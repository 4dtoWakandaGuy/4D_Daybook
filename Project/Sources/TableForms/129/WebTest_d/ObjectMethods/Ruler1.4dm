If (False:C215)
	//object Name: [WEBSETUP_4D]WebTest_d.Ruler1
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
	C_LONGINT:C283(<>IWS_l_TestClients)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [WEBSETUP_4D].WebTest_d.Ruler1"; Form event code:C388)
<>IWS_l_TestClients:=Self:C308->
ERR_MethodTrackerReturn("OBJ [WEBSETUP_4D].WebTest_d.Ruler1"; $_t_oldMethodName)