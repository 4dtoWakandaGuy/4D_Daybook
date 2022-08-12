//%attributes = {}
If (False:C215)
	//Project Method Name:      Minor_LP_Ex
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/10/2013 12:26
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By 
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(DB_bo_NoLoad; DB_bo_RecordModified; PAL_bo_ButtonSubFunction)
	C_LONGINT:C283($_l_Event; $_l_RecordID; DB_l_ButtonClickedFunction; iCancel; iOK; vAdd)
	C_POINTER:C301($_Ptr_CurrentTable; $_Ptr_ExportStamp; $_Ptr_NextCell; $_ptr_RecordIdent; $1; $2; $3; $4)
	C_TEXT:C284($_t_CloseSave; $_t_Delete; $_t_IDFieldNumbers; $_t_oldMethodName; $_t_oldMethodName2; $_t_OnLoadMethod; $_t_PalletButtonName; $_t_RecordCode; $_t_TableTitle; $_t_Text; $5)
	C_TEXT:C284($6; $7; DB_t_CUrrentInputMenuRef; DB_T_CurrentInputWindowMenu; PAL_BUTTON; vButtDis)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("Minor_LP_Ex")

//lp Minor_LP_Export_Stamp
$_ptr_RecordIdent:=$1
$_Ptr_NextCell:=$2
$_Ptr_ExportStamp:=$3
$_Ptr_CurrentTable:=$4
$_t_TableTitle:=$5
$_t_IDFieldNumbers:=$6
If (Count parameters:C259>=7)
	$_t_OnLoadMethod:=$7
End if 

