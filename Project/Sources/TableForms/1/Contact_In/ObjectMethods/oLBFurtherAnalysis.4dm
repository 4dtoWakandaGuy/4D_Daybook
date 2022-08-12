If (False:C215)
	//object Name: [CONTACTS]Contact_In.oLBFurtherAnalysis
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:04
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(CON_lb_FurtherAnalysis;0)
	//ARRAY POINTER(CON_aPtr_LBAnalSetup;0)
	C_LONGINT:C283($_l_event; $_l_FieldNumber; $_l_Row; $_l_TableNumber; $_l_CurrentSortColumn; CON_l_CurrentSubArea; LB_SetMode)
	C_TEXT:C284($_t_oldMethodName; $_t_VariableName; CON_t_CurrentFocus)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [CONTACTS].Contact_In.oLBFurtherAnalysis"; Form event code:C388)
$_l_event:=Form event code:C388
CON_l_CurrentSubArea:=1
Case of 
		
	: ($_l_event=On Header Click:K2:40)
		CON_l_CurrentSubArea:=1
		RESOLVE POINTER:C394(Self:C308; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
		$_l_Row:=Self:C308->
		LB_SetMode:=1
		$_l_CurrentSortColumn:=LB_GetColumn(->CON_lb_FurtherAnalysis; ""; $_t_VariableName)  //changed from "eLBCoFurl" (small L) to "CON_lb_FurtherAnalysis" (capital i) -kmw 29/08/06
		LBi_AreaScript(->CON_aPtr_LBAnalSetup; 0; [CONTACTS:1]Contact_Code:2; ->LB_SetMode; $_l_Row; $_t_VariableName; "CON_LBI_Furthers"; $_l_CurrentSortColumn)
		//***********ends**********************************
	: ($_l_event=On Drag Over:K2:13)
		
	Else 
		CON_l_CurrentSubArea:=1
		RESOLVE POINTER:C394(Self:C308; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
		$_l_Row:=Self:C308->
		If ($_l_event=On Clicked:K2:4)
			CON_t_CurrentFocus:="Analysis"
			//single click select-double enter
			LB_SetMode:=1
		Else 
			LB_SetMode:=2
		End if 
		
		LBi_AreaScript(->CON_aPtr_LBAnalSetup; 0; [CONTACTS:1]Contact_Code:2; ->LB_SetMode; $_l_Row; $_t_VariableName; "CON_LBI_Furthers")
End case 
ERR_MethodTrackerReturn("OBJ:Contact_In,CON_lb_FurtherAnalysis"; $_t_oldMethodName)
