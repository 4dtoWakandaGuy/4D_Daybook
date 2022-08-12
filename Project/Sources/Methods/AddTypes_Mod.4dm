//%attributes = {}
If (False:C215)
	//Project Method Name:      AddTypes_Mod
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/11/2012 13:40
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284(<>SYS_t_FormSizeName; $_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("AddTypes_Mod")
Minor_ModName(->[ADDRESS_FORMATS:74]; "Types"; <>SYS_t_FormSizeName; "Address Formats")
ERR_MethodTrackerReturn("AddTypes_Mod"; $_t_oldMethodName)
