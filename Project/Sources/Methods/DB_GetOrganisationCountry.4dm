//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_GetOrganisationCountry
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 09/09/2012 15:44
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(DB_bo_ConfigInited)
	C_LONGINT:C283(<>PER_l_CurLoggedinDataOwnerID; DB_l_CurrentOwnerRequest)
	C_TEXT:C284($_t_oldMethodName; $0; DM_T_UserCountry)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DB_GetOrganisationCountry")

If (<>PER_l_CurLoggedinDataOwnerID>0) | (DB_l_CurrentOwnerRequest>0)
	If (Not:C34(DB_bo_ConfigInited))
		DB_LoadConfigurationPrefs
		If (Application type:C494#4D Server:K5:6)
			DB_bo_ConfigInited:=True:C214
		End if 
	End if 
	$0:=DM_T_UserCountry
	
Else 
	ALL RECORDS:C47([USER:15])
	$0:=[USER:15]Country:7
	
End if 
ERR_MethodTrackerReturn("DB_GetOrganisationCountry"; $_t_oldMethodName)