//%attributes = {}
If (False:C215)
	//Project Method Name:      SD2_DiaryViewUnhighlightAll
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 16/10/2012 16:29
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(SD_lb_Workflow;0)
	ARRAY LONGINT:C221($_al_blankarray; 0)
	//ARRAY TEXT(SD2_at_CachedSelections;0)
	C_LONGINT:C283($_l_Index; $_l_SizeofArray)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SD2_DiaryViewUnhighlightAll")

//SD2_DiaryViewUnhighlightAll added 03/7/8-kmw




//changed from above to slightly more generic way of doing the unhighlight -03/07/08 -kmw
ARRAY LONGINT:C221($_al_blankarray; 0)
LB_SetSelect(->SD_lb_Workflow; ->$_al_blankarray)

For ($_l_Index; 1; Size of array:C274(SD2_at_CachedSelections))  //kmw 02/06/08 - unhighlight the logical cache of "highlighted" lines
	$_l_SizeofArray:=Size of array:C274(SD2_at_CachedSelections{$_l_Index})
	DELETE FROM ARRAY:C228(SD2_at_CachedSelections{$_l_Index}; 1; $_l_SizeofArray)
End for 

ERR_MethodTrackerReturn("SD2_DiaryViewUnhighlightAll"; $_t_oldMethodName)
LB_GetSelect
ERR_MethodTrackerReturn("SD2_DiaryViewUnhighlightAll"; $_t_oldMethodName)
