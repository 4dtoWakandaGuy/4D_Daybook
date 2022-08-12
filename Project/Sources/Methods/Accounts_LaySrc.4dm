//%attributes = {}
If (False:C215)
	//Project Method Name:      Accounts_LaySrc
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 28/11/2010 18:09
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>SYS_bo_SpecifiedAccounts)
	C_TEXT:C284($_t_oldMethodName; $1)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Accounts_LaySrc")
If ((<>SYS_bo_SpecifiedAccounts) & ((DB_GetModuleSettingByNUM(Module_MultiLayer))>1))
	
	QUERY BY FORMULA:C48([ACCOUNTS:32]; ACC_LayerMatch($1))
	//QUERY([ACCOUNTS];[ACCOUNTS]LAYERS'Layer Code=$1)
	If (Records in selection:C76([ACCOUNTS:32])=0)
		ALL RECORDS:C47([ACCOUNTS:32])
	End if 
Else 
	ALL RECORDS:C47([ACCOUNTS:32])
End if 
ERR_MethodTrackerReturn("Accounts_LaySrc"; $_t_oldMethodName)
