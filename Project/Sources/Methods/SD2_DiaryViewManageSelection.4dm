//%attributes = {}
If (False:C215)
	//Project Method Name:      SD2_DiaryViewManageSelection
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
	//ARRAY LONGINT(SD2_AL_PAGECACHE;0)
	//ARRAY POINTER(SD2_aptr_ListControl;0)
	ARRAY TEXT:C222($_at_PageSelection; 0)
	ARRAY TEXT:C222($_at_DiaryRecordCodes; 0)
	//ARRAY TEXT(SD2_at_CachedSelections;0)
	//ARRAY TEXT(SD2_at_PageTabs;0)
	C_BOOLEAN:C305($_bo_GetSelection; $_bo_IgnoreUnhighlighted; $_bo_IngoreHighlighted; $1; $2)
	C_LONGINT:C283($_l_Index; $_l_Index2; $_l_Index3; $_l_KeyFIeldPosition; $_l_LineIndex; $_l_RecordPosition)
	C_POINTER:C301($_ptr_Field; $_ptr_FieldsArray; $_Ptr_KeyValuesArray; $_ptr_PointersArray)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SD2_DiaryViewManageSelection")
//This method will get the current selection of diary records based on the paged views
//Get the current highlighted
If (Count parameters:C259>=1)
	$_bo_IgnoreUnhighlighted:=$1  //if $1 is true then only get the highlighted selections
Else 
	$_bo_IgnoreUnhighlighted:=False:C215
End if 
If (Count parameters:C259>=2)
	$_bo_IngoreHighlighted:=$2
Else 
	$_bo_IngoreHighlighted:=False:C215
End if 
//Note that if you pass true and true you WILL get 0
SD2_DiaryVIewManageCaches  //updates the cache of the current page
If (Size of array:C274(SD2_at_PageTabs)>0)
	//get from caches
	ARRAY TEXT:C222($_at_DiaryRecordCodes; 0)
	For ($_l_Index; 1; Size of array:C274(SD2_at_PageTabs))
		If ($_l_Index<=Size of array:C274(SD2_at_CachedSelections))  //Comment added 19/06/08, kmw - I think this must be a "just in case" check as surely the arrays "SD2_at_PageTabs" and "SD2_at_CachedSelections" are meant to always be the same size?
			
			If (Size of array:C274(SD2_at_CachedSelections{$_l_Index})>0) & (Not:C34($_bo_IngoreHighlighted))
				For ($_l_Index2; 1; Size of array:C274(SD2_at_CachedSelections{$_l_Index}))
					ARRAY TEXT:C222($_at_PageSelection; 0)
					CREATE SELECTION FROM ARRAY:C640([DIARY:12]; SD2_AL_PAGECACHE{$_l_Index})  //kmw 26/06/08 -Just curious but what happens here if a record has been deleted since it was put in the page cache?
					SELECTION TO ARRAY:C260([DIARY:12]Diary_Code:3; $_at_PageSelection)
					For ($_l_Index3; 1; Size of array:C274($_at_PageSelection))
						$_l_RecordPosition:=Find in array:C230($_at_DiaryRecordCodes; $_at_PageSelection{$_l_Index3})
						If ($_l_RecordPosition<0)
							APPEND TO ARRAY:C911($_at_DiaryRecordCodes; $_at_PageSelection{$_l_Index3})
						End if 
						
					End for 
					
				End for 
				
			Else 
				//all on that page
				//So here the record numbers are in the 'SD2_AL_PAGECACHE'
				If (Not:C34($_bo_IgnoreUnhighlighted))
					ARRAY TEXT:C222($_at_PageSelection; 0)
					CREATE SELECTION FROM ARRAY:C640([DIARY:12]; SD2_AL_PAGECACHE{$_l_Index})
					SELECTION TO ARRAY:C260([DIARY:12]Diary_Code:3; $_at_PageSelection)
					For ($_l_Index2; 1; Size of array:C274($_at_PageSelection))
						$_l_RecordPosition:=Find in array:C230($_at_DiaryRecordCodes; $_at_PageSelection{$_l_Index2})
						If ($_l_RecordPosition<0)
							APPEND TO ARRAY:C911($_at_DiaryRecordCodes; $_at_PageSelection{$_l_Index2})
						End if 
						
					End for 
					
				End if 
			End if 
		End if 
	End for 
	If (Size of array:C274($_at_DiaryRecordCodes)>0)
		//Because here i know what we are searching we can hard code this
		QUERY WITH ARRAY:C644([DIARY:12]Diary_Code:3; $_at_DiaryRecordCodes)
	Else 
		REDUCE SELECTION:C351([DIARY:12]; 0)
	End if 
Else 
	//just get from current page
	ARRAY TEXT:C222($_at_DiaryRecordCodes; 0)
	ARRAY LONGINT:C221($_al_CurrentSelection; 0)
	LB_GetSelect(->SD_lb_Workflow; ->$_al_CurrentSelection)
	If (Size of array:C274($_al_CurrentSelection)>0)
		$_bo_GetSelection:=True:C214
	Else 
		$_bo_GetSelection:=False:C215
	End if 
	$_ptr_PointersArray:=SD2_aptr_ListControl{3}
	$_ptr_FieldsArray:=SD2_aptr_ListControl{2}
	$_ptr_Field:=SD2_aptr_ListControl{8}
	$_l_KeyFIeldPosition:=Find in array:C230($_ptr_FieldsArray->; $_ptr_Field)
	If ($_l_KeyFIeldPosition>0)  //it should be
		$_Ptr_KeyValuesArray:=$_ptr_PointersArray->{$_l_KeyFIeldPosition}
	End if 
	ARRAY TEXT:C222($_at_DiaryrecordCodes; 0)
	For ($_l_LineIndex; 1; Size of array:C274($_Ptr_KeyValuesArray->))
		If (Not:C34($_bo_IngoreHighlighted))
			$_l_RecordPosition:=Find in array:C230($_al_CurrentSelection; $_l_LineIndex)
			If (($_l_RecordPosition>0) | ($_bo_GetSelection=False:C215))
				If ($_l_KeyFIeldPosition>0)
					APPEND TO ARRAY:C911($_at_DiaryRecordCodes; $_Ptr_KeyValuesArray->{$_l_LineIndex})
				End if 
			End if 
		Else 
			APPEND TO ARRAY:C911($_at_DiaryRecordCodes; $_Ptr_KeyValuesArray->{$_l_LineIndex})
		End if 
	End for 
	If (Size of array:C274($_at_DiaryRecordCodes)>0)
		//Because here i know what we are searching we can hard code this
		QUERY WITH ARRAY:C644([DIARY:12]Diary_Code:3; $_at_DiaryRecordCodes)
		If (Size of array:C274(SD2_at_CachedSelections)<1)
			ARRAY TEXT:C222(SD2_at_CachedSelections; 1; 0)
		End if 
		COPY ARRAY:C226($_at_DiaryRecordCodes; SD2_at_CachedSelections{1})
		
	Else 
		REDUCE SELECTION:C351([DIARY:12]; 0)
		
	End if 
End if 
ERR_MethodTrackerReturn("SD2_DiaryViewManageSelection"; $_t_oldMethodName)