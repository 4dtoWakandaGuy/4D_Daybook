//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Reports_InLPA
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/11/2009`Method: Reports_InLPA
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//C_UNKNOWN(SR_DOCUMENTXML)
	ARRAY POINTER:C280($_aptr_PrefsToSave; 0)
	//ARRAY TEXT(EMail_at_DocEmailTo;0)
	C_BLOB:C604(SR_blb_ReportDataBLOB)
	C_BOOLEAN:C305(<>SRP262; DOC_bo_DOCUserPassword; DOC_bo_PDFPreventCopy; DOC_bo_PDFPreventEdit; DOC_bo_PDFPreventPrinting; PDF_bo_IsLicenced)
	C_LONGINT:C283($_l_Result; vOrdI)
	C_PICTURE:C286($_pic_Picture)
	C_POINTER:C301($_ptr_SRData; $_ptr_SRReportSource)
	C_TEXT:C284($_t_oldMethodName; EMAIL_t_DocEmailRoletoText; email_t_Role; Rep_t_docEmailToTxt; SR_t_ReportDataXML)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Reports_InLPA")


If (PDF_bo_IsLicenced)
	If (DOC_bo_PDFPreventCopy) | (DOC_bo_PDFPreventEdit) | (DOC_bo_PDFPreventPrinting) | (DOC_bo_DOCUserPassword)
		SET BLOB SIZE:C606([DOCUMENTS:7]PDF_Options:31; 0)
		VARIABLE TO BLOB:C532(DOC_bo_PDFPreventCopy; [DOCUMENTS:7]PDF_Options:31; *)
		VARIABLE TO BLOB:C532(DOC_bo_PDFPreventEdit; [DOCUMENTS:7]PDF_Options:31; *)
		VARIABLE TO BLOB:C532(DOC_bo_PDFPreventPrinting; [DOCUMENTS:7]PDF_Options:31; *)
		VARIABLE TO BLOB:C532(DOC_bo_DOCUserPassword; [DOCUMENTS:7]PDF_Options:31; *)
		
	End if 
End if 
Rep_t_docEmailToTxt:="'"
If (EMail_at_DocEmailTo>0) & (Size of array:C274(EMail_at_DocEmailTo)>0)
	Rep_t_docEmailToTxt:=EMail_at_DocEmailTo{EMail_at_DocEmailTo}
End if 
EMAIL_t_DocEmailRoletoText:=email_t_Role

Reports_PrefsSave
ARRAY POINTER:C280($_aptr_PrefsToSave; 0)
Reports_PrefsSaveNEW([DOCUMENTS:7]Document_Code:1; "REPORT"; ->$_aptr_PrefsToSave; Table:C252(->[DOCUMENTS:7]); 0)  //Added 13/11/08 v631b120g -kmw
Reports_PrefsCommit  //Added 02/12/08 v631b120i -kmw
//investigate
If (<>SRP262)
	$_ptr_SRReportSource:=->[DOCUMENTS:7]SR_DOCUMENT_:4
	SR_blb_ReportDataBLOB:=[DOCUMENTS:7]SR_DOCUMENT_:4
	$_ptr_SRData:=->SR_blb_ReportDataBLOB
Else 
	$_ptr_SRReportSource:=->[DOCUMENTS:7]SR_DOCUMENTXML_:34
	SR_t_ReportDataXML:=[DOCUMENTS:7]SR_DOCUMENTXML_:34  //make a copy of the report, we might modify i
	$_ptr_SRData:=->SR_DOCUMENTXML
End if 
If (vOrdI=0)
	//$_l_Result:=SR Get Area (Write;$_ptr_SRReport->)
	//$_l_Result:=SR_SaveReport ($_ptr_SRReport->;[DOCUMENTS]SR_DOCUMENTXML;0)
	$_l_Result:=SR_SaveReport($_ptr_SRData->; SR_t_ReportDataXML)
	[DOCUMENTS:7]SR_DOCUMENTXML_:34:=SR_t_ReportDataXML
	
Else 
	//TRACE
	//$_l_Result:=SR Get Area (vOrdI;$_ptr_SRReport->)
End if 
If ($_l_Result=0)
	[DOCUMENTS:7]SR_DOCUMENTXML_:34:=SR_t_ReportDataXML
Else 
	Gen_Alert("The Report could not be saved (Error: "+String:C10($_l_Result)+")")
End if 
ERR_MethodTrackerReturn("Reports_InLPA"; $_t_oldMethodName)
