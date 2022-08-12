//%attributes = {}
If (False:C215)
	//Project Method Name:      Areas_InLP
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  22/09/2010 17:45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(MOD_al_ModuleBarNum;0)
	//ARRAY LONGINT(MOD_al_ModuleBarOffsets;0)
	C_BOOLEAN:C305(DB_bo_NoLoad; DB_bo_RecordModified; PAL_bo_ButtonSubFunction)
	C_LONGINT:C283($_l_ButtonNumber; $_l_Event; $_l_ModulePosition; DB_l_WindowCurrentModule; ModuleNumber; PAL_but_LastRecord; PAL_but_PreviousRecord; PAL_but_NextRecord; PAL_but_FirstRecord)
	C_REAL:C285($1)
	C_TEXT:C284($_t_oldMethodName; $_t_PalleteButton; BAR_t_Button; DB_t_CUrrentInputMenuRef; PAL_BUTTON; WIN_t_CurrentInputForm)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("Areas_InLP")

Minor_LP_Ex(->[AREAS:3]Area_Code:1; ->[AREAS:3]Area_Name:2; ->[AREAS:3]Export:3; ->[AREAS:3]; "Areas"; "1"; "")
If (Count parameters:C259>=1)
	$_l_Event:=$1
Else 
	$_l_Event:=Form event code:C388
End if 
$_t_oldMethodName:=ERR_MethodTracker("Areas_InLP"; $_l_Event)



Case of 
	: ($_l_Event=On Data Change:K2:15) | ($_l_Event=On Clicked:K2:4) | ($_l_Event=On Menu Selected:K2:14) | ($_l_Event=On Plug in Area:K2:16)
		
		Case of 
			: (BAR_t_Button#"")
				$_l_ButtonNumber:=Num:C11(BAR_t_Button)
				If ($_l_ButtonNumber>1)
					ModuleNumber:=MOD_al_ModuleBarOffsets{$_l_ButtonNumber-1}
					$_l_ModulePosition:=Find in array:C230(MOD_al_ModuleBarNum; ModuleNumber)
					DB_SetBrowserBarSelection($_l_ModulePosition; ->MOD_al_ModuleBarNum; DB_l_WindowCurrentModule; ->DB_l_WindowCurrentModule)
					DB_SetInputFormMenu(Table:C252(->[AREAS:3]); "Area_in")
				End if 
				BAR_t_Button:=""
			: (PAL_BUTTON#"")
				$_t_PalleteButton:=PAL_BUTTON
				PAL_BUTTON:=""
				DB_HandleInputFormButtons($_t_PalleteButton)
				PAL_bo_ButtonSubFunction:=False:C215
				
			: (Modified:C32([AREAS:3]Tax_Rate:4))
				DB_bo_RecordModified:=True:C214
				[AREAS:3]Export:3:=Export_Stamp2([AREAS:3]Export:3)
			: (Modified:C32([AREAS:3]Person:5))
				Check_MinorNC(->[AREAS:3]Person:5; ""; ->[PERSONNEL:11]; ->[PERSONNEL:11]Initials:1; ->[PERSONNEL:11]Name:2; "Person")  //6
				DB_bo_RecordModified:=True:C214
			: (Modified:C32([AREAS:3]Description:6))
				DB_bo_RecordModified:=True:C214
			: ($_l_Event=On Menu Selected:K2:14)
				DB_SetInputFormMenu(Table:C252(->[AREAS:3]); "Area_in")
				If (Records in selection:C76([AREAS:3])<=1)
					OBJECT SET VISIBLE:C603(*; "oInputButtonNextRecord"; False:C215)
					OBJECT SET VISIBLE:C603(*; "oInputButtonPreviousRecord"; False:C215)
					DB_MenuAction("File"; "Next Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
					DB_MenuAction("File"; "Previous Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
				End if 
		End case 
	: ($_l_Event=On Clicked:K2:4)
		If (PAL_BUTTON#"")
			$_t_PalleteButton:=PAL_BUTTON
			PAL_BUTTON:=""
			DB_HandleInputFormButtons($_t_PalleteButton)
			PAL_bo_ButtonSubFunction:=False:C215
		End if 
	: ($_l_Event=On Activate:K2:9)
		DB_SetInputFormMenu(Table:C252(->[AREAS:3]); "Area_in")
		If (Records in selection:C76([AREAS:3])<=1)
			OBJECT SET VISIBLE:C603(*; "oInputButtonNextRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonPreviousRecord"; False:C215)
			DB_MenuAction("File"; "Next Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
			DB_MenuAction("File"; "Previous Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
		End if 
	: ($_l_Event=On Menu Selected:K2:14)
		DB_SetInputFormMenu(Table:C252(->[AREAS:3]); "Area_in")
		If (Records in selection:C76([AREAS:3])<=1)
			OBJECT SET VISIBLE:C603(*; "oInputButtonNextRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonPreviousRecord"; False:C215)
			DB_MenuAction("File"; "Next Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
			DB_MenuAction("File"; "Previous Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
		End if 
	: ($_l_Event=On Header:K2:17) | ($_l_Event=On Resize:K2:27)
		//WS_AutoscreenSize (2;350;585)
	: ($_l_Event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		OpenHelp(Table:C252(->[AREAS:3]); "Area_in")
		WS_AutoscreenSize(2; 360; 585)
		WIN_t_CurrentInputForm:="Area_in"
		INT_SetInput(Table:C252(->[AREAS:3]); WIN_t_CurrentInputForm)
		DB_SetInputFormMenu(Table:C252(->[AREAS:3]); "Area_in")
		If (Records in selection:C76([AREAS:3])<=1)
			OBJECT SET VISIBLE:C603(*; "oInputButtonNextRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonPreviousRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonFirstRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonLastRecord"; False:C215)
			DB_MenuAction("File"; "Next Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
			DB_MenuAction("File"; "Previous Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
		End if 
		
End case 
ERR_MethodTrackerReturn("Areas_InLP"; $_t_oldMethodName)
