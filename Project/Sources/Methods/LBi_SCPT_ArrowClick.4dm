//%attributes = {}
If (False:C215)
	//Project Method Name:      LBi_SCPT_ArrowClick
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY POINTER(CONT_aPtr_LBSetup;0)
	C_BOOLEAN:C305($_bo_Continue)
	C_LONGINT:C283($_l_FieldNumber; $_l_KeyPosition; $_l_NumberOfRows; $_l_Row; $_l_TableNumber)
	C_POINTER:C301($_ptr_ArrayFieldPointers; $_ptr_ArrayofArrayPointers; $_Ptr_KeyField; $_Ptr_ListBox; $_ptr_ListboxSetup; $_Ptr_ThisColumnArray; $1)
	C_TEXT:C284($_t_oldMethodName; $_t_VariableName; $2)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("LBi_SCPT_ArrowClick")
// LB_ArrowClick
// 26/06/06 pb
// Manages arrow clicks (up/down) in Listbox areas

// parameters:   `          $1 =  pointer to the Listbox object
//                    $2 = "up" or "down" arrow clicked


//$_Ptr_ListBox:=$1->{1}
$_Ptr_ListBox:=$1
$_l_Row:=$_Ptr_ListBox->
$_l_NumberOfRows:=LISTBOX Get number of rows:C915($_Ptr_ListBox->)
$_bo_Continue:=True:C214
Case of 
	: ($_l_Row=0)
		$_bo_Continue:=False:C215
	: (($2="up") & ($_l_Row=1))
		$_bo_Continue:=False:C215
	: (($2="down") & ($_l_Row>=$_l_NumberOfRows))
		$_bo_Continue:=False:C215
	: ($2="up")
		$_l_Row:=$_l_Row-1
	: ($2="down")
		$_l_Row:=$_l_Row+1
End case 
If ($_bo_Continue)
	LISTBOX SELECT ROW:C912($_Ptr_ListBox->; $_l_Row)
	RESOLVE POINTER:C394($_Ptr_ListBox; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
	
	//  now handle any special processing for the listbox area such as displaying records, setting enterability etc.
	Case of 
		: ($_t_VariableName="SD_LB_Items")  // super diary
			$_ptr_ListboxSetup:=->CONT_aPtr_LBSetup
			$_ptr_ArrayFieldPointers:=$_ptr_ListboxSetup->{2}
			$_Ptr_KeyField:=$_ptr_ListboxSetup->{8}
			$_l_KeyPosition:=Find in array:C230($_ptr_ArrayFieldPointers->; $_Ptr_KeyField)
			$_ptr_ArrayofArrayPointers:=$_ptr_ListboxSetup->{3}
			$_Ptr_ThisColumnArray:=$_ptr_ArrayofArrayPointers->{$_l_KeyPosition}
			LBi_SCPT_DiaryItemView($_Ptr_ListBox; False:C215; $_Ptr_ThisColumnArray->{$_l_Row})
	End case 
End if 
ERR_MethodTrackerReturn("LBi_SCPT_ArrowClick"; $_t_oldMethodName)