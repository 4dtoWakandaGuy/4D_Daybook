//%attributes = {}
If (False:C215)
	//Project Method Name:      Cal4D_GetSimpleVarName
	//------------------ Method Notes ------------------
	// ----------------------------------------------------
	// Project Method: Cal4D_GetSimpleVarName (variable name) --> Text
	
	// Pass this method the name of an IP variable and it will return the variable
	//   name without the <>.  This makes it easier to work with our variable names
	//   in a cross-platform environment, since on the Mac IP vars start with ◊, and
	//   in Windows <> is used.
	// The method is designed so it's safe to pass process or local variable names
	//   also.  It just returns them unmodified.
	
	// Access Type: Private
	
	// Parameters:
	//   $1 : Text : A 4D variable name
	
	// Returns:
	//   $0 : Text : The name without the IP char
	
	// Created by Dave Batton on Aug 1, 2004
	// ----------------------------------------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/12/2009 14:33`Method: Cal4D_GetSimpleVarName
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName; $_t_VariableName; $0; $1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cal4D_GetSimpleVarName")


$_t_VariableName:=$1

$_t_VariableName:=Replace string:C233($_t_VariableName; "<>"; "")  // For Windows.
$_t_VariableName:=Replace string:C233($_t_VariableName; "◊"; "")  // For Macintosh.

$0:=$_t_VariableName
ERR_MethodTrackerReturn("Cal4D_GetSimpleVarName"; $_t_oldMethodName)