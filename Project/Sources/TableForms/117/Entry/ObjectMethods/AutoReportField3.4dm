If (False:C215)
	//object Name: [EW_ExportProjects]Entry.AutoReportField3
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


$_t_oldMethodName:=ERR_MethodTracker("OBJ [EW_ExportProjects].Entry.AutoReportField3"; Form event code:C388)
[EW_ExportProjects:117]ErrorReportMobileNumber:19:=SMS_IntlPhoneNumber(->[EW_ExportProjects:117]ErrorReportMobileNumber:19)
ERR_MethodTrackerReturn("OBJ [EW_ExportProjects].Entry.AutoReportField3"; $_t_oldMethodName)