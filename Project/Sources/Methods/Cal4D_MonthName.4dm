//%attributes = {}
If (False:C215)
	//Project Method Name:      Cal4D_MonthName
	//------------------ Method Notes ------------------
	// ----------------------------------------------------
	// Project Method: Cal4D_MonthName (month number) --> Text
	
	// Returns the name of the month with the specified number.
	// This routine gets the month names from 4D's resource fork, so
	//   the returned value is localized.
	
	// Access Type: Private
	
	// Parameters:
	//   $1 : Longint : 1 thorugh 12
	
	// Returns:
	//   $0 : Text : The name of the month
	
	// Created by Dave Batton on May 2, 2004
	// ----------------------------------------------------
	//------------------ Revision Control ----------------
	//Date Created: 22/12/2009 14:25`Method: Cal4D_MonthName
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_MonthNumber; $1)
	C_TEXT:C284($_t_InternalLabel; $_t_MonthName; $_t_oldMethodName; $0)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cal4D_MonthName")


$_l_MonthNumber:=$1

Cal4D_Init

If (($_l_MonthNumber>=1) & ($_l_MonthNumber<=12))
	$_t_MonthName:=Get indexed string:C510(14001; $_l_MonthNumber)
Else 
	$_t_MonthName:="Error"
End if 

$0:=$_t_MonthName
ERR_MethodTrackerReturn("Cal4D_MonthName"; $_t_oldMethodName)