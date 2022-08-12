//%attributes = {}
If (False:C215)
	//Project Method Name:      Time_In
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 12/06/2010 15:56
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(<>MENU_l_BarModule; $_l_AddMode; MOD_l_CurrentModuleAccess; Vadd)
	C_TEXT:C284($_t_oldMethodName; $_t_WindowTitle; DB_t_CallOnCloseorSave; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; WIN_t_CurrentInputForm)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Time_In")
//Time_In
$_t_WindowTitle:="Enter Time"
Start_Process
If (Diary_File)  //NG modified June 2004
	MOD_l_CurrentModuleAccess:=DB_GetModuleSettingByNUM(Module_DiaryManager)
	Gen_Read_Only
	If (In_Allowed($_t_WindowTitle; ->[DIARY:12]))
		FORM SET INPUT:C55([DIARY:12]; "Diary_inT")  //NG April 2004 Removed ◊Screen
		WIN_t_CurrentInputForm:="Diary_inT"
		CREATE SET:C116([DIARY:12]; "DMaster")
		REDUCE SELECTION:C351([DIARY:12]; 0)
		$_l_AddMode:=Vadd
		vAdd:=1
		OK:=1
		DB_t_CurrentFormUsage3:="Time_In"
		Open_Pro_Window($_t_WindowTitle; 0; 2; ->[DIARY:12]; WIN_t_CurrentInputForm)
		
		While ((OK=1) & (DB_t_CallOnCloseorSave#"Close"))
			DB_t_CurrentFormUsage:="Time"
			ADD RECORD:C56([DIARY:12]; *)
			ADD TO SET:C119([DIARY:12]; "DMaster")
			Gen_InOne
		End while 
		Close_ProWin(Table name:C256(->[DIARY:12])+"_"+WIN_t_CurrentInputForm)
		vAdd:=$_l_AddMode
	End if 
End if 

Process_End
ERR_MethodTrackerReturn("Time_In"; $_t_oldMethodName)
