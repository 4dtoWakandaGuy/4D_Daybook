//%attributes = {}
If (False:C215)
	//Project Method Name:      Macros_InLPA
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  28/11/2010 19:09
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(<>IME_at_ScriptCode;0)
	//ARRAY TEXT(<>IME_at_ScriptText;0)
	//ARRAY TEXT(<>SCPT_at_ScriptCode;0)
	//ARRAY TEXT(<>SCPT_at_ScriptText;0)
	C_BOOLEAN:C305(<>DB_bo_ScriptsInited; <>IME_bo_ScriptsInited; <>PER_bo_CurrentScriptonSave; <>SYS_bo_ScriptonSave)
	C_LONGINT:C283($_l_ScriptRow)
	C_TEXT:C284($_t_oldMethodName; $1)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Macros_InLPA")
//Macros_InLPA
<>DB_bo_ScriptsInited:=False:C215
<>IME_bo_ScriptsInited:=False:C215
[SCRIPTS:80]Recording_Text:4:=Macro_translate([SCRIPTS:80]Recording_Text:4)
[SCRIPTS:80]Recording_Text:4:=Macro_PlatformTranslate(->[SCRIPTS:80]Recording_Text:4; 0)
MACRO_ParseForCode([SCRIPTS:80]Script_Code:1; False:C215)
While (Semaphore:C143("$InitingMacros"))
	DelayTicks
End while 
If (Not:C34(<>DB_bo_ScriptsInited))  //NG in the macro trigger (and aLPA method) set this to false and it will reload automaticallly
	ARRAY TEXT:C222(<>SCPT_at_ScriptCode; 0)
	ARRAY TEXT:C222(<>SCPT_at_ScriptText; 0)
	<>DB_bo_ScriptsInited:=True:C214
End if 
If (Not:C34(<>IME_bo_ScriptsInited))  //NG in the macro trigger (and aLPA method) set this to false and it will reload automaticallly
	ARRAY TEXT:C222(<>IME_at_ScriptCode; 0)
	ARRAY TEXT:C222(<>IME_at_ScriptText; 0)
	<>IME_bo_ScriptsInited:=True:C214
End if 

CLEAR SEMAPHORE:C144("$InitingMacros")

[SCRIPTS:80]Recording_Text:4:=Str_StripDel([SCRIPTS:80]Recording_Text:4)
If (Not:C34(<>SYS_bo_ScriptonSave))
	If (DB_GetModuleSettingByNUM(Module_Macros)>0)
		<>SYS_bo_ScriptonSave:=<>PER_bo_CurrentScriptonSave
	End if 
End if 

If ((<>SYS_bo_ScriptonSave) | ([SCRIPTS:80]Script_Code:1="IMA @") | ([SCRIPTS:80]Script_Code:1="ITX @"))
	If (([SCRIPTS:80]Script_Code:1="IMA @") | ([SCRIPTS:80]Script_Code:1="ITX @") | ([SCRIPTS:80]Script_Code:1="ICA @") | ([SCRIPTS:80]Script_Code:1="Accept @") | ([SCRIPTS:80]Script_Code:1="Enter @") | ([SCRIPTS:80]Script_Code:1="View @") | ([SCRIPTS:80]Script_Code:1="Modified @") | ([SCRIPTS:80]Script_Code:1="Background"))
		While (Semaphore:C143("$InsertingMacroArray"))
			DelayTicks
		End while 
		$_l_ScriptRow:=Find in array:C230(<>SCPT_at_ScriptCode; [SCRIPTS:80]Script_Code:1)
		If (([SCRIPTS:80]Script_Code:1="IMA @") | ([SCRIPTS:80]Script_Code:1="ITX @") | ([SCRIPTS:80]Script_Code:1="ICA @"))
			If ($_l_ScriptRow>0)
				<>SCPT_at_ScriptText{$_l_ScriptRow}:=Macro_PlatformTranslate(->[SCRIPTS:80]Recording_Text:4; 0)
			End if 
		Else 
			
			If ($_l_ScriptRow<1)
				INSERT IN ARRAY:C227(<>SCPT_at_ScriptCode; 1; 1)
				INSERT IN ARRAY:C227(<>SCPT_at_ScriptText; 1; 1)
				$_l_ScriptRow:=1
				<>SCPT_at_ScriptCode{$_l_ScriptRow}:=[SCRIPTS:80]Script_Code:1
			End if 
			<>SCPT_at_ScriptText{$_l_ScriptRow}:=Macro_PlatformTranslate(->[SCRIPTS:80]Recording_Text:4; 0)
		End if 
		CLEAR SEMAPHORE:C144("$InsertingMacroArray")
	End if 
End if 

//Rollo 29/10/2004
If ((DB_GetModuleSettingByNUM(Module_IntServer))>1)  // if access to Internet Module
	//clear caches to allow immediate local testing of changes made to certain macros
	If ([SCRIPTS:80]Script_Code:1="ITX DBEdit@")
		IME_CachedDataDelete("Edit@")
	End if 
	If ([SCRIPTS:80]Script_Code:1="ITX DBList@")
		IME_CachedDataDelete("List@")
	End if 
End if 
ERR_MethodTrackerReturn("Macros_InLPA"; $_t_oldMethodName)
