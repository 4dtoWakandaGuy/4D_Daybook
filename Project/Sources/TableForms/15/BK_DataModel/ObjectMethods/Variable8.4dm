If (False:C215)
	//object Name: [USER]BK_DataModel.Variable8
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:11
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(DM_Bo_BKedit)
	C_LONGINT:C283($_l_event)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].BK_DataModel.Variable8"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Data Change:K2:15)
		DM_Bo_BKedit:=True:C214
End case 
ERR_MethodTrackerReturn("OBJ [USER].BK_DataModel.Variable8"; $_t_oldMethodName)