//%attributes = {}
If (False:C215)
	//Project Method Name:      SD2_SetupLinks
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

$_t_oldMethodName:=ERR_MethodTracker("SD2_SetupLinks")
//SD2_SetupLinks
//This method will create the links for a diary record. Note that it does not create the recordsERR_MethodTrackerReturn ("SD2_SetupLinks";$_t_oldMethodName)