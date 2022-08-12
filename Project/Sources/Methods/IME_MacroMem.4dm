//%attributes = {}
If (False:C215)
	//Project Method Name:      IME_MacroMem
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
	//ARRAY TEXT(<>IME_at_ScriptCode;0)
	//ARRAY TEXT(<>IME_at_ScriptText;0)
	ARRAY TEXT:C222($_at_ScriptCode; 0)
	ARRAY TEXT:C222($_at_ScriptText; 0)
	//ARRAY TEXT(IME_at_ScriptCode;0)
	//ARRAY TEXT(IME_at_ScriptText;0)
	C_BOOLEAN:C305(<>IME_bo_ScriptsInited; IME_bo_ScriptsInited)
	C_LONGINT:C283($_l_CountRecords; $_l_Index; $_l_ScriptPosition)
	C_TEXT:C284($_t_oldMethodName; $_t_ResultText; $_t_ScriptText)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("IME_MacroMem")
//IME_MacroMem
//see also Ask_Person & Macros_InLPA
CUT NAMED SELECTION:C334([SCRIPTS:80]; "$Macros")
QUERY:C277([SCRIPTS:80]; [SCRIPTS:80]Script_Code:1="ITX @"; *)
QUERY:C277([SCRIPTS:80];  | ; [SCRIPTS:80]Script_Code:1="IMA @"; *)
QUERY:C277([SCRIPTS:80];  | ; [SCRIPTS:80]Script_Code:1="ICA @")
//QUERY SELECTION([MACROS];[MACROS]Same Process=True)

$_l_CountRecords:=Records in selection:C76([SCRIPTS:80])
While (Semaphore:C143("$InitingMacros"))
	DelayTicks
End while 
If (Not:C34(<>IME_bo_ScriptsInited)) | (Not:C34(IME_bo_ScriptsInited))  //NG in the macro trigger (and aLPA method) set this to false and it will reload automaticallly
	If (Not:C34(<>IME_bo_ScriptsInited))
		ARRAY TEXT:C222(<>IME_at_ScriptCode; 0)
		ARRAY TEXT:C222(<>IME_at_ScriptText; 0)
	End if 
	ARRAY TEXT:C222(IME_at_ScriptCode; 0)
	ARRAY TEXT:C222(IME_at_ScriptText; 0)
	COPY ARRAY:C226(<>IME_at_ScriptCode; IME_at_ScriptCode)
	COPY ARRAY:C226(<>IME_at_ScriptText; IME_at_ScriptText)
	IME_bo_ScriptsInited:=True:C214
	<>IME_bo_ScriptsInited:=True:C214
End if 
CLEAR SEMAPHORE:C144("$InitingMacros")

//Rollo 9/9/2004 - rewritten the loading of macros to do the translation

//UTI_ArrayResize ($_l_CountRecords;->◊IME_at_ScriptCode;->◊IME_at_ScriptText)
FIRST RECORD:C50([SCRIPTS:80])
$_l_Index:=1
While (Semaphore:C143("$InsertingMacroArray"))
	DelayTicks
End while 
If (Size of array:C274(<>IME_at_ScriptCode)=0)
	SELECTION TO ARRAY:C260([SCRIPTS:80]Script_Code:1; <>IME_at_ScriptCode; [SCRIPTS:80]Recording_Text:4; <>IME_at_ScriptText)
	For ($_l_Index; 1; Size of array:C274(<>IME_at_ScriptCode))
		<>IME_at_ScriptText{$_l_Index}:=Macro_PlatformTranslate(-><>IME_at_ScriptText{$_l_Index}; 0)
	End for 
Else 
	SELECTION TO ARRAY:C260([SCRIPTS:80]Script_Code:1; $_at_ScriptCode; [SCRIPTS:80]Recording_Text:4; $_at_ScriptText)
	For ($_l_Index; 1; Size of array:C274($_at_ScriptCode))
		$_l_ScriptPosition:=Find in array:C230(<>IME_at_ScriptCode; $_at_ScriptCode{$_l_Index})
		If ($_l_ScriptPosition<0)
			//$_t_ScriptText:=Macro_PlatformTranslate (->$_at_ScriptText{$_l_Index})
			$_t_ResultText:=Macro_PlatformTranslate(->$_at_ScriptText{$_l_Index})
			$_t_ScriptText:=$_at_ScriptText{$_l_Index}
			APPEND TO ARRAY:C911(<>IME_at_ScriptText; $_t_ScriptText)
			APPEND TO ARRAY:C911(<>IME_at_ScriptCode; $_at_ScriptCode{$_l_Index})
		Else 
			//$_t_ScriptText:=Macro_PlatformTranslate (->$_at_ScriptText{$_l_Index})
			$_t_ResultText:=Macro_PlatformTranslate(->$_at_ScriptText{$_l_Index})
			$_t_ScriptText:=$_at_ScriptText{$_l_Index}
			<>IME_at_ScriptText{$_l_ScriptPosition}:=$_t_ScriptText
		End if 
	End for 
End if 
COPY ARRAY:C226(<>IME_at_ScriptCode; IME_at_ScriptCode)
COPY ARRAY:C226(<>IME_at_ScriptText; IME_at_ScriptText)
CLEAR SEMAPHORE:C144("$InsertingMacroArray")

If (False:C215)
	While ((Not:C34(End selection:C36([SCRIPTS:80]))) & ($_l_Index<=$_l_CountRecords))
		
		<>IME_at_ScriptCode{$_l_Index}:=[SCRIPTS:80]Script_Code:1
		<>IME_at_ScriptText{$_l_Index}:=Macro_PlatformTranslate(->[SCRIPTS:80]Recording_Text:4; 0)
		
		$_l_Index:=$_l_Index+1
		NEXT RECORD:C51([SCRIPTS:80])
	End while 
End if 

USE NAMED SELECTION:C332("$Macros")
ERR_MethodTrackerReturn("IME_MacroMem"; $_t_oldMethodName)