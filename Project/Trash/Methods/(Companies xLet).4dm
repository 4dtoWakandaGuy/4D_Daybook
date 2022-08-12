//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Companies xLet
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/11/2012 13:42
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(vCM; xApply)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Companies xLet")
If ((xApply=1) & ([COMPANIES:2]Sales_Person:29="") & ([COMPANIES:2]Taken_By:26=""))
	Gen_Alert("Please allocate a Person first"; "Try again")
	xApply:=0
Else 
	If ((vCM>0) & (xApply=1))
		Gen_Alert("This cannot be used when creating Companies from other files"; "Cancel")
		xApply:=0
	End if 
End if 
ERR_MethodTrackerReturn("Companies xLet"; $_t_oldMethodName)