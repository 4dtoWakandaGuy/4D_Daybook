//%attributes = {}
If (False:C215)
	//Project Method Name:      MOD_ShowVariables
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

$_t_oldMethodName:=ERR_MethodTracker("MOD_ShowVariables")

//This method is part of a debug window
// it populates arrays with information about varaibles-not that its not so very clever in that the names of the variables are in here
ERR_MethodTrackerReturn("MOD_ShowVariables"; $_t_oldMethodName)