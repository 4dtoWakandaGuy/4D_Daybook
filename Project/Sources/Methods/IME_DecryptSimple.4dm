//%attributes = {}
If (False:C215)
	//Project Method Name:      IME_DecryptSimple
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
	C_TEXT:C284($_t_oldMethodName; $0; $1; $tText)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("IME_DecryptSimple")
//IME_DecryptSimple
//Rollo 12/23/99

//Decrypt IME_EncryptSimple text


If (Count parameters:C259>0)
	
	$tText:=$1
	
	$tText:=IME_AsciiToText(IME_DecrFixed($tText))
	
	$0:=$tText
	
Else 
	
	$0:=""
	
End if 
ERR_MethodTrackerReturn("IME_DecryptSimple"; $_t_oldMethodName)