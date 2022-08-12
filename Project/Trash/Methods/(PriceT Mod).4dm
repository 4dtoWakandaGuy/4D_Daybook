//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      PriceT Mod
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
	C_LONGINT:C283(vP)
	C_TEXT:C284($_t_oldMethodName; $_t_PriceCodeFind; $1; $2; $3)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("PriceT Mod")
If (Count parameters:C259>=2)
	$_bo_AutoFind:=($2="TRUE")
	$_t_PriceCodeFind:=$1
End if 
Gen_Mod("View Price Table"; "PriceT_File"; "Master"; ->[PRICE_TABLE:28]; ->vP; "PriceT_Sel"; "Price Table Entries"; $_bo_AutoFind; $_t_PriceCodeFind)
ERR_MethodTrackerReturn("PriceT Mod"; $_t_oldMethodName)
