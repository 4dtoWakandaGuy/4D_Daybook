//%attributes = {}
If (False:C215)
	//Project Method Name:      Cal4D_ReplaceSpecialCharacters
	//------------------ Method Notes ------------------
	// ----------------------------------------------------
	// Project Method: Cal4D_ReplaceSpecialCharacters (text) --> Text
	
	// Replaces special characters that may be in the calendar event text.
	// For example, we replace \n with a carriage return.
	// See RFC 2445 <http://www.faqs.org/rfcs/rfc2445.html>
	
	// Access Type: Private
	
	// Parameters:
	//   $1 : Text : Text with special chars
	
	// Returns:
	//   $0 : Text : Text with special chars replaced
	
	// Created by Dave Batton on Jun 28, 2004
	// ----------------------------------------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/12/2009 14:24`Method: Cal4D_ReplaceSpecialCharacters
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName; $_t_Text; $0; $1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cal4D_ReplaceSpecialCharacters")

$_t_Text:=$1

$_t_Text:=Replace string:C233($_t_Text; "\\n"; Char:C90(Carriage return:K15:38))
$_t_Text:=Replace string:C233($_t_Text; "\\,"; ",")
$_t_Text:=Replace string:C233($_t_Text; "\\\""; "\"")

$0:=$_t_Text
ERR_MethodTrackerReturn("Cal4D_ReplaceSpecialCharacters"; $_t_oldMethodName)