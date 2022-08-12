//%attributes = {}
If (False:C215)
	//Project Method Name:      SuperReportToPDF
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/11/2009`Method: SuperReportToPDF
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY PICTURE(SR_apic_Report;0)
	C_BOOLEAN:C305($0; $3; DOC_bo_DOCUserPassword; DOC_bo_PDFPreventCopy; DOC_bo_PDFPreventEdit; DOC_bo_PDFPreventPrinting; PDF_bo_IsLicenced; PDF_bo_UseDOcumentPrefs; PDF_bo_UserPassword)
	C_DATE:C307(SRDate)
	C_LONGINT:C283($_l_Error; $_l_Index; $_l_offset; $_l_Options; $_l_Section; $_l_SessionID; iSR_Result; SRPage; SRRecord)
	C_POINTER:C301($_ptr_SRPicture; $_ptr_XMLData; $1; $4)
	C_TEXT:C284($_t_oldMethodName; $_t_PDFOutputPath; $2)
	C_TIME:C306(SRTime)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SuperReportToPDF")
//(SrPictPtr; pdfOutputFilePathStr) -> OK
DOC_bo_PDFPreventCopy:=False:C215
DOC_bo_PDFPreventEdit:=False:C215
DOC_bo_PDFPreventPrinting:=False:C215
PDF_bo_UserPassword:=False:C215
PDF_EncyptLoadPrefs
PDF_bo_IsLicenced:=PDF_EncryptVerfifyLicence
If (PDF_bo_IsLicenced)
	PDF_bo_UseDOcumentPrefs:=False:C215
	If (BLOB size:C605([DOCUMENTS:7]PDF_Options:31)>0)
		$_l_offset:=0
		PDF_bo_UseDOcumentPrefs:=True:C214
		BLOB TO VARIABLE:C533([DOCUMENTS:7]PDF_Options:31; DOC_bo_PDFPreventCopy; $_l_offset)
		If (BLOB size:C605([DOCUMENTS:7]PDF_Options:31)>$_l_offset)
			BLOB TO VARIABLE:C533([DOCUMENTS:7]PDF_Options:31; DOC_bo_PDFPreventEdit; $_l_offset)
			If (BLOB size:C605([DOCUMENTS:7]PDF_Options:31)>$_l_offset)
				BLOB TO VARIABLE:C533([DOCUMENTS:7]PDF_Options:31; DOC_bo_PDFPreventPrinting; $_l_offset)
				If (BLOB size:C605([DOCUMENTS:7]PDF_Options:31)>$_l_offset)
					BLOB TO VARIABLE:C533([DOCUMENTS:7]PDF_Options:31; DOC_bo_DOCUserPassword; $_l_offset)
				End if 
			End if 
		End if 
	End if 
End if 

$_ptr_XMLData:=$4
$_ptr_SRPicture:=$1
$_t_PDFOutputPath:=$2

ARRAY PICTURE:C279(SR_apic_Report; 0)

Case of 
	: (Is nil pointer:C315($_ptr_SRPicture))
		
	: (Type:C295($_ptr_SRPicture->)#Is picture:K8:10)
		
	Else 
		$_l_Options:=0  //don't valid Page Setup, don'tshow Job Setup dialog
		$_l_Section:=0  //all sections
		
		If (Count parameters:C259>=3)
			If ($3)
				//SR PrintDestination Preview
				$_l_Error:=SR SetDestination(SR PrintDestination Preview)
				$_l_Error:=SR_Print($_ptr_XMLData->; 1; SRP_Print_DestinationPreview; ""; $_l_SessionID; "")
				
			Else 
				//$_l_Error:=SR SetDestination (SR PrintDestination File;$_t_PDFOutputPath)
				$_l_Error:=SR_Print($_ptr_XMLData->; 1; SRP_Print_DestinationPDF; $_t_PDFOutputPath; 0; "")
				
			End if 
		Else 
			
			//$_l_Error:=SR SetDestination (SR PrintDestination File;$_t_PDFOutputPath)
			$_l_Error:=SR_Print($_ptr_XMLData->; 1; SRP_Print_DestinationPDF; $_t_PDFOutputPath; 0; "")
			
		End if 
		
		//$_l_Error:=SR Print Report ($_ptr_SRPicture->;0;65535)
		//SR_Print ($_ptr_XMLData->;1;SRP_Print_DestinationPrinter;"";0;"")
		//$_l_Error:=SR SetDestination (SR PrintDestination Printer)  //Added 27/11/08 v631b120i -kmw (without this extra line, then onece the destination had been set to file, system was sending all SR print jobs to PDF (unless the print dialog was shown to user in which case it would print to whatver they said - which as why this problem probably never noticed before....ie probably in the past this function was only ever called immediately after a print dialog displayed).
		
		
		//iSR_Result:=SR Print PICT ($_ptr_SRPicture->;"SR_apic_Report";$options;$_l_Section)
		
		//$_l_SessionID:=PPdf StartJob ($_t_PDFOutputPath)
		If (False:C215)
			If ($_l_SessionID>0)
				For ($_l_Index; 1; Size of array:C274(SR_apic_Report))
					//$err:=PPdf PageOut ($_l_SessionID;SR_apic_Report{$_l_Index})
				End for 
				//$err:=PPdf EndJob ($_l_SessionID)
			End if 
			
			//ARRAY PICTURE(SR_apic_Report;0)
		End if 
		
End case 
//</code>

//<return>
If (Count parameters:C259<3)
	$0:=Test path name:C476($_t_PDFOutputPath)=Is a document:K24:1
	If ($0)
		If (PDF_bo_IsLicenced)
			$_t_PDFOutputPath:=PDF_Encrypt($_t_PDFOutputPath)
		End if 
	End if 
Else 
	If ($3)
		$0:=True:C214
	Else 
		$0:=Test path name:C476($_t_PDFOutputPath)=Is a document:K24:1
	End if 
	If ($0)
		If (PDF_bo_IsLicenced)
			$_t_PDFOutputPath:=PDF_Encrypt($_t_PDFOutputPath)
		End if 
	End if 
End if 

//</return>
ERR_MethodTrackerReturn("SuperReportToPDF"; $_t_oldMethodName)
