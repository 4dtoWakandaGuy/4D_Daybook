//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Jobs PPQtn
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
	C_TEXT:C284($_t_oldMethodName; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Jobs PPQtn")
//Jobs PPQtn
Menu_Record("Jobs PPQtn"; "Quotation WP")
If ((DB_GetModuleSettingByNUM(Module_WPManager)=2) | (DB_GetModuleSettingByNUM(Module_WPManager)=4))
	Jobs_PPBef
	Start_ProcMail
	Jobs_PPQtnIte
	DB_t_CurrentFormUsage:="QJob"
	FORM SET INPUT:C55([DIARY:12]; "Diary_InL13"+Documents_4DWriteAccessType(True:C214))  //NG April 2004 removed reference to ◊screen
	
	Open_Pro_Window("Job Quotation"; 0; 2; ->[DIARY:12]; "Diary_InL13"+Documents_4DWriteAccessType(True:C214))  //NG may 2004 added form reference
	ADD RECORD:C56([DIARY:12]; *)
	Close_ProWin(Table name:C256(->[DIARY:12])+"_"+"Diary_InL13"+Documents_4DWriteAccessType(True:C214))
	
	UNLOAD RECORD:C212([DIARY:12])
	UNLOAD RECORD:C212([DOCUMENTS:7])
Else 
	Gen_Alert("You do not have access to the WP Module"; "Cancel")
End if 
ERR_MethodTrackerReturn("Jobs PPQtn"; $_t_oldMethodName)