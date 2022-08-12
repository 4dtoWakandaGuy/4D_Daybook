If (False:C215)
	//object Name: [USER]CompanySelect.oSelectOne
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
	//ARRAY TEXT(SD_at_CompanyNames;0)
	C_LONGINT:C283(SD_l_CompanySelected)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].CompanySelect.oSelectOne"; Form event code:C388)
If (SD_at_CompanyNames>0)
	CANCEL:C270
	SD_l_CompanySelected:=1
Else 
	Gen_Alert("You  must highlight the company to select it")
End if 
ERR_MethodTrackerReturn("OBJ [USER].CompanySelect.oSelectOne"; $_t_oldMethodName)
