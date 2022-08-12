//%attributes = {}
If (False:C215)
	//Project Method Name:      Macro_PlatformTranslate
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 14/03/2010 17:57
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_POINTER:C301($1)
	C_TEXT:C284($_t_oldMethodName; $_t_ScriptText; $0)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Macro_PlatformTranslate")
//New Method NG may 2004 to only do the cross platform translation of the MacroText(pass a pointer to the text in $1)

If (Count parameters:C259>=1)
	$_t_ScriptText:=$1->
	
	$_t_ScriptText:=Replace string:C233($_t_ScriptText; "≤"; "[[")
	$_t_ScriptText:=Replace string:C233($_t_ScriptText; "≥"; "]]")
	$_t_ScriptText:=Replace string:C233($_t_ScriptText; "◊"; "<>")
	
	If (Count parameters:C259=1)
		$1->:=$_t_ScriptText
		$0:=$_t_ScriptText
	Else 
		$0:=$_t_ScriptText
	End if 
	
End if 
ERR_MethodTrackerReturn("Macro_PlatformTranslate"; $_t_oldMethodName)
