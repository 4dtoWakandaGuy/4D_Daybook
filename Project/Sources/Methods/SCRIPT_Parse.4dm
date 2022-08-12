//%attributes = {}

If (False:C215)
	//Project Method Name:      SCRIPT_Parse
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  08/04/2020
	//Created BY:  Nigel Greenlee
	
	//Date Modified: 
	//Modified By: Nigel Greenlee
	//Modification notes
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName; $_t_ScriptText; $0; $1)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("SCRIPT_Parse")
//this method will handle any conversion we need to do to the script-ie replace an IMA or ITX Stuff
$_t_ScriptText:=$1
//$_t_ScriptText:=Replace string($_t_ScriptText;"Wait on Event";"Record_PlayWoE")
$0:=$1
ERR_MethodTrackerReturn("SCRIPT_Parse"; $_t_oldMethodName)
