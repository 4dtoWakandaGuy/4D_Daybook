If (False:C215)
	//object Method Name: Object Name:      WEB_Vingettes.oLoad
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 03/03/2012 13:29
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_Event)
	C_TEXT:C284($_t_oldMethodName; DB_t_LinkURL; DBWS_t_DocumentURL; DBWS_t_Webform)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("OBJ [projectForm]/WEB_Vingettes/oLoad"; Form event code:C388)
$_t_oldMethodName:=ERR_MethodTracker("OBJ WEB_Vingettes.oLoad"; Form event code:C388)

$_l_Event:=Form event code:C388
Case of 
	: ($_l_Event=On Clicked:K2:4)
		DB_t_LinkURL:="http://"+DBWS_t_DocumentURL
		WA OPEN URL:C1020(*; "oWebform"; DB_t_LinkURL)
		WA REFRESH CURRENT URL:C1023(DBWS_t_Webform)
		
End case 
ERR_MethodTrackerReturn("OBJ WEB_Vingettes.oLoad"; $_t_oldMethodName)
