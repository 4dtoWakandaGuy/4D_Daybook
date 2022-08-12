//%attributes = {}
If (False:C215)
	//Project Method Name:      Cal4D_GetDateByBoxNumber
	//------------------ Method Notes ------------------
	// ----------------------------------------------------
	// Project Method: Cal4D_GetDateByBoxNumber (box number) --> Date
	
	// Given the specified box position, return the date that box represents.
	
	// Access Type: Private
	
	// Parameters:
	//   $1 : Longint : Description
	
	// Returns:
	//   $0 : Date : Description
	
	// Created by Dave Batton on Aug 1, 2004
	// ----------------------------------------------------
	
	
	//------------------ Revision Control ----------------
	//Date Created: 22/12/2009 14:34`Method: Cal4D_GetDateByBoxNumber
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_DATE:C307(<>CAL_d_Box1Date; $0)
	C_LONGINT:C283($1)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cal4D_GetDateByBoxNumber")


$0:=<>CAL_d_Box1Date+$1-1
ERR_MethodTrackerReturn("Cal4D_GetDateByBoxNumber"; $_t_oldMethodName)