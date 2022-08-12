//%attributes = {}
If (False:C215)
	//Project Method Name:      Cal4D_iCal_GetDate
	//------------------ Method Notes ------------------
	// ----------------------------------------------------
	// Project Method: Cal4D_iCal_GetDate (date) --> Text
	
	// Construct the given date into the format of YYMMDD or YYYYMMDD.
	
	// Access Type: Private
	
	// Parameters:
	//   $1 : Date : A date
	
	// Returns:
	//   $0 : Text : The date in YYMMDD format
	
	// Created by Add Komoncharoensiri, 4D, Inc.
	//   Method originally named iCal_GetDate.
	// ----------------------------------------------------
	
	
	//------------------ Revision Control ----------------
	//Date Created: 22/12/2009 14:32`Method: Cal4D_iCal_GetDate
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_DATE:C307($_d_Date; $1)
	C_TEXT:C284($_t_DaySTR; $_t_MonthSTR; $_t_oldMethodName; $_t_YearSTR; $0)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cal4D_iCal_GetDate")

$_d_Date:=$1
$_t_MonthSTR:=String:C10(Month of:C24($_d_Date))
$_t_DaySTR:=String:C10(Day of:C23($_d_Date))
$_t_YearSTR:=String:C10(Year of:C25($_d_Date))

If (Length:C16($_t_MonthSTR)<2)
	$_t_MonthSTR:="0"+$_t_MonthSTR
End if 

If (Length:C16($_t_DaySTR)<2)
	$_t_DaySTR:="0"+$_t_DaySTR
End if 

If (Length:C16($_t_YearSTR)<2)
	$_t_YearSTR:="200"+$_t_YearSTR
Else 
	If (Length:C16($_t_YearSTR)<3)
		$_t_YearSTR:="20"+$_t_YearSTR
	End if 
End if 

$0:=$_t_YearSTR+$_t_MonthSTR+$_t_DaySTR
ERR_MethodTrackerReturn("Cal4D_iCal_GetDate"; $_t_oldMethodName)