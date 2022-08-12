//%attributes = {}
If (False:C215)
	//Project Method Name:      ZScrnSav_Proc
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
	C_LONGINT:C283(<>PER_l_CurrentUserID; $_l_ProcessNumber; $_l_ProcessState; $_l_ProcessTime; $0)
	C_OBJECT:C1216($_Obj_GetUser)
	C_TEXT:C284($_t_oldMethodName; $_t_ProcessName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("ZScrnSav_Proc")
$_l_ProcessNumber:=Frontmost process:C327(*)
$_Obj_GetUser:=New object:C1471("personID"; <>PER_l_CurrentUserID; "functions"; "")
SYS_GetCurrentUserSetting($_Obj_GetUser)

PROCESS PROPERTIES:C336($_l_ProcessNumber; $_t_ProcessName; $_l_ProcessState; $_l_ProcessTime)
If (($_t_ProcessName="Design Process") | ($_Obj_GetUser.functions ?? 6))
	$0:=0
Else 
	$_l_ProcessNumber:=Process_No("$Progress2")  //never show if progress bar is operating
	If ($_l_ProcessNumber#0)
		$0:=0
	Else 
		$0:=Process_No("$ScreenSaveWin")
		If ($0=0)
			$0:=New process:C317("ScrnSav_Proc"; 128000; "$ScreenSaveWin")
		Else 
			$0:=Process state:C330($0)
			If ($0=-1)
				$0:=New process:C317("ScrnSav_Proc"; 35000; "$ScreenSaveWin")
			Else 
				$0:=0
			End if 
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("ZScrnSav_Proc"; $_t_oldMethodName)
