If (False:C215)
	//object Name: [SERVICE_CALLS]Calls_in.oListBoxCharges
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/08/2013 17:28
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(SC_LB_CHARGES;0)
	//ARRAY POINTER(SVS_aPtr_OrderItemsSetup;0)
	//ARRAY TEXT(SC_at_ModeCharge;0)
	C_LONGINT:C283($_l_CurrentColumn; $_l_event; $_l_FieldNumber; $_l_Row; $_l_TableNumber)
	C_TEXT:C284($_t_oldMethodName; $_t_VariableName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [SERVICE_CALLS].Calls_in.oListBoxCharges"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
		
	: ($_l_event=On Header Click:K2:40)
		RESOLVE POINTER:C394(Self:C308; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
		$_l_Row:=Self:C308->
		$_l_CurrentColumn:=LB_GetColumn(->SC_LB_CHARGES; ""; $_t_VariableName)
		LBi_AreaScript(->SVS_aPtr_OrderItemsSetup; 0; [SERVICE_CALLS:20]Call_Code:4; ->SC_at_ModeCharge; $_l_Row; $_t_VariableName; "ORD_LBI_Items"; $_l_CurrentColumn)
		//***********ends**********************************
	: ($_l_event=On Drag Over:K2:13)
	Else 
		RESOLVE POINTER:C394(Self:C308; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
		$_l_Row:=Self:C308->
		LBi_AreaScript(->SVS_aPtr_OrderItemsSetup; 0; [SERVICE_CALLS:20]Call_Code:4; ->SC_at_ModeCharge; $_l_Row; $_t_VariableName; "ORD_LBI_Items")
		
End case 
ERR_MethodTrackerReturn("OBJ [SERVICE_CALLS].Calls_in.oListBoxCharges"; $_t_oldMethodName)
