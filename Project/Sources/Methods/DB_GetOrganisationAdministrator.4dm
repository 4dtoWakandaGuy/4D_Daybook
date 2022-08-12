//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_GetOrganisationAdministrator
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 10/09/2012 17:36
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(DB_bo_ConfigInited)
	C_LONGINT:C283(<>PER_l_CurLoggedinDataOwnerID; DB_l_CurrentOwnerRequest)
	C_TEXT:C284($_t_oldMethodName; $0; DM_T_AdminName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DB_GetOrganisationAdministrator")


If (<>PER_l_CurLoggedinDataOwnerID>0) | (DB_l_CurrentOwnerRequest>0)
	If (Not:C34(DB_bo_ConfigInited))
		DB_LoadConfigurationPrefs
		If (Application type:C494#4D Server:K5:6)
			DB_bo_ConfigInited:=True:C214
		End if 
		
	End if 
	$0:=DM_T_AdminName
	
Else 
	ALL RECORDS:C47([USER:15])
	$0:=[USER:15]Name:38
End if 
ERR_MethodTrackerReturn("DB_GetOrganisationAdministrator"; $_t_oldMethodName)