//%attributes = {}
If (False:C215)
	//Project Method Name:      SR_Update
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 28/06/2014 13:47
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_OK)
	C_LONGINT:C283($_l_Error; $_l_Index)
	C_TEXT:C284($_t_oldMethodName; $_t_XMLText)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SR_Update")
$_bo_OK:=START_RegisterPlugins
If ($_bo_OK)
	QUERY:C277([DOCUMENTS:7]; [DOCUMENTS:7]Document_Code:1="SR@"; *)
	QUERY:C277([DOCUMENTS:7];  | [DOCUMENTS:7]Document_Class:14=SuperReport Email; *)
	QUERY:C277([DOCUMENTS:7];  | [DOCUMENTS:7]Document_Class:14=SuperReport Email Template; *)
	QUERY:C277([DOCUMENTS:7];  | [DOCUMENTS:7]Document_Class:14=SuperReport Letter; *)
	QUERY:C277([DOCUMENTS:7];  | [DOCUMENTS:7]Document_Class:14=SuperReport Letter Template; *)
	QUERY:C277([DOCUMENTS:7];  | [DOCUMENTS:7]Document_Class:14=SuperReport Report; *)
	QUERY:C277([DOCUMENTS:7];  | [DOCUMENTS:7]Document_Class:14=SuperReportReport Template)
	QUERY SELECTION:C341([DOCUMENTS:7]; [DOCUMENTS:7]SR_DOCUMENTXML_:34="")
	
	For ($_l_Index; 1; Records in selection:C76([DOCUMENTS:7]))
		[DOCUMENTS:7]DOC_BLOB:17:=SR Report To BLOB([DOCUMENTS:7]Write_:5)
		//[documents]DOC_BLOB:=
		$_t_XMLText:=""
		$_l_Error:=SR_ConvertReportToXML([DOCUMENTS:7]DOC_BLOB:17; $_t_XMLText; [DOCUMENTS:7]Heading:2; "")
		[DOCUMENTS:7]SR_DOCUMENTXML_:34:=$_t_XMLText
		SAVE RECORD:C53([DOCUMENTS:7])
		NEXT RECORD:C51([DOCUMENTS:7])
		
	End for 
	
	
End if 
ERR_MethodTrackerReturn("SR_Update"; $_t_oldMethodName)
