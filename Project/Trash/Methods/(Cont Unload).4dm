//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Cont Unload
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 07/04/2011 21:41
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cont Unload")
UNLOAD RECORD:C212([CONTACTS:1])
UNLOAD RECORD:C212([CONTACTS_COMPANIES:145])
UNLOAD RECORD:C212([CONTACTS_RECORD_ANALYSIS:144])

UNLOAD RECORD:C212([COMPANIES:2])
ERR_MethodTrackerReturn("Cont Unload"; $_t_oldMethodName)