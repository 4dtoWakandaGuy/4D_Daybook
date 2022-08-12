
If (False:C215)
	//Object Name:      DB_minisearch.oButtonFind
	//------------------ Script Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  18/09/2019
	//Created BY:  DefaultUser
	
	//Date Modified: 
	//Modified By: DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName; SD2_t_SearchValue2)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("OBJ [projectForm]/DB_minisearch/obuttonCancel"; Form event code:C388)
Case of 
	: (Form event code:C388=On Clicked:K2:4)
		CANCEL:C270
		SD2_t_SearchValue2:=""
End case 
ERR_MethodTrackerReturn("OBJ [projectForm]/DB_minisearch/obuttonCancel"; $_t_oldMethodName)
