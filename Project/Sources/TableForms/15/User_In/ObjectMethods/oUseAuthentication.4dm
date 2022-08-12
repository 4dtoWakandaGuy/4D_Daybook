If (False:C215)
	//object Name: [USER]User_In.oUseAuthentication
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
	C_LONGINT:C283($_l_event; SMTP_l_AUTH)
	C_TEXT:C284($_t_oldMethodName; SMTP_t_GeneralPassAuth; SMTP_t_GeneralPassName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].User_In.oUseAuthentication"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4)
		OBJECT SET VISIBLE:C603(*; "oUseGenAuthentication"; (SMTP_l_AUTH=1))
		OBJECT SET VISIBLE:C603(*; "oAuthTypeLabel"; (SMTP_l_AUTH=1))
		OBJECT SET VISIBLE:C603(*; "oAuthUserLabel"; (SMTP_l_AUTH=1))
		OBJECT SET VISIBLE:C603(*; "oAuthPassLabel"; (SMTP_l_AUTH=1))
		OBJECT SET VISIBLE:C603(*; "OauthTypes"; (SMTP_l_AUTH=1))
		OBJECT SET VISIBLE:C603(SMTP_t_GeneralPassName; (SMTP_l_AUTH=1))
		OBJECT SET VISIBLE:C603(SMTP_t_GeneralPassAuth; (SMTP_l_AUTH=1))
End case 
ERR_MethodTrackerReturn("OBJ [USER].User_In.oUseAuthentication"; $_t_oldMethodName)
