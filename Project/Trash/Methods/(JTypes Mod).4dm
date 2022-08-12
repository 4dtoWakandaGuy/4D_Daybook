//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      JTypes Mod
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
	C_TEXT:C284(<>SYS_t_FormSizeName; $_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("JTypes Mod")
Minor_ModName(->[JOB_TYPES:65]; "Types"; <>SYS_t_FormSizeName; "Job Types")
ERR_MethodTrackerReturn("JTypes Mod"; $_t_oldMethodName)