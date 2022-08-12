//%attributes = {}
If (False:C215)
	//Project Method Name:      SD2_DiaryViewCountRecords
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
	//ARRAY LONGINT(SD2_AL_PAGECACHE;0)
	//ARRAY POINTER(SD2_aptr_ListControl;0)
	//ARRAY TEXT(SD2_at_PageTabs;0)
	C_LONGINT:C283($_l_Index; $_l_KeyPosition)
	C_POINTER:C301($_ptr_ArrayFieldPointers; $_ptr_ArrayofArrayPointers; $_Ptr_KeyField; $_Ptr_ThisColumnArray)
	C_REAL:C285($_r_Total; $0)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SD2_DiaryViewCountRecords")
//This method returns the total number of records in the current selection--note this is differrent to the number o n the page
//Note this only works for the form [USER];"SD2_diaryViewer"
If (Size of array:C274(SD2_at_PageTabs)>0)
	$_r_Total:=0
	For ($_l_Index; 1; Size of array:C274(SD2_at_PageTabs))
		$_r_Total:=$_r_Total+(Size of array:C274(SD2_AL_PAGECACHE{$_l_Index}))
		
	End for 
	$0:=$_r_Total
Else 
	//Just the one page
	$_ptr_ArrayofArrayPointers:=SD2_aptr_ListControl{3}
	$_ptr_ArrayFieldPointers:=SD2_aptr_ListControl{2}
	$_Ptr_KeyField:=SD2_aptr_ListControl{8}
	$_l_KeyPosition:=Find in array:C230($_ptr_ArrayFieldPointers->; $_Ptr_KeyField)
	If ($_l_KeyPosition>0)  //it should be
		$_Ptr_ThisColumnArray:=$_ptr_ArrayofArrayPointers->{$_l_KeyPosition}
	End if 
	$0:=Size of array:C274($_Ptr_ThisColumnArray->)
End if 
ERR_MethodTrackerReturn("SD2_DiaryViewCountRecords"; $_t_oldMethodName)
