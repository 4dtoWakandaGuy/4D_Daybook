If (False:C215)
	//object Method Name: Object Name:      WEB_Vingettes.oWebform
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 03/03/2012 13:47
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_Event)
	C_TEXT:C284($_t_oldMethodName; DB_t_LinkURL; DBWS_t_DocumentURL)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ WEB_Vingettes.oWebform"; Form event code:C388)
$_l_Event:=Form event code:C388
Case of 
	: ($_l_Event=On Begin URL Loading:K2:45)
		DBWS_t_DocumentURL:=Replace string:C233(DB_t_LinkURL; "http://"; "")
		
		
End case 
ERR_MethodTrackerReturn("OBJ WEB_Vingettes.oWebform"; $_t_oldMethodName)
