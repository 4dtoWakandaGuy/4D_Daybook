//%attributes = {}
If (False:C215)
	//Project Method Name:      ACC_trRelationEntry
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/11/2012 13:40
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($0; $Null)
	C_LONGINT:C283($1; $2)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("ACC_trRelationEntry")
$0:=False:C215
ERR_MethodTrackerReturn("ACC_trRelationEntry"; $_t_oldMethodName)
