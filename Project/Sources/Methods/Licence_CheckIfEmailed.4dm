//%attributes = {}
If (False:C215)
	//Project Method Name:      Licence_CheckIfEmailed
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>Email_bo_Enabled; Lic_bo_Accepted; Lic_bo_NotifiedToUs)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Licence_CheckIfEmailed")
//Licence_CheckIfEmailed
// checks to see if the licence details have been emailed to us
// and if not, tries to do it
// 27/03/03 pb

If (<>Email_bo_Enabled)
	Licence_LoadPrefs
	If (Lic_bo_NotifiedToUs=False:C215) & (Lic_bo_Accepted=True:C214)
		Licence_SendEmail
		If (Lic_bo_NotifiedToUs)
			Licence_SaveVariables
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("Licence_CheckIfEmailed"; $_t_oldMethodName)