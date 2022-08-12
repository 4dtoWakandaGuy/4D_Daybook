//%attributes = {}

If (False:C215)
	//Project Method Name:      Reports_PrefsSave
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  26/02/2020
	//Created BY:  Unknown
	
	//Date Modified: 
	//Modified By: Nigel Greenlee
	//Modification notes
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_ItemID; DOC_l_CopyToPrinter; DOC_l_docDoEmail; DOC_l_docDoEmail_copy; DOC_l_docDoPdf; DOC_l_DocDoPDFcopy; DOC_l_DocDoPrint; DOC_l_DoPrintCopy)
	C_TEXT:C284(<>PER_t_CurrentUserInitials; $_t_DocumentCode; $_t_oldMethodName; $_t_PreferencesName; $1; DOC_t_DocEmailFrom; DOC_t_DocumentName; DOC_t_EmailBodyReport; DOC_t_EmailSubject; DOC_t_OutputFolderPath; DOC_t_TemplateCode)
	C_TEXT:C284(EMAIL_t_DocEmailRoletoText; Rep_t_docEmailToTxt)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Reports_PrefsSave")

If (Count parameters:C259>0)
	$_t_DocumentCode:=$1
Else 
	$_t_DocumentCode:=[DOCUMENTS:7]Document_Code:1
End if 
//</param>

//<locals>
//</locals>

//<process>

//</process>

//<interproc> `</interproc>

//<code>

$_t_oldMethodName:=ERR_MethodTracker("Reports_PrefsSave")
If ($_t_DocumentCode#"")
	
	$_t_PreferencesName:="SRP_"+$_t_DocumentCode+"_All"
	
	DOC_l_DocDoPrint:=DOC_l_DoPrintCopy
	DOC_l_docDoPdf:=DOC_l_DocDoPDFcopy
	DOC_l_docDoEmail:=DOC_l_docDoEmail_copy
	
	While (Semaphore:C143("LoadDocPrefs"))
		DelayTicks
	End while 
	//
	$_l_ItemID:=PREF_GetPreferenceID($_t_PreferencesName)
	If ($_l_ItemID>0)
		READ WRITE:C146([PREFERENCES:116])
		SET QUERY LIMIT:C395(1)
		QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=$_l_ItemID)
		SET QUERY LIMIT:C395(0)
		
		If (Records in selection:C76([PREFERENCES:116])=0)
			CREATE RECORD:C68([PREFERENCES:116])
			[PREFERENCES:116]IDNumber:1:=$_l_ItemID
		End if 
		
		SET BLOB SIZE:C606([PREFERENCES:116]DataBlob:2; 0)
		If (False:C215)  //NG CHanging t
			VARIABLE TO BLOB:C532(DOC_t_TemplateCode; [PREFERENCES:116]DataBlob:2)
			VARIABLE TO BLOB:C532(DOC_l_DocDoPrint; [PREFERENCES:116]DataBlob:2; *)
			VARIABLE TO BLOB:C532(DOC_l_docDoPdf; [PREFERENCES:116]DataBlob:2; *)
			VARIABLE TO BLOB:C532(DOC_l_docDoEmail; [PREFERENCES:116]DataBlob:2; *)
			VARIABLE TO BLOB:C532(DOC_t_DocumentName; [PREFERENCES:116]DataBlob:2; *)
			VARIABLE TO BLOB:C532(DOC_t_DocEmailFrom; [PREFERENCES:116]DataBlob:2; *)
			VARIABLE TO BLOB:C532(DOC_t_EmailSubject; [PREFERENCES:116]DataBlob:2; *)
			VARIABLE TO BLOB:C532(DOC_t_EmailBodyReport; [PREFERENCES:116]DataBlob:2; *)
			VARIABLE TO BLOB:C532(Rep_t_docEmailToTxt; [PREFERENCES:116]DataBlob:2; *)
			VARIABLE TO BLOB:C532(EMAIL_t_DocEmailRoletoText; [PREFERENCES:116]DataBlob:2; *)
			VARIABLE TO BLOB:C532(DOC_l_CopyToPrinter; [PREFERENCES:116]DataBlob:2; *)
			Compress_BlobPtr(->[PREFERENCES:116]DataBlob:2)
		Else 
			OB SET:C1220([PREFERENCES:116]DataObject:8; "TemplateCode"; DOC_t_TemplateCode)
			OB SET:C1220([PREFERENCES:116]DataObject:8; "DocumentPrint"; DOC_l_DocDoPrint)
			OB SET:C1220([PREFERENCES:116]DataObject:8; "DocumentMakePDF"; DOC_l_docDoPdf)
			OB SET:C1220([PREFERENCES:116]DataObject:8; "DocumentSendEmail"; DOC_l_docDoEmail)
			OB SET:C1220([PREFERENCES:116]DataObject:8; "DocumentAndPrint"; DOC_l_CopyToPrinter)
			OB SET:C1220([PREFERENCES:116]DataObject:8; "DocumentName"; DOC_t_DocumentName)
			OB SET:C1220([PREFERENCES:116]DataObject:8; "DocumentFromPerson"; DOC_t_DocEmailFrom)
			OB SET:C1220([PREFERENCES:116]DataObject:8; "DocumentEmailTitle"; DOC_t_EmailSubject)
			OB SET:C1220([PREFERENCES:116]DataObject:8; "DocumentEmailBody"; DOC_t_EmailBodyReport)
			OB SET:C1220([PREFERENCES:116]DataObject:8; "DocumentToEmail"; Rep_t_docEmailToTxt)
			OB SET:C1220([PREFERENCES:116]DataObject:8; "DocumentToRole"; EMAIL_t_DocEmailRoletoText)
		End if 
		DB_SaveRecord(->[PREFERENCES:116])
		UNLOAD RECORD:C212([PREFERENCES:116])
		READ ONLY:C145([PREFERENCES:116])
	End if 
	
	//user specific preferences are saved in another blob record
	$_t_PreferencesName:="SRP_"+$_t_DocumentCode+"_"+<>PER_t_CurrentUserInitials
	$_l_ItemID:=PREF_GetPreferenceID($_t_PreferencesName)
	If ($_l_ItemID>0)
		READ WRITE:C146([PREFERENCES:116])
		SET QUERY LIMIT:C395(1)
		QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=$_l_ItemID)
		SET QUERY LIMIT:C395(0)
		
		If (Records in selection:C76([PREFERENCES:116])=0)
			CREATE RECORD:C68([PREFERENCES:116])
			[PREFERENCES:116]IDNumber:1:=$_l_ItemID
		End if 
		
		SET BLOB SIZE:C606([PREFERENCES:116]DataBlob:2; 0)
		
		VARIABLE TO BLOB:C532(DOC_t_OutputFolderPath; [PREFERENCES:116]DataBlob:2)
		
		Compress_BlobPtr(->[PREFERENCES:116]DataBlob:2)
		
		DB_SaveRecord(->[PREFERENCES:116])
		UNLOAD RECORD:C212([PREFERENCES:116])
		READ ONLY:C145([PREFERENCES:116])
	End if 
	
	CLEAR SEMAPHORE:C144("LoadDocPrefs")
End if 
//</code>

//<return>
//$0 :=
//</return>
ERR_MethodTrackerReturn("Reports_PrefsSave"; $_t_oldMethodName)
