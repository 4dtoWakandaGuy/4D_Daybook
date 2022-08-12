//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Term AllWT
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
	C_TEXT:C284($_t_oldMethodName; $0; $1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Term AllWT")
$0:=Term_StoWT(Term_NLWT(Term_SLPLWT($1)))
ERR_MethodTrackerReturn("Term AllWT"; $_t_oldMethodName)