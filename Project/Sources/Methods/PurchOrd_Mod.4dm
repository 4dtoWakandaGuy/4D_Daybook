//%attributes = {}
If (False:C215)
	//Project Method Name:      PurchOrd_Mod
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
	C_BOOLEAN:C305($_bo_AutoFind)
	C_LONGINT:C283(vPu)
	C_TEXT:C284($_t_oldMethodName; $_t_PurchOrderCodeFind; $1; $2)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("PurchOrd_Mod")

If (Count parameters:C259>=2)
	$_bo_AutoFind:=($2="TRUE")
	$_t_PurchOrderCodeFind:=$1
End if 
Gen_Mod("View Purchase Orders"; "PurchOrd_File"; "PMaster"; ->[PURCHASE_ORDERS:57]; ->vPu; "PurchOrd_Sel"; " Purchase Orders"; $_bo_AutoFind; $_t_PurchOrderCodeFind)

Orders_Unload
ERR_MethodTrackerReturn("PurchOrd_Mod"; $_t_oldMethodName)
