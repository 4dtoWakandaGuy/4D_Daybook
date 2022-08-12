//%attributes = {}
If (False:C215)
	//Project Method Name:      DOC_GetDocumentClass
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:     03/06/2010 19:07
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(WS_at_DocumentTemplateClasses;0)
	C_TEXT:C284($_t_oldMethodName; $0)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DOC_GetDocumentClass")
ARRAY TEXT:C222(WS_at_DocumentTemplateClasses; 3)
WS_at_DocumentTemplateClasses{1}:="Letter Template"
WS_at_DocumentTemplateClasses{2}:="Report Template"
WS_at_DocumentTemplateClasses{3}:="eMail Template"

If ([DOCUMENTS:7]Document_Code:1#[DIARY:12]Document_Code:15) & ([DIARY:12]Document_Code:15#"")
	
	BEEP:C151
	QUERY:C277([DOCUMENTS:7]; [DOCUMENTS:7]Document_Code:1=[DIARY:12]Document_Code:15)
End if 
Case of 
	: ([DOCUMENTS:7]Document_Class:14=4D Write Letter Template) | ([DOCUMENTS:7]Document_Class:14=4D Write Letter)
		$0:=Get localized string:C991("DocumentStrings_LetterTemplate")
	: ([DOCUMENTS:7]Document_Class:14=Text Email Template) | ([DOCUMENTS:7]Document_Class:14=Text Email)
		$0:=Get localized string:C991("DocumentStrings_EmailTemplate")
		
	: ([DOCUMENTS:7]Document_Class:14=SuperReportReport Template)
		$0:="SuperReport"
	Else 
		$0:="Document: "+([DOCUMENTS:7]Document_Code:1)
		
		
		//""
		
End case 
ERR_MethodTrackerReturn("DOC_GetDocumentClass"; $_t_oldMethodName)