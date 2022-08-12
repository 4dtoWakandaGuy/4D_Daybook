
If (False:C215)
	//Object Name:      DB_minisearch.oSearchValueFalse
	//------------------ Script Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  24/09/2019
	//Created BY:  DefaultUser
	
	//Date Modified: 
	//Modified By: DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(SD2_l_False; SD2_l_TRUE)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("OBJ [projectForm]/DB_minisearch/oSearchValueFalse"; Form event code:C388)
Case of 
	: (Form event code:C388=On Clicked:K2:4)
		If (SD2_l_False=1)
			SD2_l_TRUE:=0
		Else 
			SD2_l_True:=1
		End if 
End case 
ERR_MethodTrackerReturn("OBJ [projectForm]/DB_minisearch/oSearchValueFalse"; $_t_oldMethodName)
