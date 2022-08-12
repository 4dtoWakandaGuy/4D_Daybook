If (False:C215)
	//object Name: [PERSONNEL]Personnel_In.OauthTypes
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
	//ARRAY LONGINT(PER_al_AuthenticationTypes;0)
	//ARRAY TEXT(PER_at_AuthenticationType;0)
	C_LONGINT:C283(Per_l_UserAuthtype)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [PERSONNEL].Personnel_In.OauthTypes"; Form event code:C388)

//object method added 28/07/08 -kmw

If (PER_at_AuthenticationType>0)
	Per_l_UserAuthtype:=PER_al_AuthenticationTypes{PER_at_AuthenticationType}  //added 28/07/08 -kmw (Previously no matter what the user selected in the array, it was not updating the SMTP preference variable that ends up getting saved to prefs)
Else 
	Per_l_UserAuthtype:=0
End if 
ERR_MethodTrackerReturn("OBJ:Personnel_In,PER_at_AuthenticationType"; $_t_oldMethodName)
