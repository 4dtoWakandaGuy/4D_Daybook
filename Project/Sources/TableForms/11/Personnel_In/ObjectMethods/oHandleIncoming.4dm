
If (False:C215)
	//Object Name:      [PERSONNEL].Personnel_In.oHandleIncoming
	//------------------ Script Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  28/10/2019
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
$_t_oldMethodName:=ERR_MethodTracker("OBJ [PERSONNEL]Personnel_In.oHandleIncoming"; Form event code:C388)
Case of 
	: (Form event code:C388=On Clicked:K2:4)
		
		FORM GOTO PAGE:C247(13)
End case 
ERR_MethodTrackerReturn("OBJ [PERSONNEL]Personnel_In.oHandleIncoming"; $_t_oldMethodName)
