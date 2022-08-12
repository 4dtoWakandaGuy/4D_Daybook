If (False:C215)
	//object Name: [SMS_Log]SMSLog_Out.3D Button3
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


$_t_oldMethodName:=ERR_MethodTracker("OBJ [SMS_Log].SMSLog_Out.3D Button3"; Form event code:C388)
WT_SORT_TABLE_3(->[SMS_Log:124]; "Text6"; ->[SMS_Log:124]CreditsUsed:5)
ERR_MethodTrackerReturn("OBJ [SMS_Log].SMSLog_Out.3D Button3"; $_t_oldMethodName)