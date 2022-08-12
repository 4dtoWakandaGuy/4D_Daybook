//%attributes = {}
If (False:C215)
	//Project Method Name:      AUDITLOGGING
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 26/01/2010 11:58
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>SYS_bo_AuditLogging)
	C_LONGINT:C283($_l_PathLength; $_l_Retries)
	C_TEXT:C284(<>SYS_t_AuditLogText; Folder separator:K24:12; $_t_DocumentPathName; $_t_oldMethodName; $_t_PathName)
	C_TIME:C306($_ti_DocumentRef)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("AUDITLOGGING")
// AuditLogging
// added 13/05/02 pb

//TRACE
<>SYS_bo_AuditLogging:=False:C215  // BSW 24/07/02 for debugging -- will create a log entry
//             every time a transaction starts or stops when set to True
//             and when users log on/off
//               13/05/02 pb

If (<>SYS_bo_AuditLogging)
	//TRACE
	$_t_PathName:=Data file:C490(1)
	//Folder separator:=DB_DirSymbol 
	$_l_PathLength:=Length:C16($_t_PathName)
	While ($_t_PathName[[$_l_PathLength]]#Folder separator:K24:12)
		$_l_PathLength:=$_l_PathLength-1
	End while 
	$_t_PathName:=Substring:C12($_t_PathName; 1; $_l_PathLength)
	$_t_DocumentPathName:=$_t_PathName+"AuditLog.txt"
	$_t_DocumentPathName:=DocumentNamecreate($_t_DocumentPathName)
	
	
	$_ti_DocumentRef:=DB_CreateDocument($_t_DocumentPathName)
	CLOSE DOCUMENT:C267($_ti_DocumentRef)
	$_l_Retries:=0
	While (True:C214)
		IDLE:C311  // 7/04/03 pb
		If (<>SYS_t_AuditLogText#"")  // it will get poked from a client or from a server process
			If (Test path name:C476($_t_DocumentPathName)#Is a document:K24:1)  // in case the log file was deleted or something
				$_t_DocumentPathName:=$_t_PathName+"AuditLog.txt"
				$_t_DocumentPathName:=DocumentNamecreate($_t_DocumentPathName)
				
				$_ti_DocumentRef:=DB_CreateDocument($_t_DocumentPathName)
			Else 
				$_ti_DocumentRef:=Append document:C265($_t_DocumentPathName)
			End if 
			SEND PACKET:C103($_ti_DocumentRef; <>SYS_t_AuditLogText)
			CLOSE DOCUMENT:C267($_ti_DocumentRef)
			<>SYS_t_AuditLogText:=""
		End if 
		$_l_Retries:=$_l_Retries+1
		DelayTicks(2*(1+$_l_Retries))
	End while 
End if 
ERR_MethodTrackerReturn("AUDITLOGGING"; $_t_oldMethodName)
