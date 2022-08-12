If (False:C215)
	//Table Form Method Name: [WEBSETUP_4D]WebTest_d
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
	C_LONGINT:C283(GET_l_Button1)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("FM [WEBSETUP_4D].WebTest_d"; Form event code:C388)
ERR_MethodTrackerReturn("FM [WEBSETUP_4D].WebTest_d"; $_t_oldMethodName)
