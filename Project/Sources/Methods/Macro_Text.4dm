//%attributes = {}
If (False:C215)
	//Project Method Name:      Macro_Text
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(<>SCPT_at_ScriptCode;0)
	//ARRAY TEXT(<>SCPT_at_ScriptText;0)
	ARRAY TEXT:C222($_at_ScriptCode; 0)
	ARRAY TEXT:C222($_at_ScriptText; 0)
	//ARRAY TEXT(aMacroCode;0)
	//ARRAY TEXT(aMacroText;0)
	C_BOOLEAN:C305(<>DB_bo_ScriptsInited; SCPT_bo_ScriptsLoaded)
	C_LONGINT:C283($_l_ScriptRow)
	C_TEXT:C284($_t_oldMethodName; $0; $1)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Macro_Text")
//Macro_Text - see also Int Text
While (Semaphore:C143("$InitingMacros"))
	DelayTicks
End while 
If (Not:C34(<>DB_bo_ScriptsInited)) | (Not:C34(SCPT_bo_ScriptsLoaded))  //NG in the macro trigger (and aLPA method) set this to false and it will reload automaticallly
	If (Not:C34(<>DB_bo_ScriptsInited))
		ARRAY TEXT:C222(<>SCPT_at_ScriptCode; 0)
		ARRAY TEXT:C222(<>SCPT_at_ScriptText; 0)
	End if 
	ARRAY TEXT:C222($_at_ScriptCode; 0)
	ARRAY TEXT:C222($_at_ScriptText; 0)
	COPY ARRAY:C226(<>SCPT_at_ScriptCode; $_at_ScriptCode)
	COPY ARRAY:C226(<>SCPT_at_ScriptText; $_at_ScriptText)
	SCPT_bo_ScriptsLoaded:=True:C214
	<>DB_bo_ScriptsInited:=True:C214
End if 
CLEAR SEMAPHORE:C144("$InitingMacros")
If (Count parameters:C259>0)
	If ($1#"")
		$_l_ScriptRow:=Find in array:C230($_at_ScriptCode; $1)
		If ($_l_ScriptRow>0)
			$0:=<>SCPT_at_ScriptText{$_l_ScriptRow}
		Else 
			While (Semaphore:C143("$InsertingMacroArray"))
				DelayTicks
			End while 
			QUERY:C277([SCRIPTS:80]; [SCRIPTS:80]Script_Code:1=$1)
			While (Semaphore:C143("$InitingMacros"))
				DelayTicks
			End while 
			APPEND TO ARRAY:C911(<>SCPT_at_ScriptCode; [SCRIPTS:80]Script_Code:1)
			APPEND TO ARRAY:C911(<>SCPT_at_ScriptText; Macro_PlatformTranslate(->[SCRIPTS:80]Recording_Text:4; 0))
			APPEND TO ARRAY:C911($_at_ScriptCode; [SCRIPTS:80]Script_Code:1)
			APPEND TO ARRAY:C911($_at_ScriptText; Macro_PlatformTranslate(->[SCRIPTS:80]Recording_Text:4; 0))
			CLEAR SEMAPHORE:C144("$InitingMacros")
			CLEAR SEMAPHORE:C144("$InsertingMacroArray")
			$0:=Macro_PlatformTranslate(->[SCRIPTS:80]Recording_Text:4; 0)
		End if 
	Else 
		$0:=""
	End if 
Else 
	$0:=""
End if 
ERR_MethodTrackerReturn("Macro_Text"; $_t_oldMethodName)
