//%attributes = {}

If (False:C215)
	//Project Method Name:      Doc_userPreferencesSave
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
	C_LONGINT:C283($_l_PreferenceID)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Doc_userPreferencesSave")

Doc_currentPrefsToArrays
//
While (Semaphore:C143("LoadDocPrefs"))
	DelayTicks
End while 
$_l_PreferenceID:=PREF_GetPreferenceID("Document Email Settings")


READ WRITE:C146([PREFERENCES:116])
SET QUERY LIMIT:C395(1)
QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=$_l_PreferenceID)
SET QUERY LIMIT:C395(0)

If (Records in selection:C76([PREFERENCES:116])=0)
	CREATE RECORD:C68([PREFERENCES:116])
	[PREFERENCES:116]IDNumber:1:=$_l_PreferenceID
End if 

SET BLOB SIZE:C606([PREFERENCES:116]DataBlob:2; 0)

VARIABLE TO BLOB:C532(DOC_at_DocumentTypes; [PREFERENCES:116]DataBlob:2)
VARIABLE TO BLOB:C532(DOC_abo_EmailPrefs; [PREFERENCES:116]DataBlob:2; *)
VARIABLE TO BLOB:C532(DOC_at_SavedPrefix; [PREFERENCES:116]DataBlob:2; *)
VARIABLE TO BLOB:C532(DOC_at_SavedPrefix1; [PREFERENCES:116]DataBlob:2; *)
VARIABLE TO BLOB:C532(DOC_at_SavedPrefix2; [PREFERENCES:116]DataBlob:2; *)
VARIABLE TO BLOB:C532(DOC_at_SavedSuffix; [PREFERENCES:116]DataBlob:2; *)
VARIABLE TO BLOB:C532(DOC_at_EmailFrom; [PREFERENCES:116]DataBlob:2; *)
VARIABLE TO BLOB:C532(DOC_at_EmailBody; [PREFERENCES:116]DataBlob:2; *)
VARIABLE TO BLOB:C532(DOC_at_PDFTargetPath; [PREFERENCES:116]DataBlob:2; *)
VARIABLE TO BLOB:C532(DOC_at_OutputFolderPath; [PREFERENCES:116]DataBlob:2; *)
VARIABLE TO BLOB:C532(DOC_at_EmailSubject; [PREFERENCES:116]DataBlob:2; *)
VARIABLE TO BLOB:C532(DOC_abo_DocPdfPrefs; [PREFERENCES:116]DataBlob:2; *)

Compress_BlobPtr(->[PREFERENCES:116]DataBlob:2)

DB_SaveRecord(->[PREFERENCES:116])
UNLOAD RECORD:C212([PREFERENCES:116])
READ ONLY:C145([PREFERENCES:116])

CLEAR SEMAPHORE:C144("LoadDocPrefs")
ERR_MethodTrackerReturn("Doc_userPreferencesSave"; $_t_oldMethodName)