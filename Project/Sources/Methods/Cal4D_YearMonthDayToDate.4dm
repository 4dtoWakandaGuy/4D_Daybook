//%attributes = {}
If (False:C215)
	//Project Method Name:      Cal4D_YearMonthDayToDate
	//------------------ Method Notes ------------------
	// ----------------------------------------------------
	// Project Method: Cal4D_YearMonthDayToDate (year; month; day) --> Date
	
	// Converts the year, month, and day into a 4D date.
	// Works with either a two or four digit year.
	// Works regardless of the system's date format or the default century setting.
	
	// Access Type: Private
	
	// Parameters:
	//   $1 : Longint : Year (2 or 4 digits)
	//   $2 : Longint : Month
	//   $3 : Longint : Day
	
	// Returns:
	//   $0 : Date : The date
	
	// Created by Dave Batton on May 2, 2004
	// ----------------------------------------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/12/2009 14:23`Method: Cal4D_YearMonthDayToDate
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_DATE:C307($_d_ResultDate; $0)
	C_LONGINT:C283($_l_Day; $_l_Month; $_l_Year; $1; $2; $3)
	C_TEXT:C284($_t_DateStr; $_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cal4D_YearMonthDayToDate")


$_l_Year:=$1
$_l_Month:=$2
$_l_Day:=$3

// There's really no reason to call Cal4D_Date_Init here.

// Handle 2 digit dates here. Make it a 4 digit date.
// This technique works for any system date format.
If ($_l_Year<100)
	$_t_DateStr:=String:C10(!1776-01-02!; Internal date short:K1:7)
	$_t_DateStr:=Replace string:C233($_t_DateStr; "1776"; String:C10($_l_Year; "00"))
	$_l_Year:=Year of:C25(Date:C102($_t_DateStr))
End if 

$_d_ResultDate:=Add to date:C393(!1900-01-01!; $_l_Year-1900; $_l_Month-1; $_l_Day-1)

$0:=$_d_ResultDate
ERR_MethodTrackerReturn("Cal4D_YearMonthDayToDate"; $_t_oldMethodName)