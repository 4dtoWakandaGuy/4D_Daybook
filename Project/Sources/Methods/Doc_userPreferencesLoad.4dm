//%attributes = {}

If (False:C215)
	//Project Method Name:      Doc_userPreferencesLoad
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  26/02/2020
	//Created BY:  Unknown
	
	//Date Modified: 
	//Modified By: Redeye0735
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
	//ARRAY TEXT(DOC_at_SavedPrefix;0)
	//ARRAY TEXT(DOC_at_SavedPrefix1;0)
	//ARRAY TEXT(DOC_at_SavedPrefix2;0)
	//ARRAY TEXT(DOC_at_SavedSuffix;0)
	C_LONGINT:C283($_l_Offset; $_l_PreferenceID)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Doc_userPreferencesLoad")


ARRAY TEXT:C222(DOC_at_DocumentTypes; 0)
ARRAY BOOLEAN:C223(DOC_abo_EmailPrefs; 0)
ARRAY TEXT:C222(DOC_at_SavedPrefix; 0)
ARRAY TEXT:C222(DOC_at_SavedPrefix1; 0)
ARRAY TEXT:C222(DOC_at_SavedPrefix2; 0)
ARRAY TEXT:C222(DOC_at_SavedSuffix; 0)
ARRAY TEXT:C222(DOC_at_EmailFrom; 0)
ARRAY TEXT:C222(DOC_at_EmailBody; 0)
ARRAY TEXT:C222(DOC_at_PDFTargetPath; 0)
ARRAY TEXT:C222(DOC_at_OutputFolderPath; 0)
ARRAY TEXT:C222(DOC_at_EmailSubject; 0)
ARRAY BOOLEAN:C223(DOC_abo_DocPdfPrefs; 0)
//</process>

//<interproc> `</interproc>

//<code>
$_t_oldMethodName:=ERR_MethodTracker("Doc_userPreferencesLoad")
$_l_Offset:=0
//
While (Semaphore:C143("LoadDocPrefs"))
	DelayTicks
End while 
$_l_PreferenceID:=PREF_GetPreferenceID("Document Email Settings")
QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=$_l_PreferenceID)
If (Records in selection:C76([PREFERENCES:116])=0)
	CREATE RECORD:C68([PREFERENCES:116])
	[PREFERENCES:116]IDNumber:1:=$_l_PreferenceID
	SAVE RECORD:C53([PREFERENCES:116])
End if 

READ ONLY:C145([PREFERENCES:116])

SET QUERY LIMIT:C395(1)
QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=$_l_PreferenceID)
SET QUERY LIMIT:C395(0)

If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>0)
	Expand_BlobPtr(->[PREFERENCES:116]DataBlob:2)
	
	BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; DOC_at_DocumentTypes; $_l_Offset)
	If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_Offset)
		BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; DOC_abo_EmailPrefs; $_l_Offset)
	End if 
	If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_Offset)
		BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; DOC_at_SavedPrefix; $_l_Offset)
	End if 
	If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_Offset)
		BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; DOC_at_SavedPrefix1; $_l_Offset)
	End if 
	If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_Offset)
		BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; DOC_at_SavedPrefix2; $_l_Offset)
	End if 
	If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_Offset)
		BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; DOC_at_SavedSuffix; $_l_Offset)
	End if 
	If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_Offset)
		BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; DOC_at_EmailFrom; $_l_Offset)
	End if 
	If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_Offset)
		BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; DOC_at_EmailBody; $_l_Offset)
	End if 
	If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_Offset)
		BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; DOC_at_PDFTargetPath; $_l_Offset)
	End if 
	If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_Offset)
		BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; DOC_at_OutputFolderPath; $_l_Offset)
	End if 
	
	If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_Offset)
		BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; DOC_at_EmailSubject; $_l_Offset)
		
	Else 
		ARRAY TEXT:C222(DOC_at_EmailSubject; Size of array:C274(DOC_at_OutputFolderPath))
	End if 
	
	If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_Offset)
		BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; DOC_abo_DocPdfPrefs; $_l_Offset)
		
	Else 
		ARRAY TEXT:C222(DOC_at_EmailSubject; Size of array:C274(DOC_abo_DocPdfPrefs))
	End if 
	
End if 

UNLOAD RECORD:C212([PREFERENCES:116])

CLEAR SEMAPHORE:C144("LoadDocPrefs")
ERR_MethodTrackerReturn("Doc_userPreferencesLoad"; $_t_oldMethodName)
ERR_MethodTrackerReturn("Doc_userPreferencesLoad"; $_t_oldMethodName)