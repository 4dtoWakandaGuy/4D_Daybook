//%attributes = {}
If (False:C215)
	//Project Method Name:      Gen_None
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45:41If (False)// ----------------------------------------------------
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_POINTER:C301($2)
	C_TEXT:C284($_t_oldMethodName; $1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Gen_None")
Gen_Confirm("No "+$1+" Found.  Try Again?"; "Yes"; "No")
If (OK=0)
	$2->:=0
End if 
ERR_MethodTrackerReturn("Gen_None"; $_t_oldMethodName)