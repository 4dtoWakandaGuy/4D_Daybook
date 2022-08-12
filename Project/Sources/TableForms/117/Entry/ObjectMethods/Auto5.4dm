If (False:C215)
	//object Name: [EW_ExportProjects]Entry.Auto5
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


$_t_oldMethodName:=ERR_MethodTracker("OBJ [EW_ExportProjects].Entry.Auto5"; Form event code:C388)
If (Form event code:C388=On Data Change:K2:15)
	Case of 
		: ([EW_ExportProjects:117]NextRunDate:6=!00-00-00!)
			//     ALERT("The Next Run Date cannot be blank!")
			Gen_Alert("The Next Run Date cannot be blank!")
			[EW_ExportProjects:117]NextRunDate:6:=Current date:C33(*)
	End case 
End if 
ERR_MethodTrackerReturn("OBJ [EW_ExportProjects].Entry.Auto5"; $_t_oldMethodName)
