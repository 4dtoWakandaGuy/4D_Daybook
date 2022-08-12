If (False:C215)
	//object Method Name: Object Name:      [PERSONNEL].Diary_ViewAG.Variable3
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
	C_LONGINT:C283($_l_event; xNext)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [PERSONNEL].Diary_ViewAG.Variable3"; Form event code:C388)
$_l_event:=Form event code:C388


Case of 
	: ($_l_event=On Clicked:K2:4)
		xNext:=1
		If (SD_RecordModified(->[DIARY:12]))
			SuperDiary_SaveChk
		End if 
		
		ZProc("SD2_Diary_Mod"; DB_ProcessMemoryinit(4); "View Diary"; ""; ""; "1")
		
		
		
End case 
ERR_MethodTrackerReturn("OBJ:Diary_ViewAG,xFindNext"; $_t_oldMethodName)
