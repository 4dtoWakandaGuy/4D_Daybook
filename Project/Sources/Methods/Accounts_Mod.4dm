//%attributes = {}
If (False:C215)
	//Project Method Name:      Accounts_Mod
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
	C_BOOLEAN:C305($_bo_AutoFind)
	C_TEXT:C284($_t_oldMethodName; $_t_SetName; $1; $2)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Accounts_Mod")
$_bo_AutoFind:=False:C215
$_t_SetName:=""

If (Count parameters:C259>=2)
	$_bo_AutoFind:=($2="TRUE")
	CREATE EMPTY SET:C140([ACCOUNTS:32]; "AccFound")
	QUERY:C277([ACCOUNTS:32]; [ACCOUNTS:32]Account_Code:2=$1)
	If (Records in selection:C76([ACCOUNTS:32])>0)
		CREATE SET:C116([ACCOUNTS:32]; "AccFound")
		
	End if 
	$_t_SetName:="AccFound"
End if 

Minor_Mod(->[ACCOUNTS:32]; "Accounts"; ""; ""; $_t_SetName; $_bo_AutoFind)
ERR_MethodTrackerReturn("Accounts_Mod"; $_t_oldMethodName)
