//%attributes = {}
If (False:C215)
	//Project Method Name:      Macro_AccType
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 09/12/2009 09:32`Method: Macro_AccType
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(MAC_at_aMacroCode;0)
	//ARRAY TEXT(MAC_at_aMacroText;0)
	C_BOOLEAN:C305(<>PER_bo_CurrentScriptonSave; <>SYS_bo_ScriptonSave; <>SYS_bo_StopMacros; $_bo_NoQuery; $_bo_OverrideAccessRights; $_bo_Rules; $2; $3; $4; SCPT_bo_RunFromArrays)
	C_LONGINT:C283(<>SCPT_l_currentScriptProcess; <>SCPT_l_PlayerActive; <>SYS_l_CancelProcess; $_l_ScriptRow; SCPT_l_Cancel)
	C_TEXT:C284(<>RECTEXT; $_t_oldMethodName; $_t_ScriptIDent; $_t_ScriptText; $1; $RT)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Macro_AccType")
//Macro_AccType - Accept Type - ie also Enter, View, Modified or During
//see also Diary_RecCheck
//C_TEXT($1)
If (Count parameters:C259>=1)
	$_t_ScriptIDent:=$1
	If (Count parameters:C259>=2)
		$_bo_Rules:=$2
	Else 
		$_bo_Rules:=False:C215
	End if 
	If (Count parameters:C259>=3)
		$_bo_NoQuery:=$3
	Else 
		$_bo_NoQuery:=False:C215
	End if 
	If (Count parameters:C259>=4)
		$_bo_OverrideAccessRights:=$4
	Else 
		$_bo_OverrideAccessRights:=False:C215
	End if 
	If ($_bo_Rules)
		QUERY:C277([SCRIPTS:80]; [SCRIPTS:80]Script_Code:1=$_t_ScriptIDent)
		If ([SCRIPTS:80]Script_status:13#Disabled)
			<>SYS_l_CancelProcess:=0
			SCPT_l_Cancel:=0
			<>SYS_bo_StopMacros:=False:C215
			$_t_ScriptText:=Replace string:C233([SCRIPTS:80]Recording_Text:4; "$"; "SCPT_")
			
			Record_Play(1; $_t_ScriptText; $_bo_OverrideAccessRights; [SCRIPTS:80]Script_Code:1)  //A parameter means don't clear RecPlayUp
			WS_KeepFocus
			
			
		End if 
		
		
	Else 
		If (Not:C34(<>SYS_bo_ScriptonSave))
			If (DB_GetModuleSettingByNUM(Module_Macros)>0)
				<>SYS_bo_ScriptonSave:=<>PER_bo_CurrentScriptonSave
			End if 
		End if 
		If (<>SYS_bo_ScriptonSave)
			If (SCPT_bo_RunFromArrays)  //if we are editing macros we cant have the macro change...
				$_l_ScriptRow:=Find in array:C230(MAC_at_aMacroCode; $_t_ScriptIDent)
				If ($_l_ScriptRow>0)
					<>SYS_l_CancelProcess:=0
					SCPT_l_Cancel:=0
					<>SYS_bo_StopMacros:=False:C215
					$_t_ScriptText:=Replace string:C233(MAC_at_aMacroText{$_l_ScriptRow}; "$"; "SCPT_")
					
					Record_Play(1; $_t_ScriptText; $_bo_OverrideAccessRights; MAC_at_aMacroCode{$_l_ScriptRow})  //A parameter means don't clear RecPlayUp
					WS_KeepFocus
					
				End if 
			Else 
				QUERY:C277([SCRIPTS:80]; [SCRIPTS:80]Script_Code:1=$_t_ScriptIDent)
				If (Records in selection:C76([SCRIPTS:80])>0)
					If ([SCRIPTS:80]Script_status:13#Disabled)
						<>SYS_l_CancelProcess:=0
						SCPT_l_Cancel:=0
						<>SYS_bo_StopMacros:=False:C215
						$_t_ScriptText:=Replace string:C233([SCRIPTS:80]Recording_Text:4; "$"; "SCPT_")
						
						Record_Play(1; [SCRIPTS:80]Recording_Text:4; $_bo_OverrideAccessRights; $_t_ScriptIDent)  //A parameter means don't clear RecPlayUp
						WS_KeepFocus
					End if 
				End if 
			End if 
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("Macro_AccType"; $_t_oldMethodName)
