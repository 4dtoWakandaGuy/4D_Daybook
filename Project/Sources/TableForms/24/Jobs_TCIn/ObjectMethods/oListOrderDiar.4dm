If (False:C215)
	//object Name: [ORDERS]Jobs_TCIn.oListOrderDiar
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/08/2013 17:29
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(ORD_LB_Diary;0)
	//ARRAY POINTER(ORD_aPtr_LbDISetup;0)
	//ARRAY TEXT(ORD_at_ModeDiary;0)
	C_LONGINT:C283($_l_event; $_l_FieldNumber; $_l_Row; $_l_TableNumber; $_l_CurrentSortColumn)
	C_POINTER:C301($_ptr_FocusObject)
	C_TEXT:C284($_t_oldMethodName; $_t_VariableName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [ORDERS].Jobs_TCIn.oListOrderDiar"; Form event code:C388)
$_l_event:=Form event code:C388


Case of 
		
	: ($_l_event=On Header Click:K2:40)
		RESOLVE POINTER:C394(Self:C308; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
		$_l_Row:=Self:C308->
		$_l_CurrentSortColumn:=LB_GetColumn(->ORD_LB_Diary; ""; $_t_VariableName)
		LBi_AreaScript(->ORD_aPtr_LbDISetup; 0; [ORDERS:24]Order_Code:3; ->ORD_at_ModeDiary; $_l_Row; $_t_VariableName; "ORD_LBI_DiaryItems"; $_l_CurrentSortColumn)
		//***********ends**********************************
	: ($_l_event=On Drag Over:K2:13)
	Else 
		RESOLVE POINTER:C394(Self:C308; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
		$_l_Row:=Self:C308->
		
		$_ptr_FocusObject:=Focus object:C278
		
		LBi_AreaScript(->ORD_aPtr_LbDISetup; 0; [ORDERS:24]Order_Code:3; ->ORD_at_ModeDiary; $_l_Row; $_t_VariableName; "ORD_LBI_DiaryItems")
End case 
ERR_MethodTrackerReturn("OBJ [ORDERS].Jobs_TCIn.oListOrderDiar"; $_t_oldMethodName)
