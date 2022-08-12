//%attributes = {}

If (False:C215)
	//Project Method Name:      Minor_LP_exByObject
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  04/05/2022
	//Created BY:  Nigel Greenlee
	
	//Date Modified: 
	//Modified By: Nigel Greenlee
	//Modification notes
End if 

//Variable Declarations
If (True:C214)
	//C_UNKNOWN(PAL_BUTTON)
	//C_UNKNOWN(vAdd)
	//C_UNKNOWN(vButtDis)
	C_BOOLEAN:C305(DB_bo_NoLoad; DB_bo_RecordModified; PAL_bo_ButtonSubFunction)
	C_LONGINT:C283($_l_Event; $_l_RecordID; $_L_Type; DB_l_ButtonClickedFunction; iCancel; iOK)
	C_OBJECT:C1216($_obj_BUttonCall; $_obj_Event; $_obj_LPParameters; $0$_obj_LPParameters; $1)
	C_POINTER:C301($_Ptr_CurrentTable; $_Ptr_ExportStamp; $_Ptr_NextCell; $_ptr_RecordIdent)
	C_TEXT:C284($_t_ButtonsDisabled; $_t_CloseSave; $_t_Delete; $_t_IDFieldNumbers; $_t_oldMethodName2; $_t_OnLoadMethod; $_t_PalletButtonName; $_t_RecordCode; $_t_TableTitle; $_t_Text; DB_t_CUrrentInputMenuRef)
	C_TEXT:C284(DB_T_CurrentInputWindowMenu)
End if 
//Code Starts Here
$_obj_Event:=FORM Event:C1606

