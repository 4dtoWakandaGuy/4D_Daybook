//%attributes = {}
If (False:C215)
	//Project Method Name:      DBWS_AlterUserPreference
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 18/10/2012 13:08
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName; DBWS_T_incomingParam)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DBWS_AlterUserPreference")

//TRACE

If (DBWS_T_incomingParam#"")
	Case of 
		: (DBWS_T_incomingParam="toggledefaultentryoption")
			
		: (DBWS_T_incomingParam="toggledefaultentryoption")
		: (DBWS_T_incomingParam="toggledefaultentryoption")
		: (DBWS_T_incomingParam="toggledefaultentryoption")
	End case 
	
End if 
ERR_MethodTrackerReturn("DBWS_AlterUserPreference"; $_t_oldMethodName)