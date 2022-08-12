If (False:C215)
	//object Name: [COMPANIES]Company_In.oFurl
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
	//ARRAY BOOLEAN(COM_LB_FurtherAnalysis;0)
	//ARRAY POINTER(COM_aPtr_CoFurthers;0)
	C_LONGINT:C283($_l_Column; $_l_CurrentSortColumn; $_l_event; $_l_FieldNumber; $_l_Row; $_l_TableNumber; LB_l_LastRow; LB_SetMode)
	C_TEXT:C284($_t_oldMethodName; $_t_VariableName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [COMPANIES].Company_In.oFurl"; Form event code:C388)
$_l_event:=Form event code:C388
$_t_VariableName:=""
Case of 
		
	: ($_l_event=On Header Click:K2:40)
		
		
		RESOLVE POINTER:C394(Self:C308; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
		$_l_Row:=Self:C308->
		LB_SetMode:=1  //added 29/08/06 -kmw (getting error due to pointer to undefined variable)
		$_l_CurrentSortColumn:=LB_GetColumn(->COM_LB_FurtherAnalysis; ""; $_t_VariableName)  //, replaced l with I (small L with capital i), added missing -> symbol, 29/08/06 - kmw
		
		
		
		
		LBi_AreaScript(->COM_aPtr_CoFurthers; 0; [COMPANIES:2]Company_Code:1; ->LB_SetMode; $_l_Row; $_t_VariableName; "CO_LBI_Furthers"; $_l_CurrentSortColumn)
		//***********ends**********************************
	: ($_l_event=On Drag Over:K2:13)
		
		
	Else 
		If ($_l_event=On Clicked:K2:4)
			
			
			//single click select-double enter
			LB_SetMode:=1
		Else 
			LB_SetMode:=2
		End if 
		
		LISTBOX GET CELL POSITION:C971(Self:C308->; $_l_Column; $_l_Row)
		RESOLVE POINTER:C394(Self:C308; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
		$_l_Row:=Self:C308->
		If ($_l_Column=3)
			//MESSAGE("COL3")
			
			//$`Arptr:=COM_aPtr_CoFurthers{3}
			//$Arptr2:=$Arptr->{$_l_Column}
			//SET ENTERABLE($Arptr2->;True)
		End if 
		LB_l_LastRow:=0
		
		LBi_AreaScript(->COM_aPtr_CoFurthers; 0; [COMPANIES:2]Company_Code:1; ->LB_SetMode; $_l_Row; $_t_VariableName; "CO_LBI_Furthers")
		
End case 
ERR_MethodTrackerReturn("OBJ:Company_In,COM_LB_FurtherAnalysis"; $_t_oldMethodName)
