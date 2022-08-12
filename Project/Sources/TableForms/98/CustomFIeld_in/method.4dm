If (False:C215)
	//Table Form Method Name: [CUSTOM_FIELDS]CustomFIeld_in
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 14/04/2011 15:04
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>SYS_bo_FieldNamesLoaded; DB_bo_NoLoad; DB_bo_RecordModified; vFromIn)
	C_LONGINT:C283($_l_event; DB_l_ButtonClickedFunction; iCancel; iOK; PAL_but_LastRecord; PAL_but_PreviousRecord; PAL_but_NextRecord; PAL_but_FirstRecord)
	C_TEXT:C284($_t_oldMethodName; DB_t_CUrrentInputMenuRef; vButtDis; vButtDisFF; WIN_t_CurrentInputForm)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FM [CUSTOM_FIELDS].CustomFIeld_in"; Form event code:C388)
//FurthFldD_InLP
$_l_event:=Form event code:C388
$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Header:K2:17) | ($_l_event=On Resize:K2:27)
		WS_AutoscreenSize(2; 375; 553)
		
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		OpenHelp(Table:C252(->[CUSTOM_FIELDS:98]); "CustomFIeld_in")
		WS_AutoscreenSize(2; 375; 553)
		If (Not:C34(<>SYS_bo_FieldNamesLoaded))
			Load_Fields
		End if 
		vButtDisFF:="I DPMO  FSSSRCADT"
		Input_Buttons(->[CUSTOM_FIELDS:98]; ->vButtDisFF; "Further Field")
		INT_SetInput(Table:C252(->[CUSTOM_FIELDS:98]); WIN_t_CurrentInputForm)
		DB_SetInputFormMenu(Table:C252(->[CUSTOM_FIELDS:98]); "CustomFIeld_in")
		If (Records in selection:C76([CUSTOM_FIELDS:98])<=1)
			OBJECT SET VISIBLE:C603(*; "oInputButtonNextRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonPreviousRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonFirstRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonLastRecord"; False:C215)
			DB_MenuAction("File"; "Next Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
			DB_MenuAction("File"; "Previous Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
		End if 
		
	: (($_l_event=On Activate:K2:9) | (vFromIn))
		DB_SetInputFormMenu(Table:C252(->[CUSTOM_FIELDS:98]); "CustomFIeld_in")
		OpenHelp(Table:C252(->[CUSTOM_FIELDS:98]); "CustomFIeld_in")
		vFromIn:=After:C31
		
		In_ButtChkDis(->vButtDisFF; "Further Field")
	: ($_l_event=On Activate:K2:9)
		DB_SetInputFormMenu(Table:C252(->[CUSTOM_FIELDS:98]); "CustomFIeld_in")
		In_ButtChkDis(->vButtDisFF; "Further Field")
		
	: ((($_l_event=On Outside Call:K2:11) & (DB_l_ButtonClickedFunction#0)) | (iOK=1) | (iCancel=1))
		In_ButtCall(""; ""; ""; ->[CUSTOM_FIELDS:98]; ->[CUSTOM_FIELDS:98]Unique_Code:2; "Further Fields"; ""; ""; "Master"; ""; ""; ->[CUSTOM_FIELDS:98]; ->vButtDis)
	: ($_l_event=On Data Change:K2:15)
		Case of 
			: (Modified:C32([CUSTOM_FIELDS:98]Field_Name:3))
				Check_MinorNC(->[CUSTOM_FIELDS:98]Field_Name:3; ""; ->[CUSTOM_FIELD_DEFINITiONS:99]; ->[CUSTOM_FIELD_DEFINITiONS:99]Field_Name:2; ->[CUSTOM_FIELD_DEFINITiONS:99]Type:6; "Field Names")
				DB_bo_RecordModified:=True:C214
			: (Modified:C32([CUSTOM_FIELDS:98]Unique_Code:2))
				DB_bo_RecordModified:=True:C214
			: (Modified:C32([CUSTOM_FIELDS:98]String_31:4))
				DB_bo_RecordModified:=True:C214
			: (Modified:C32([CUSTOM_FIELDS:98]Real_or_Integer:5))
				DB_bo_RecordModified:=True:C214
			: (Modified:C32([CUSTOM_FIELDS:98]Date_Field:7))
				DB_bo_RecordModified:=True:C214
			: (Modified:C32([CUSTOM_FIELDS:98]Text_Field:6))
				DB_bo_RecordModified:=True:C214
		End case 
	: ($_l_event=On Deactivate:K2:10)
		//PAUSE PROCESS(vProc)
End case 
ERR_MethodTrackerReturn("FM:CustomFIeld_in"; $_t_oldMethodName)
