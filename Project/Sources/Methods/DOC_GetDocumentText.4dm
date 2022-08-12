//%attributes = {}
If (False:C215)
	//Project Method Name:      DOC_GetDocumentText
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  05/06/2010 12:56
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//C_UNKNOWN($0)
	C_LONGINT:C283($_l_4DWriteOffscreenArea)
	C_TEXT:C284($0; $_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DOC_GetDocumentText")
$0:=""

Case of 
	: ([DOCUMENTS:7]Document_Class:14=4D Write Letter) | ([DOCUMENTS:7]Document_Class:14=4D Write Letter Template)
		$_l_4DWriteOffscreenArea:=WR New offscreen area:P12000:47  //wr new offscreen area
		$0:=WR Get text:P12000:20($_l_4DWriteOffscreenArea; 1; 32000)
		WR DELETE OFFSCREEN AREA:P12000:38($_l_4DWriteOffscreenArea)
End case 
ERR_MethodTrackerReturn("DOC_GetDocumentText"; $_t_oldMethodName)
