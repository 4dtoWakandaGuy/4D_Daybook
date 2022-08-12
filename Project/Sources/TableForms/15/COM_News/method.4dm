If (False:C215)
	//Table Form Method Name: [USER]COM_News
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 28/02/2011 08:22
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(DB_bo_NoLoad)
	C_LONGINT:C283($_l_ButtonPressed; $_l_event; DB_l_ButtonClickedFunction; DB_l_WebProgress; iCancel; iOK)
	C_TEXT:C284($_t_oldMethodName; COM_T_DataString; DB_t_WebUrl; SD2_T_Dataform)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FM [USER].COM_News"; Form event code:C388)

//Tue, Mar 3, 2009 balinderwalia: fixed nasty crashing bug by calling commands in right order


$_l_event:=Form event code:C388


Case of 
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		WA SET PREFERENCE:C1041(SD2_T_Dataform; 2; True:C214)
		WA SET PREFERENCE:C1041(SD2_T_Dataform; 3; True:C214)
		WA SET PREFERENCE:C1041(SD2_T_Dataform; 4; True:C214)
		//$Err:=Web_SetPreferences(SD2_l_Dataform;Web_kVisible;1;"")  `0=hide the browser; 1=show the browser (2) SET VISIBLE doesn't fully hide web area
		DB_t_WebUrl:=COM_T_DataString
		//WA OPEN URL(SD2_T_Dataform;COM_T_DataString)
		WS_AutoscreenSize(4; Screen height:C188-60; Screen width:C187-60)
		
		
	: ($_l_event=On Resize:K2:27)
		WA REFRESH CURRENT URL:C1023(SD2_T_Dataform)
		
	: ($_l_event=On Outside Call:K2:11)
		Case of 
			: (((DB_l_ButtonClickedFunction#0)) | (iOK=1) | (iCancel=1))
				$_l_ButtonPressed:=DB_l_ButtonClickedFunction
				DB_l_ButtonClickedFunction:=0
				//  oCancel:=0
				If ($_l_ButtonPressed=DB_GetButtonFunction("cancel")) | ($_l_ButtonPressed=DB_GetButtonFunction("OK")) | (iOK=1) | (iCancel=1)
					CANCEL:C270
				End if 
		End case 
		
End case 
ERR_MethodTrackerReturn("FM [USER].COM_News"; $_t_oldMethodName)
