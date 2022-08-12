//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_REP_ExportReport
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 09/01/2012 10:48
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(DB_l_ReportType; DBQR_l_EDITORAREA)
	C_TEXT:C284($_t_oldMethodName)
	C_TIME:C306($_ti_DocumentRef)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DB_REP_ExportReport")

Case of 
	: (DB_l_ReportType=SuperWrite Report Template)
		QR SET DESTINATION:C745(DBQR_l_EDITORAREA; qr text file:K14903:2; "")
		QR RUN:C746(DBQR_l_EDITORAREA)
		
		
	Else 
		$_ti_DocumentRef:=Create document:C266(""; "TEXT")
		CLOSE DOCUMENT:C267($_ti_DocumentRef)
		
		
		
End case 
ERR_MethodTrackerReturn("DB_REP_ExportReport"; $_t_oldMethodName)