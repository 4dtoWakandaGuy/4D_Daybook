//%attributes = {}
If (False:C215)
	//Project Method Name:      User_Licence
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/10/2012 16:24
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>Email_bo_Enabled; <>StartProc; <>SYS_bo_LoggedIn; $_bo_Accept; $_bo_ROState; $1; $LIC_bo_SuppressRelogin; Lic_bo_Accepted; Lic_bo_NotifiedToUs)
	C_DATE:C307(Lic_D_LicenceDate)
	C_LONGINT:C283(Lic_l_Version)
	C_TEXT:C284(<>KEYS; <>PathName; <>PER_t_CurrentUserName; $_t_oldMethodName; Lic_t_LicenceNumber)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("User_Licence")
//User Licence

//********************************** added 20/08/08 -kmw **********************************
//Need way to know to if this called from menu option of during startup.
//If it's from menu item then the existing way that it forces the user to...
//...login again (so any licence changes take effect)  is fine.
//If it's during startup then the user will be faced with a login screen later...
//...on anyway and this function will mean they get TWO login screens in a...
//...row so need a way to suppress the login screen.
If (Count parameters:C259>0)
	$LIC_bo_SuppressRelogin:=$1
Else 
	$LIC_bo_SuppressRelogin:=False:C215
End if 
//**********************************************************************************************

//TRACE
Start_Process
<>StartProc:=False:C215  //to make sure that keystrokes aren't recorded by On Event
<>Keys:=""
If (False:C215)
	ALL RECORDS:C47([USER:15])
	
	$_bo_ROState:=Read only state:C362([USER:15])
	If ($_bo_ROState=True:C214)
		READ WRITE:C146([USER:15])
		LOAD RECORD:C52([USER:15])
		
	End if 
	
	If (Not:C34(Locked:C147([USER:15])))
		
		// Licence text stuff 21/03/03 pb
		$_bo_Accept:=Licence_TextAccept
		If ($_bo_Accept)
			Path_TestDlog
			
			If (OK=1)
				Lic_t_LicenceNumber:=<>PathName
				Lic_D_LicenceDate:=Current date:C33(*)
				Lic_bo_Accepted:=True:C214
				
				// this section added 19/06/03 pb
				CREATE RECORD:C68([LICENCE_UPDATES:97])
				[LICENCE_UPDATES:97]Licence:1:=Lic_t_LicenceNumber
				[LICENCE_UPDATES:97]Update_Date:2:=Current date:C33(*)
				[LICENCE_UPDATES:97]User:3:=<>PER_t_CurrentUserName
				[LICENCE_UPDATES:97]Version_Number:4:=Lic_l_Version
				DB_SaveRecord(->[LICENCE_UPDATES:97])
				UNLOAD RECORD:C212([LICENCE_UPDATES:97])
				
				If (<>Email_bo_Enabled)
					//Licence_SendEmail
					Lic_bo_NotifiedToUs:=True:C214
				End if   // email enabled
				Licence_SaveVariables
			End if 
			
			If ($LIC_bo_SuppressRelogin=False:C215)  //added 20/08/08 -kmw (see top of method for explanation)
				Change_AccessP2  //have to relog on because the ◊aaMods have all been set to 1
			End if   //added 20/08/08 -kmw (see top of method for explanation)
			
			
		End if 
	Else 
		Gen_Alert("The Preferences record is currently locked, so the Licence cannot be updated"; "OK")
	End if 
	READ ONLY:C145([USER:15])
	UNLOAD RECORD:C212([USER:15])
Else 
	DB_GetNewLicence
End if 
Process_End
ERR_MethodTrackerReturn("User_Licence"; $_t_oldMethodName)
