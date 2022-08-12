//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Time Mod
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

$_t_oldMethodName:=ERR_MethodTracker("Time Mod")
//Time Mod
Start_Process
If (Diary_File)  //NG modified June 2004
	MOD_l_CurrentModuleAccess:=DB_GetModuleSettingByNUM(Module_DiaryManager)
	Gen_Read_Only
	FORM SET INPUT:C55([DIARY:12]; "Diary_InT13")  //NG April 2004 Removed ◊Screen
	WIN_t_CurrentInputForm:="Diary_InT13"
	FORM SET OUTPUT:C54([DIARY:12]; "Diary OutT")
	WIN_t_CurrentOutputform:="Diary OutT"
	While (vD=1)
		DB_t_CurrentFormUsage:="Time"
		Diary_Sel
		Gen_ModMid("View Time"; "DMaster"; ->[DIARY:12]; ->vD; "Time Items"; "")
	End while 
End if 

Process_End
ERR_MethodTrackerReturn("Time Mod"; $_t_oldMethodName)