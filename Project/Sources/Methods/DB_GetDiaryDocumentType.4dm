//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_GetDiaryDocumentType
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/09/2012 10:44
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName; $0)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DB_GetDiaryDocumentType")
If ([DIARY:12]Document_Code:15#"")
	If ([DOCUMENTS:7]Document_Code:1#[DIARY:12]Document_Code:15)
		QUERY:C277([DOCUMENTS:7]; [DOCUMENTS:7]Document_Code:1=[DIARY:12]Document_Code:15)
	End if 
	$0:=[DOCUMENTS:7]DOC_TYPE:18
End if 
ERR_MethodTrackerReturn("DB_GetDiaryDocumentType"; $_t_oldMethodName)