//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Record PlMacro
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 09/12/2009 09:32`Method: Record PlMacro
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(<>SCPT_l_PlayerActive; $found)
	C_TEXT:C284(<>RECTEXT; $_t_ErrorMethodName; $_t_oldMethodName; $1; $W; vMTitle2)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Record PlMacro")
//Record PlMacro
$_t_ErrorMethodName:=Method called on error:C704
If (Count parameters:C259>=1)
	vMTitle2:=$1
End if 

$W:=<>RecText
<>RecText:="NoClear"
$found:=<>SCPT_l_PlayerActive

Macro(vMTitle2)
ON ERR CALL:C155("Error_Macro")
//TRACE
<>SCPT_l_PlayerActive:=$found
<>RecText:=$W
If ($_t_ErrorMethodName#"")
	ON ERR CALL:C155($_t_ErrorMethodName)
End if 
ERR_MethodTrackerReturn("Record PlMacro"; $_t_oldMethodName)
