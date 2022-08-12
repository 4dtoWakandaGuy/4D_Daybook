If (False:C215)
	//object Name: [USER]SD2_diaryViewer.OIncludeDone
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:46
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_event)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].SD2_diaryViewer.OIncludeDone"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4)
		//IncludeExclude completed modified-  `Force an update to the current search(search in selection!)
		//************** commented out 03/07/08 -kmw **************
		//If (SD2_T_SearchValue#"")
		//SD2_DiaryVIewManageView (1;SD2_T_SearchValue)
		//Else
		//SD2_DiaryViewManageSelection
		//SD2_DiaryVIewManageView (-1)
		//End if
		//**************************************************************
		SD2_DiaryVIewManageView(-1)  //changed to simply just this, 03/07/08 -kmw (SD2_DiaryVIewManageView does apply filters which now goes back to last search/select set before applying the filter anyway)
		
End case 
ERR_MethodTrackerReturn("OBJ [USER].SD2_diaryViewer.OIncludeDone"; $_t_oldMethodName)
