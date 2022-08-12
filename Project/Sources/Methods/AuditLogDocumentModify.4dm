//%attributes = {}
If (False:C215)
	//Project Method Name:      AuditLogDocumentModify
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 03/12/2010 09:30
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>SYS_bo_AuditLogging; $_bo_AuditLogging)
	C_LONGINT:C283($_l_MaxTimeout; $_l_ProcessState; $_l_ProcessTime; $_l_Timeout)
	C_TEXT:C284(<>SYS_t_AuditLogText; $_t_LogText; $_t_oldMethodName; $_t_ProcessName; $1)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("AuditLogDocumentModify")
// AuditLogDocumentModify
// Flags the AuditLogging process on the server
// to add an entry to the detailed log of transactions etc.
// 13/05/02 pb

// parameters: $1=the text to add to the log

If (False:C215)  //25/0702 pb/bsw donot need it at the moment
	
	//$_l_MaxTimeout:=(60/5)*10
	$_l_MaxTimeout:=60*10
	$_t_LogText:=""
	If (Application type:C494=4D Server:K5:6)
		While (<>SYS_t_AuditLogText#"")
			DelayTicks(2)
		End while 
		<>SYS_t_AuditLogText:=$1
	Else 
		GET PROCESS VARIABLE:C371(-1; <>SYS_bo_AuditLogging; $_bo_AuditLogging)
		If ($_bo_AuditLogging)
			GET PROCESS VARIABLE:C371(-1; <>SYS_t_AuditLogText; $_t_LogText)
			$_l_Timeout:=0
			While (($_t_LogText#"") & ($_l_Timeout<$_l_MaxTimeout))  // wait a max. of 10 seconds
				DelayTicks(5)
				$_l_Timeout:=$_l_Timeout+1
				GET PROCESS VARIABLE:C371(-1; <>SYS_t_AuditLogText; $_t_LogText)  // 20/05/02 pb
			End while 
			If ($_l_Timeout>=$_l_MaxTimeout)
				//  ALERT("There is a problem with the Audit Logging. Please tell the programmers!
				Gen_Alert("There is a problem with the Audit Logging. Please tell the programmers!")
			Else 
				PROCESS PROPERTIES:C336(-1; $_t_ProcessName; $_l_ProcessState; $_l_ProcessTime)  // 30/05/02 pb
				If ($_l_ProcessState>=0)  // 30/05/02 pb
					SET PROCESS VARIABLE:C370(-1; <>SYS_t_AuditLogText; $1)
				End if 
			End if 
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("AuditLogDocumentModify"; $_t_oldMethodName)
