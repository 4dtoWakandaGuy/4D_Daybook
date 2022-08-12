//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      UKEC Alert
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
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("UKEC Alert")
Gen_Alert("Must be U - UK/Local or E - EC"; "Try again")
ERR_MethodTrackerReturn("UKEC Alert"; $_t_oldMethodName)