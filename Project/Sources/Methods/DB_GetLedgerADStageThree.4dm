//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_GetLedgerADStageThree
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 05/09/2012 15:39
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(DB_bo_LedgerInited)
	C_LONGINT:C283(<>PER_l_CurLoggedinDataOwnerID; $0; DB_l_CurrentOwnerRequest; DM_l_NomAgingStage3)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DB_GetLedgerADStageThree")

If (<>PER_l_CurLoggedinDataOwnerID>0) | (DB_l_CurrentOwnerRequest>0)
	If (Not:C34(DB_bo_LedgerInited))
		DB_LoadLedgerPreferences
		If (Application type:C494#4D Server:K5:6)
			DB_bo_LedgerInited:=True:C214
		End if 
	End if 
	$0:=DM_l_NomAgingStage3
Else 
	ALL RECORDS:C47([USER:15])
	$0:=[USER:15]AD 3:36
End if 
ERR_MethodTrackerReturn("DB_GetLedgerADStageThree"; $_t_oldMethodName)