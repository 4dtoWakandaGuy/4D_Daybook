//%attributes = {}
If (False:C215)
	//Project Method Name:      Are_YouSureM
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/11/2012 13:41
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName; $1)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Are_YouSureM")
//Are_YouSureM?
Gen_Confirm("Are you sure"+$1+"?"; "No"; "Yes")
If (OK=1)
	OK:=0
Else 
	OK:=1
End if 
ERR_MethodTrackerReturn("Are_YouSureM"; $_t_oldMethodName)
