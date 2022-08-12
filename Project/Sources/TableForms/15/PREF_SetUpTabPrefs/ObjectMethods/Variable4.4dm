If (False:C215)
	//object Name: [USER]PREF_SetUpTabPrefs.Variable4
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:46
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(SP_al_PersonnelIDs;0)
	//ARRAY TEXT(SP_at_PersonnelNames;0)
	C_LONGINT:C283(PREF_l_GroupID; PREF_l_PersonelID)
	C_TEXT:C284($_t_oldMethodName; PREF_t_AdHocName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].PREF_SetUpTabPrefs.Variable4"; Form event code:C388)
If (SP_at_PersonnelNames>0)
	PREF_t_AdHocName:=SP_at_PersonnelNames{SP_at_PersonnelNames}
	PREF_l_PersonelID:=SP_al_PersonnelIDs{SP_at_PersonnelNames}
	PREF_l_GroupID:=0
End if 
ERR_MethodTrackerReturn("OBJ [USER].PREF_SetUpTabPrefs.Variable4"; $_t_oldMethodName)
