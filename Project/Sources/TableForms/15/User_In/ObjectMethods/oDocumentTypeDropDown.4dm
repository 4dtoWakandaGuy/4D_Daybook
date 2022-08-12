If (False:C215)
	//object Name: [USER]User_In.p_s80_Doc_aDocumentType
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/11/2009 22:02
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


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].User_In.p_s80_Doc_aDocumentType"; Form event code:C388)

Case of 
	: ((Form event code:C388=On Data Change:K2:15) | (Form event code:C388=On Clicked:K2:4))
		
		//NOTE -kmw - as at 17/11/08 v631b120i -There is a limitation in functionality in that changes to reprots are saved even if user cancels out of prefernces - needs to be dealt with at some stage.
		
		
		
		
		Doc_currentPrefsToArrays
		Doc_currentPrefsLoad
		UserIn13_document_setInterface
		
		//ReportsIn_PrefsLoadNEW (DOC_t_CurrentDocType;"REPORT")  `Added 14/11/08 v631b120i -kmw
		
		//ReportsIn_PrefsSetVisibility   `Added 14/11/08 v631b120i -kmw
		
		
	Else 
End case 
//</code>

//<return>
//$0 :=
//</return>
ERR_MethodTrackerReturn("OBJ [USER].User_In.p_s80_Doc_aDocumentType"; $_t_oldMethodName)
