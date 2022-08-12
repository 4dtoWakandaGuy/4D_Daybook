//%attributes = {}

If (False:C215)
	//Project Method Name:      CON_LBI_Items
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  26/02/2020
	//Created BY:  Unknown
	
	//Date Modified: 
	//Modified By: Nigel Greenlee
	//Modification notes
End if 
//Variable Declarations
If (True:C214)
	//Array BOOLEAN(CON_LB_RelatedData;0)
	//Array LONGINT(CON_al_ViewTableToTable;0)
	//Array POINTER(CON_aptr_LBSetup;0)
	//Array TEXT(CON_at_ViewTabsLabels;0)
	C_BOOLEAN:C305($_bo_Null; $_bo_OK)
	C_LONGINT:C283($_l_Column; $_l_Row)
	C_POINTER:C301($_ptr_ArrayFieldPointers; $_Ptr_ThisColumnField)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("CON_LBI_Items")

//NG this mehtod replaces al mod contact.
//this was the call back method from the companies screen.
//we have never implemented direct input for any of the areas on this screen other than CONTACTS so this method only handles data entry for contacts

$_t_oldMethodName:=ERR_MethodTracker("CON_LBI_Items")
//ALModCont
LISTBOX GET CELL POSITION:C971(CON_LB_RelatedData; $_l_Column; $_l_Row)

If ($_l_Column>0) & ($_l_Row>0)
	$_bo_OK:=LBi_ModIncl(->CON_aptr_LBSetup; $_l_Column; $_l_Row)
	If (($_bo_OK) & (OK=1))
		$_ptr_ArrayFieldPointers:=CON_aptr_LBSetup{2}
		$_Ptr_ThisColumnField:=$_ptr_ArrayFieldPointers->{$_l_Column}
		$_bo_Null:=(UTI_VarIsNull($_Ptr_ThisColumnField))
		Case of 
			: ((CON_al_ViewTableToTable{CON_at_ViewTabsLabels})=Table:C252(->[CUSTOM_FIELDS:98]))  //in prep for changing so on screen edit can take place i am outtingthis stuff in here
				
				//the following was done in the during phase
			: ((CON_al_ViewTableToTable{CON_at_ViewTabsLabels})=Table:C252(->[ORDERS:24]))
			: ((CON_al_ViewTableToTable{CON_at_ViewTabsLabels})=Table:C252(->[PURCHASE_ORDERS:57]))
			: ((CON_al_ViewTableToTable{CON_at_ViewTabsLabels})=Table:C252(->[INVOICES:39]))
			: ((CON_al_ViewTableToTable{CON_at_ViewTabsLabels})=Table:C252(->[CONTRACTS:17]))
			: ((CON_al_ViewTableToTable{CON_at_ViewTabsLabels})=Table:C252(->[SERVICE_CALLS:20]))
			: ((CON_al_ViewTableToTable{CON_at_ViewTabsLabels})=Table:C252(->[JOBS:26]))
				
		End case 
	End if 
Else 
	
	
	
End if 
ERR_MethodTrackerReturn("CON_LBI_Items"; $_t_oldMethodName)