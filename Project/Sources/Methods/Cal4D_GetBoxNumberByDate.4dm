//%attributes = {}
If (False:C215)
	//Project Method Name:      Cal4D_GetBoxNumberByDate
	//------------------ Method Notes ------------------
	// ----------------------------------------------------
	// Project Method: Cal4D_GetBoxNumberByDate (date) --> Longint
	
	// Pass this routine a date and it will return the corresponding box number.
	// If the date isn't represented in the current calendar, 0 is returned.
	
	// Access Type: Private
	
	// Parameters:
	//   $1 : Date : The date
	
	// Returns:
	//   $0 : Longint : The box number
	
	// Created by Dave Batton on May 25, 2004
	
	//------------------ Revision Control ----------------
	//Date Created: 22/12/2009 14:34`Method: Cal4D_GetBoxNumberByDate
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_DATE:C307(<>CAL_d_Box1Date; <>CAL_d_BoxLastDate; $_d_Date; $_d_FirstBoxDate; $1)
	C_LONGINT:C283($_l_Box; $0)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cal4D_GetBoxNumberByDate")


$_d_Date:=$1

If (($_d_Date<<>CAL_d_Box1Date) | ($_d_Date><>CAL_d_BoxLastDate))
	$_l_Box:=0
	
Else 
	$_d_FirstBoxDate:=<>CAL_d_Box1Date
	$_l_Box:=$_d_Date-$_d_FirstBoxDate+1
End if 

$0:=$_l_Box
ERR_MethodTrackerReturn("Cal4D_GetBoxNumberByDate"; $_t_oldMethodName)