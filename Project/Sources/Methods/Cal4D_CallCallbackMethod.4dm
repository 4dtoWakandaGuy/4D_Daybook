//%attributes = {}
If (False:C215)
	//Project Method Name:      Cal4D_CallCallbackMethod
	//------------------ Method Notes ------------------
	// Project Method: Cal4D_CallCallbackMethod (form event; calendar event ID{; start date; end date}) --> Boolean
	
	// Calls the event callback method if one has been installed.
	// Does nothing if no event handler is installed.
	// Pass No current record if there is no associated calendar event.
	// See Cal4D_EventCallbackMethod.
	
	// Access Type: Private
	
	// Parameters:
	//   $1 : Longint : The form event
	//   $2 : Longint : The associated event ID or 'No current record'
	//   $3 : Date : The event start date
	//   $4 : Date : The event end date
	
	// Returns:
	//   $0 : Boolean : True if the callback method was called
	
	// Created by Dave Batton on Mar 6, 2006
	//// Modified by: Charles Vass (02/26/2009, 12:10) Changed EXECUTE FORMULA to EXECUTE METHOD
	//// the method must have been shared ("Shared by components and host database" option, in the Method properties).
	
	//------------------ Revision Control ----------------
	//Date Created: 22/12/2009 14:36`Method: Cal4D_CallCallbackMethod
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_Handled; $0)
	C_DATE:C307($_d_EndDate; $_d_StartDate; $3; $4)
	C_LONGINT:C283($_l_eventID; $_l_Formevent; $_l_Params; $1; $2)
	C_TEXT:C284(<>Cal_t_CallbackMethodforEvents; $_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cal4D_CallCallbackMethod")

$_l_Params:=Count parameters:C259

$_l_Formevent:=$1
$_l_eventID:=$2

If ($_l_Params>=4)
	$_d_StartDate:=$3
	$_d_EndDate:=$4
Else 
	$_d_StartDate:=!00-00-00!
	$_d_EndDate:=!00-00-00!
End if 

If (<>Cal_t_CallbackMethodforEvents="")
	$_bo_Handled:=False:C215
	
Else 
	//EXECUTE FORMULA(◊Cal_t_CallbackMethodforEvents+"("+String($_l_Formevent)+";"+String($_l_eventID)+";!"+String($_d_StartDate)+"!;!"+String($_d_EndDate)+"!)")
	If ($_l_Params>=4)
		EXECUTE METHOD:C1007(<>Cal_t_CallbackMethodforEvents; *; $_l_Formevent; $_l_eventID; $_d_StartDate; $_d_EndDate)
	Else 
		EXECUTE METHOD:C1007(<>Cal_t_CallbackMethodforEvents; *; $_l_Formevent; $_l_eventID)
	End if 
	$_bo_Handled:=True:C214
End if 

$0:=$_bo_Handled
ERR_MethodTrackerReturn("Cal4D_CallCallbackMethod"; $_t_oldMethodName)