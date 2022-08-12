If (False:C215)
	//object Name: [USER]User_In.Variable43
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/11/2009 18:16
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//Array Text(EMail_at_DocEmailTo;0)
	//Array Text(REP_at_DocReportTo;0)
	C_TEXT:C284($_t_oldMethodName; email_t_Role; EMAIL_t_DocEmailRoletoText; Rep_t_docEmailToTxt)
End if 

//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].User_In.Variable43"; Form event code:C388)
Rep_t_docEmailToTxt:=EMail_at_DocEmailTo{EMail_at_DocEmailTo}
EMAIL_t_DocEmailRoletoText:=email_t_Role
Reports_PrefsSave(REP_at_DocReportTo{REP_at_DocReportTo})
ERR_MethodTrackerReturn("OBJ [USER].User_In.Variable43"; $_t_oldMethodName)