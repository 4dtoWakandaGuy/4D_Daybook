//%attributes = {}
If (False:C215)
	//Project Method Name:      Cal4D_Cal_DaysInMonth
	//------------------ Method Notes ------------------
	////
	////  Cal4D_Cal_DaysInMonth
	////
	////  Written by Charles Vass - 11/17/2008, 17:22
	////
	////  Purpose: Return the maximum number of days of a month
	////
	////  $1 - type - purpose
	////
	////  Copyright 2007 CRV, Inc.
	////
	//*****************************************************************************
	//------------------ Revision Control ----------------
	//Date Created: 22/12/2009 15:13`Method: Cal4D_Cal_DaysInMonth
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_DATE:C307($1)
	C_LONGINT:C283($_l_Days; $_l_MonthOf; $_l_Year; $0)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cal4D_Cal_DaysInMonth")
If ($1>!00-00-00!)
	
	$_l_MonthOf:=Month of:C24($1)
	$_l_Year:=Year of:C25($1)
	
	//========================    Method Actions    ==================================
	
	Case of 
		: ($_l_MonthOf=1)
			$_l_Days:=31
		: ($_l_MonthOf=2)
			If (SD_YearisLeapYear($1))
				$_l_Days:=29
			Else 
				$_l_Days:=28
			End if 
		: ($_l_MonthOf=3)
			$_l_Days:=31
		: ($_l_MonthOf=4)
			$_l_Days:=30
		: ($_l_MonthOf=5)
			$_l_Days:=31
		: ($_l_MonthOf=6)
			$_l_Days:=30
		: ($_l_MonthOf=7)
			$_l_Days:=31
		: ($_l_MonthOf=8)
			$_l_Days:=31
		: ($_l_MonthOf=9)
			$_l_Days:=30
		: ($_l_MonthOf=10)
			$_l_Days:=31
		: ($_l_MonthOf=11)
			$_l_Days:=30
		: ($_l_MonthOf=12)
			$_l_Days:=31
	End case 
	
	//========================    Clean up and Exit    =================================
Else 
	$_l_Days:=31
End if 

$0:=$_l_Days
ERR_MethodTrackerReturn("Cal4D_Cal_DaysInMonth"; $_t_oldMethodName)