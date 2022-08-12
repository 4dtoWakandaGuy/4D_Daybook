//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Companies vNC
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
	C_LONGINT:C283(vCM; xCount)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Companies vNC")
If ((xCount=1) & ([COMPANIES:2]Sales_Person:29=""))
	Gen_Alert("Please allocate a Person first"; "Try again")
	xCount:=0
Else 
	If ((vCM>0) & (xCount=1))
		Gen_Alert("This cannot be used when creating Companies from other files"; "Cancel")
		xCount:=0
	End if 
End if 
ERR_MethodTrackerReturn("Companies vNC"; $_t_oldMethodName)