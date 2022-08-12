//%attributes = {}
If (False:C215)
	//Project Method Name:      SD2_DiaryViewHighlightRecords
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 06/09/2009 12:57
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(SD_lb_Workflow;0)
	ARRAY LONGINT:C221($_al_LineNumbers; 0)
	//ARRAY POINTER(SD2_aptr_ListControl;0)
	ARRAY TEXT:C222($_at_DiaryRecordCodes; 0)
	//ARRAY TEXT(SD2_at_CachedSelections;0)
	//ARRAY TEXT(SD2_at_PageTabs;0)
	C_LONGINT:C283($_l_Index3; $_l_KeyFIeldPosition; $_l_KeyValuePosition; $_l_LineIndex)
	C_POINTER:C301($_ptr_Field; $_ptr_FieldsArray; $_Ptr_KeyValuesArray; $_ptr_PointersArray)
	C_TEXT:C284($_t_CachedSelection; $_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SD2_DiaryViewHighlightRecords")
//This method hightlights the cached selection within the current form. Note that if the selection or sort has changed then these records may not be on this page so they don't get hightlight
//and so the highlighted selection gets updated. now this could cause complaints becuase the highlighted records change but i doubt it
ARRAY TEXT:C222($_at_DiaryRecordCodes; 0)
If (Size of array:C274(SD2_at_PageTabs)>0)
	
	//Mulit page
	If (SD2_at_PageTabs<=Size of array:C274(SD2_at_CachedSelections))
		
		If (Size of array:C274(SD2_at_CachedSelections{SD2_at_PageTabs})>0)  //altered from $i to SD2_at_PageTabs - 23/06/08 -kmw
			
			For ($_l_Index3; 1; Size of array:C274(SD2_at_CachedSelections{SD2_at_PageTabs}))  //altered from $i to SD2_at_PageTabs - 23/06/08 -kmw
				//APPEND TO ARRAY($_at_DiaryRecordCodes;SD2_at_CachedSelections{$i}{$_l_Index3})
				$_t_CachedSelection:=SD2_at_CachedSelections{SD2_at_PageTabs}{$_l_Index3}
				APPEND TO ARRAY:C911($_at_DiaryRecordCodes; $_t_CachedSelection)  //altered from $i to SD2_at_PageTabs - 23/06/08 -kmw
			End for 
			
		Else 
			//all on that page
			//So here the record numbers are in the 'SD2_AL_PAGECACHE'
			//Nothing to highlight
		End if 
	End if 
	
Else 
	//Just the one
	ARRAY TEXT:C222($_at_DiaryRecordCodes; 0)
	If (Size of array:C274(SD2_at_CachedSelections)>=1)
		COPY ARRAY:C226(SD2_at_CachedSelections{1}; $_at_DiaryRecordCodes)
	End if 
	//This is the record numbers
End if 

//commented out the check for $_at_DiaryRecordCodes >0 -23/06/08 -kmw (If none selected on a page it DOESN'T mean that we don't have to reset the selected lines back to none!)
//If (Size of array($_at_DiaryRecordCodes)>0)


//LB_Setselect
ARRAY LONGINT:C221($_al_LineNumbers; 0)
$_ptr_PointersArray:=SD2_aptr_ListControl{3}
$_ptr_FieldsArray:=SD2_aptr_ListControl{2}
$_ptr_Field:=SD2_aptr_ListControl{8}
$_l_KeyFIeldPosition:=Find in array:C230($_ptr_FieldsArray->; $_ptr_Field)
If ($_l_KeyFIeldPosition>0)  //it should be
	$_Ptr_KeyValuesArray:=$_ptr_PointersArray->{$_l_KeyFIeldPosition}
End if 


For ($_l_LineIndex; 1; Size of array:C274($_Ptr_KeyValuesArray->))
	$_l_KeyValuePosition:=Find in array:C230($_at_DiaryRecordCodes; $_Ptr_KeyValuesArray->{$_l_LineIndex})
	If ($_l_KeyValuePosition>0)
		APPEND TO ARRAY:C911($_al_LineNumbers; $_l_LineIndex)
	End if 
End for 
LB_SetSelect(->SD_lb_Workflow; ->$_al_LineNumbers)
If (Size of array:C274($_al_LineNumbers)#Size of array:C274($_at_DiaryRecordCodes))
	SD2_DiaryVIewManageCaches  //Update the cache for the current page.
End if 

//commented out the check for $_at_DiaryRecordCodes >0 -23/06/08 -kmw (If none selected on a page it DOESN'T mean that we don't have to reset the selected lines back to none!)
//End if
ERR_MethodTrackerReturn("SD2_DiaryViewHighlightRecords"; $_t_oldMethodName)