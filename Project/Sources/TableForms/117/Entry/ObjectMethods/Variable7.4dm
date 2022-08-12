If (False:C215)
	//object Name: [EW_ExportProjects]Entry.Variable7
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 17/10/2012 14:59
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(yNewStep)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here



$_t_oldMethodName:=ERR_MethodTracker("OBJ [EW_ExportProjects].Entry.Variable7"; Form event code:C388)
If (Form event code:C388=On Clicked:K2:4)
	If (yNewStep)
		Gen_Confirm("Delete the new Export?"; "Yes"; "No")
		If (Ok=1)
			DB_DeletionControl(->[EW_ExportSteps:118])
			
			DELETE RECORD:C58([EW_ExportSteps:118])
			CANCEL:C270
		End if 
	Else 
		CANCEL:C270
	End if 
End if 
ERR_MethodTrackerReturn("OBJ [EW_ExportProjects].Entry.Variable7"; $_t_oldMethodName)
