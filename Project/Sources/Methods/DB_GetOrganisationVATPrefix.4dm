//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_GetOrganisationVATPrefix
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 04/09/2012 16:11
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(DB_bo_ConfigInited)
	C_LONGINT:C283(<>PER_l_CurLoggedinDataOwnerID; DB_l_CurrentOwnerRequest)
	C_TEXT:C284($_t_oldMethodName; $0; DM_T_UservatPrefix)
End if 

//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("DB_GetOrganisationVATPrefix")
If (<>PER_l_CurLoggedinDataOwnerID>0) | (DB_l_CurrentOwnerRequest>0)
	If (Not:C34(DB_bo_ConfigInited))
		DB_LoadConfigurationPrefs
		If (Application type:C494#4D Server:K5:6)
			DB_bo_ConfigInited:=True:C214
		End if 
	End if 
	$0:=DM_T_UservatPrefix
	If (DM_T_UservatPrefix="")
		DM_T_UservatPrefix:="GB"
	End if 
Else 
	//TRACE
	
	ALL RECORDS:C47([USER:15])
	$0:=[USER:15]VAT Reg No:11
	If ([USER:15]VAT Reg No:11="")
		$0:="GB"
	End if 
End if 
ERR_MethodTrackerReturn("DB_GetOrganisationVATPrefix"; $_t_oldMethodName)