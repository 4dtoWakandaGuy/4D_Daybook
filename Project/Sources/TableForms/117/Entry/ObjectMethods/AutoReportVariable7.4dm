If (False:C215)
	//object Name: [EW_ExportProjects]Entry.AutoReportVariable7
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
	C_LONGINT:C283(cEmail)
	C_TEXT:C284(<>EMAIL_t_DefaultSMTPhost; <>PER_t_CurrentEmailFrom; $_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [EW_ExportProjects].Entry.AutoReportVariable7"; Form event code:C388)
Case of 
	: (cEmail=0)
		// OK
	: (<>EMAIL_t_DefaultSMTPhost="")
		//  ALERT("Please set up your SMTP server in email defaults in the Preferences scr
		Gen_Alert("Please set up your SMTP server in email defaults in the Preferences screen.")
		cEmail:=0
	: (cEmail=1) & (<>PER_t_CurrentEmailFrom="")  // no default email address has been set up
		//    ALERT("Please set up your email defaults in Preferences")
		Gen_Alert("Please set up your email defaults in Preferences.")
		cEmail:=0
	Else 
		EW_ErrorReportFlags
End case 
ERR_MethodTrackerReturn("OBJ [EW_ExportProjects].Entry.AutoReportVariable7"; $_t_oldMethodName)
