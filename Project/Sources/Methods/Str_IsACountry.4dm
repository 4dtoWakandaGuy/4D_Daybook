//%attributes = {}
If (False:C215)
	//Project Method Name:      Str_IsACountry
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
	C_BOOLEAN:C305($0)
	C_TEXT:C284($_t_oldMethodName; $1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Str_IsACountry")
//NG Jan 2008 are you serious???
If (Count parameters:C259>=1)
	$0:=(($1="Scotland") | ($1="Wales") | ($1="Northern Ireland") | ($1="N Ireland") | ($1="Eire") | ($1="Ireland") | ($1="England") | ($1="UK") | ($1="United Kingdom") | ($1="British Isles") | ($1="France") | ($1="Germany") | ($1="Holland") | ($1="Netherlands") | ($1="Belgium") | ($1="Italy") | ($1="Denmark"))
Else 
	$0:=False:C215
End if 
ERR_MethodTrackerReturn("Str_IsACountry"; $_t_oldMethodName)