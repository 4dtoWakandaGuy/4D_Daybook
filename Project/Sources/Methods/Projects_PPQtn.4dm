//%attributes = {}
If (False:C215)
	//Project Method Name:      Projects_PPQtn
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 28/11/2010 09:34
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; WIN_t_CurrentInputForm)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Projects_PPQtn")
//Projects_PPQtn
Menu_Record("Projects_PPQtn"; "Quotation WP")
If ((DB_GetModuleSettingByNUM(Module_WPManager)=2) | (DB_GetModuleSettingByNUM(Module_WPManager)=4))
	DB_SaveRecord(->[PROJECTS:89])
	AA_CheckFileUnlocked(->[PROJECTS:89]X_ID:11)
	Jobs_PPBef
	Start_ProcMail
	Projects_PPQtnI
	DB_t_CurrentFormUsage:="QJob"
	FORM SET INPUT:C55([DIARY:12]; "Diary_inL"+Documents_4DWriteAccessType(True:C214))
	WIN_t_CurrentInputForm:="Diary_inL"+Documents_4DWriteAccessType(True:C214)
	Open_Pro_Window("Project Quotation"; 0; 2; ->[DIARY:12]; WIN_t_CurrentInputForm)
	ADD RECORD:C56([DIARY:12]; *)
	Close_ProWin(Table name:C256(->[DIARY:12])+"_"+WIN_t_CurrentInputForm)
	
	UNLOAD RECORD:C212([DIARY:12])
	UNLOAD RECORD:C212([DOCUMENTS:7])
Else 
	Gen_Alert("You do not have access to the WP Module"; "Cancel")
End if 
ERR_MethodTrackerReturn("Projects_PPQtn"; $_t_oldMethodName)
