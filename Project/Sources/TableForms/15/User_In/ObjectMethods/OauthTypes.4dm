If (False:C215)
	//object Name: [USER]User_In.OauthTypes
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 05/01/2011 23:27
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(GEN_al_AuthenticationTypes;0)
	//ARRAY TEXT(GEN_at_AuthenticationType;0)
	C_LONGINT:C283(SMTP_l_GeneralPassType)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].User_In.OauthTypes"; Form event code:C388)

//object method added 28/07/08 -kmw

If (GEN_at_AuthenticationType>0)
	SMTP_l_GeneralPassType:=GEN_al_AuthenticationTypes{GEN_at_AuthenticationType}  //added 28/07/08 -kmw (Previously no matter what the user selected in the array, it was not updating the SMTP preference variable that ends up getting saved to prefs)
Else 
	SMTP_l_GeneralPassType:=0
End if 
ERR_MethodTrackerReturn("OBJ:User_In,GEN_at_AuthenticationType"; $_t_oldMethodName)
