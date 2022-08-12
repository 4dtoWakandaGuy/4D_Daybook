//%attributes = {}
If (False:C215)
	//Project Method Name:      PROD_LBI_SubsItems
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  22/11/2010 15:24
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY POINTER(SUBS_aPtr_LBSettings;0)
	C_BOOLEAN:C305($_bo_Null; $_bo_OK; $0k)
	C_LONGINT:C283($_l_Column; $_l_Row)
	C_POINTER:C301($_ptr_ArrayFieldPointers; $_Ptr_ListBox; $_Ptr_ThisColumnField)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("PROD_LBI_SubsItems")

//NG This method is a replacement for the call back method ALModsubscriptions

//ALMODSUBSCRIPTION
//NG APRIL 2004
//EVENT HANDLER METHOD FOR AREA LIST AREA
//USED IN THE FORM [ORDER ITEMS]Items_Su
$_Ptr_ListBox:=SUBS_aPtr_LBSettings{1}
LISTBOX GET CELL POSITION:C971($_Ptr_ListBox->; $_l_Column; $_l_Row)

If ($_l_Column>0) & ($_l_Row>0)
	
	$_bo_OK:=LBi_ModIncl(->SUBS_aPtr_LBSettings; $_l_Column; $_l_Row)
	
	If (($_bo_OK) & (OK=1))
		$_ptr_ArrayFieldPointers:=SUBS_aPtr_LBSettings{2}
		$_Ptr_ThisColumnField:=$_ptr_ArrayFieldPointers->{$_l_Column}
		$_bo_Null:=(UTI_VarIsNull($_Ptr_ThisColumnField))
		Subscriptions_inLPX($_Ptr_ThisColumnField)
		LBi_ModUpdate(->SUBS_aPtr_LBSettings; $_bo_Null; $_Ptr_ThisColumnField; $_l_Column; $_l_Row)
		
	End if 
Else 
	//$0:=True
End if 
ERR_MethodTrackerReturn("PROD_LBI_SubsItems"; $_t_oldMethodName)