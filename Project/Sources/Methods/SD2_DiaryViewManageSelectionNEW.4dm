//%attributes = {}
If (False:C215)
	//Project Method Name:      SD2_DiaryViewManageSelectionNEW
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 03/09/2009 15:47
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(SD_lb_Workflow;0)
	//ARRAY LONGINT(SD2_AL_PAGECACHE;0)
	//ARRAY POINTER(SD2_aptr_ListControl;0)
	ARRAY TEXT:C222($_at_DiaryrecordCodes; 0)
	ARRAY TEXT:C222($_at_Pageselection; 0)
	//ARRAY TEXT(SD2_at_CachedSelections;0)
	//ARRAY TEXT(SD2_at_PageTabs;0)
	C_BOOLEAN:C305($_bo_IgnoreHighlighted; $_bo_IgnoreUnHighlighted; $1; $2)
	C_LONGINT:C283($_l_Index; $_l_Index2; $_l_KeyPosition; $_l_LineIndex; $_t_NumberofDiaryCodes)
	C_POINTER:C301($_ptr_ArrayFieldPointers; $_ptr_ArrayofArrayPointers; $_Ptr_KeyField; $_Ptr_ThisColumnArray)
	C_TEXT:C284($_t_CachedSelectionName; $_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SD2_DiaryViewManageSelectionNEW")
//
//Added 19/06/08 -kmw
//
//This method is a re-write of SD2_DiaryViewManageSelection
//
//
//Based on a best guess on the intention of SD2_DiaryViewManageSelection, SD2_DiaryViewManageSelectionNEW does the following...
//
//Depending on how it is called, it can make the current selection of diary records equal to "currently displayed/listed" diary items in Diary Viewer that are either highlighted, unhighlighted or either (ie all displayed diary items).
//When displaying multiple tabs then it looks through ALL of the diary items currently in the viewer regardless of if they are in the current tab or not.
//
//It takes 2 boolean parameters
//The $1 determines if it should ignore items that are unhighlighted...ie a value of FALSE indicates that unhighlighted items should be included and TRUE indicates that unhighlighted lines should not be included.
//The $2 determines if it should ignore items that are highlighted...ie a value of FALSE indicates that highlighted items should be included and TRUE indicates that highlighted lines should not be included.
//Default for $1 and $2 are both false
//Examples...
// SD2_DiaryViewManageSelectionNEW     `Makes current selection the same as ALL items in diary viewer regardless of which tab they are on
// SD2_DiaryViewManageSelectionNEW(false)     `Also makes current selection the same as ALL items in diary viewer regardless of which tab they are on
// SD2_DiaryViewManageSelectionNEW(false;false)     `Also makes current selection the same as ALL items in diary viewer regardless of which tab they are on
// SD2_DiaryViewManageSelectionNEW(true)     `Makes current selection the same as HIGHLIGHTED items in diary viewer regardless of which tab they are on
// SD2_DiaryViewManageSelectionNEW(true;false)     `Also makes current selection the same as HIGHLIGHTED items in diary viewer regardless of which tab they are on
// SD2_DiaryViewManageSelectionNEW(false;true)     `Makes current selection the same as UNHIGHLIGHTED items in diary viewer regardless of which tab they are on
// SD2_DiaryViewManageSelectionNEW(true;true)     `Makes current selection empty
//
//
//
If (Count parameters:C259>=1)
	$_bo_IgnoreUnHighlighted:=$1
Else 
	$_bo_IgnoreUnHighlighted:=False:C215
End if 
If (Count parameters:C259>=2)
	$_bo_IgnoreHighlighted:=$2
Else 
	$_bo_IgnoreHighlighted:=False:C215
End if 
//
SD2_DiaryVIewManageCaches  //updates the cache of the current page
//
//
If (Size of array:C274(SD2_at_PageTabs)>0)  //If using tabs (diary items spread across more than 1 page)
	ARRAY TEXT:C222($_at_DiaryrecordCodes; 0)
	Case of 
		: ($_bo_IgnoreUnHighlighted=False:C215) & ($_bo_IgnoreHighlighted=False:C215)
			For ($_l_Index; 1; Size of array:C274(SD2_at_PageTabs))
				ARRAY TEXT:C222($_at_Pageselection; 0)
				CREATE SELECTION FROM ARRAY:C640([DIARY:12]; SD2_AL_PAGECACHE{$_l_Index})
				SELECTION TO ARRAY:C260([DIARY:12]Diary_Code:3; $_at_Pageselection)
				For ($_l_Index2; 1; Size of array:C274($_at_Pageselection))
					APPEND TO ARRAY:C911($_at_DiaryrecordCodes; $_at_Pageselection{$_l_Index2})
				End for 
			End for 
		: ($_bo_IgnoreUnHighlighted) & ($_bo_IgnoreHighlighted)
			//leave at zero size array
		: ($_bo_IgnoreUnHighlighted)
			For ($_l_Index; 1; Size of array:C274(SD2_at_PageTabs))
				For ($_l_Index2; 1; Size of array:C274(SD2_at_CachedSelections{$_l_Index}))
					$_t_CachedSelectionName:=SD2_at_CachedSelections{$_l_Index}{$_l_Index2}
					APPEND TO ARRAY:C911($_at_DiaryrecordCodes; $_t_CachedSelectionName)
				End for 
			End for 
		: ($_bo_IgnoreHighlighted)
			For ($_l_Index; 1; Size of array:C274(SD2_at_PageTabs))
				ARRAY TEXT:C222($_at_Pageselection; 0)
				CREATE SELECTION FROM ARRAY:C640([DIARY:12]; SD2_AL_PAGECACHE{$_l_Index})
				SELECTION TO ARRAY:C260([DIARY:12]Diary_Code:3; $_at_Pageselection)
				For ($_l_Index2; 1; Size of array:C274($_at_Pageselection))
					If (Find in array:C230(SD2_at_CachedSelections{$_l_Index}; $_at_Pageselection{$_l_Index2})<1)
						APPEND TO ARRAY:C911($_at_DiaryrecordCodes; $_at_Pageselection{$_l_Index2})
					End if 
				End for 
			End for 
	End case 
Else   //If not using tabs (all diary items fit on a single page)
	$_ptr_ArrayofArrayPointers:=SD2_aptr_ListControl{3}
	$_ptr_ArrayFieldPointers:=SD2_aptr_ListControl{2}
	$_Ptr_KeyField:=SD2_aptr_ListControl{8}
	$_l_KeyPosition:=Find in array:C230($_ptr_ArrayFieldPointers->; $_Ptr_KeyField)
	If ($_l_KeyPosition>0)  //it should be
		$_Ptr_ThisColumnArray:=$_ptr_ArrayofArrayPointers->{$_l_KeyPosition}
	End if 
	ARRAY TEXT:C222($_at_DiaryrecordCodes; 0)
	For ($_l_LineIndex; 1; Size of array:C274($_Ptr_ThisColumnArray->))
		APPEND TO ARRAY:C911($_at_DiaryrecordCodes; $_Ptr_ThisColumnArray->{$_l_LineIndex})
	End for 
	Case of 
		: ($_bo_IgnoreUnHighlighted=False:C215) & ($_bo_IgnoreHighlighted=False:C215)
			//do nothing (leave everything in the array)
		: ($_bo_IgnoreUnHighlighted) & ($_bo_IgnoreHighlighted)
			ARRAY TEXT:C222($_at_DiaryrecordCodes; 0)  //set array size back to 0
		: ($_bo_IgnoreUnHighlighted)
			LB_ReduceArrayBasedOnLBSelect(->SD_lb_Workflow; ->$_at_DiaryrecordCodes)
		: ($_bo_IgnoreHighlighted)
			LB_ReduceArrayBasedOnLBSelect(->SD_lb_Workflow; ->$_at_DiaryrecordCodes; True:C214)
	End case 
End if 
//
//Now set the current selection of diary records - which was the whole point of this method
$_t_NumberofDiaryCodes:=Size of array:C274($_at_DiaryrecordCodes)
If ($_t_NumberofDiaryCodes>0)
	QUERY WITH ARRAY:C644([DIARY:12]Diary_Code:3; $_at_DiaryrecordCodes)
Else 
	REDUCE SELECTION:C351([DIARY:12]; 0)
End if 
ERR_MethodTrackerReturn("SD2_DiaryViewManageSelectionNEW"; $_t_oldMethodName)
