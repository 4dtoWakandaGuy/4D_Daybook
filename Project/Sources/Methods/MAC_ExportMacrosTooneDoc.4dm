//%attributes = {}
If (False:C215)
	//Project Method Name:      MAC_ExportMacrosTooneDoc
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 13/06/2012 09:30
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_Index)
	C_TEXT:C284($_t_oldMethodName)
	C_TIME:C306($_ti_DocumentRef)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("MAC_ExportMacrosTooneDoc")
$_ti_DocumentRef:=Create document:C266(""; "TEXT")
ALL RECORDS:C47([SCRIPTS:80])
For ($_l_Index; 1; Records in selection:C76([SCRIPTS:80]))
	SEND PACKET:C103($_ti_DocumentRef; [SCRIPTS:80]Recording_Text:4)
	SEND PACKET:C103($_ti_DocumentRef; Char:C90(13))
	NEXT RECORD:C51([SCRIPTS:80])
End for 
CLOSE DOCUMENT:C267($_ti_DocumentRef)
ALERT:C41("DONE")
ERR_MethodTrackerReturn("MAC_ExportMacrosTooneDoc"; $_t_oldMethodName)
