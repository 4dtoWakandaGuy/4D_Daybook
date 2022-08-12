//%attributes = {}
If (False:C215)
	//Project Method Name:      SetMachinePDFWriter
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 26/01/2010 11:23
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(<>iOS; $_l_OK; $_l_PathTest; $0)
	C_TEXT:C284(<>PER_t_CurrentUserInitials; $_t_CurrentActiveDirectory2; $_t_DocumentName; $_t_oldMethodName; $1; PDF_t_CURPDriver; PDF_t_CURPName; PDF_t_CURPType; PDF_t_CURPZone)
	C_TIME:C306($_ti_DocumentRef)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SetMachinePDFWriter")
//this method will look for the stored PDF writer details for this machine
//I dont want to put another table of field on
<>iOS:=Int:C8(Num:C11(DB_GetVersionNum(DBGetOSVersion)))
If (<>iOS#10)
	$_l_OK:=PLUGCALL_PDFs("GetPrinter"; ->PDF_t_CURPName; ->PDF_t_CURPType; ->PDF_t_CURPZone; ->PDF_t_CURPDriver)
	$_t_CurrentActiveDirectory2:=Get 4D folder:C485
	$_t_CurrentActiveDirectory2:=PathFromPathName($_t_CurrentActiveDirectory2)
	$_t_DocumentName:=$_t_CurrentActiveDirectory2+"PDFWriter.TXT"
	$_l_PathTest:=Test path name:C476($_t_DocumentName)
	
	If ($_l_PathTest=1)
		If (Gen_Option) & (Gen_Control)  //reset
			Repeat 
				// ALERT("Please switch your printer to your PDF writer THEN press OK")
				Gen_Alert("Please switch your printer to your PDF writer THEN press OK.")
				$_l_OK:=PLUGCALL_PDFs("GetPrinter"; ->PDF_t_CURPName; ->PDF_t_CURPType; ->PDF_t_CURPZone; ->PDF_t_CURPDriver)
				
				CONFIRM:C162("PDF CREATOR; "+PDF_t_CURPDriver+Char:C90(13); "Yes"; "NO")
			Until (OK=1)
			$_ti_DocumentRef:=DB_CreateDocument($_t_DocumentName; "TEXT")
			SEND PACKET:C103($_ti_DocumentRef; PDF_t_CURPName+Char:C90(9)+PDF_t_CURPType+Char:C90(9)+PDF_t_CURPZone+Char:C90(9)+PDF_t_CURPDriver+Char:C90(9))
			CLOSE DOCUMENT:C267($_ti_DocumentRef)
		Else 
			//Gen_Alert ("From SetmachinePDFWriter ")  `26/1/2010
			$_ti_DocumentRef:=DB_OpenDocument($_t_DocumentName; "TEXT")
			RECEIVE PACKET:C104($_ti_DocumentRef; PDF_t_CURPName; Char:C90(9))
			RECEIVE PACKET:C104($_ti_DocumentRef; PDF_t_CURPType; Char:C90(9))
			RECEIVE PACKET:C104($_ti_DocumentRef; PDF_t_CURPZOne; Char:C90(9))
			RECEIVE PACKET:C104($_ti_DocumentRef; PDF_t_CURPDriver; Char:C90(9))
			CLOSE DOCUMENT:C267($_ti_DocumentRef)
		End if 
		
	Else 
		//doc does not exist
		
		Repeat 
			//  ALERT("Please switch your printer to your PDF writer THEN press OK")
			Gen_Alert("Please switch your printer to your PDF writer THEN press OK.")
			$_l_OK:=PLUGCALL_PDFs("GetPrinter"; ->PDF_t_CURPName; ->PDF_t_CURPType; ->PDF_t_CURPZone; ->PDF_t_CURPDriver)
			
			CONFIRM:C162("PDF CREATOR; "+PDF_t_CURPDriver+Char:C90(13); "Yes"; "NO")
		Until (OK=1)
		$_ti_DocumentRef:=DB_CreateDocument($_t_DocumentName; "TEXT")
		SEND PACKET:C103($_ti_DocumentRef; PDF_t_CURPName+Char:C90(9)+PDF_t_CURPType+Char:C90(9)+PDF_t_CURPZone+Char:C90(9)+PDF_t_CURPDriver+Char:C90(9))
		CLOSE DOCUMENT:C267($_ti_DocumentRef)
	End if 
	
	$_l_OK:=PLUGCALL_PDFs("SetPrinter"; ->PDF_t_CURPName; ->PDF_t_CURPType; ->PDF_t_CURPZone; ->PDF_t_CURPDriver)
	
	$0:=$_l_OK
Else 
	$0:=1
End if 
ERR_MethodTrackerReturn("SetMachinePDFWriter"; $_t_oldMethodName)
