If (False:C215)
	//object Name: [USER]User_In.SR_btnSetPDFEncryption1
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 07/09/2011 12:54
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


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].User_In.SR_btnSetPDFEncryption1"; Form event code:C388)

//Added 13/11/08 v631b120g -kmw

PDF_EncrpytEditPrefs
ERR_MethodTrackerReturn("OBJ [USER].User_In.SR_btnSetPDFEncryption1"; $_t_oldMethodName)
