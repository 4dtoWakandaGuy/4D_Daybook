//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Diary_ModSW
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/09/2009 21:29:29If (False)// ----------------------------------------------------
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(<>MENU_l_BarModule; MOD_l_CurrentModuleAccess; vD)
	C_TEXT:C284($_t_oldMethodName; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Diary_ModSW")
//Diary_ModL
Start_Process
If (Diary_FileL)  // modified NG June 2004
	MOD_l_CurrentModuleAccess:=DB_GetModuleSettingByNUM(<>MENU_l_BarModule)
	If (MOD_l_CurrentModuleAccess=3)
		READ ONLY:C145
	Else 
		READ WRITE:C146
	End if 
	While (vD=1)
		DB_t_CurrentFormUsage:="InL"
		Diary_Sel
		QUERY SELECTION:C341([DIARY:12]; [DIARY:12]Document_Code:15#"")
		Gen_ModMid("View Document History"; "DMaster"; ->[DIARY:12]; ->vD; "Diary Items"; ""; 0; "L")
	End while 
End if 

Process_End
ERR_MethodTrackerReturn("Diary_ModSW"; $_t_oldMethodName)