//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Macro MenuFile
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 28/11/2010 17:15
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(<>AutoProc; <>MenuProc; <>SCPT_l_RecordEdit; <>SCPT_l_PlayerActive; $_l_Process; $_l_TableNumber)
	C_TEXT:C284($_t_MenuItemParameter; $_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Macro MenuFile")
//Macro MenuFile
//See also On_EventFKey
If (<>MenuProc=0)
	<>MenuProc:=1
End if 
If (<>SCPT_l_PlayerActive=0)
	If (<>SCPT_l_RecordEdit=0)
		If ((DB_GetModuleSettingByNUM(Module_Macros))>1)
			$_l_Process:=Frontmost process:C327(*)
			If ($_l_Process=<>MenuProc)
				<>AutoProc:=109  //pretend it's Command-Shift M
			Else 
				$_t_MenuItemParameter:=Get selected menu item parameter:C1005
				$_l_TableNumber:=Num:C11($_t_MenuItemParameter)
				<>AutoProc:=1000+$_l_TableNumber
				
			End if 
			$_l_Process:=New process:C317("Record_FKey"; DB_ProcessMemoryinit(4); "Macro FKey")
		Else 
			Gen_Alert("You do not have access to Macros"; "Cancel")
		End if 
	Else 
		Gen_Alert("You cannot play a Macro while the Macro Editor is being used"; "Cancel")
	End if 
Else 
	Gen_Alert("Another Macro is currently being played"; "Cancel")
End if 
ERR_MethodTrackerReturn("Macro MenuFile"; $_t_oldMethodName)