If (False:C215)
	//object Name: [PERSONNEL]Diary_ViewAG.Highlight Button3
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:09
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_DATE:C307(SD_D_CurrentviewDate)
	C_TEXT:C284($_t_oldMethodName; SD_t_Periodstr; vDateString)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [PERSONNEL].Diary_ViewAG.Highlight Button3"; Form event code:C388)
//◊SuperDiary
If (SD_RecordModified(->[DIARY:12]))
	SuperDiary_SaveChk
End if 
SD_D_CurrentviewDate:=Current date:C33
SD_t_Periodstr:=(MonthName(SD_D_CurrentviewDate))+" "+String:C10(Year of:C25(SD_D_CurrentviewDate))
vDateString:=String:C10(SD_D_CurrentviewDate; 7)
SD_DiaryViewCalc
ERR_MethodTrackerReturn("OBJ [PERSONNEL].Diary_ViewAG.Highlight Button3"; $_t_oldMethodName)
