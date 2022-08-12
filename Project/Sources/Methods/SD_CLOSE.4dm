//%attributes = {}
If (False:C215)
	//Project Method Name:      SD_CLOSE
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
	C_LONGINT:C283(<>FloatingCalender; SD3_l_FloatingDiaryList; iCancel)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SD_CLOSE")

//THIS METHOD WILL INTERFERE WITH THE CLOSE WINDOW CALL TO HIDE THE WINDOW
If (Not:C34(Macintosh option down:C545))
	If (SD_RecordModified(->[DIARY:12]))
		SuperDiary_SaveChk
	End if 
	HIDE PROCESS:C324(Current process:C322)
	If (SD3_l_FloatingDiaryList>0)
		HIDE PROCESS:C324(SD3_l_FloatingDiaryList)
	End if 
	If (<>FloatingCalender>0)
		HIDE PROCESS:C324(<>FloatingCalender)
	End if 
	
	iCancel:=0
	
Else 
	CANCEL:C270
	iCancel:=0
	
End if 
ERR_MethodTrackerReturn("SD_CLOSE"; $_t_oldMethodName)