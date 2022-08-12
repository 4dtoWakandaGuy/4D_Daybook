//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_GetLedgerECcreditor
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 06/09/2012 16:23
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(DB_bo_LedgerInited)
	C_LONGINT:C283(<>PER_l_CurLoggedinDataOwnerID; DB_l_CurrentOwnerRequest)
	C_TEXT:C284($_t_oldMethodName; $0; DM_T_nomVatECCreditor)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DB_GetLedgerECcreditor")
//TRACE
If (<>PER_l_CurLoggedinDataOwnerID>0) | (DB_l_CurrentOwnerRequest>0)
	If (Not:C34(DB_bo_LedgerInited))
		DB_LoadLedgerPreferences
		If (Application type:C494#4D Server:K5:6)
			DB_bo_LedgerInited:=True:C214
		End if 
	End if 
	$0:=DM_T_nomVatECCreditor
Else 
	ALL RECORDS:C47([USER:15])
	$0:=[USER:15]VAT EC Creditor:75
End if 
ERR_MethodTrackerReturn("DB_GetLedgerECcreditor"; $_t_oldMethodName)