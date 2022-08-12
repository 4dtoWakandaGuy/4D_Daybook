//%attributes = {}
If (False:C215)
	//Project Method Name:      Cal4D_Event_GuessEventType
	//------------------ Method Notes ------------------
	// ----------------------------------------------------
	// Project Method: Cal4D_Event_GuessEventType (start date; start time; end date; end time) --> Text
	
	// Returns the default event type based on the time and date.
	
	// Access Type: Private
	
	// Parameters:
	//   $1 : Date : Start date
	//   $2 : Time : Start time
	//   $3 : Date : End date
	//   $4 : Time : End time
	
	// Returns:
	//   $0 : Text : The event type
	
	// Created by Dave Batton on Mar 12, 2006
	
	//------------------ Revision Control ----------------
	//Date Created: 22/12/2009 14:39`Method: Cal4D_Event_GuessEventType
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_DATE:C307($1; $3; $_d_EndDate; $_d_StartDate)
	C_TEXT:C284($_t_oldMethodName; $0; $_t_Type)
	C_TIME:C306($2; $4; $_ti_EndTime; $_ti_StartTime)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cal4D_Event_GuessEventType")



$_d_StartDate:=$1
$_ti_StartTime:=$2
$_d_EndDate:=$3
$_ti_EndTime:=$4

Case of 
	: ($_d_StartDate#$_d_EndDate)  // It starts and ends on different dates.
		$_t_Type:="Banner"
		
	: (($_ti_EndTime-$_ti_StartTime)>=60)  // The event is at least one minute in length.
		$_t_Type:="Appointment"
		
	: ($_ti_StartTime#?00:00:00?)  // There is a start time.
		$_t_Type:="Appointment"
		
	Else 
		$_t_Type:="All-Day"
		
End case 

$0:=$_t_Type
ERR_MethodTrackerReturn("Cal4D_Event_GuessEventType"; $_t_oldMethodName)