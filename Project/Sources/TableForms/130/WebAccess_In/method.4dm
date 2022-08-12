If (False:C215)
	//Table Form Method Name: Object Name:      [WEB_ACCESS].WebAccess_in
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 05/03/2011 03:47
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(DB_bo_NoLoad; DB_bo_RecordModified)
	C_LONGINT:C283($_l_event; DB_l_ButtonClickedFunction)
	C_TEXT:C284($_t_oldMethodName; vContName; vPerson; WIN_t_CurrentInputForm)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FM [WEB_ACCESS].WebAccess_in"; Form event code:C388)
Minor_LP(->[WEB_ACCESS:130]Web_Ref:1; ->[WEB_ACCESS:130]Person:10; ->[WEB_ACCESS:130]; "WebAccess"; "1"; "")
$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Header:K2:17) | ($_l_event=On Resize:K2:27)
		WS_AutoscreenSize(2; 350; 590)
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		OpenHelp(Table:C252(->[WEB_ACCESS:130]); "WebAccess_in")
		WS_AutoscreenSize(2; 350; 590)
		INT_SetInput(Table:C252(->[WEB_ACCESS:130]); WIN_t_CurrentInputForm)
		
		If ([WEB_ACCESS:130]Contact_Code:9#"")
			READ ONLY:C145([CONTACTS:1])
			QUERY:C277([CONTACTS:1]; [CONTACTS:1]Contact_Code:2=[WEB_ACCESS:130]Contact_Code:9)
			vContName:=[CONTACTS:1]Contact_Name:31
		Else 
			vContName:=""
		End if 
		
		If ([WEB_ACCESS:130]Person:10#"")
			READ ONLY:C145([PERSONNEL:11])
			QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Initials:1=[WEB_ACCESS:130]Person:10)
			vPerson:=[PERSONNEL:11]Name:2
		Else 
			vPerson:=""
		End if 
		SD2_SetDiaryPopup
	: ($_l_event=On Data Change:K2:15)
		Case of 
			: (Modified:C32([WEB_ACCESS:130]Contact_Code:9))
				
				//ResultCode
				
				//CheckMinorByObject (New object("ObjectName";"oWebContactCode";"SearchTable";"contacts";"SearchFields";New collection("Contact_Code";"Contact_Name");"ResultNameObject";"oWebContactName"))
				
				Check_MinorNC(->[WEB_ACCESS:130]Contact_Code:9; "ContName"; ->[CONTACTS:1]; ->[CONTACTS:1]Contact_Code:2; ->[CONTACTS:1]Contact_Name:31)  //5
				Macro_AccTypePt(->[WEB_ACCESS:130]Contact_Code:9)
				DB_bo_RecordModified:=True:C214
			: (Modified:C32([WEB_ACCESS:130]Person:10))
				Check_MinorNC(->[WEB_ACCESS:130]Person:10; "Person"; ->[PERSONNEL:11]; ->[PERSONNEL:11]Initials:1; ->[PERSONNEL:11]Name:2)  //5
				Macro_AccTypePt(->[WEB_ACCESS:130]Person:10)
				DB_bo_RecordModified:=True:C214
		End case 
	: ($_l_event=On Outside Call:K2:11)
		DB_l_ButtonClickedFunction:=0
End case 
ERR_MethodTrackerReturn("FM:WebAccess_in"; $_t_oldMethodName)
