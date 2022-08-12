
If (False:C215)
	//Object Name:      [ACC_Bank_Statements].ALL_FIELDS2
	//------------------ Script Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  10/12/2019
	//Created BY:  DefaultUser
	
	//Date Modified: 
	//Modified By: DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("FM [ACC_Bank_Statements]ALL_FIELDS2"; Form event code:C388)
Case of 
	: (Form event code:C388=On Clicked:K2:4)
End case 
ERR_MethodTrackerReturn("FM [ACC_Bank_Statements]ALL_FIELDS2"; $_t_oldMethodName)
