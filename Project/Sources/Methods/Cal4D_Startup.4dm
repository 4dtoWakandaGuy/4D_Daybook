//%attributes = {}
If (False:C215)
	//Project Method Name:      Cal4D_Startup
	//------------------ Method Notes ------------------
	// ----------------------------------------------------
	// Project Method: Cal4D_Startup ({user name})
	
	// Call at Startup to launch the calendar's background process. A user name can
	//   optionally be passed if the 4D password system isn't being used.
	
	// Access Type: Protected
	
	// Parameters:
	//   $1 : Text : The user name (optional)
	
	// Returns: None
	
	// Created by Dave Batton
	// ----------------------------------------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/12/2009 14:24`Method: Cal4D_Startup
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_processNumber)
	C_TEXT:C284(<>Cal_t_CurrentUserName; $_t_oldMethodName; $1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cal4D_Startup")


If (Application type:C494#4D Server:K5:6)  // This shouldn't be called from 4D Server.
	// Set the <>Cal4D_CurrentUserName_t before calling Cal4D_Init.
	// Allow it to be set only once. It can't be changed unless the email system is first shut down using EM4D_Quit.
	If (<>Cal_t_CurrentUserName="")
		If (Count parameters:C259>=1)
			<>Cal_t_CurrentUserName:=$1
		Else 
			<>Cal_t_CurrentUserName:=Current user:C182
		End if 
		
		Error:=0
		Cal4D_Init
		
	End if 
	
	// Launch our background process that will update network calendar events.
	// We'll let this happen even if the calendar stuff is already running. It might
	//   be helpful during development.
	//$processNumber_i:=New Process("Cal4D_BackgroundLoop";◊Cal4D_StackSize_i;◊Cal4D_BackgroundProcessName_t;*)
End if 
ERR_MethodTrackerReturn("Cal4D_Startup"; $_t_oldMethodName)