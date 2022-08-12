If (False:C215)
	//object Name: [USER]BK_ServerSetup.Variable6
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
	C_BOOLEAN:C305(DM_Bo_BKedit)
	C_LONGINT:C283(DM_l_BKOK; DM_l_BKServerID; DM_l_BKServerPort)
	C_TEXT:C284($_t_oldMethodName; DM_t_BKServerIP; DM_t_BKServerName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].BK_ServerSetup.Variable6"; Form event code:C388)
//validate the entry
DM_l_BKOK:=0
If (DM_t_BKServerIP#"") & (DM_l_BKServerPort>0) & (DM_t_BKServerName#"")
	If (DM_Bo_BKedit)
		//it has been modified
		If (DM_l_BKServerID>0)
			Gen_Confirm("Update Server Details?"; "No"; "Yes")
		Else 
			Gen_Confirm("Create Server Details?"; "No"; "Yes")
		End if 
		If (OK=0)
			DM_l_BKOK:=2
			CANCEL:C270
		Else 
			If (DM_l_BKServerID>0)
				DM_l_BKOK:=1
			End if 
			CANCEL:C270
		End if 
	Else   //no changes
		CANCEL:C270
		DM_l_BKOK:=1
	End if 
Else 
	Gen_Confirm("Not all details have been entered, cannot save"; "Delete"; "Stop")
	If (OK=0)
		//stop
	Else 
		CANCEL:C270
	End if 
End if 
ERR_MethodTrackerReturn("OBJ [USER].BK_ServerSetup.Variable6"; $_t_oldMethodName)
