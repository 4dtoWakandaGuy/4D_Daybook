//%attributes = {}
If (False:C215)
	//Project Method Name:      Cal4D_iCal_GetErrorMessage
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 18/12/2009 12:54`Method: Cal4D_iCal_GetErrorMessage
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//C_UNKNOWN(BEGIN)
	//C_UNKNOWN(VCALENDAR)
	C_LONGINT:C283($1)
	C_TEXT:C284($_t_Message; $_t_oldMethodName; $0)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cal4D_iCal_GetErrorMessage")


$_t_Message:=IT_ErrorText($1)
If ($_t_Message="")
	Case of 
		: ($1=1400)
			$_t_Message:="The request could not be understood by the server."
		: ($1=1401)
			$_t_Message:="The request requires user authentication."
		: ($1=1403)
			$_t_Message:="Invalid username or password."
		: ($1=1404)
			$_t_Message:="The requested WebDAV folder doesn't exist."
		: ($1=1405)
			$_t_Message:="The method specified in the Request-Line is not allowed for the resource identifi"+"ed by the Request-URI."
		: ($1=1408)
			$_t_Message:="The request took longer than allowed to complete. Try again later."
		: ($1=14013)
			$_t_Message:="The server is refusing to process a request because the request entity is larger "+"than the server is willing or able to process."
		: ($1=14014)
			$_t_Message:="The server is refusing to service the request because the Request-URI is longer t"+"han the server is willing to interpret."
			
		: ($1=19310)  // Cal4D_User_Delete
			$_t_Message:="The user record could not be found."
		: ($1=19311)  // Cal4D_User_Delete
			$_t_Message:="The user record is in use and cannot be deleted now. Try again later."
			
		: ($1=19320)  // Cal4D_iCal_Delete
			$_t_Message:="The calendar record could not be found."
		: ($1=19321)  // Cal4D_iCal_Delete
			$_t_Message:="This calendar is in use and cannot be deleted now. Try again later."
		: ($1=19322)  // Cal4D_iCal_Delete,
			$_t_Message:="One of this calendar's events is in use and cannot be deleted now. "+"Try again later."
		: ($1=19330)  // Cal4D_iCal_DownloadCalendarFile
			$_t_Message:="The calendar URL is not valid."
		: ($1=19340)  // Cal4D_iCal_ReadSubscription
			$_t_Message:="This is not a valid calendar file. \"BEGIN:VCALENDAR\" was not found."
		: ($1=19350)  // Cal4D_iCal_ReadSubscription
			$_t_Message:="This is not a valid calendar file."
			
		Else 
			$_t_Message:=""  // Return a blank string if we don't have a text description.
	End case 
End if 

$0:=$_t_Message
ERR_MethodTrackerReturn("Cal4D_iCal_GetErrorMessage"; $_t_oldMethodName)