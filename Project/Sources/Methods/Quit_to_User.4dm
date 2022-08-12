//%attributes = {}
If (False:C215)
	//Project Method Name:      Quit_to_User
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/01/2010 09:36
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>_bo_HidePalletteBar)
	C_LONGINT:C283(<>MenuWindow; <>SYS_l_WindowTop; $_l_NewProcess)
	C_TEXT:C284(<>SYS_t_PlatformSetting; $_t_oldMethodName)
End if 
//Code Starts Here
TRACE:C157
$_t_oldMethodName:=ERR_MethodTracker("Quit_to_User")

If (<>MenuWindow#0)
	
	// MoveWto (◊MenuWindow;53;◊WindowTop+50)
	// SetWSize (◊MenuWindow;455;267)
	If (Is Windows:C1573)
		
		//SET WINDOW RECT(59;<>SYS_l_WindowTop+72;55+455;<>SYS_l_WindowTop+60+267;<>MenuWindow)
		
	Else 
		//SET WINDOW RECT(53;<>SYS_l_WindowTop+50;53+455;<>SYS_l_WindowTop+50+267;<>MenuWindow)
		
	End if 
Else 
	//SET WINDOW RECT(53;50;53+455;50+267;Frontmost window)
End if 

//<>Bar:=0
ON EVENT CALL:C190("")
If (False:C215)
	Gen_PostKey(0; Character code:C91("ƒ"); 0)
	<>_bo_HidePalletteBar:=True:C214
	HIDE TOOL BAR:C434
Else 
	If (Is compiled mode:C492)
		<>_bo_HidePalletteBar:=True:C214
		$_l_NewProcess:=New process:C317("DB_LoadFauxUserMode"; 256000; "User_Mode")
		
		//SET WINDOW RECT(53;0+50;53+455;800;<>MenuWindow)
	Else 
		TRACE:C157
		If (False:C215)
			
			If (OK=1)
				TRACE:C157
				$_l_NewProcess:=New process:C317("DB_LoadFauxUserMode"; 256000; "User_Mode")
				
			Else 
				TRACE:C157
				
			End if 
		End if 
	End if 
	
End if 
ERR_MethodTrackerReturn("Quit_to_User"; $_t_oldMethodName)
