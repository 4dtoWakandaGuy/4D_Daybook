//%attributes = {}
If (False:C215)
	//Project Method Name:      Cal4D_GetDayOfWeek
	//------------------ Method Notes ------------------
	// ----------------------------------------------------
	// Project Method: Cal4D_GetDayOfWeek (day number) --> Text
	
	// Returns the name of the day of the week specified by the number paramter.
	// Uses 4D's numbering system, where 1=Sunday.
	// Specially modified so we can actually pass a number between 1 and 14, where
	//   8=Sunday, 9=Monday, etc. This lets us start anywhere in the week using a loop.
	
	// Access Type: Private
	
	// Parameters:
	//   $1 : Longint : The day number
	
	// Returns:
	//   $0 : Longint : The day of the week
	
	// Created by Dave Batton on May 25, 2004
	//   Based on code submitted to 4DToday.com by Basil Bourque.
	// ----------------------------------------------------
	//// Modified by: Charles Vass (02/26/2009, 10:50)
	////  Changed to use XLIFF strings
	
	//------------------ Revision Control ----------------
	//Date Created: 22/12/2009 14:33`Method: Cal4D_GetDayOfWeek
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($1; $2; $_l_Day; $_l_Width)
	C_TEXT:C284($_t_oldMethodName; $0)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cal4D_GetDayOfWeek")

//C_DATE($dayAsDate_d)

//// Modified by: Charles Vass (02/26/2009, 11:19)
$_l_Day:=$1
$_l_Width:=$2
Case of 
	: ($_l_Width<250)
		$0:=Get indexed string:C510(15003; $_l_Day)
	: ($_l_Width<500)
		$0:=Get indexed string:C510(15002; $_l_Day)
	Else 
		$0:=Get indexed string:C510(15001; $_l_Day)
End case 
ERR_MethodTrackerReturn("Cal4D_GetDayOfWeek"; $_t_oldMethodName)