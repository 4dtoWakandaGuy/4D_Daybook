//%attributes = {}
If (False:C215)
	//Project Method Name:      Time_Mod
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 14/06/2010 15:25
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(<>MENU_l_BarModule; MOD_l_CurrentModuleAccess; vD)
	C_TEXT:C284($_t_oldMethodName; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; WIN_t_CurrentInputForm; WIN_t_CurrentOutputform)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Time_Mod")
//Time_Mod
Start_Process
If (Diary_File)  //NG modified June 2004
	MOD_l_CurrentModuleAccess:=DB_GetModuleSettingByNUM(Module_DiaryManager)
	Gen_Read_Only
	FORM SET INPUT:C55([DIARY:12]; "Diary_inT")  //NG April 2004 Removed ◊Screen
	WIN_t_CurrentInputForm:="Diary_inT"
	FORM SET OUTPUT:C54([DIARY:12]; "Diary_OutT")
	WIN_t_CurrentOutputform:="Diary_OutT"
	While (vD=1)
		DB_t_CurrentFormUsage:="Time"
		Diary_Sel
		Gen_ModMid("View Time"; "DMaster"; ->[DIARY:12]; ->vD; "Time Items"; "")
	End while 
End if 

Process_End
ERR_MethodTrackerReturn("Time_Mod"; $_t_oldMethodName)