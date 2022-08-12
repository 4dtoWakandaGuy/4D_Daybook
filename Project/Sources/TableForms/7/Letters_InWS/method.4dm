If (False:C215)
	//Table Form Method Name: [DOCUMENTS]Letters_inWS
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:07
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(DB_bo_NoLoad; vBefore2C)
	C_LONGINT:C283($_l_event; DB_l_ButtonClickedFunction; iCancel; iOK)
	C_TEXT:C284($_t_oldMethodName; vButtDis)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FM [DOCUMENTS].Letters_inWS"; Form event code:C388)
$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Activate:K2:9)
		
		In_ButtChkDis(->vButtDis)
		
	: ((($_l_event=On Outside Call:K2:11) & (DB_l_ButtonClickedFunction#0)) | (iOK=1) | (iCancel=1))
		In_ButtCall("R:Letters_InLPA"; ""; "Minor_DelSinEx"; ->[DOCUMENTS:7]; ->[DOCUMENTS:7]Document_Code:1; "Documents"; "1"; "Letters_SWInLPB"; "Master"; "Letters_Sel"; ""; ->[IDENTIFIERS:16]; ->vButtDis)
	: (vBefore2C)
		If ((DB_GetModuleSettingByNUM(1))=5)
			DB_MenuAction("Insert"; "Product Items..."; 3; "")
			
		End if 
		vBefore2C:=False:C215
	: ($_l_event=On Data Change:K2:15)
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		OpenHelp(Table:C252(->[DOCUMENTS:7]); "Letters_inWS")
		WS_AutoscreenSize(1; 0; 700; Table name:C256(->[DOCUMENTS:7])+"_"+"Letters_inWS")
		
		
		Letters_SWInLPB
		vBefore2C:=True:C214
		Gen_PostKey(1; 92; 256)
	: ($_l_event=On Deactivate:K2:10)
End case 
ERR_MethodTrackerReturn("FM:Letters_inWS"; $_t_oldMethodName)
