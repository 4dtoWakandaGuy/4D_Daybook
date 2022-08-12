//%attributes = {}
If (False:C215)
	//Project Method Name:      Macro_button
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
	C_BOOLEAN:C305(<>SCPT_bo_NoAutoScripts)
	C_LONGINT:C283(<>SYS_l_WindowTop; $_l_Mousex; $_l_Mousey; $_l_Process; $1; $2; $3)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Macro_button")

$_l_Mousey:=$1+2
$_l_Mousex:=$2+22+<>SYS_l_WindowTop
$_l_Process:=$3
If (<>SCPT_bo_NoAutoScripts=False:C215)
	PLAY:C290("Click"; 0)
End if 
//PostClick (0;$_l_Mousex;$_l_Mousey;$_l_Process)
If ($_l_Process>0)
	
End if 

//POST CLICK($_l_Mousex;$_l_Mousey)
POST CLICK:C466($_l_Mousex; $_l_Mousey)

ERR_MethodTrackerReturn("Macro_button"; $_t_oldMethodName)
