//%attributes = {}

If (False:C215)
	//Project Method Name:      Personnel_PDF_LoadPrefs
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
	C_LONGINT:C283($_l_Offset; $_l_PreferenceID; $_l_SizeofArray)
	C_TEXT:C284(<>PER_t_CurrentUserInitials; $_t_oldMethodName; $1)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Personnel_PDF_LoadPrefs")



ARRAY TEXT:C222(DOC_at_PDF995Path; 0)
ARRAY TEXT:C222(PDF_at_995DocsDirPath; 0)  //bwalia 20060926
ARRAY TEXT:C222(PDF_at_MachineNames; 0)
ARRAY TEXT:C222(PDS_at_DaybookUsers; 0)
ARRAY BOOLEAN:C223(PDF_abo_MachineIsWindows; 0)
//</process>

//<interproc> `</interproc>

//<code>
$_t_oldMethodName:=ERR_MethodTracker("Personnel_PDF_LoadPrefs")
$_l_Offset:=0
//
While (Semaphore:C143("LoadDocPrefs"))
	DelayTicks
End while 
//
//NG Well the follow is trash when called from the personnel loading as it loads the pref for the logged in user not the personnel record
If (Count parameters:C259>=1)
	$_l_PreferenceID:=PREF_GetPreferenceID("Personnel_PDF_Preferences"+$1)
Else 
	$_l_PreferenceID:=PREF_GetPreferenceID("Personnel_PDF_Preferences"+<>PER_t_CurrentUserInitials)
End if 
QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=$_l_PreferenceID)

If (Records in selection:C76([PREFERENCES:116])=0)
	CREATE RECORD:C68([PREFERENCES:116])
	[PREFERENCES:116]IDNumber:1:=$_l_PreferenceID
	DB_SaveRecord(->[PREFERENCES:116])
End if 

READ ONLY:C145([PREFERENCES:116])

SET QUERY LIMIT:C395(1)
QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=$_l_PreferenceID)
SET QUERY LIMIT:C395(0)

If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>0)
	Expand_BlobPtr(->[PREFERENCES:116]DataBlob:2)
	
	If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_Offset)
		BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; DOC_at_PDF995Path; $_l_Offset)
		If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_Offset)
			BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; PDF_at_MachineNames; $_l_Offset)
			If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_Offset)  //bwalia 20060926
				BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; PDF_at_995DocsDirPath; $_l_Offset)
				If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_Offset)  //Nigel Greeenl october 2007
					BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; PDS_at_DaybookUsers; $_l_Offset)
					If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_Offset)  //Nigel Greeenl october 2007
						BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; PDF_abo_MachineIsWindows; $_l_Offset)
					Else 
						ARRAY TEXT:C222(PDS_at_DaybookUsers; Size of array:C274(PDF_at_MachineNames))
						ARRAY BOOLEAN:C223(PDF_abo_MachineIsWindows; Size of array:C274(PDF_at_MachineNames))
					End if 
				Else 
				End if 
			Else 
				ARRAY TEXT:C222(DOC_at_PDF995Path; 0)
				ARRAY TEXT:C222(PDF_at_995DocsDirPath; 0)  //bwalia 20060926
				ARRAY TEXT:C222(PDF_at_MachineNames; 0)
				ARRAY TEXT:C222(PDS_at_DaybookUsers; 0)
				ARRAY BOOLEAN:C223(PDF_abo_MachineIsWindows; 0)
			End if 
		Else 
			ARRAY TEXT:C222(DOC_at_PDF995Path; 0)
			ARRAY TEXT:C222(PDF_at_995DocsDirPath; 0)  //bwalia 20060926
			ARRAY TEXT:C222(PDF_at_MachineNames; 0)
			ARRAY TEXT:C222(PDS_at_DaybookUsers; 0)
			ARRAY BOOLEAN:C223(PDF_abo_MachineIsWindows; 0)
		End if 
	Else 
		ARRAY TEXT:C222(DOC_at_PDF995Path; 0)
		ARRAY TEXT:C222(PDF_at_995DocsDirPath; 0)  //bwalia 20060926
		ARRAY TEXT:C222(PDF_at_MachineNames; 0)
		ARRAY TEXT:C222(PDS_at_DaybookUsers; 0)
		ARRAY BOOLEAN:C223(PDF_abo_MachineIsWindows; 0)
	End if 
	
	
End if 
$_l_SizeofArray:=Size of array:C274(DOC_at_PDF995Path)
ARRAY TEXT:C222(DOC_at_PDF995Path; $_l_SizeofArray)
ARRAY TEXT:C222(PDF_at_995DocsDirPath; $_l_SizeofArray)  //bwalia 20060926
ARRAY TEXT:C222(PDF_at_MachineNames; $_l_SizeofArray)
ARRAY TEXT:C222(PDS_at_DaybookUsers; $_l_SizeofArray)
ARRAY BOOLEAN:C223(PDF_abo_MachineIsWindows; $_l_SizeofArray)
UNLOAD RECORD:C212([PREFERENCES:116])

CLEAR SEMAPHORE:C144("LoadDocPrefs")

ERR_MethodTrackerReturn("Personnel_PDF_LoadPrefs"; $_t_oldMethodName)
