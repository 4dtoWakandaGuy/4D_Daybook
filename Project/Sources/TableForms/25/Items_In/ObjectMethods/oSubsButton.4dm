If (False:C215)
	//object Name: [ORDER_ITEMS]Items_in.oSubsButton
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 15/04/2011 11:23
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

$_t_oldMethodName:=ERR_MethodTracker("OBJ [ORDER_ITEMS].Items_in.oSubsButton"; Form event code:C388)

Gen_Confirm("Are you sure you are ready to renew this subscription?")
ERR_MethodTrackerReturn("OBJ [ORDER_ITEMS].Items_in.oSubsButton"; $_t_oldMethodName)