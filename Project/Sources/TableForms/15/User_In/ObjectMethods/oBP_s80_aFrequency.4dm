If (False:C215)
	//object Name: [USER]User_In.oBP_s80_aFrequency
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


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].User_In.oBP_s80_aFrequency"; Form event code:C388)
Case of 
	: (Form event code:C388=On Clicked:K2:4)
		BP_UpdateBackupSettings
End case 
ERR_MethodTrackerReturn("OBJ [USER].User_In.oBP_s80_aFrequency"; $_t_oldMethodName)
