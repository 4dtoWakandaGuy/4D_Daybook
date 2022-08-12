If (False:C215)
	//object Name: [USER]JOB_PermConfig.Variable1
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/08/2013 17:24
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_event; ST_l_Modified)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].JOB_PermConfig.Variable1"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Data Change:K2:15)
		ST_l_Modified:=1
End case 
ERR_MethodTrackerReturn("OBJ [USER].JOB_PermConfig.Variable1"; $_t_oldMethodName)
