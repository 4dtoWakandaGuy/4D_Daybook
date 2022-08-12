//%attributes = {}
If (False:C215)
	//Project Method Name:      Cal4D_Alert
	//------------------ Method Notes ------------------
	// Project Method: Cal4D_Alert (code{; error number})
	
	// This routine is called when the calendar needs to display an alert.
	// This is a public method so the developer can use a custom Alert dialog, or
	//   the alert message can be localized.
	// Alerts within the code are given labels that are then looked up in the
	//   Case statement below. This makes it easier to localize.
	// Developer errors (such as passing the wrong number of parameters) are not
	//   coded. In this case a full error message is passed to this routine.
	
	// Access Type: Public
	
	// Parameters:
	//   $1 : Text : The message code
	//   $2 : Longint : The error number (optional)
	
	// Returns: Nothing
	
	// Created by Dave Batton on May 25, 2004
	
	//------------------ Revision Control ----------------
	//Date Created: 18/12/2009 12:52`Method: Cal4D_Alert
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_Error; $2)
	C_TEXT:C284($_t_code; $_t_error; $_t_message; $_t_oldMethodName; $1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cal4D_Alert")

$_t_code:=$1
If (Count parameters:C259>=2)
	$_l_Error:=$2
Else 
	$_l_Error:=0
End if 

Case of 
	: ($_t_code="EventRecordNotFound")
		$_t_message:="The event record could not be found in the database. "+"It may have been deleted by another user or automatically updated."
		
	: ($_t_code="EventNotOwned")
		$_t_message:="This event belongs to another user. You may view it, but you cannot modify it."
		
	: ($_t_code="LockedRecord")
		$_t_message:="The record is in use and cannot be modified now."
		
	: ($_t_code="LockedEvent")
		$_t_message:="This event may not be modified."
		
	: ($_t_code="LockedSubscriptionEvent")
		$_t_message:="This event is part of a subscription. It cannot be modified."
		
	: ($_t_code="NameRequired")
		$_t_message:="A calendar name is required."
		
	: ($_t_code="URLRequired")
		$_t_message:="Please specify the calendar's URL.\r\re.g. webcal://www.domain.com/calendar.ics"
		
	: ($_t_code="TitleRequired")
		$_t_message:="A title is required for this event type."
		
	: ($_t_code="PictureRequired")
		$_t_message:="A title or picture is required for this event type."
		
	: ($_t_code="TooManyEvents")
		$_t_message:="There are more events this month than can be displayed on this calendar."
		
	: ($_t_code="InvalidEndDate")
		$_t_message:="The event's end date must be greater than or equal to the start date."
		
	: ($_t_code="ImportError")
		$_t_message:="An error occurred while trying to download and import the calendar."
		
	: ($_t_code="DeleteError")
		$_t_message:="An error occurred while trying to delete the calendar."
		
	Else 
		$_t_message:=$_t_code  // This is a developer error message.
End case 

If ($_l_Error#0)
	$_t_error:=Cal4D_iCal_GetErrorMessage($_l_Error)
	If ($_t_error#"")
		$_t_message:=$_t_message+Char:C90(Carriage return:K15:38)+Char:C90(Carriage return:K15:38)+$_t_error
	End if 
	$_t_message:=$_t_message+"  ["+String:C10($_l_Error)+"]"
End if 

Gen_Alert($_t_message)
ERR_MethodTrackerReturn("Cal4D_Alert"; $_t_oldMethodName)