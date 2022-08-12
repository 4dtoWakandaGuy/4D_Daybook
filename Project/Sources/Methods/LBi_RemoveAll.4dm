//%attributes = {}

If (False:C215)
	//Project Method Name:      LBi_RemoveAll
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
	C_LONGINT:C283($_l_ListboxColumns; $_l_SizeofArray)
	C_POINTER:C301($_ptr_ArrayOfArrayNames; $_Ptr_ListBox; $1)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("LBi_RemoveAll")

//NG 19/7/06
//This method is a direct replacement for ALremoveAll

If (Not:C34(Is nil pointer:C315($1)))
	If (Size of array:C274($1->)>0)
		$_Ptr_ListBox:=$1->{1}
		$_ptr_ArrayOfArrayNames:=$1->{4}
		$_l_SizeofArray:=Size of array:C274($_ptr_ArrayOfArrayNames->)
		If ($_l_SizeofArray>0)
			$_l_ListboxColumns:=LISTBOX Get number of columns:C831($_Ptr_ListBox->)
			If ($_l_ListboxColumns>=$_l_SizeofArray)
				LISTBOX DELETE COLUMN:C830($_Ptr_ListBox->; 1; $_l_SizeofArray)
			End if 
			
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("LBi_RemoveAll"; $_t_oldMethodName)