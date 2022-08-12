If (False:C215)
	//object Name: [COMPANIES]Company_In.Variable42
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:06
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


$_t_oldMethodName:=ERR_MethodTracker("OBJ [COMPANIES].Company_In.Variable42"; Form event code:C388)
Case of 
	: (Form event code:C388=On Clicked:K2:4)
		OPEN URL:C673([COMPANIES:2]Home_Page_URL:56)
End case 
ERR_MethodTrackerReturn("OBJ [COMPANIES].Company_In.Variable42"; $_t_oldMethodName)
