If (False:C215)
	//Table Form Method Name: [WEBSETUP_4D]Input
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
	C_LONGINT:C283($_l_WebServerHandlerRow)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("FM [WEBSETUP_4D].Input"; Form event code:C388)
If (Form event code:C388=On Load:K2:1)
	OpenHelp(Table:C252(->[WEBSETUP_4D:129]); "Input")
	
	ARRAY TEXT:C222(WEB_at_WebServerHandler; 2)
	WEB_at_WebServerHandler{1}:="ITK"
	WEB_at_WebServerHandler{2}:="NTK"
	If ([WEBSETUP_4D:129]WebServerUses:33#"")
		$_l_WebServerHandlerRow:=Find in array:C230(WEB_at_WebServerHandler; [WEBSETUP_4D:129]WebServerUses:33)
		If ($_l_WebServerHandlerRow>0)
			WEB_at_WebServerHandler:=$_l_WebServerHandlerRow
		Else 
			WEB_at_WebServerHandler:=1
		End if 
	Else 
		WEB_at_WebServerHandler:=1
	End if 
	
	If (WEB_at_WebServerHandler{WEB_at_WebServerHandler}="NTK")  //if using NTK then the user has the option to set up a port to use for for SSL over HTTP.
		OBJECT SET VISIBLE:C603(*; "objHTTPS@"; True:C214)
	Else 
		OBJECT SET VISIBLE:C603(*; "objHTTPS@"; False:C215)
	End if 
	
	
	INT_SetDialog
	SD2_SetDiaryPopup
End if 
ERR_MethodTrackerReturn("FM [WEBSETUP_4D].Input"; $_t_oldMethodName)
