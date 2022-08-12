If (False:C215)
	//object Name: [EW_ExportProjects]Entry.Field1
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
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [EW_ExportProjects].Entry.Field1"; Form event code:C388)
Case of 
	: (Form event code:C388=On Data Change:K2:15)
		If (Self:C308->="")
			//      ALERT("The Project Name can't be blank!")
			Gen_Alert("The Project Name can't be blank!")
			If (Old:C35([EW_ExportProjects:117]ProjectName:1)#"")
				[EW_ExportProjects:117]ProjectName:1:=Old:C35([EW_ExportProjects:117]ProjectName:1)
			End if 
			GOTO OBJECT:C206([EW_ExportProjects:117]ProjectName:1)
		End if 
End case 
ERR_MethodTrackerReturn("OBJ [EW_ExportProjects].Entry.Field1"; $_t_oldMethodName)
