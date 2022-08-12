//%attributes = {}
If (False:C215)
	//Project Method Name:      IME_EncryptSimple
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

$_t_oldMethodName:=ERR_MethodTracker("IME_EncryptSimple")
//IME_EncryptSimple
//Rollo 12/23/99

//Encrypt while preserving all normal characters and casing


If (Count parameters:C259>0)
	
	$tText:=$1
	
	$tText:=IME_EncrFixed(IME_TextToAscii($tText))
	
	$0:=$tText
	
Else 
	
	$0:=""
	
End if 
ERR_MethodTrackerReturn("IME_EncryptSimple"; $_t_oldMethodName)