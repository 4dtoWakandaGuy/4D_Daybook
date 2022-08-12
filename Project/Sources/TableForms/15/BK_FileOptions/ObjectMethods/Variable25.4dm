If (False:C215)
	//object Name: [USER]BK_FileOptions.Variable25
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
	C_BOOLEAN:C305(DM_Bo_Modified)
	C_LONGINT:C283($_l_event; DM_l_DataOptions; DM_l_Save)
	C_TEXT:C284($_t_oldMethodName; DM_t_SettingsName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].BK_FileOptions.Variable25"; Form event code:C388)
$_l_event:=Form event code:C388
DM_l_Save:=0
Case of 
	: ($_l_event=On Clicked:K2:4)
		If (DM_Bo_Modified)
			//the record is modified
			If (DM_t_SettingsName="")
				Gen_Alert("You must give these settings a name")
			Else 
				If (DM_l_DataOptions>0)
					Gen_Confirm("Save Updated "+DM_t_SettingsName; "No"; "Yes")
				Else 
					Gen_Confirm("Create new settings "+DM_t_SettingsName; "No"; "Yes")
				End if 
				If (OK=0)
					DM_l_Save:=1
					CANCEL:C270
				Else 
					CANCEL:C270
				End if 
				
			End if 
			
		Else 
			CANCEL:C270
			
		End if 
End case 
ERR_MethodTrackerReturn("OBJ [USER].BK_FileOptions.Variable25"; $_t_oldMethodName)
