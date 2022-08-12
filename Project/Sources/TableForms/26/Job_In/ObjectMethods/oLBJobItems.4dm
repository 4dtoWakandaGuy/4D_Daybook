If (False:C215)
	//object Name: [JOBS]Job_In.oLBJobItems
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/08/2013 17:30
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(JOB_LB_OrderItems;0)
	//ARRAY POINTER(JOB_aPtr_OrderItemsSetup;0)
	//ARRAY TEXT(JOB_at_Modeorders;0)
	C_LONGINT:C283($_l_CurrentColumn; $_l_event; $_l_FieldNumber; $_l_Row; $_l_TableNumber; P_Message)
	C_TEXT:C284($_t_oldMethodName; $_t_VariableName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [JOBS].Job_In.oLBJobItems"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
		
	: ($_l_event=On Header Click:K2:40)
		RESOLVE POINTER:C394(Self:C308; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
		$_l_Row:=Self:C308->
		$_l_CurrentColumn:=LB_GetColumn(->JOB_LB_OrderItems; ""; $_t_VariableName)
		LBi_AreaScript(->JOB_aPtr_OrderItemsSetup; 0; [ORDERS:24]Order_Code:3; ->JOB_at_Modeorders; $_l_Row; $_t_VariableName; "ORD_LBI_Items"; $_l_CurrentColumn)
		//***********ends**********************************
	: ($_l_event=On Drag Over:K2:13)
	Else 
		RESOLVE POINTER:C394(Self:C308; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
		$_l_Row:=Self:C308->
		//LBi_AreaScript (->JOB_aPtr_OrderItemsSetup;0;[ORDERS]Order Code;->JOB_at_Modeorders;$_l_Row;$_t_VariableName;"ORD_LBI_Items")
		
		If ($_l_event=On Data Change:K2:15) | ($_l_event=On Losing Focus:K2:8)
			//DB_SaveRecord (->[ORDER ITEMS])
			//DB_SaveRecord (->[JOB STAGES])
			P_Message:=111  //19/03/07 -kmw
			POST OUTSIDE CALL:C329(Current process:C322)  //19/03/07 -kmw
		End if 
		
		LBi_AreaScript(->JOB_aPtr_OrderItemsSetup; 1; [ORDERS:24]Order_Code:3; ->JOB_at_Modeorders; $_l_Row; $_t_VariableName; "ORD_LBI_Items")  //kmw 07/12/06 - altered to start in new process using Nigel's new parameter
		
		
End case 
ERR_MethodTrackerReturn("OBJ [JOBS].Job_In.oLBJobItems"; $_t_oldMethodName)
