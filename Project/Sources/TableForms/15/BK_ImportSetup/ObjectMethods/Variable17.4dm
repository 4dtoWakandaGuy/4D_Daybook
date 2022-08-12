If (False:C215)
	//object Name: [USER]BK_ImportSetup.Variable17
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:12
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(DM_bo_CModified)
	C_LONGINT:C283(DB_l_BKSettingsID; DM_l_CSave)
	C_TEXT:C284($_t_oldMethodName; DM_t_BkConnectionName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].BK_ImportSetup.Variable17"; Form event code:C388)
DM_l_CSave:=0
If (DM_bo_CModified)
	If (DM_t_BkConnectionName#"")
		If (DB_l_BKSettingsID>0)
			Gen_Confirm("Update Connection settings for "+DM_t_BkConnectionName; "No"; "Yes")
		Else 
			Gen_Confirm("Create Connection settings for "+DM_t_BkConnectionName; "No"; "Yes")
		End if 
		If (OK=0)
			DM_l_CSave:=1
			CANCEL:C270
		Else 
			CANCEL:C270
		End if 
		
	Else 
		Gen_Alert("You must give this connection a name")
	End if 
Else 
	CANCEL:C270
End if 
ERR_MethodTrackerReturn("OBJ [USER].BK_ImportSetup.Variable17"; $_t_oldMethodName)
