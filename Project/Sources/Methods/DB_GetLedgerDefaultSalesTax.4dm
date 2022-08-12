//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_GetLedgerDefaultSalesTax
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 05/09/2012 15:58
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(DB_bo_LedgerInited)
	C_LONGINT:C283(<>PER_l_CurLoggedinDataOwnerID; DB_l_CurrentOwnerRequest)
	C_TEXT:C284($_t_oldMethodName; $0; DM_T_NomDefaultSalesTax)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DB_GetLedgerDefaultSalesTax")

If (<>PER_l_CurLoggedinDataOwnerID>0) | (DB_l_CurrentOwnerRequest>0)
	If (Not:C34(DB_bo_LedgerInited))
		DB_LoadLedgerPreferences
		If (Application type:C494#4D Server:K5:6)
			DB_bo_LedgerInited:=True:C214
		End if 
	End if 
	$0:=DM_T_NomDefaultSalesTax
	If (DM_T_NomDefaultSalesTax="")
		$0:="S"
	End if 
	
Else 
	ALL RECORDS:C47([USER:15])
	$0:=[USER:15]Def VAT Code:91
	If ([USER:15]Def VAT Code:91="")
		$0:="S"
	End if 
End if 
ERR_MethodTrackerReturn("DB_GetLedgerDefaultSalesTax"; $_t_oldMethodName)