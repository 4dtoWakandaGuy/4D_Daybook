//%attributes = {}
If (False:C215)
	//Project Method Name:      Macro_ITXPLAY
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 28/11/2010 19:15
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_Message; $_t_oldMethodName; $1)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Macro_ITXPLAY")
If ((DB_GetModuleSettingByNUM(Module_IntServer))>1)
	// IME_ITXPlay ($1)
	// Screwed up by PB 22/04/02
	$_t_Message:="Unimplemented feature. Please contact the programmer "
	$_t_Message:=$_t_Message+"and quote ref. no. 666."
	//  ALERT($_t_Message)
	Gen_Alert($_t_Message)
End if 
ERR_MethodTrackerReturn("Macro_ITXPLAY"; $_t_oldMethodName)
