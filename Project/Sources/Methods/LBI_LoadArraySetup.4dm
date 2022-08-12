//%attributes = {}

If (False:C215)
	//Project Method Name:      LBI_LoadArraySetup
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
	C_LONGINT:C283($_l_DataType; $_l_SizeofArray; $_l_SortFieldNumber; $_l_TableNumber; $3)
	C_POINTER:C301($_ptr_ArrayFieldPointers; $_ptr_ArrayofArrayPointers; $_ptr_ArrayReferences; $_ptr_FirstColumnField; $_Ptr_KeyField; $_ptr_LBTable; $_ptr_ListboxSetup; $_ptr_ParentTableKeyField; $1)
	C_TEXT:C284($_t_CurrentDefinitionsName; $_t_oldMethodName; $_t_Unique; $2)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("LBI_LoadArraySetup")


//NG June 2008
//This method is called to load array based list box settings using the LIST LAYOUTS onto screen
//There is no point in loading the pointer arrays onto screen when they point at other arrays.
//ALLoadSetup - used from ß procs to Load Arrays & Do Setup

If (OK=1)
	$_ptr_ListboxSetup:=$1
	$_ptr_ArrayofArrayPointers:=$_ptr_ListboxSetup->{3}
	$_ptr_LBTable:=$_ptr_ListboxSetup->{7}
	$_ptr_ArrayReferences:=$_ptr_ListboxSetup->{9}
	$_ptr_ParentTableKeyField:=$_ptr_ListboxSetup->{11}
	If ((Type:C295($_ptr_ParentTableKeyField->))=9)
		$_t_Unique:=String:C10($_ptr_ParentTableKeyField->)
	Else 
		$_t_Unique:=$_ptr_ParentTableKeyField->
	End if 
	
	//if is a page turn, have to work out if the processing is needed
	//by finding out if the array elem 11 contains the current record's unique field
	If (($2="B") | (($2="P") & ($_ptr_ArrayReferences->{11}=""))) | (True:C214)
		LBi_inclSetup($_ptr_ListboxSetup)
	End if 
	If (Count parameters:C259>2)
		LBi_LoadFtrs($_ptr_ListboxSetup; $3)
	Else 
		LBi_LoadFtrs($_ptr_ListboxSetup)
	End if 
	
	//ALLoadFtrs ($_ptr_ListboxSetup)
	$_ptr_ArrayFieldPointers:=$_ptr_ListboxSetup->{2}
	$_ptr_ArrayReferences:=$_ptr_ListboxSetup->{9}
	$_t_CurrentDefinitionsName:=$_ptr_ArrayReferences->{6}
	
	$_ptr_FirstColumnField:=$_ptr_ArrayFieldPointers->{1}
	$_l_DataType:=Type:C295($_ptr_FirstColumnField->)
	Case of 
		: ($_l_DataType=14) | ($_l_DataType=19) | ($_l_DataType=21) | ($_l_DataType=16) | ($_l_DataType=17) | ($_l_DataType=15) | ($_l_DataType=22) | ($_l_DataType=18)
		Else 
			$_l_SortFieldNumber:=Field:C253($_ptr_ArrayFieldPointers->{1})
			$_l_TableNumber:=Table:C252($_ptr_ArrayFieldPointers->{1})
			//ALAreaSort
			//If (False)
			LBi_AreaSort($_t_CurrentDefinitionsName; $_l_TableNumber; $_ptr_ListboxSetup)
	End case 
	
	
	$_ptr_ArrayReferences->{11}:=$_t_Unique
End if 
ERR_MethodTrackerReturn("LBi_LoadArraySetup"; $_t_oldMethodName)
