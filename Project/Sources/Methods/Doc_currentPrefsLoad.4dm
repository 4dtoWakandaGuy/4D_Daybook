//%attributes = {}
If (False:C215)
	//Project Method Name:      Doc_currentPrefsLoad
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
	//ARRAY TEXT(DOC_at_DocumentType;0)
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
	C_BOOLEAN:C305($_bo_SendEmail)
	C_LONGINT:C283($_l_DocumentPrefixRow; $_l_DocumentTypeRow; DOC_l_docDoEmail; DOC_l_docDoPdf; DOC_l_DocDoPrint)
	C_TEXT:C284($_t_oldMethodName; DOC_t_CurrentDocType; DOC_t_DocEmailBody; DOC_t_DocEmailFrom; DOC_t_DocumentPrefix; DOC_t_EmailSubject; DOC_t_FIlePrefix; DOC_t_FIlePrefix1; DOC_t_OutputFolderPath; DOC_t_PDF995Path)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Doc_currentPrefsLoad")

DOC_t_CurrentDocType:=DOC_at_DocumentType{DOC_at_DocumentType}
$_l_DocumentTypeRow:=Find in array:C230(DOC_at_DocumentTypes; DOC_t_CurrentDocType)

If ($_l_DocumentTypeRow>0)
	$_bo_SendEmail:=DOC_abo_EmailPrefs{$_l_DocumentTypeRow}
	DOC_l_docDoEmail:=Num:C11($_bo_SendEmail)
	DOC_l_DocDoPrint:=Num:C11(Not:C34($_bo_SendEmail))
	DOC_t_FIlePrefix:=DOC_at_SavedPrefix{$_l_DocumentTypeRow}
	DOC_t_DocEmailFrom:=DOC_at_EmailFrom{$_l_DocumentTypeRow}
	DOC_t_DocEmailBody:=DOC_at_EmailBody{$_l_DocumentTypeRow}
	DOC_t_FIlePrefix1:=DOC_at_SavedPrefix2{$_l_DocumentTypeRow}
	DOC_t_PDF995Path:=DOC_at_PDFTargetPath{$_l_DocumentTypeRow}
	DOC_t_OutputFolderPath:=DOC_at_OutputFolderPath{$_l_DocumentTypeRow}
	DOC_t_EmailSubject:=DOC_at_EmailSubject{$_l_DocumentTypeRow}
	DOC_l_docDoPdf:=Num:C11(DOC_abo_DocPdfPrefs{$_l_DocumentTypeRow})
	
	$_l_DocumentPrefixRow:=Find in array:C230(DOC_at_Prefix1; DOC_at_SavedPrefix1{$_l_DocumentTypeRow})
	If ($_l_DocumentPrefixRow>0)
		DOC_at_Prefix1:=$_l_DocumentPrefixRow
	End if 
	
	$_l_DocumentPrefixRow:=Find in array:C230(DOC_at_Prefix2; DOC_at_SavedSuffix{$_l_DocumentTypeRow})
	If ($_l_DocumentPrefixRow>0)
		DOC_at_Prefix2:=$_l_DocumentPrefixRow
	End if 
End if 
//</code>

//<return>
//$0 :=
//</return>
ERR_MethodTrackerReturn("Doc_currentPrefsLoad"; $_t_oldMethodName)