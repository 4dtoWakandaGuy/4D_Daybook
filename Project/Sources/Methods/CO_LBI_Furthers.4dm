//%attributes = {}

If (False:C215)
	//Project Method Name:      CO_LBI_Furthers
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
	//ARRAY POINTER(COM_aPtr_CoFurthers;0)
	C_BOOLEAN:C305($_bo_Null; $_bo_OK; COM_bo_AddingFurther)
	C_LONGINT:C283($_l_Column; $_l_Row)
	C_POINTER:C301($_ptr_ArrayFieldPointers; $_ptr_ListboxArea; $_ptr_ListboxSetup; $_Ptr_ThisColumnField)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("CO_LBI_Furthers")

//This method replaces ALModCFur which was the call back method for furthers on the companies screen
//ALModCFur
$_t_oldMethodName:=ERR_MethodTracker("CO_LBI_Furthers")
$_ptr_ListboxSetup:=->COM_aPtr_CoFurthers
$_ptr_ListboxArea:=$_ptr_ListboxSetup->{1}
LISTBOX GET CELL POSITION:C971($_ptr_ListboxArea->; $_l_Column; $_l_Row)


If ($_l_Column>0) & ($_l_Row>0)
	
	$_bo_OK:=LBi_ModIncl($_ptr_ListboxSetup; $_l_Column; $_l_Row)
	If (($_bo_OK) & (OK=1))
		$_ptr_ArrayFieldPointers:=$_ptr_ListboxSetup->{2}
		$_Ptr_ThisColumnField:=$_ptr_ArrayFieldPointers->{$_l_Column}
		$_bo_Null:=(UTI_VarIsNull($_Ptr_ThisColumnField))
		COM_bo_AddingFurther:=True:C214
		
		Check_Minor(->[COMPANIES_RECORD_ANALYSIS:146]Analysis_Code:1; "Analysis"; ->[ADDITIONAL_RECORD_ANALYSIS:53]; ->[ADDITIONAL_RECORD_ANALYSIS:53]Additional_Analysis_Code:1; ->[ADDITIONAL_RECORD_ANALYSIS:53]Additional_Analysis_Name:2; "Furthers In")
		Companies_InLPM
		LBi_ModUpdate($_ptr_ListboxSetup; $_bo_Null; $_Ptr_ThisColumnField; $_l_Column; $_l_Row)
	End if 
End if 
ERR_MethodTrackerReturn("CO_LBI_Furthers"; $_t_oldMethodName)