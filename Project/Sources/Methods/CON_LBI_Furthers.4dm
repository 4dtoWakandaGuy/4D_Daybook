//%attributes = {}
If (False:C215)
	//Project Method Name:      CON_LBI_Furthers
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/11/2010 15:24
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY POINTER(CON_aPtr_LBAnalSetup;0)
	C_BOOLEAN:C305($_bo_Null; $_bo_OK)
	C_LONGINT:C283($_l_Column; $_l_Row; $_l_WIndowBottom; $_l_WIndowLeft; $_l_WIndowRight; $_l_WIndowTop)
	C_POINTER:C301($_ptr_ArrayFieldPointers; $_Ptr_ListBoxArea; $_ptr_ListboxSetup; $_Ptr_ThisColumnField)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("CON_LBI_Furthers")

//This method is a replacement for the area list call back method ALModCoFur


$_ptr_ListboxSetup:=->CON_aPtr_LBAnalSetup
$_Ptr_ListBoxArea:=$_ptr_ListboxSetup->{1}
LISTBOX GET CELL POSITION:C971($_Ptr_ListBoxArea->; $_l_Column; $_l_Row)



If ($_l_Column>0) & ($_l_Row>0)
	
	$_bo_OK:=LBi_ModIncl($_ptr_ListboxSetup; $_l_Column; $_l_Row)
	If (($_bo_OK) & (OK=1))
		$_ptr_ArrayFieldPointers:=$_ptr_ListboxSetup->{2}
		$_Ptr_ThisColumnField:=$_ptr_ArrayFieldPointers->{$_l_Column}
		$_bo_Null:=(UTI_VarIsNull($_Ptr_ThisColumnField))
		//HIDE WINDOW
		Check_Minor(->[CONTACTS_RECORD_ANALYSIS:144]Analysis_Code:1; "Analysis"; ->[ADDITIONAL_RECORD_ANALYSIS:53]; ->[ADDITIONAL_RECORD_ANALYSIS:53]Additional_Analysis_Code:1; ->[ADDITIONAL_RECORD_ANALYSIS:53]Additional_Analysis_Name:2; "Furthers In")
		//SHOW WINDOW
		
		Contacts_InLPM
		LBi_ModUpdate($_ptr_ListboxSetup; $_bo_Null; $_Ptr_ThisColumnField; $_l_Column; $_l_Row)
		GET WINDOW RECT:C443($_l_WIndowLeft; $_l_WIndowTop; $_l_WIndowRight; $_l_WIndowBottom)
		SET WINDOW RECT:C444($_l_WIndowLeft; $_l_WIndowTop; $_l_WIndowRight; $_l_WIndowBottom+1)
		SET WINDOW RECT:C444($_l_WIndowLeft; $_l_WIndowTop; $_l_WIndowRight; $_l_WIndowBottom)
	End if 
End if 
ERR_MethodTrackerReturn("CON_LBI_Furthers"; $_t_oldMethodName)