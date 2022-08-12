//%attributes = {}

If (False:C215)
	//Project Method Name:      SD_GetAgendaLicence
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
	//ARRAY BOOLEAN(SDAG_abo_UseAgenda;0)
	//ARRAY TEXT(SDAG_at_UserInitials;0)
	C_BOOLEAN:C305(<>SD_bo_UseAgenda; $0; $2; SD_bo_AgendaSetup)
	C_LONGINT:C283($_l_Error; $_l_offset; $_l_PersonRow; $_l_PreferenceID; $_l_SizeofArray; SD_l_AgendaTable)
	C_TEXT:C284(<>PER_t_CurrentUserInitials; $_t_Key; $_t_oldMethodName; $_t_Serial; $_t_UserInitials; $1)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SD_GetAgendaLicence")

SD_bo_AgendaSetup:=False:C215
SD_l_AgendaTable:=Table:C252(->[DIARY:12])
$_t_Serial:="40469070370916081"
$_t_Key:="44CCD3D5D2B3C1A07"
$0:=True:C214

$_t_oldMethodName:=ERR_MethodTracker("SD_GetAgendaLicence")
If (Count parameters:C259>=1)
	$_t_UserInitials:=$1
Else 
	$_t_UserInitials:=<>PER_t_CurrentUserInitials
End if 
//
//this method will extract any licence settings-use for optional plug-ins

//Change to plan we have bought the OEM Licence for this products
If (ApplicationType_isSingleUser) & (Not:C34(Is compiled mode:C492))
	//The will be changed to pick up from prefs or use oem
	//$_l_Error:=AG Register ($_t_Serial;$_t_Key)
	$_l_Error:=0
	If ($_l_Error>0)
		$0:=False:C215
	End if 
Else 
	$_t_Serial:="10462107340728085"
	$_t_Key:="8160A59B49079AC45"
	//$_l_Error:=AG Register ($_t_Serial;$_t_Key)
	If ($_l_Error>0)
		$0:=False:C215
	End if 
	//We just need an on off button now!
	If (Is compiled mode:C492) & (False:C215)  // Until I have tested it!
		
		$0:=False:C215
	End if 
	While (Semaphore:C143("LoadingPrefsAGusers"))
		DelayTicks(2)
	End while 
	$_l_PreferenceID:=PREF_GetPreferenceID("Agenda Diary Users")
	CLEAR SEMAPHORE:C144("LoadingPrefsAGusers")
	
	
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
		
		$_l_PersonRow:=Find in array:C230(SDAG_at_UserInitials; $_t_UserInitials)
		If ($_l_PersonRow>0)
			If (Count parameters:C259>=1)
				If (Count parameters:C259>=2)
					If (SDAG_abo_UseAgenda{$_l_PersonRow}#$2)
						SDAG_abo_UseAgenda{$_l_PersonRow}:=$2
						If (UTI_Semaphore("CheckingLicences"))
							READ WRITE:C146([PREFERENCES:116])
							QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=$_l_PreferenceID)
							//BLOB size([Preferences]DataBlob;0)
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
				$0:=<>SD_bo_UseAgenda
			End if 
			
			
		Else 
			If (UTI_Semaphore("CheckingLicences"))
				INSERT IN ARRAY:C227(SDAG_at_UserInitials; Size of array:C274(SDAG_at_UserInitials)+1; 1)
				INSERT IN ARRAY:C227(SDAG_abo_UseAgenda; Size of array:C274(SDAG_abo_UseAgenda)+1; 1)
				SDAG_at_UserInitials{Size of array:C274(SDAG_at_UserInitials)}:=$_t_UserInitials
				SDAG_abo_UseAgenda{Size of array:C274(SDAG_abo_UseAgenda)}:=True:C214
				If (Count parameters:C259>=2)
					SDAG_abo_UseAgenda{Size of array:C274(SDAG_abo_UseAgenda)}:=$2
				End if 
				
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
					$0:=<>SD_bo_UseAgenda
					
				End if 
			End if 
			
			
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("SD_GetAgendaLicence"; $_t_oldMethodName)
