//%attributes = {}
If (False:C215)
	//Project Method Name:      SDAG_SavePreference
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/10/2012 07:11
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(SDAG_abo_UseAgenda;0)
	//ARRAY TEXT(SDAG_at_UserInitials;0)
	C_BOOLEAN:C305(<>SD_bo_UseAgenda; $0)
	C_LONGINT:C283($_l_offset; $_l_PersonRow; $_l_PreferenceID; $_l_SizeofArray; $1; $2)
	C_TEXT:C284($_t_oldMethodName; $_t_UserInitials)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SDAG_SavePreference")

While (Semaphore:C143("LoadingPrefsAG"))
	DelayTicks(2)
End while 
$_l_PreferenceID:=PREF_GetPreferenceID("Agenda Diary Users")


CLEAR SEMAPHORE:C144("LoadingPrefsAG")


//The will be changed to pick up from prefs or use oe
ARRAY TEXT:C222(SDAG_at_UserInitials; 0)
ARRAY BOOLEAN:C223(SDAG_abo_UseAgenda; 0)
If (UTI_Semaphore("CheckingLicences"))
	QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=$_l_PreferenceID)
	If (Records in selection:C76([PREFERENCES:116])=0)
		READ WRITE:C146([PREFERENCES:116])
		CREATE RECORD:C68([PREFERENCES:116])
		[PREFERENCES:116]IDNumber:1:=$_l_PreferenceID
		VARIABLE TO BLOB:C532(SDAG_at_UserInitials; [PREFERENCES:116]DataBlob:2; *)
		VARIABLE TO BLOB:C532(SDAG_abo_UseAgenda; [PREFERENCES:116]DataBlob:2; *)
		SAVE RECORD:C53([PREFERENCES:116])
		UNLOAD RECORD:C212([PREFERENCES:116])
		READ ONLY:C145([PREFERENCES:116])
		QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=$_l_PreferenceID)
	End if 
	UTI_ClearSemaphore("CheckingLicences")
	$_l_offset:=0
	BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; SDAG_at_UserInitials; $_l_offset)
	If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_offset)
		BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; SDAG_abo_UseAgenda; $_l_offset)
		
	End if 
	
	$_l_SizeofArray:=Size of array:C274(SDAG_at_UserInitials)
	ARRAY TEXT:C222(SDAG_at_UserInitials; $_l_SizeofArray)
	ARRAY BOOLEAN:C223(SDAG_abo_UseAgenda; $_l_SizeofArray)
	If ([PERSONNEL:11]Personnel_ID:48#$1)
		QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Personnel_ID:48=$1)
	End if 
	$_t_UserInitials:=[PERSONNEL:11]Initials:1
	$_l_PersonRow:=Find in array:C230(SDAG_at_UserInitials; $_t_UserInitials)
	If ($_l_PersonRow>0)
		If (Count parameters:C259>=1)
			If (Count parameters:C259>=2)
				If (SDAG_abo_UseAgenda{$_l_PersonRow}#($2=1))
					SDAG_abo_UseAgenda{$_l_PersonRow}:=($2=1)
					If (UTI_Semaphore("CheckingLicences"))
						REDUCE SELECTION:C351([PREFERENCES:116]; 0)
						READ WRITE:C146([PREFERENCES:116])
						
						QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=$_l_PreferenceID)
						SET BLOB SIZE:C606([PREFERENCES:116]DataBlob:2; 0)
						VARIABLE TO BLOB:C532(SDAG_at_UserInitials; [PREFERENCES:116]DataBlob:2; *)
						VARIABLE TO BLOB:C532(SDAG_abo_UseAgenda; [PREFERENCES:116]DataBlob:2; *)
						SAVE RECORD:C53([PREFERENCES:116])
						UNLOAD RECORD:C212([PREFERENCES:116])
						READ ONLY:C145([PREFERENCES:116])
						QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=$_l_PreferenceID)
						UTI_ClearSemaphore("CheckingLicences")
					End if 
				End if 
			End if 
			$0:=SDAG_abo_UseAgenda{$_l_PersonRow}
		Else 
			<>SD_bo_UseAgenda:=SDAG_abo_UseAgenda{$_l_PersonRow}
		End if 
		
		
	Else 
		If (UTI_Semaphore("CheckingLicences"))
			INSERT IN ARRAY:C227(SDAG_at_UserInitials; Size of array:C274(SDAG_at_UserInitials)+1; 1)
			INSERT IN ARRAY:C227(SDAG_abo_UseAgenda; Size of array:C274(SDAG_abo_UseAgenda)+1; 1)
			SDAG_at_UserInitials{Size of array:C274(SDAG_at_UserInitials)}:=$_t_UserInitials
			SDAG_abo_UseAgenda{Size of array:C274(SDAG_abo_UseAgenda)}:=True:C214
			If (Count parameters:C259>=2)
				SDAG_abo_UseAgenda{Size of array:C274(SDAG_abo_UseAgenda)}:=($2=1)
			End if 
			REDUCE SELECTION:C351([PREFERENCES:116]; 0)
			READ WRITE:C146([PREFERENCES:116])
			QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=$_l_PreferenceID)
			SET BLOB SIZE:C606([PREFERENCES:116]DataBlob:2; 0)
			
			VARIABLE TO BLOB:C532(SDAG_at_UserInitials; [PREFERENCES:116]DataBlob:2; *)
			VARIABLE TO BLOB:C532(SDAG_abo_UseAgenda; [PREFERENCES:116]DataBlob:2; *)
			SAVE RECORD:C53([PREFERENCES:116])
			UNLOAD RECORD:C212([PREFERENCES:116])
			READ ONLY:C145([PREFERENCES:116])
			QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=$_l_PreferenceID)
			UTI_ClearSemaphore("CheckingLicences")
			If (Count parameters:C259>=1)
				$0:=SDAG_abo_UseAgenda{Size of array:C274(SDAG_abo_UseAgenda)}
			Else 
				<>SD_bo_UseAgenda:=SDAG_abo_UseAgenda{Size of array:C274(SDAG_abo_UseAgenda)}
			End if 
		End if 
		
		
	End if 
End if 
ERR_MethodTrackerReturn("SDAG_SavePreference"; $_t_oldMethodName)
