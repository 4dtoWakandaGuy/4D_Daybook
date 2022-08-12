//%attributes = {}
If (False:C215)
	//Project Method Name:      EW_ErrorReportFlags
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45:41If (False)// ----------------------------------------------------
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(cDiary; cEmail; cSMS; s1; s2; s3)
	C_TEXT:C284($_t_ErrorCode; $_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("EW_ErrorReportFlags")
// EW_ErrorReportFlags
// 11/09/02 pb
// Creates a 4-char flag: 0=off, 1=on
// char 1: 0 =No error reporting
//             1 = report errors
//             2 = report errors and succeses
// Char 2: Send email
// char 3: Send SMS
// char 4: create diary item

$_t_ErrorCode:="0000"
Case of 
	: (s1=1)  // no error reporting
		$_t_ErrorCode[[1]]:="0"
	: (s2=1)  // report errors
		$_t_ErrorCode[[1]]:="1"
	: (s3=1)  // report errors and successes
		$_t_ErrorCode[[1]]:="2"
End case 

If ($_t_ErrorCode[[1]]#"0")
	// If (cEmail=1)
	$_t_ErrorCode[[2]]:=String:C10(cEmail)
	// End if
	// If (cSMS=1)
	$_t_ErrorCode[[3]]:=String:C10(cSMS)
	// End if
	// If (cDiary=1)
	$_t_ErrorCode[[4]]:=String:C10(cDiary)
	//  End if
End if 
[EW_ExportProjects:117]ErrorReportHandling:21:=$_t_ErrorCode
ERR_MethodTrackerReturn("EW_ErrorReportFlags"; $_t_oldMethodName)