If (Count parameters:C259>=1)
	$_obj_LPParameters:=$1
	$_l_Event:=Form event code:C388
	Case of 
		: ($_obj_Event.code=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
			DB_SetnewToolBar
			
			$_t_RecordCode:=""
			$_l_RecordID:=0
			$_L_Type:=OB Get type:C1230($_obj_LPParameters; "recordIdent")
			If ($_L_Type=Is text:K8:3)
				$_t_RecordCode:=$_obj_LPParameters.recordIdent
			Else 
				$_l_RecordID:=$_obj_LPParameters.recordIdent
			End if 
			
			Case of 
				: ($_t_RecordCode#"")
					If (vAdd=1)
						$_obj_LPParameters.recordIdent:=Uppercase:C13($_t_RecordCode)
						If (Not:C34($_obj_LPParameters.exportStamp=Null:C1517))
							$_t_Text:=$_obj_LPParameters.exportStamp
							$_obj_LPParameters.exportStamp:=Export_Stamp2($_obj_LPParameters.exportStamp)
						End if 
					End if 
					If (Not:C34($_obj_LPParameters.nextAttribute=Null:C1517))
						GOTO OBJECT:C206($_obj_LPParameters.nextAttribute)
					End if 
				: ($_l_RecordID#0)
					If (Not:C34($_obj_LPParameters.nextAttribute=Null:C1517))
						GOTO OBJECT:C206($_obj_LPParameters.nextAttribute)
					End if 
				Else 
					//GOTO OBJECT($_obj_LPParameters.recordIdent)
			End case 
			If (Not:C34($_obj_LPParameters.onLoadMethod=Null:C1517))
				If ($_obj_LPParameters.onLoadMethod#"")
					$_t_oldMethodName2:=ERR_MethodTracker("EXECUTE: "+$_obj_LPParameters.onLoadMethod)
					If (Not:C34($_obj_LPParameters.formData=Null:C1517))
						//we are passing the entity attributes to the method..note when creating these methods this may be attributes named the same as the fields (form.xxx.. or rather  $1.xxx or we could have a current entity(record) , by using the field names as the form object
						EXECUTE METHOD:C1007($_obj_LPParameters.onLoadMethod; *; $_obj_LPParameters.formData)
						
					Else 
						EXECUTE METHOD:C1007($_obj_LPParameters.onLoadMethod)
					End if 
				End if 
			End if 
			Form:C1466.buttonsDisabled:="I  PMO  FSSSRCADT"
			//vButtDis:="I  PMO  FSSSRCADT"
			//Gen_InDisCode($_ptr_RecordIdent; ->vButtDis)
			$_Ptr_CurrentTable:=Table:C252($_obj_LPParameters.currentTable)
			$_t_ButtonsDisabled:=Form:C1466.buttonsDisabled
			Input_Buttons($_Ptr_CurrentTable; ->$_t_ButtonsDisabled)
			Macro_AccType("Load "+String:C10(Table:C252($_Ptr_CurrentTable)))
			SD2_SetDiaryPopup
			In_ButtChkDis(->$_t_ButtonsDisabled)
			
		: ($_obj_Event.code=On Activate:K2:9) | ($_obj_Event.code=On Menu Selected:K2:14)
			SD2_SetDiaryPopup
			$_t_ButtonsDisabled:=Form:C1466.buttonsDisabled
			In_ButtChkDis(->$_t_ButtonsDisabled)
			
		: ((($_obj_Event.code=On Outside Call:K2:11) & (DB_l_ButtonClickedFunction#0)) | (iOK=1) | (iCancel=1))
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
					If (Not:C34($_obj_LPParameters.onLoadMethod=Null:C1517))
						If ($_obj_LPParameters.onLoadMethod#"")
							$_t_OnLoadMethod:=$_obj_LPParameters.onLoadMethod
						End if 
					End if 
					If (Not:C34($_obj_LPParameters.onSaveMethod=Null:C1517))
						If ($_obj_LPParameters.onSaveMethod#"")
							$_t_CloseSave:=$_obj_LPParameters.onSaveMethod
						End if 
					End if 
					
					If ($_t_OnLoadMethod="@CU")
						$_t_Delete:="Minor_DelSECU"
						If ($_t_CloseSave="")
							$_t_CloseSave:="Gen_CULPA"
						End if 
					End if 
					$_Ptr_CurrentTable:=Table:C252($_obj_LPParameters.currentTable)
					$_obj_BUttonCall:=New object:C1471("clickedFunction"; DB_l_ButtonClickedFunction; "OnLoadMethod"; $_t_OnLoadMethod; "CloseSaveFunction"; $_t_CloseSave; "currentTable"; $_obj_LPParameters.currentTable; "IDFieldNumbers"; $_obj_LPParameters.IDFieldNumbers; "disableButtons"; vButtDis; "FormData"; $_obj_LPParameters.formData)
					In_ButtCall($_t_CloseSave; ""; $_t_Delete; $_Ptr_CurrentTable; $_ptr_RecordIdent; $_t_TableTitle; $_t_IDFieldNumbers; $_t_OnLoadMethod; ""; ""; ""; ->[IDENTIFIERS:16]; ->vButtDis)
					
			End case 
			
			
			
			
		: ($_obj_Event.code=On Data Change:K2:15)
			Case of 
				: (Modified:C32($_obj_LPParameters.recordIdent))
					
					If (Type:C295($_obj_LPParameters.recordIdent)=Is text:K8:3)
						$_t_RecordCode:=$_obj_LPParameters.recordIdent
						$_obj_LPParameters.recordIdent:=Str_StripDel(RemoveTrail2(Uppercase:C13($_t_RecordCode)))
					Else 
						$_l_RecordID:=$_obj_LPParameters.recordIdent
					End if 
					
					//$_obj_LPParameters.recordIdent:=Str_StripDel(RemoveTrail2(Uppercase($_t_Text)))
					If (Not:C34($_obj_LPParameters.exportStamp=Null:C1517))
						$_t_Text:=$_obj_LPParameters.exportStamp
						$_obj_LPParameters.exportStamp:=Export_Stamp2($_t_Text)
					End if 
					DB_bo_RecordModified:=True:C214
					If (Not:C34($_obj_LPParameters.IDFieldNumber=Null:C1517))
						$_ptr_RecordIdent:=Field:C253($_obj_LPParameters.currentTable; $_obj_LPParameters.IDFieldNumber)
						Macro_AccTypePt($_ptr_RecordIdent)
					End if 
				: (Modified:C32($_obj_LPParameters.nextAttribute))
					If (Is a variable:C294($_obj_LPParameters.nextAttribute))
						$_t_Text:=$_obj_LPParameters.nextAttribute
					Else 
						If (Is field value Null:C964($_obj_LPParameters.nextAttribute))
							$_t_Text:=""
						Else 
							$_t_Text:=$_obj_LPParameters.nextAttribute
						End if 
					End if 
					$_obj_LPParameters.nextAttribute:=Uppers2($_t_Text)
					If (Not:C34($_obj_LPParameters.exportStamp=Null:C1517))
						$_t_Text:=$_obj_LPParameters.exportStamp
						$_obj_LPParameters.exportStamp:=Export_Stamp2($_t_Text)
					End if 
					DB_bo_RecordModified:=True:C214
					
					//Macro_AccTypePt($_Ptr_NextCell)<--need to rethink this behaviour
				Else 
					If (PAL_BUTTON#"")
						$_t_PalletButtonName:=PAL_BUTTON
						PAL_BUTTON:=""
						DB_HandleInputFormButtons($_t_PalletButtonName)
						PAL_bo_ButtonSubFunction:=False:C215
					End if 
					
			End case 
		: ($_obj_Event.code=On Clicked:K2:4)
			If (PAL_BUTTON#"")
				$_t_PalletButtonName:=PAL_BUTTON
				PAL_BUTTON:=""
				DB_HandleInputFormButtons($_t_PalletButtonName)
				PAL_bo_ButtonSubFunction:=False:C215
			End if 
		: ($_obj_Event.code=On Deactivate:K2:10)
			//PAUSE PROCESS(vProc)
	End case 
	
	
End if 
