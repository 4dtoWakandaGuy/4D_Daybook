//%attributes = {}
If (False:C215)
	//Project Method Name:      VarToName
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
	C_LONGINT:C283($_l_Nul)
	C_POINTER:C301($1)
	C_TEXT:C284($_t_oldMethodName; $_t_VariableName; $0)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("VarToName")
//VarToName - 01/10/02 PB
//$1=pointer to var

If (Count parameters:C259>=1)
	RESOLVE POINTER:C394($1; $_t_VariableName; $_l_Nul; $_l_Nul)
End if 
$0:=$_t_VariableName
ERR_MethodTrackerReturn("VarToName"; $_t_oldMethodName)