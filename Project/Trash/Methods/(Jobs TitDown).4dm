//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Jobs TitDown
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

$_t_oldMethodName:=ERR_MethodTracker("Jobs TitDown")
//jobs TitDown
States_Down(->[JOBS:26]State:9)
ERR_MethodTrackerReturn("Jobs TitDown"; $_t_oldMethodName)