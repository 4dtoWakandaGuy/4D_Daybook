If (False:C215)
	//object Name: [PERSONNEL]Personnel_In.oUseAuthentication
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:09
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_event; PER_l_UseAuthentication)
	C_TEXT:C284($_t_oldMethodName; PER_t_UserName; PER_t_UserPassword)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [PERSONNEL].Personnel_In.oUseAuthentication"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4)
		OBJECT SET VISIBLE:C603(*; "oAuthTypeLabel"; (PER_l_UseAuthentication=1))
		OBJECT SET VISIBLE:C603(*; "oAuthUserLabel"; (PER_l_UseAuthentication=1))
		OBJECT SET VISIBLE:C603(*; "oAuthPassLabel"; (PER_l_UseAuthentication=1))
		OBJECT SET VISIBLE:C603(*; "OauthTypes"; (PER_l_UseAuthentication=1))
		OBJECT SET VISIBLE:C603(PER_t_UserName; (PER_l_UseAuthentication=1))
		OBJECT SET VISIBLE:C603(PER_t_UserPassword; (PER_l_UseAuthentication=1))
End case 
ERR_MethodTrackerReturn("OBJ [PERSONNEL].Personnel_In.oUseAuthentication"; $_t_oldMethodName)
