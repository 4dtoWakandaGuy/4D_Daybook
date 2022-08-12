If (False:C215)
	//Project Form Method Name: EN_Cumulus
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 25/03/2011 11:23
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(DB_bo_NoLoad)
	C_LONGINT:C283($_l_event; DB_l_WebProgress)
	C_TEXT:C284($_t_oldMethodName; DB_t_WebUrl; EN_t_AssettPath; SD2_T_Dataform)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FM EN_Cumulus"; Form event code:C388)
$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		
		If (EN_t_AssettPath="")
			SET TIMER:C645(60*2)
			WA SET PREFERENCE:C1041(SD2_T_Dataform; 1; True:C214)
			WA SET PREFERENCE:C1041(SD2_T_Dataform; 2; True:C214)
			WA SET PREFERENCE:C1041(SD2_T_Dataform; 3; True:C214)
			WA SET PREFERENCE:C1041(SD2_T_Dataform; 4; True:C214)
			//$Err:=Web_SetPreferences(SD2_l_Dataform;Web_kVisible;1;"")  `0=hide the browser; 1=show the browser (2) SET VISIBLE doesn't fully hide web area
			//DB_t_WebUrl:="http://digitalmedia.creamermedia.co.za:8080/Cumulus"
			DB_t_WebUrl:="http://digitalmedia.creamermedia.co.za:8080/Sites"
			WS_AutoscreenSize(3; 400; 600)
			//zenAdminID=d427c066e1c9e5814f1da4ad2dcb6317"
			DB_l_WebProgress:=0
		End if 
End case 
ERR_MethodTrackerReturn("FM EN_Cumulus"; $_t_oldMethodName)
