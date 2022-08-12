//%attributes = {}
If (False:C215)
	//Project Method Name:      Str_TelPrefStri
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
	C_TEXT:C284(<>DialPref; $_t_oldMethodName; $0; $1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Str_TelPrefStri")
If (Count parameters:C259>=1)
	If ($1=(<>DialPref+"@"))
		$1:=Substring:C12($1; Length:C16(<>DialPref)+1; 32000)
	Else 
		If ($1=("("+<>DialPref+"@"))
			$1:=Substring:C12($1; Length:C16(<>DialPref)+2; 32000)
		End if 
	End if 
	$0:=$1
Else 
	$0:=""
End if 
ERR_MethodTrackerReturn("Str_TelPrefStri"; $_t_oldMethodName)