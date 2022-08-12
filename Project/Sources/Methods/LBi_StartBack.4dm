//%attributes = {}

If (False:C215)
	//Project Method Name:      LBi_StartBack
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  26/02/2020
	//Created BY:  Unknown
	
	//Date Modified: 
	//Modified By: Nigel Greenlee
	//Modification notes
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("LBi_StartBack")

//NG 19/7/2006. This method is a direct replacement for ALStartBack
$_t_oldMethodName:=ERR_MethodTracker("LBi_StartBack")
//ALStartBack - startup tasks to do in background
//loads into interProcess_Arrays the setups of the most-used Definitions
//plus calls the 2 biggest procs to put them in memory
//don't bother with Page_2 ones


//this is no longer used
ERR_MethodTrackerReturn("LBi_StartBack"; $_t_oldMethodName)