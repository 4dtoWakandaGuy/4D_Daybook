//%attributes = {}
If (False:C215)
	//Project Method Name:      SD_YearisLeapYear
	//------------------ Method Notes ------------------
	//*****************************************************************************
	////
	////  DAX_Cal_IsLeapYear
	////
	////  Written by Charles Vass - 11/11/2008, 17:19
	////
	////  Purpose: To determine if a year is a Leap Year
	////
	////  $0 - BOOLEAN - True for Leap Year
	////  $1 - DATE - Gregorian date to be tested
	////
	//*****************************************************************************
	
	//------------------ Revision Control ----------------
	//Date Created: 17/12/2009 15:35`Method: SD_YearisLeapYear
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_IsLeapYear; $0)
	C_DATE:C307($1)
	C_LONGINT:C283($_l_Year)
	C_TEXT:C284($_t_MethodName; $_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SD_YearisLeapYear")

$_l_Year:=Year of:C25($1)


$_bo_IsLeapYear:=($_l_Year%4)=0
If ($_bo_IsLeapYear & (($_l_Year%100)=0))
	$_bo_IsLeapYear:=($_l_Year%400)=0
End if 


$0:=$_bo_IsLeapYear
ERR_MethodTrackerReturn("SD_YearisLeapYear"; $_t_oldMethodName)
