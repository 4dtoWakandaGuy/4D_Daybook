//%attributes = {}
If (False:C215)
	//Project Method Name:      SD_l_ShowAutomater
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 02/03/2010 14:00
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

$_t_oldMethodName:=ERR_MethodTracker("SD_l_ShowAutomater")
ERR_MethodTrackerReturn("SD_l_ShowAutomater"; $_t_oldMethodName)