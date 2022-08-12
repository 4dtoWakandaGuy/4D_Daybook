If (False:C215)
	//object Name: [WEBSETUP_4D]Input.Popup Drop down List1
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
	//ARRAY TEXT(WEB_at_WebServerHandler;0)
	C_LONGINT:C283($_l_FormEvent)
	C_TEXT:C284(<>Web_t_ServerHandler; $_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [WEBSETUP_4D].Input.Popup Drop down List1"; Form event code:C388)

$_l_FormEvent:=Form event code:C388

Case of 
	: ($_l_FormEvent=On Data Change:K2:15) | ($_l_FormEvent=On Clicked:K2:4) | ($_l_FormEvent=On Mouse Enter:K2:33) | ($_l_FormEvent=On Mouse Leave:K2:34)
		[WEBSETUP_4D:129]WebServerUses:33:=WEB_at_WebServerHandler{WEB_at_WebServerHandler}
		<>Web_t_ServerHandler:=[WEBSETUP_4D:129]WebServerUses:33
		
		If (WEB_at_WebServerHandler{WEB_at_WebServerHandler}="NTK")  //if using NTK then the user has the option to set up a port to use for for SSL over HTTP.
			OBJECT SET VISIBLE:C603(*; "objHTTPS@"; True:C214)
		Else 
			OBJECT SET VISIBLE:C603(*; "objHTTPS@"; False:C215)
		End if 
		
	Else 
		
End case 
ERR_MethodTrackerReturn("OBJ [WEBSETUP_4D].Input.Popup Drop down List1"; $_t_oldMethodName)
