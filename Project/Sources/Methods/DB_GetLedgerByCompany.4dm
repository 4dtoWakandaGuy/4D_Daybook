//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_GetLedgerByCompany
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 07/09/2012 08:24
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($0; DB_bo_LedgerInited; DM_bo_nomPostbyCompany)
	C_LONGINT:C283(<>PER_l_CurLoggedinDataOwnerID; DB_l_CurrentOwnerRequest)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DB_GetLedgerByCompany")

If (<>PER_l_CurLoggedinDataOwnerID>0) | (DB_l_CurrentOwnerRequest>0)
	If (Not:C34(DB_bo_LedgerInited))
		DB_LoadLedgerPreferences
		If (Application type:C494#4D Server:K5:6)
			DB_bo_LedgerInited:=True:C214
		End if 
	End if 
	$0:=DM_bo_nomPostbyCompany
Else 
	ALL RECORDS:C47([USER:15])
	$0:=[USER:15]PayRec ByCo:205
End if 
ERR_MethodTrackerReturn("DB_GetLedgerByCompany"; $_t_oldMethodName)