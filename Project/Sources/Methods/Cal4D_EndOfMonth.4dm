//%attributes = {}
If (False:C215)
	//Project Method Name:      Cal4D_EndOfMonth
	//------------------ Method Notes ------------------
	// ----------------------------------------------------
	// Project Method: Cal4D_EndOfMonth (date) --> Date
	
	// Returns the last day of the month passed.
	
	// Access Type: Private
	
	// Parameters:
	//   $1 : Date : Any date
	
	// Returns:
	//   $0 : Date : The last day of the month for the date
	
	// Created by Dave Batton on Apr 28, 2004
	// -----------------------------------------------
	//------------------ Revision Control ----------------
	//Date Created: 22/12/2009 14:36`Method: Cal4D_EndOfMonth
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_DATE:C307($0; $1; $_d_Date)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cal4D_EndOfMonth")



$_d_Date:=$1

// There's really no reason to call Cal4D_Init here.

// Add a month to the input date.
$_d_Date:=Add to date:C393($_d_Date; 0; 1; 0)

// Get the first day of that month.
$_d_Date:=Cal4D_YearMonthDayToDate(Year of:C25($_d_Date); Month of:C24($_d_Date); 1)

// Get the date of the day before that date.
$_d_Date:=Add to date:C393($_d_Date; 0; 0; -1)

$0:=$_d_Date
ERR_MethodTrackerReturn("Cal4D_EndOfMonth"; $_t_oldMethodName)