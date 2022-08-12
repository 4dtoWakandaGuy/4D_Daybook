
If (False:C215)
	//Object Name:      [COMPANIES].Company_In.oFurthFieldComments
	//------------------ Script Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  05/03/2019
	//Created BY:  Unknown
	
	//Date Modified: 
	//Modified By: DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("OBJ [COMPANIES]Company_In.oFurthFieldComments"; Form event code:C388)
Case of 
	: (Form event code:C388=On Data Change:K2:15)
		
		SAVE RECORD:C53([CUSTOM_FIELDS:98])
End case 
ERR_MethodTrackerReturn("OBJ [COMPANIES]Company_In.oFurthFieldComments"; $_t_oldMethodName)
