//%attributes = {}

If (False:C215)
	//Project Method Name:      ORDI_LBI_SubsItems
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
	//Array POINTER(SUBS_aPtr_LBSettings;0)
	C_BOOLEAN:C305($_bo_Null; $_bo_OK)
	C_LONGINT:C283($_l_Column; $_l_Row)
	C_POINTER:C301($_ptr_ArrayFieldPointers; $_Ptr_ListBox; $_Ptr_ThisColumnField)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("ORDI_LBI_SubsItems")

//This method replaces the area list call back ALModSUbsription

//ALMODSUBSCRIPTION
//NG APRIL 2004
//EVENT HANDLER METHOD FOR AREA LIST AREA
//USED IN THE FORM [ORDER ITEMS]Items_Su
$_t_oldMethodName:=ERR_MethodTracker("ORDI_LBI_SubsItems")

$_Ptr_ListBox:=SUBS_aPtr_LBSettings{1}
LISTBOX GET CELL POSITION:C971($_Ptr_ListBox->; $_l_Column; $_l_Row)

If ($_l_Column>0) & ($_l_Row>0)
	$_bo_OK:=LBi_ModIncl(->SUBS_aPtr_LBSettings; $_l_Column; $_l_Row)
	If (($_bo_OK) & (OK=1))
		
		$_ptr_ArrayFieldPointers:=SUBS_aPtr_LBSettings{2}
		$_Ptr_ThisColumnField:=$_ptr_ArrayFieldPointers->{$_l_Column}
		$_bo_Null:=(UTI_VarIsNull($_Ptr_ThisColumnField))
		//JobStages_inLPX ($_Ptr_ThisColumnField)  `the during phase procedure
		Subscriptions_inLPX($_Ptr_ThisColumnField)
		LBi_ModUpdate(->SUBS_aPtr_LBSettings; $_bo_Null; $_Ptr_ThisColumnField; $_l_Column; $_l_Row)
		
	End if 
Else 
	
End if 
ERR_MethodTrackerReturn("ORDI_LBI_SubsItems"; $_t_oldMethodName)