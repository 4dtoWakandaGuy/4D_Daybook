If (False:C215)
	//object Name: [USER]User_In.email_t_Role
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
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].User_In.email_t_Role"; Form event code:C388)
//If (Form event=On Data Change )
//Reports_PrefsSave (REP_at_DocReportTo{REP_at_DocReportTo})
//End if
ERR_MethodTrackerReturn("OBJ [USER].User_In.email_t_Role"; $_t_oldMethodName)