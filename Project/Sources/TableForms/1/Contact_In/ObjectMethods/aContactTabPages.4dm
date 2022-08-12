If (False:C215)
	//object Name: [CONTACTS]Contact_In.aContactTab1
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:04
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

$_t_oldMethodName:=ERR_MethodTracker("OBJ [CONTACTS].Contact_In.aContactTab1")





//SCTRIPT aComanyTab


DB_ContactTab
ERR_MethodTrackerReturn("OBJ:Company_In,COM_at_CompanyTab"; $_t_oldMethodName)
