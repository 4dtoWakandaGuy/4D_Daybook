//%attributes = {}
If (False:C215)
	//Project Method Name:      Cal4D_DateAndTimeToLongint
	//------------------ Method Notes ------------------
	//Based on
	// Project Method: Cal4D_DateAndTimeToLongint (server time?) --> Number
	
	// Returns the current date and time as a long integer.
	// Pass True as the First_Parameter to get the time and date from the server.
	// This can be compared to similar longints to determine which is most recent.
	// Based on number of seconds from Midnight, Jan 1st 2000.
	
	// Access Type: Private
	
	// Parameters:
	//   $1 : Boolean : Get server's time and date?
	
	// Returns:
	//   $0 : Longint : Seconds
	
	// Created by Dave Batton on Apr 21, 2006
	// Based on UTIL_ConvertDateToNumber method posted to the iNUG by Myles Wakeham.
	
	//This is very similar to code already in Daybook
	//GEN_TimeDateStamp
	// however the 'starting date' is different.. ihave modified GenTimeDateStamp so it can work off different base dates an called it from here
	
	//------------------ Revision Control ----------------
	//Date Created: 18/12/2009 12:59`Method: Cal4D_DateAndTimeToLongint
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_ServerTime; $1)
	C_DATE:C307($_d_Date)
	C_LONGINT:C283($_l_seconds; $0)
	C_TEXT:C284($_t_oldMethodName)
	C_TIME:C306($_ti_Time)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cal4D_DateAndTimeToLongint")



If (Count parameters:C259>=1)
	$_bo_ServerTime:=$1
Else 
	$_bo_ServerTime:=False:C215
End if 

If ($_bo_ServerTime)
	$_d_Date:=Current date:C33(*)
	$_ti_Time:=Current time:C178(*)
Else 
	$_d_Date:=Current date:C33
	$_ti_Time:=Current time:C178
End if 
$0:=GEN_TimeDateStamp($_d_Date; $_ti_Time; !2000-01-01!)
ERR_MethodTrackerReturn("Cal4D_DateAndTimeToLongint"; $_t_oldMethodName)