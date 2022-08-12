//%attributes = {}
If (False:C215)
	//Project Method Name:      Doc_currentPrefsToArrays
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(DOC_abo_DocPdfPrefs;0)
	//ARRAY BOOLEAN(DOC_abo_EmailPrefs;0)
	//ARRAY TEXT(DOC_at_DocumentTypes;0)
	//ARRAY TEXT(DOC_at_EmailBody;0)
	//ARRAY TEXT(DOC_at_EmailFrom;0)
	//ARRAY TEXT(DOC_at_EmailSubject;0)
	//ARRAY TEXT(DOC_at_OutputFolderPath;0)
	//ARRAY TEXT(DOC_at_PDFTargetPath;0)
	//ARRAY TEXT(DOC_at_Prefix1;0)
	//ARRAY TEXT(DOC_at_Prefix2;0)
	//ARRAY TEXT(DOC_at_SavedPrefix;0)
	//ARRAY TEXT(DOC_at_SavedPrefix1;0)
	//ARRAY TEXT(DOC_at_SavedPrefix2;0)
	//ARRAY TEXT(DOC_at_SavedSuffix;0)
	C_LONGINT:C283($_l_DocumentTypeRow; $_l_Index; DOC_l_docDoEmail; DOC_l_docDoPdf)
	C_TEXT:C284($_t_oldMethodName; DOC_t_CurrentDocType; DOC_t_DocEmailBody; DOC_t_DocEmailFrom; DOC_t_DocumentPrefix; DOC_t_EmailSubject; DOC_t_FIlePrefix1; DOC_t_OutputFolderPath; DOC_t_PDF995Path)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Doc_currentPrefsToArrays")

$_l_DocumentTypeRow:=Find in array:C230(DOC_at_DocumentTypes; DOC_t_CurrentDocType)

If ($_l_DocumentTypeRow<0)
	$_l_DocumentTypeRow:=Size of array:C274(DOC_at_DocumentTypes)+1
	INSERT IN ARRAY:C227(DOC_at_DocumentTypes; $_l_DocumentTypeRow; 1)
	INSERT IN ARRAY:C227(DOC_abo_EmailPrefs; $_l_DocumentTypeRow; 1)
	INSERT IN ARRAY:C227(DOC_at_SavedPrefix; $_l_DocumentTypeRow; 1)
	INSERT IN ARRAY:C227(DOC_at_SavedPrefix1; $_l_DocumentTypeRow; 1)
	INSERT IN ARRAY:C227(DOC_at_SavedPrefix2; $_l_DocumentTypeRow; 1)
	INSERT IN ARRAY:C227(DOC_at_SavedSuffix; $_l_DocumentTypeRow; 1)
	INSERT IN ARRAY:C227(DOC_at_EmailFrom; $_l_DocumentTypeRow; 1)
	INSERT IN ARRAY:C227(DOC_at_EmailBody; $_l_DocumentTypeRow; 1)
	INSERT IN ARRAY:C227(DOC_at_PDFTargetPath; $_l_DocumentTypeRow; 1)
	INSERT IN ARRAY:C227(DOC_at_OutputFolderPath; $_l_DocumentTypeRow; 1)
	INSERT IN ARRAY:C227(DOC_at_EmailSubject; $_l_DocumentTypeRow; 1)
	INSERT IN ARRAY:C227(DOC_abo_DocPdfPrefs; $_l_DocumentTypeRow; 1)
	DOC_at_DocumentTypes{$_l_DocumentTypeRow}:=DOC_t_CurrentDocType
	
End if 

If (Size of array:C274(DOC_abo_EmailPrefs)<$_l_DocumentTypeRow)
	ARRAY BOOLEAN:C223(DOC_abo_EmailPrefs; $_l_DocumentTypeRow)
End if 

DOC_abo_EmailPrefs{$_l_DocumentTypeRow}:=DOC_l_docDoEmail=1

If (Size of array:C274(DOC_at_SavedPrefix)<$_l_DocumentTypeRow)
	ARRAY TEXT:C222(DOC_at_SavedPrefix; $_l_DocumentTypeRow)
	
End if 

DOC_at_SavedPrefix{$_l_DocumentTypeRow}:=DOC_t_DocumentPrefix  //this is used as full name for file (single var)

If (Size of array:C274(DOC_at_SavedPrefix1)<$_l_DocumentTypeRow)
	ARRAY TEXT:C222(DOC_at_SavedPrefix1; $_l_DocumentTypeRow)
End if 

DOC_at_SavedPrefix1{$_l_DocumentTypeRow}:=DOC_at_Prefix1{DOC_at_Prefix1}

If (Size of array:C274(DOC_at_SavedPrefix2)<$_l_DocumentTypeRow)
	ARRAY TEXT:C222(DOC_at_SavedPrefix2; $_l_DocumentTypeRow)
End if 

DOC_at_SavedPrefix2{$_l_DocumentTypeRow}:=DOC_t_FIlePrefix1

If (Size of array:C274(DOC_at_SavedSuffix)<$_l_DocumentTypeRow)
	ARRAY TEXT:C222(DOC_at_SavedSuffix; $_l_DocumentTypeRow)
End if 
DOC_at_SavedSuffix{$_l_DocumentTypeRow}:=DOC_at_Prefix2{DOC_at_Prefix2}

If (Size of array:C274(DOC_at_EmailFrom)<$_l_DocumentTypeRow)
	ARRAY TEXT:C222(DOC_at_EmailFrom; $_l_DocumentTypeRow)
End if 
DOC_at_EmailFrom{$_l_DocumentTypeRow}:=DOC_t_DocEmailFrom

If (Size of array:C274(DOC_at_EmailBody)<$_l_DocumentTypeRow)
	ARRAY TEXT:C222(DOC_at_EmailBody; $_l_DocumentTypeRow)
End if 

DOC_at_EmailBody{$_l_DocumentTypeRow}:=DOC_t_DocEmailBody

If (Size of array:C274(DOC_at_PDFTargetPath)<$_l_DocumentTypeRow)
	ARRAY TEXT:C222(DOC_at_PDFTargetPath; $_l_DocumentTypeRow)
End if 

For ($_l_Index; 1; Size of array:C274(DOC_at_PDFTargetPath))
	DOC_at_PDFTargetPath{$_l_Index}:=DOC_t_PDF995Path
End for 

If (Size of array:C274(DOC_at_OutputFolderPath)<$_l_DocumentTypeRow)
	ARRAY TEXT:C222(DOC_at_OutputFolderPath; $_l_DocumentTypeRow)
End if 
DOC_at_OutputFolderPath{$_l_DocumentTypeRow}:=DOC_t_OutputFolderPath


If (Size of array:C274(DOC_at_EmailSubject)<$_l_DocumentTypeRow)
	ARRAY TEXT:C222(DOC_at_EmailSubject; $_l_DocumentTypeRow)
End if 

DOC_at_EmailSubject{$_l_DocumentTypeRow}:=DOC_t_EmailSubject

If (Size of array:C274(DOC_abo_DocPdfPrefs)<$_l_DocumentTypeRow)
	ARRAY BOOLEAN:C223(DOC_abo_DocPdfPrefs; $_l_DocumentTypeRow)
End if 

DOC_abo_DocPdfPrefs{$_l_DocumentTypeRow}:=DOC_l_docDoPdf=1
ERR_MethodTrackerReturn("Doc_currentPrefsToArrays"; $_t_oldMethodName)