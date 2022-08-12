If (False:C215)
	//object Name: [USER]SD2_diaryViewer.oDiaryActionFilter5
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 03/06/2010 18:39
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName; SD2_t_Document; SD2_t_DocumentName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].SD2_diaryViewer.oDiaryActionFilter5"; Form event code:C388)
Check_Letter(->SD2_t_DocumentName; ""; 4D Write Letter Template)

SD2_t_Document:=SD2_t_DocumentName
SD2_t_DocumentName:=[DOCUMENTS:7]Heading:2
//************** commented out 03/07/08 -kmw **************
//If (SD2_T_SearchValue#"")
//SD2_DiaryVIewManageView (1;SD2_T_SearchValue)
//Else
//SD2_DiaryViewManageSelection
//SD2_DiaryVIewManageView (-1)
//End if
//**************************************************************
SD2_DiaryVIewManageView(-1)  //changed to simply just this, 03/07/08 -kmw (SD2_DiaryVIewManageView does apply filters which now goes back to last search/select set before applying the filter anyway)
ERR_MethodTrackerReturn("OBJ:SD2_diaryViewer,SD2_t_DocumentName"; $_t_oldMethodName)
