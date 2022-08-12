If (False:C215)
	//object Name: [USER]PER_EmailAddresses.oEMailAddress
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:46
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(USR_bo_Modified)
	C_LONGINT:C283($_l_event)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].PER_EmailAddresses.oEMailAddress"; Form event code:C388)
//object PER_t_EmailAddress
//on form •[user]per_emaiAddresses•
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Data Change:K2:15)
		USR_bo_Modified:=True:C214
End case 
ERR_MethodTrackerReturn("OBJ [USER].PER_EmailAddresses.oEMailAddress"; $_t_oldMethodName)
