If (False:C215)
	//object Name: [USER]Error_Report.baddScreenshot3
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 15/12/2009 10:24
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//Array TEXT(Err_at_aAttachements;0)
	//Array TEXT(Err_at_aAttachementsPATH;0)
	C_TEXT:C284($_t_oldMethodName; DB_t_ScreenshotPath)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].Error_Report.baddScreenshot3"; Form event code:C388)

HIDE WINDOW:C436
ERR_TakeScreenShot
DB_t_ScreenshotPath:=DOCUMENT
INSERT IN ARRAY:C227(Err_at_aAttachements; 9999; 1)
INSERT IN ARRAY:C227(Err_at_aAttachementsPATH; 9999; 1)
Err_at_aAttachementsPATH{Size of array:C274(Err_at_aAttachementsPATH)}:=DB_t_ScreenshotPath
Err_at_aAttachements{Size of array:C274(Err_at_aAttachements)}:=FileNamefromPath(DB_t_ScreenshotPath)
Err_at_aAttachements:=Size of array:C274(Err_at_aAttachements)
SHOW WINDOW:C435
ERR_MethodTrackerReturn("OBJ [USER].Error_Report.baddScreenshot3"; $_t_oldMethodName)