//%attributes = {}
If (False:C215)
	//Project Method Name:      JC_SetProjectCode
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

$_t_oldMethodName:=ERR_MethodTracker("JC_SetProjectCode")

[PROJECTS:89]Project_Code:1:=Gen_CodePref(30; ->[PROJECTS:89]Project_Code:1)
ERR_MethodTrackerReturn("JC_SetProjectCode"; $_t_oldMethodName)