//%attributes = {}
If (False:C215)
	//Project Method Name:      DC_SetConfigurationPage
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45:40If (False)// ----------------------------------------------------
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

$_t_oldMethodName:=ERR_MethodTracker("DC_SetConfigurationPage")
Case of 
	: ([EW_ExportProjects:117]RecordNumber:2=1)
		FORM GOTO PAGE:C247(2)
End case 
ERR_MethodTrackerReturn("DC_SetConfigurationPage"; $_t_oldMethodName)