If (False:C215)
	//object Name: [ORDER_ITEMS]Items_Su.oSubs
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:46
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(ORD_abo_PowerviewSubs;0)
	//ARRAY POINTER(SUBS_aPtr_LBSettings;0)
	//ARRAY TEXT(SUB_at_Modes;0)
	C_LONGINT:C283($_l_event; $_l_FieldNumber; $_l_Row; $_l_TableNumber; $_l_CurrentSortColumn)
	C_TEXT:C284($_t_oldMethodName; $_t_VariableName)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("OBJ [ORDER_ITEMS]Items_Su.oSubs"; Form event code:C388)




ERR_MethodTrackerReturn("OBJ [ORDER_ITEMS].Items_Su.oSubs"; $_t_oldMethodName)


$_t_oldMethodName:=ERR_MethodTracker("OBJ [ORDER_ITEMS].Items_Su.oSubs"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
		
	: ($_l_event=On Header Click:K2:40)
		RESOLVE POINTER:C394(Self:C308; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
		$_l_Row:=Self:C308->
		$_l_CurrentSortColumn:=LB_GetColumn(->ORD_abo_PowerviewSubs; ""; $_t_VariableName)
		LBi_AreaScript(->SUBS_aPtr_LBSettings; 0; String:C10([ORDER_ITEMS:25]Item_Number:27); ->SUB_at_Modes; $_l_Row; $_t_VariableName; "ORDi_LBI_subsItems"; $_l_CurrentSortColumn)
		
		//***********ends**********************************
	: ($_l_event=On Drag Over:K2:13)
	Else 
		RESOLVE POINTER:C394(Self:C308; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
		$_l_Row:=Self:C308->
		LBi_AreaScript(->SUBS_aPtr_LBSettings; 0; String:C10([ORDER_ITEMS:25]Item_Number:27); ->SUB_at_Modes; $_l_Row; $_t_VariableName; "ORDi_LBI_subsItems")
		
End case 
ERR_MethodTrackerReturn("OBJ [ORDER_ITEMS].Items_Su.oSubs"; $_t_oldMethodName)
