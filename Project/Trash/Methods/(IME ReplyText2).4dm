//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      IME_ReplyText2
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
	C_LONGINT:C283($_l_CountParameters; $_l_Index; $_l_ScriptRow)
	C_TEXT:C284($_t_Find; $_t_oldMethodName; $_t_Replace; $_t_Reply; $1; $10; $11; $12; $13; $14; $15)
	C_TEXT:C284($16; $17; $18; $2; $3; $4; $5; $6; $7; $8; $9)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("IME_ReplyText2")
//IME_ReplyText2 - doesn't require any replace chars
// - see also Macro_Text
$_l_CountParameters:=Count parameters:C259
If ($_l_CountParameters>0)
	If ($1#"")
		If (($1#"ITX @") & ($1#"ICA @"))
			$1:="ITX "+$1
		End if 
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
		
		$_l_ScriptRow:=Find in array:C230(IME_at_ScriptCode; $1)
		If ($_l_ScriptRow>0)
			$_t_Reply:=IME_at_ScriptText{$_l_ScriptRow}
		Else 
			If ([SCRIPTS:80]Script_Code:1#$1)
				QUERY:C277([SCRIPTS:80]; [SCRIPTS:80]Script_Code:1=$1)
			End if 
			If (Records in selection:C76([SCRIPTS:80])>0)
				$_t_Reply:=Macro_PlatformTranslate(->[SCRIPTS:80]Recording_Text:4; 0)
			End if 
		End if 
		
		If ($1="ICA @")
			If ($_l_CountParameters=2)
				$_t_Reply:=IME_EncryptFind(Replace string:C233($_t_Reply; "&*REPLACE*&"; $2))
			Else 
				$_t_Reply:=IME_EncryptFind($_t_Reply)
			End if 
		Else 
			If ($_l_CountParameters>1)
				For ($_l_Index; 2; $_l_CountParameters)
					$_t_Find:="$"+String:C10($_l_Index-1)+"$"
					$_t_Replace:=${$_l_Index}
					$_t_Reply:=Replace string:C233($_t_Reply; $_t_Find; $_t_Replace)
				End for 
			End if 
		End if 
		IME_Reply($_t_Reply)
		
		
	Else 
		$_t_Reply:=""
	End if 
Else 
	$_t_Reply:=""
End if 
ERR_MethodTrackerReturn("IME_ReplyText2"; $_t_oldMethodName)