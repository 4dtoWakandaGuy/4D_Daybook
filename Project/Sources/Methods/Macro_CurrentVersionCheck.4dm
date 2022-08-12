//%attributes = {}
If (False:C215)
	//Project Method Name:      Macro_CurrentVersionCheck
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 16/02/2010 09:41
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(<>SCPT_l_CheckVersion; $0; $1)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Macro_CurrentVersionCheck")

If (Count parameters:C259=0)
	$0:=13
Else 
	If (<>SCPT_l_CheckVersion=0)
		<>SCPT_l_CheckVersion:=$1
	End if 
	$0:=<>SCPT_l_CheckVersion
End if 
ERR_MethodTrackerReturn("Macro_CurrentVersionCheck"; $_t_oldMethodName)
