//%attributes = {}
If (False:C215)
	//Project Method Name:      STR_InQuotes
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284(<>STR_t_DoubleQuote; $_t_oldMethodName; $0; $1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("STR_InQuotes")
//******************************************************************************
//
//Method: STR_InQuotes
//
//Written by  John on 18/09/98
//
//Purpose: Returns string passed in quotes
//
//$1 - text, $0 - text

//
//******************************************************************************
If (Count parameters:C259>=1)
	$0:=<>STR_t_DoubleQuote+$1+<>STR_t_DoubleQuote
Else 
	$0:=<>STR_t_DoubleQuote+<>STR_t_DoubleQuote
End if 
ERR_MethodTrackerReturn("STR_InQuotes"; $_t_oldMethodName)