$_l_Event:=Form event code:C388
Case of 
	: ($_l_Event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		DB_SetnewToolBar
		
		$_t_RecordCode:=""
		$_l_RecordID:=0
		If (Is a variable:C294($_ptr_RecordIdent))
			If (Type:C295($_ptr_RecordIdent->)=Is text:K8:3)
				$_t_RecordCode:=$_ptr_RecordIdent->
			Else 
				$_l_RecordID:=$_ptr_RecordIdent->
			End if 
		Else 
			If (Is field value Null:C964($_ptr_RecordIdent->))
				If (Type:C295($_ptr_RecordIdent->)=Is text:K8:3)
					$_t_RecordCode:=""
				Else 
					$_l_RecordID:=0
				End if 
				//$_t_Text:=""
			Else 
				//$_t_Text:=$1->
				If (Type:C295($_ptr_RecordIdent->)=Is text:K8:3)
					$_t_RecordCode:=$_ptr_RecordIdent->
				Else 
					$_l_RecordID:=$_ptr_RecordIdent->
				End if 
				
			End if 
		End if 
		Case of 
			: ($_t_RecordCode#"")
				If (vAdd=1)
					$_ptr_RecordIdent->:=Uppercase:C13($_t_RecordCode)
					$_t_Text:=$_Ptr_ExportStamp->
					$_Ptr_ExportStamp->:=Export_Stamp2($_t_Text)
				End if 
				
				GOTO OBJECT:C206($_Ptr_NextCell->)
			: ($_l_RecordID#0)
				GOTO OBJECT:C206($_Ptr_NextCell->)
				
			Else 
				GOTO OBJECT:C206($_ptr_RecordIdent->)
		End case 
		If ($_t_OnLoadMethod#"")
			$_t_oldMethodName2:=ERR_MethodTracker("EXECUTE: "+$_t_OnLoadMethod)
			EXECUTE METHOD:C1007($_t_OnLoadMethod)
		End if 
		vButtDis:="I  PMO  FSSSRCADT"
		Gen_InDisCode($_ptr_RecordIdent; ->vButtDis)
		Input_Buttons($_Ptr_CurrentTable; ->vButtDis)
		Macro_AccType("Load "+String:C10(Table:C252($_Ptr_CurrentTable)))
		SD2_SetDiaryPopup
		In_ButtChkDis(->vButtDis)
		
	: ($_l_Event=On Activate:K2:9) | ($_l_Event=On Menu Selected:K2:14)
		
		SD2_SetDiaryPopup
		
		In_ButtChkDis(->vButtDis)
		
	: ((($_l_Event=On Outside Call:K2:11) & (DB_l_ButtonClickedFunction#0)) | (iOK=1) | (iCancel=1))
		Case of 
			: (DB_l_ButtonClickedFunction=DB_GetButtonFunction("FormWindows"))
				If (DB_t_CUrrentInputMenuRef#"") & (DB_T_CurrentInputWindowMenu#"")
					DB_T_CurrentInputWindowMenu:=DB_BuildWIndowsMenu(DB_T_CurrentInputWindowMenu)
					SET MENU BAR:C67(DB_t_CUrrentInputMenuRef)
				End if 
				DB_l_ButtonClickedFunction:=0
			: (DB_l_ButtonClickedFunction=902)
				DB_l_ButtonClickedFunction:=0
				DB_SubFunctionHandler
			Else 
				$_t_Delete:="Minor_DelSinEx"
				$_t_CloseSave:=""
				If ($_t_OnLoadMethod="@CU")
					$_t_Delete:="Minor_DelSECU"
					$_t_CloseSave:="Gen_CULPA"
				End if 
				In_ButtCall($_t_CloseSave; ""; $_t_Delete; $_Ptr_CurrentTable; $_ptr_RecordIdent; $_t_TableTitle; $_t_IDFieldNumbers; $_t_OnLoadMethod; ""; ""; ""; ->[IDENTIFIERS:16]; ->vButtDis)
				
		End case 
		
		
		
		
	: ($_l_Event=On Data Change:K2:15)
		Case of 
			: (Modified:C32($_ptr_RecordIdent->))
				If (Is a variable:C294($_ptr_RecordIdent))
					If (Type:C295($_ptr_RecordIdent->)=Is text:K8:3)
						$_t_RecordCode:=$_ptr_RecordIdent->
					Else 
						$_l_RecordID:=$_ptr_RecordIdent->
					End if 
				Else 
					If (Is field value Null:C964($_ptr_RecordIdent->))
						If (Type:C295($_ptr_RecordIdent->)=Is text:K8:3)
							$_t_RecordCode:=""
						Else 
							$_l_RecordID:=0
						End if 
						//$_t_Text:=""
					Else 
						//$_t_Text:=$1->
						If (Type:C295($_ptr_RecordIdent->)=Is text:K8:3)
							$_t_RecordCode:=$_ptr_RecordIdent->
							$_ptr_RecordIdent->:=Str_StripDel(RemoveTrail2(Uppercase:C13($_t_RecordCode)))
						Else 
							$_l_RecordID:=$_ptr_RecordIdent->
						End if 
						
					End if 
				End if 
				
				
				$1->:=Str_StripDel(RemoveTrail2(Uppercase:C13($_t_Text)))
				If (Is a variable:C294($_Ptr_ExportStamp))
					$_t_Text:=$_Ptr_ExportStamp->
				Else 
					If (Is field value Null:C964($_Ptr_ExportStamp->))
						$_t_Text:=""
					Else 
						$_t_Text:=$_Ptr_ExportStamp->
					End if 
				End if 
				$_Ptr_ExportStamp->:=Export_Stamp2($_t_Text)
				DB_bo_RecordModified:=True:C214
				Macro_AccTypePt($_ptr_RecordIdent)
			: (Modified:C32($_Ptr_NextCell->))
				If (Is a variable:C294($_Ptr_NextCell))
					$_t_Text:=$_Ptr_NextCell->
				Else 
					If (Is field value Null:C964($_Ptr_NextCell->))
						$_t_Text:=""
					Else 
						$_t_Text:=$_Ptr_NextCell->
					End if 
				End if 
				$_Ptr_NextCell->:=Uppers2($_t_Text)
				If (Is a variable:C294($_Ptr_ExportStamp))
					$_t_Text:=$_Ptr_ExportStamp->
				Else 
					If (Is field value Null:C964($_Ptr_ExportStamp->))
						$_t_Text:=""
					Else 
						$_t_Text:=$_Ptr_ExportStamp->
					End if 
				End if 
				
				$_Ptr_ExportStamp->:=Export_Stamp2($_t_Text)
				DB_bo_RecordModified:=True:C214
				Macro_AccTypePt($_Ptr_NextCell)
			Else 
				If (PAL_BUTTON#"")
					$_t_PalletButtonName:=PAL_BUTTON
					PAL_BUTTON:=""
					DB_HandleInputFormButtons($_t_PalletButtonName)
					PAL_bo_ButtonSubFunction:=False:C215
				End if 
				
		End case 
	: ($_l_Event=On Clicked:K2:4)
		If (PAL_BUTTON#"")
			$_t_PalletButtonName:=PAL_BUTTON
			PAL_BUTTON:=""
			DB_HandleInputFormButtons($_t_PalletButtonName)
			PAL_bo_ButtonSubFunction:=False:C215
		End if 
	: ($_l_Event=On Deactivate:K2:10)
		//PAUSE PROCESS(vProc)
End case 
ERR_MethodTrackerReturn("Minor_LP_Ex"; $_t_oldMethodName)
