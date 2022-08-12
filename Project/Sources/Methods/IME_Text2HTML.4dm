//%attributes = {}
If (False:C215)
	//Project Method Name:      IME_Text2HTML
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
	C_BOOLEAN:C305($2; $bAllowTags)
	C_LONGINT:C283($iLength)
	C_TEXT:C284($_t_oldMethodName; $0; $1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("IME_Text2HTML")

//IME_Text2HTML
//Wrapper for ITX_Text2HTML
//that doesn't do it if long!


$iLength:=Length:C16($1)

If ($iLength>29000)
	$0:=$1
Else 
	
	If (Count parameters:C259>1)
		$bAllowTags:=$2
	Else 
		$bAllowTags:=False:C215
	End if 
	
	If ($bAllowTags)
		$0:=STR_HTMLEncode($1; 1)
	Else 
		$0:=STR_HTMLEncode($1)
	End if 
	//
End if 
ERR_MethodTrackerReturn("IME_Text2HTML"; $_t_oldMethodName)