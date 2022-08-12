If (False:C215)
	//object Name: [COMPANIES]Company_In.oContactsP2FA
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:06
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(CON_lb_FurtherAnalysis;0)
	//ARRAY POINTER(CON_aPtr_LBAnalSetup;0)
	C_LONGINT:C283($_l_event; $_l_FieldNumber; $_l_Row; $_l_TableNumber; $_l_CurrentSortColumn; LB_SetMode)
	C_TEXT:C284($_t_oldMethodName; $_t_VariableName; CON_t_CurrentFocus)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [COMPANIES].Company_In.oContactsP2FA"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
		
	: ($_l_event=On Header Click:K2:40)
		RESOLVE POINTER:C394(Self:C308; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
		$_l_Row:=Self:C308->
		LB_SetMode:=1  //added 29/08/06 -kmw (getting error due to pointer to undefined variable)
		$_l_CurrentSortColumn:=LB_GetColumn(->CON_lb_FurtherAnalysis; ""; $_t_VariableName)  //changed from "eLBCoFurl" (small L) to "CON_lb_FurtherAnalysis" (capital i) -kmw 29/08/06 (also added missing -> pointer symbol)
		LBi_AreaScript(->CON_aPtr_LBAnalSetup; 0; [CONTACTS:1]Contact_Code:2; ->LB_SetMode; $_l_Row; $_t_VariableName; "CON_LBI_Furthers"; $_l_CurrentSortColumn)
		//***********ends**********************************
	: ($_l_event=On Drag Over:K2:13)
	Else 
		RESOLVE POINTER:C394(Self:C308; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
		$_l_Row:=Self:C308->
		If ($_l_event=On Clicked:K2:4)
			CON_t_CurrentFocus:="Analysis"
			//single click select-double enter
			LB_SetMode:=1
		Else 
			LB_SetMode:=0
		End if 
		
		LBi_AreaScript(->CON_aPtr_LBAnalSetup; 0; [CONTACTS:1]Contact_Code:2; ->LB_SetMode; $_l_Row; $_t_VariableName; "CON_LBI_Furthers")
End case 
ERR_MethodTrackerReturn("OBJ:Company_In,CON_lb_FurtherAnalysis"; $_t_oldMethodName)
