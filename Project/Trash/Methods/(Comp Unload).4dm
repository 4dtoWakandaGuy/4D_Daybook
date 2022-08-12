//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Comp Unload
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

$_t_oldMethodName:=ERR_MethodTracker("Comp Unload")
UNLOAD RECORD:C212([COMPANIES:2])
UNLOAD RECORD:C212([CONTACTS:1])
UNLOAD RECORD:C212([COMPANIES_RECORD_ANALYSIS:146])
UNLOAD RECORD:C212([CONTACTS_COMPANIES:145])
UNLOAD RECORD:C212([INFORMATION:55])

UNLOAD RECORD:C212([DIARY:12])
ERR_MethodTrackerReturn("Comp Unload"; $_t_oldMethodName)