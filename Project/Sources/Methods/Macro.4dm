//%attributes = {}
If (False:C215)
	//Project Method Name:      Macro
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 19/08/2012 17:30
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($4; SCPT_l_CalledFromPalette)
	C_TEXT:C284($_t_oldMethodName; $1; $2; $3)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Macro")
//Macro - used for launching  macros from 4D/Rep Gen procedures


Case of 
	: (Count parameters:C259=1)
		Macro2($1)
	: (Count parameters:C259=2)
		
		Macro2($1; $2)
		
		
	: (Count parameters:C259=3)
		//Return value
		Macro2($1; $2; $3)
		
	: (Count parameters:C259=4)
		If ($4#0)
			SCPT_l_CalledFromPalette:=$4
		Else 
			SCPT_l_CalledFromPalette:=0
		End if 
		
		
		Macro2($1; $2; $3; $4)
		
		
End case 
ERR_MethodTrackerReturn("Macro"; $_t_oldMethodName)