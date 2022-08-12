If (False:C215)
	//object Name: [USER]CCM_Prefs.Variable7
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
	C_TEXT:C284($_t_oldMethodName; CCM_t_WebLink)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].CCM_Prefs.Variable7"; Form event code:C388)
Case of 
	: (Form event code:C388=On Clicked:K2:4)
		If (CCM_t_WebLink#"")
			OPEN URL:C673(CCM_t_WebLink)
		End if 
		
End case 
ERR_MethodTrackerReturn("OBJ [USER].CCM_Prefs.Variable7"; $_t_oldMethodName)
