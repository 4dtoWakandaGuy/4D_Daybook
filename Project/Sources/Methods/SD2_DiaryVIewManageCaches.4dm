//%attributes = {}
If (False:C215)
	//Project Method Name:      SD2_DiaryVIewManageCaches
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
	//ARRAY BOOLEAN(SD_lb_Workflow;0)
	ARRAY LONGINT:C221($_al_CurrentSelection; 0)
	//ARRAY POINTER(SD2_aptr_ListControl;0)
	ARRAY TEXT:C222($_at_DiaryrecordCodes; 0)
	//ARRAY TEXT(SD2_at_CachedSelections;0)
	//ARRAY TEXT(SD2_at_PageTabs;0)
	C_LONGINT:C283($_l_Difference; $_l_KeyPosition; $_l_LineIndex; $_l_RecordRow; $_l_SizeofArray; SD2_CurrentPageTab)
	C_POINTER:C301($_ptr_ArrayFieldPointers; $_ptr_ArrayofArrayPointers; $_Ptr_KeyField; $_Ptr_ThisColumnArray)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SD2_DiaryVIewManageCaches")
//This method stores the cache for the current page-the Diary record codes of selected records
//it is called at page turn and also when doing anything that will change the current seleciton such as subselection to manage the re-highlighting
//it stores each page so we can get ALL the diary records highlighted on each page when need to(for instance for set intersection)
If (Size of array:C274(SD2_at_PageTabs)>0)
	If (Size of array:C274(SD2_at_CachedSelections)<SD2_at_PageTabs)  //To be safe
		$_l_Difference:=SD2_at_PageTabs-(Size of array:C274(SD2_at_CachedSelections))
		INSERT IN ARRAY:C227(SD2_at_CachedSelections; Size of array:C274(SD2_at_CachedSelections)+1; $_l_Difference)
	End if 
	
	ARRAY LONGINT:C221($_al_CurrentSelection; 0)
	LB_GetSelect(->SD_lb_Workflow; ->$_al_CurrentSelection)
	If (SD2_at_PageTabs>0)  //it should be!!!
		
		If (Size of array:C274($_al_CurrentSelection)>0)
			$_ptr_ArrayofArrayPointers:=SD2_aptr_ListControl{3}
			$_ptr_ArrayFieldPointers:=SD2_aptr_ListControl{2}
			$_Ptr_KeyField:=SD2_aptr_ListControl{8}
			$_l_KeyPosition:=Find in array:C230($_ptr_ArrayFieldPointers->; $_Ptr_KeyField)
			If ($_l_KeyPosition>0)  //it should be
				$_Ptr_ThisColumnArray:=$_ptr_ArrayofArrayPointers->{$_l_KeyPosition}
			End if 
			ARRAY TEXT:C222($_at_DiaryrecordCodes; 0)
			
			For ($_l_LineIndex; 1; Size of array:C274($_Ptr_ThisColumnArray->))
				$_l_RecordRow:=Find in array:C230($_al_CurrentSelection; $_l_LineIndex)
				If ($_l_RecordRow>0)
					If ($_l_KeyPosition>0)
						APPEND TO ARRAY:C911($_at_DiaryRecordCodes; $_Ptr_ThisColumnArray->{$_l_LineIndex})
					End if 
				End if 
			End for 
		Else 
			//Set the 'cache' to empty which means no highlighted-or all records
			ARRAY TEXT:C222($_at_DiaryrecordCodes; 0)
		End if 
		//(above var should be reset at END of page turn object method)
		//************************************* changed to use current tab page stored in a separate variable - kmw 23/08/06 (otherwise when called on page turn was saving the cache to the new page instead of the old page cache) ******************************
		//If (Size of array(SD2_at_CachedSelections{SD2_at_PageTabs})>0)
		If (Size of array:C274(SD2_at_CachedSelections{SD2_CurrentPageTab})>0)
			//Current cache
			//$_l_SizeofArray:=Size of array(SD2_at_CachedSelections{SD2_at_PageTabs})
			$_l_SizeofArray:=Size of array:C274(SD2_at_CachedSelections{SD2_CurrentPageTab})
			//DELETE ELEMENT(SD2_at_CachedSelections{SD2_at_PageTabs};1;$_l_SizeofArray)
			DELETE FROM ARRAY:C228(SD2_at_CachedSelections{SD2_CurrentPageTab}; 1; $_l_SizeofArray)
			//COPY ARRAY($_at_DiaryrecordCodes;SD2_at_CachedSelections{SD2_at_PageTabs})
			COPY ARRAY:C226($_at_DiaryrecordCodes; SD2_at_CachedSelections{SD2_CurrentPageTab})
		Else 
			//COPY ARRAY($_at_DiaryrecordCodes;SD2_at_CachedSelections{SD2_at_PageTabs})
			COPY ARRAY:C226($_at_DiaryrecordCodes; SD2_at_CachedSelections{SD2_CurrentPageTab})
		End if 
		//*********************************************************************************************************************************************************************************************************************************************************
	End if 
Else 
	//there is nowhere to 'cache' it
End if 
ERR_MethodTrackerReturn("SD2_DiaryVIewManageCaches"; $_t_oldMethodName)
