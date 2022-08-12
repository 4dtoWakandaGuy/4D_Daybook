//%attributes = {}
If (False:C215)
	//Project Method Name:      SD_SHOWPALLETES
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
	C_BOOLEAN:C305(<>FloatingCALDisplayed; SD3_bo_FloatingDiarydisplayed)
	C_LONGINT:C283(<>FloatingCalender; SD3_l_FloatingDiaryList)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SD_SHOWPALLETES")
If (SD3_l_FloatingDiaryList>0)
	If (SD3_bo_FloatingDiarydisplayed)
		SHOW PROCESS:C325(SD3_l_FloatingDiaryList)
	End if 
	
End if 
If (<>FloatingCalender>0)
	If (<>FloatingCALDisplayed)
		SHOW PROCESS:C325(<>FloatingCalender)
	End if 
	
End if 
ERR_MethodTrackerReturn("SD_SHOWPALLETES"; $_t_oldMethodName)