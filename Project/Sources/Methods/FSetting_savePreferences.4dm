//%attributes = {}
If (False:C215)
	//Project Method Name:      FSetting_savePreferences
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/10/2010 08:05
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(<>FS_al_FormSortDirection;0)
	//ARRAY LONGINT(<>FS_al_FormSortFieldNum;0)
	//ARRAY LONGINT(<>FS_al_FormSortTableNum;0)
	//ARRAY TEXT(<>FS_at_FormReference;0)
	//ARRAY TEXT(<>FS_at_FormSortTextLabelName;0)
	//ARRAY TEXT(<>FS_at_FormSortvariable;0)
	//ARRAY TEXT(<>FS_at_FormSortVarLabelName;0)
	C_BOOLEAN:C305(<>FS_bo_FSettingsLoaded; <>SYS_bo_QuitCalled; $_bo_OK)
	C_LONGINT:C283(<>l_FS_FieldNotIndexAlert; <>l_FS_FieldSortChangedAlert; $_l_Delay; $_l_GiveUp; $_l_offset; $_l_PersonID; $_l_PreferenceID; $_l_Repeats)
	C_POINTER:C301($2; $3; $4; $5; $6; $7; $8)
	C_TEXT:C284(<>PER_t_CurrentUserInitials; $_t_oldMethodName; $1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FSetting_savePreferences")  //this method is called as a process when the user exits
ON ERR CALL:C155("Error_Proc")
If (Not:C34(<>FS_bo_FSettingsLoaded))
	If (Not:C34(<>SYS_bo_QuitCalled))
		FSettings_loadPreferences(<>PER_t_CurrentUserInitials)
	End if 
End if 

If (<>FS_bo_FSettingsLoaded)
	If (Not:C34(<>SYS_bo_QuitCalled))
		While (Semaphore:C143("$WriteFormsortPref"))
			DelayTicks(2)
		End while 
	End if 
	READ ONLY:C145([PERSONNEL:11])
	If (Count parameters:C259>=7) | (True:C214)  //bsw 16/04/04 added true
		
		//NG...this is locking up the exit...but its not clear why so i have put a get out clause...
		$_l_GiveUp:=0
		If (Not:C34(<>SYS_bo_QuitCalled))
			While (Semaphore:C143("LoadingPrefsFSSave")) & ($_l_GiveUp<100)
				DelayTicks(2)
				$_l_GiveUp:=$_l_GiveUp+1
			End while 
		End if 
		$_l_PreferenceID:=PREF_GetPreferenceID("Form Sort Settings")
		
		CLEAR SEMAPHORE:C144("LoadingPrefsFSSave")
		
		
		If (<>PER_t_CurrentUserInitials#"") & (<>PER_t_CurrentUserInitials#"~SV")
			QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Initials:1=<>PER_t_CurrentUserInitials)
			$_l_PersonID:=[PERSONNEL:11]Personnel_ID:48
			READ WRITE:C146([PREFERENCES:116])
			QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=$_l_PreferenceID; *)
			QUERY:C277([PREFERENCES:116];  & ; [PREFERENCES:116]Pref_OwnerTable:3=Table:C252(->[PERSONNEL:11]); *)
			QUERY:C277([PREFERENCES:116];  & ; [PREFERENCES:116]Pref_OwnerID:4=$_l_PersonID)
			If (Records in selection:C76([PREFERENCES:116])>0)
				$_bo_OK:=False:C215
				$_l_Repeats:=0
				$_l_Delay:=1
				Repeat 
					$_l_Repeats:=$_l_Repeats+1
					$_bo_OK:=Check_Locked(->[PREFERENCES:116]; 1)
					If (Not:C34($_bo_OK))
						BEEP:C151
						If (($_l_Repeats/10)=(Int:C8($_l_Repeats/10)))
							//only increase every 10 tries
							$_l_Delay:=$_l_Delay+1  //increase the delay factor by 1
						End if 
						DelayTicks(2*$_l_Delay)
					End if 
				Until ($_bo_OK=True:C214)
				
			Else 
				READ WRITE:C146([PREFERENCES:116])
				
				CREATE RECORD:C68([PREFERENCES:116])
				[PREFERENCES:116]IDNumber:1:=$_l_PreferenceID
				[PREFERENCES:116]Pref_OwnerTable:3:=Table:C252(->[PERSONNEL:11])
				[PREFERENCES:116]Pref_OwnerID:4:=$_l_PersonID
				DB_SaveRecord(->[PREFERENCES:116])
			End if 
			
			If (Type:C295(<>FS_at_FormReference)#5) & (Type:C295(<>FS_al_FormSortDirection)#5) & (Type:C295(<>FS_al_FormSortFieldNum)#5) & (Type:C295(<>FS_al_FormSortTableNum)#5) & (Type:C295(<>FS_at_FormSortvariable)#5) & (Type:C295(<>FS_at_FormSortTextLabelName)#5) & (Type:C295(<>FS_at_FormSortVarLabelName)#5)
				SET BLOB SIZE:C606([PREFERENCES:116]DataBlob:2; 0)
				VARIABLE TO BLOB:C532(<>FS_at_FormReference; [PREFERENCES:116]DataBlob:2)
				VARIABLE TO BLOB:C532(<>FS_al_FormSortDirection; [PREFERENCES:116]DataBlob:2; *)
				VARIABLE TO BLOB:C532(<>FS_al_FormSortFieldNum; [PREFERENCES:116]DataBlob:2; *)
				VARIABLE TO BLOB:C532(<>FS_al_FormSortTableNum; [PREFERENCES:116]DataBlob:2; *)
				VARIABLE TO BLOB:C532(<>FS_at_FormSortvariable; [PREFERENCES:116]DataBlob:2; *)
				VARIABLE TO BLOB:C532(<>FS_at_FormSortTextLabelName; [PREFERENCES:116]DataBlob:2; *)
				VARIABLE TO BLOB:C532(<>FS_at_FormSortVarLabelName; [PREFERENCES:116]DataBlob:2; *)
				VARIABLE TO BLOB:C532(<>l_FS_FieldNotIndexAlert; [PREFERENCES:116]DataBlob:2; *)  //bsw 19/07/04
				VARIABLE TO BLOB:C532(<>l_FS_FieldSortChangedAlert; [PREFERENCES:116]DataBlob:2; *)  //bsw 20/07/04
				DB_SaveRecord(->[PREFERENCES:116])
				AA_CheckFileUnlocked(->[PERSONNEL:11]Personnel_ID:48)
				UNLOAD RECORD:C212([PREFERENCES:116])
				READ ONLY:C145([PREFERENCES:116])
			Else 
				Gen_Alert("Programming error, in save form prefs")
			End if 
		End if 
	End if 
	CLEAR SEMAPHORE:C144("$WriteFormsortPref")
	
End if 
ERR_MethodTrackerReturn("FSetting_savePreferences"; $_t_oldMethodName)