//%attributes = {}

If (False:C215)
	//Project Method Name:      Personnel_PDF_SavePrefs
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
	//ARRAY BOOLEAN(PDF_abo_MachineIsWindows;0)
	//ARRAY TEXT(DOC_at_PDF995Path;0)
	//ARRAY TEXT(PDF_at_995DocsDirPath;0)
	//ARRAY TEXT(PDF_at_MachineNames;0)
	//ARRAY TEXT(PDS_at_DaybookUsers;0)
	C_LONGINT:C283($_l_PreferenceID)
	C_TEXT:C284(<>PER_t_CurrentUserInitials; $_t_oldMethodName; $1)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Personnel_PDF_SavePrefs")
//
While (Semaphore:C143("LoadDocPrefs"))
	DelayTicks
End while 
//
If (Count parameters:C259>=1)
	$_l_PreferenceID:=PREF_GetPreferenceID("Personnel_PDF_Preferences"+$1)
Else 
	$_l_PreferenceID:=PREF_GetPreferenceID("Personnel_PDF_Preferences"+<>PER_t_CurrentUserInitials)
End if 

READ WRITE:C146([PREFERENCES:116])
SET QUERY LIMIT:C395(1)
QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=$_l_PreferenceID)
SET QUERY LIMIT:C395(0)

If (Records in selection:C76([PREFERENCES:116])=0)
	CREATE RECORD:C68([PREFERENCES:116])
	[PREFERENCES:116]IDNumber:1:=$_l_PreferenceID
End if 

SET BLOB SIZE:C606([PREFERENCES:116]DataBlob:2; 0)

If ((Shift down:C543) | (Undefined:C82(DOC_at_PDF995Path)) | (Undefined:C82(DOC_at_PDF995Path)) | (Type:C295(DOC_at_PDF995Path)#Text array:K8:16) & (Type:C295(DOC_at_PDF995Path)#String array:K8:15))
	ARRAY TEXT:C222(DOC_at_PDF995Path; 0)
	ARRAY TEXT:C222(PDF_at_995DocsDirPath; 0)  //bwalia 20060926
	ARRAY TEXT:C222(PDF_at_MachineNames; 0)
	ARRAY TEXT:C222(PDS_at_DaybookUsers; 0)
	ARRAY BOOLEAN:C223(PDF_abo_MachineIsWindows; 0)
End if 

VARIABLE TO BLOB:C532(DOC_at_PDF995Path; [PREFERENCES:116]DataBlob:2; *)
VARIABLE TO BLOB:C532(PDF_at_MachineNames; [PREFERENCES:116]DataBlob:2; *)
VARIABLE TO BLOB:C532(PDF_at_995DocsDirPath; [PREFERENCES:116]DataBlob:2; *)
VARIABLE TO BLOB:C532(PDS_at_DaybookUsers; [PREFERENCES:116]DataBlob:2; *)
VARIABLE TO BLOB:C532(PDF_abo_MachineIsWindows; [PREFERENCES:116]DataBlob:2; *)
Compress_BlobPtr(->[PREFERENCES:116]DataBlob:2)

DB_SaveRecord(->[PREFERENCES:116])
UNLOAD RECORD:C212([PREFERENCES:116])
READ ONLY:C145([PREFERENCES:116])


CLEAR SEMAPHORE:C144("LoadDocPrefs")

ERR_MethodTrackerReturn("Personnel_PDF_SavePrefs"; $_t_oldMethodName)
