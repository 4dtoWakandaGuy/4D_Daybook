//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_UNICODETEST
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 11/11/2009 09:06
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_CharacterPosition)
	C_TEXT:C284($_t_oldMethodName; $_t_ScriptText)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DB_UNICODETEST")

$_t_ScriptText:="Hello"+Char:C90(13)+"Goodbye"

$_l_CharacterPosition:=Position:C15(Char:C90(13); $_t_ScriptText; *)
ALERT:C41("Position is"+String:C10($_l_CharacterPosition)+"It should be 6")
$_t_ScriptText:="nigelbtinternet"
If (Position:C15(Char:C90(64); $_t_ScriptText; *)<1)
	
End if 
$_t_ScriptText:="nigel@btinternet"
If (Position:C15(Char:C90(64); $_t_ScriptText; *)>1)
	
End if 
ERR_MethodTrackerReturn("DB_UNICODETEST"; $_t_oldMethodName)