//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      RecText EditArr
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
	//ARRAY TEXT(<>SCPT_at_ScriptCommands;0)
	C_LONGINT:C283($_l_EndHighlight; $_l_StartHighlight)
	C_POINTER:C301($1)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("RecText EditArr")
If (<>SCPT_at_ScriptCommands>0)
	GET HIGHLIGHT:C209($1->; $_l_StartHighlight; $_l_EndHighlight)
	$1->:=Substring:C12($1->; 1; $_l_StartHighlight-1)+<>SCPT_at_ScriptCommands{<>SCPT_at_ScriptCommands}+(Char:C90(13)*Num:C11(Substring:C12($1->; $_l_EndHighlight; 1)#Char:C90(13)))+Substring:C12($1->; $_l_EndHighlight; 32000)
	$_l_EndHighlight:=$_l_StartHighlight+Length:C16(<>SCPT_at_ScriptCommands{<>SCPT_at_ScriptCommands})+1
	HIGHLIGHT TEXT:C210($1->; $_l_EndHighlight; $_l_EndHighlight)
Else 
	<>SCPT_at_ScriptCommands:=1
End if 
ERR_MethodTrackerReturn("RecText EditArr"; $_t_oldMethodName)
