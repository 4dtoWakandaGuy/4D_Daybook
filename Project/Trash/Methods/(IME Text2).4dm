//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      IME Text2
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
	//ARRAY TEXT(IME_at_ScriptCode;0)
	//ARRAY TEXT(IME_at_ScriptText;0)
	C_BOOLEAN:C305(<>IME_bo_ScriptsInited; IME_bo_ScriptsInited)
	C_LONGINT:C283($_l_CountParameters; $_l_Index; $_l_ScriptCodeRow)
	C_TEXT:C284($_t_Find; $_t_oldMethodName; $_t_Replace; $0; $1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("IME Text2")
//IME Text - doesn't require any replace chars
//  see also Macro_Text
$_l_CountParameters:=Count parameters:C259
If ($_l_CountParameters>0)
	If ($1#"")
		If (($1#"ITX @") & ($1#"ICA @"))
			$1:="ITX "+$1
		End if 
		While (Semaphore:C143("$_l_IndexnitingMacros"))
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
		CLEAR SEMAPHORE:C144("$_l_IndexnitingMacros")
		$_l_ScriptCodeRow:=Find in array:C230(IME_at_ScriptCode; $1)
		If ($_l_ScriptCodeRow>0)
			$0:=IME_at_ScriptText{$_l_ScriptCodeRow}
		Else 
			While (Semaphore:C143("$_l_IndexnsertingMacroArray"))
				DelayTicks
			End while 
			QUERY:C277([SCRIPTS:80]; [SCRIPTS:80]Script_Code:1=$1)
			APPEND TO ARRAY:C911(IME_at_ScriptCode; $1)
			APPEND TO ARRAY:C911(IME_at_ScriptText; Macro_PlatformTranslate(->[SCRIPTS:80]Recording_Text:4; 0))
			CLEAR SEMAPHORE:C144("$_l_IndexnsertingMacroArray")
			$0:=Macro_PlatformTranslate(->[SCRIPTS:80]Recording_Text:4; 0)
			
		End if 
		If ($_l_CountParameters>1)
			For ($_l_Index; 2; $_l_CountParameters)
				$_t_Find:="$"+String:C10($_l_Index-1)+"$"
				$_t_Replace:=${$_l_Index}
				$0:=Replace string:C233($0; $_t_Find; $_t_Replace)
			End for 
		End if 
	Else 
		$0:=""
	End if 
Else 
	$0:=""
End if 
ERR_MethodTrackerReturn("IME Text2"; $_t_oldMethodName)