//%attributes = {}
If (False:C215)
	//Project Method Name:      IME_SetMailOpts
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
	C_TEXT:C284($_t_Message; $_t_oldMethodName; $1; $2)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("IME_SetMailOpts")
//IME_SetMailOpts
//C_TEXT($1;$2)
//IME SetMailOpt2($1;$2)

// IME SetMailOpt2
//NL_SetMailOpts ($1;$2)
// Screwed up by PB 22/04/02
$_t_Message:="Unimplemented feature. Please contact the programmer "
$_t_Message:=$_t_Message+"and quote ref. no. 666."
//ALERT($_t_Message)
Gen_Alert($_t_Message)
ERR_MethodTrackerReturn("IME_SetMailOpts"; $_t_oldMethodName)