//%attributes = {}
If (False:C215)
	//Project Method Name:      Purchases_Mod
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
	C_TEXT:C284($_t_oldMethodName; $_t_PurchaseCodeFind; $1; $2)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Purchases_Mod")
If (Count parameters:C259>=2)
	$_bo_AutoFind:=($2="TRUE")
	$_t_PurchaseCodeFind:=$1
End if 
Gen_Mod(Term_SLPLWT("View Purchase Ledger"); "Purchases_File"; "Master"; ->[PURCHASE_INVOICES:37]; ->vPu; "Purchases_Sel"; Term_SLPLWT("Purchase Ledger Items"); $_bo_AutoFind; $_t_PurchaseCodeFind)
ERR_MethodTrackerReturn("Purchases_Mod"; $_t_oldMethodName)
