If (False:C215)
	//object Name: [USER]Contact_select.Button1
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:12
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(SD_at_ContactInfo;0)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].Contact_select.Button1"; Form event code:C388)
If (SD_at_ContactInfo>0)
	CANCEL:C270
Else 
	Gen_Alert("You  must highlight the contact to select it!")
End if 
ERR_MethodTrackerReturn("OBJ [USER].Contact_select.Button1"; $_t_oldMethodName)
