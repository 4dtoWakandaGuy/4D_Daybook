//%attributes = {}
If (False:C215)
	//Project Method Name:      DATAAUDITEXPORT
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 05/07/2013 10:33
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_Index)
	C_TEXT:C284($_t_DocText; $_t_oldMethodName; $_t_TableNumberSTR)
	C_TIME:C306($_ti_DocumentRef)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DATAAUDITEXPORT")
Gen_RequestAmount
$_t_TableNumberSTR:=Gen_Request("Enter Table"; "")
QUERY:C277([DATA_AUDITS:102]; [DATA_AUDITS:102]TABLE_NUMBER:2=Num:C11($_t_TableNumberSTR))
ORDER BY:C49([DATA_AUDITS:102]; [DATA_AUDITS:102]START_DATE:3; >)
$_ti_DocumentRef:=Create document:C266(""; "TEXT")
For ($_l_Index; 1; Records in selection:C76([DATA_AUDITS:102]))
	EXPAND BLOB:C535([DATA_AUDITS:102]DATA:6)
	$_t_DocText:=BLOB to text:C555([DATA_AUDITS:102]DATA:6; 3)
	SEND PACKET:C103($_ti_DocumentRef; $_t_DocText+Char:C90(13))
	NEXT RECORD:C51([DATA_AUDITS:102])
End for 
ERR_MethodTrackerReturn("DATAAUDITEXPORT"; $_t_oldMethodName)