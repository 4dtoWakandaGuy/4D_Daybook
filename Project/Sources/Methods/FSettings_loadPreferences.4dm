//%attributes = {}
If (False:C215)
	//Project Method Name:      FSettings_loadPreferences
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 08/11/2012 15:10
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
	//ARRAY LONGINT(FS_al_FormSortDirection;0)
	//ARRAY LONGINT(FS_al_FormSortFieldNum;0)
	//ARRAY LONGINT(FS_al_FormSortTableNum;0)
	//ARRAY TEXT(<>FS_at_FormReference;0)
	//ARRAY TEXT(<>FS_at_FormSortTextLabelName;0)
	//ARRAY TEXT(<>FS_at_FormSortvariable;0)
	//ARRAY TEXT(<>FS_at_FormSortVarLabelName;0)
	//ARRAY TEXT(FS_at_FormReferences;0)
	//ARRAY TEXT(FS_at_FormSortTextLabelName;0)
	//ARRAY TEXT(FS_at_FormSortvariable;0)
	//ARRAY TEXT(FS_at_FormSortvarLabelNames;0)
	//ARRAY TEXT(FS_S55_FormSortvariableLabelNam;0)
	C_BOOLEAN:C305(<>FS_bo_FSettingsLoaded; $_bo_Local; $_bo_OK; FS_bo_FSettingsLoaded)
	C_LONGINT:C283(<>l_FS_FieldNotIndexAlert; <>l_FS_FieldSortChangedAlert; $_l_Delay; $_l_offset; $_l_PersonID; $_l_PreferenceID; $_l_Repeats; l_FS_FieldNotIndexAlert; l_FS_FieldSortChangedAlert)
	C_TEXT:C284($_t_oldMethodName; $1; $2)
End if 

//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("FSettings_loadPreferences")
//pass this method one parameter
//the user initials
//this method will extract any existing data for form settings
While (Semaphore:C143("$WriteFormsortPref"))
	DelayTicks(2)
End while 
While (Semaphore:C143("LoadingPrefsFormSort"))
	DelayTicks(2)
End while 

$_l_PreferenceID:=PREF_GetPreferenceID("Form Sort Settings")
CLEAR SEMAPHORE:C144("LoadingPrefsFormSort")

If ([PERSONNEL:11]Initials:1#$1)
	QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Initials:1=$1)
End if 
$_l_PersonID:=[PERSONNEL:11]Personnel_ID:48

ON ERR CALL:C155("FSetting_DeletePreferences")
If (Count parameters:C259>=2)
	$_bo_Local:=($2="LOCAL")
Else 
	$_bo_Local:=False:C215
End if 
If ($_bo_Local=True:C214)
	//we are loading into this process-not in to local arrays-just partitioned to the current process.
	ARRAY TEXT:C222(FS_at_FormReferences; 0)
	ARRAY LONGINT:C221(FS_al_FormSortDirection; 0)
	ARRAY LONGINT:C221(FS_al_FormSortFieldNum; 0)
	ARRAY LONGINT:C221(FS_al_FormSortTableNum; 0)
	ARRAY TEXT:C222(FS_at_FormSortvariable; 0)
	ARRAY TEXT:C222(FS_at_FormSortTextLabelName; 0)
	ARRAY TEXT:C222(FS_at_FormSortvarLabelNames; 0)
Else 
	ARRAY TEXT:C222(<>FS_at_FormReference; 0)
	ARRAY LONGINT:C221(<>FS_al_FormSortDirection; 0)
	ARRAY LONGINT:C221(<>FS_al_FormSortFieldNum; 0)
	ARRAY LONGINT:C221(<>FS_al_FormSortTableNum; 0)
	ARRAY TEXT:C222(<>FS_at_FormSortvariable; 0)
	ARRAY TEXT:C222(<>FS_at_FormSortTextLabelName; 0)
	ARRAY TEXT:C222(<>FS_at_FormSortVarLabelName; 0)
End if 
QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=$_l_PreferenceID; *)
QUERY:C277([PREFERENCES:116];  & ; [PREFERENCES:116]Pref_OwnerTable:3=Table:C252(->[PERSONNEL:11]); *)
QUERY:C277([PREFERENCES:116];  & ; [PREFERENCES:116]Pref_OwnerID:4=$_l_PersonID)
If (Records in selection:C76([PREFERENCES:116])>0)
	If (Records in selection:C76([PREFERENCES:116])>0)
		$_bo_OK:=False:C215
		$_l_Repeats:=0
		$_l_Delay:=1
		Repeat 
			$_l_Repeats:=$_l_Repeats+1
			$_bo_OK:=Check_Locked(->[PREFERENCES:116]; 1)
			If (Not:C34($_bo_OK))
				If (($_l_Repeats/10)=(Int:C8($_l_Repeats/10)))
					//only increase every 10 tries
					$_l_Delay:=$_l_Delay+1  //increase the delay factor by 1
				End if 
				DelayTicks(2*$_l_Delay)
			End if 
		Until ($_bo_OK=True:C214)
	End if 
	
	If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>0)
		$_l_offset:=0
		If ($_bo_Local)
			BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; FS_at_FormReferences; $_l_offset)
			If (Type:C295(FS_at_FormReferences)=5)
				READ WRITE:C146([PREFERENCES:116])
				LOAD RECORD:C52([PREFERENCES:116])
				$_bo_OK:=False:C215
				SET BLOB SIZE:C606([PREFERENCES:116]DataBlob:2; 0)
				DB_SaveRecord(->[PREFERENCES:116])
				UNLOAD RECORD:C212([PREFERENCES:116])
				READ ONLY:C145([PREFERENCES:116])
				LOAD RECORD:C52([PREFERENCES:116])
				FSettings_loadPreferences($1)
			Else 
				BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; FS_al_FormSortDirection; $_l_offset)
				If (Type:C295(FS_al_FormSortDirection)=5)
					READ WRITE:C146([PREFERENCES:116])
					LOAD RECORD:C52([PREFERENCES:116])
					$_bo_OK:=False:C215
					
					SET BLOB SIZE:C606([PREFERENCES:116]DataBlob:2; 0)
					DB_SaveRecord(->[PREFERENCES:116])
					UNLOAD RECORD:C212([PREFERENCES:116])
					READ ONLY:C145([PREFERENCES:116])
					LOAD RECORD:C52([PREFERENCES:116])
					FSettings_loadPreferences($1)
				Else 
					BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; FS_al_FormSortFieldNum; $_l_offset)
					If (Type:C295(FS_al_FormSortFieldNum)=5)
						READ WRITE:C146([PREFERENCES:116])
						LOAD RECORD:C52([PREFERENCES:116])
						$_bo_OK:=False:C215
						
						SET BLOB SIZE:C606([PREFERENCES:116]DataBlob:2; 0)
						DB_SaveRecord(->[PREFERENCES:116])
						UNLOAD RECORD:C212([PREFERENCES:116])
						READ ONLY:C145([PREFERENCES:116])
						LOAD RECORD:C52([PREFERENCES:116])
						FSettings_loadPreferences($1)
					Else 
						BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; FS_al_FormSortTableNum; $_l_offset)
						If (Type:C295(FS_al_FormSortTableNum)=5)
							READ WRITE:C146([PREFERENCES:116])
							LOAD RECORD:C52([PREFERENCES:116])
							$_bo_OK:=False:C215
							
							SET BLOB SIZE:C606([PREFERENCES:116]DataBlob:2; 0)
							DB_SaveRecord(->[PREFERENCES:116])
							UNLOAD RECORD:C212([PREFERENCES:116])
							READ ONLY:C145([PREFERENCES:116])
							LOAD RECORD:C52([PREFERENCES:116])
							FSettings_loadPreferences($1)
						Else 
							BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; FS_at_FormSortvariable; $_l_offset)
							If (Type:C295(FS_at_FormSortvariable)=5)
								READ WRITE:C146([PREFERENCES:116])
								LOAD RECORD:C52([PREFERENCES:116])
								$_bo_OK:=False:C215
								
								SET BLOB SIZE:C606([PREFERENCES:116]DataBlob:2; 0)
								DB_SaveRecord(->[PREFERENCES:116])
								UNLOAD RECORD:C212([PREFERENCES:116])
								READ ONLY:C145([PREFERENCES:116])
								LOAD RECORD:C52([PREFERENCES:116])
								FSettings_loadPreferences($1)
							Else 
								BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; FS_at_FormSortTextLabelName; $_l_offset)
								If (Type:C295(FS_at_FormSortTextLabelName)=5)
									READ WRITE:C146([PREFERENCES:116])
									LOAD RECORD:C52([PREFERENCES:116])
									$_bo_OK:=False:C215
									
									SET BLOB SIZE:C606([PREFERENCES:116]DataBlob:2; 0)
									DB_SaveRecord(->[PREFERENCES:116])
									UNLOAD RECORD:C212([PREFERENCES:116])
									READ ONLY:C145([PREFERENCES:116])
									LOAD RECORD:C52([PREFERENCES:116])
									FSettings_loadPreferences($1)
								Else 
									BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; FS_at_FormSortvarLabelNames; $_l_offset)
									If (Type:C295(FS_at_FormSortvarLabelNames)=5)
										READ WRITE:C146([PREFERENCES:116])
										LOAD RECORD:C52([PREFERENCES:116])
										$_bo_OK:=False:C215
										
										SET BLOB SIZE:C606([PREFERENCES:116]DataBlob:2; 0)
										DB_SaveRecord(->[PREFERENCES:116])
										UNLOAD RECORD:C212([PREFERENCES:116])
										READ ONLY:C145([PREFERENCES:116])
										LOAD RECORD:C52([PREFERENCES:116])
										FSettings_loadPreferences($1)
									End if 
								End if 
							End if 
						End if 
					End if 
				End if 
			End if 
			BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; l_FS_FieldNotIndexAlert; $_l_offset)
			BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; l_FS_FieldSortChangedAlert; $_l_offset)
			
		Else 
			BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; <>FS_at_FormReference; $_l_offset)
			
			If (Type:C295(<>FS_at_FormReference)=5)
				READ WRITE:C146([PREFERENCES:116])
				LOAD RECORD:C52([PREFERENCES:116])
				$_bo_OK:=False:C215
				
				SET BLOB SIZE:C606([PREFERENCES:116]DataBlob:2; 0)
				DB_SaveRecord(->[PREFERENCES:116])
				UNLOAD RECORD:C212([PREFERENCES:116])
				READ ONLY:C145([PREFERENCES:116])
				LOAD RECORD:C52([PREFERENCES:116])
				FSettings_loadPreferences($1)
			Else 
				BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; <>FS_al_FormSortDirection; $_l_offset)
				If (Type:C295(<>FS_al_FormSortDirection)=5)
					READ WRITE:C146([PREFERENCES:116])
					LOAD RECORD:C52([PREFERENCES:116])
					$_bo_OK:=False:C215
					
					SET BLOB SIZE:C606([PREFERENCES:116]DataBlob:2; 0)
					DB_SaveRecord(->[PREFERENCES:116])
					UNLOAD RECORD:C212([PREFERENCES:116])
					READ ONLY:C145([PREFERENCES:116])
					LOAD RECORD:C52([PREFERENCES:116])
					FSettings_loadPreferences($1)
				Else 
					BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; <>FS_al_FormSortFieldNum; $_l_offset)
					If (Type:C295(<>FS_al_FormSortFieldNum)=5)
						READ WRITE:C146([PREFERENCES:116])
						LOAD RECORD:C52([PREFERENCES:116])
						$_bo_OK:=False:C215
						
						SET BLOB SIZE:C606([PREFERENCES:116]DataBlob:2; 0)
						DB_SaveRecord(->[PREFERENCES:116])
						UNLOAD RECORD:C212([PREFERENCES:116])
						READ ONLY:C145([PREFERENCES:116])
						LOAD RECORD:C52([PREFERENCES:116])
						FSettings_loadPreferences($1)
					Else 
						BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; <>FS_al_FormSortTableNum; $_l_offset)
						If (Type:C295(<>FS_al_FormSortTableNum)=5)
							READ WRITE:C146([PREFERENCES:116])
							LOAD RECORD:C52([PREFERENCES:116])
							$_bo_OK:=False:C215
							
							SET BLOB SIZE:C606([PREFERENCES:116]DataBlob:2; 0)
							DB_SaveRecord(->[PREFERENCES:116])
							UNLOAD RECORD:C212([PREFERENCES:116])
							READ ONLY:C145([PREFERENCES:116])
							LOAD RECORD:C52([PREFERENCES:116])
							FSettings_loadPreferences($1)
						Else 
							BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; <>FS_at_FormSortvariable; $_l_offset)
							If (Type:C295(<>FS_at_FormSortvariable)=5)
								READ WRITE:C146([PREFERENCES:116])
								LOAD RECORD:C52([PREFERENCES:116])
								$_bo_OK:=False:C215
								
								SET BLOB SIZE:C606([PREFERENCES:116]DataBlob:2; 0)
								DB_SaveRecord(->[PREFERENCES:116])
								UNLOAD RECORD:C212([PREFERENCES:116])
								READ ONLY:C145([PREFERENCES:116])
								LOAD RECORD:C52([PREFERENCES:116])
								FSettings_loadPreferences($1)
							Else 
								BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; <>FS_at_FormSortTextLabelName; $_l_offset)
								If (Type:C295(<>FS_at_FormSortTextLabelName)=5)
									READ WRITE:C146([PREFERENCES:116])
									LOAD RECORD:C52([PREFERENCES:116])
									$_bo_OK:=False:C215
									
									SET BLOB SIZE:C606([PREFERENCES:116]DataBlob:2; 0)
									DB_SaveRecord(->[PREFERENCES:116])
									UNLOAD RECORD:C212([PREFERENCES:116])
									READ ONLY:C145([PREFERENCES:116])
									LOAD RECORD:C52([PREFERENCES:116])
									FSettings_loadPreferences($1)
								Else 
									BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; <>FS_at_FormSortVarLabelName; $_l_offset)
									If (Type:C295(<>FS_at_FormSortVarLabelName)=5)
										READ WRITE:C146([PREFERENCES:116])
										LOAD RECORD:C52([PREFERENCES:116])
										$_bo_OK:=False:C215
										
										SET BLOB SIZE:C606([PREFERENCES:116]DataBlob:2; 0)
										DB_SaveRecord(->[PREFERENCES:116])
										UNLOAD RECORD:C212([PREFERENCES:116])
										READ ONLY:C145([PREFERENCES:116])
										LOAD RECORD:C52([PREFERENCES:116])
										FSettings_loadPreferences($1)
									End if 
								End if 
							End if 
						End if 
					End if 
				End if 
			End if 
			BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; <>l_FS_FieldNotIndexAlert; $_l_offset)  //bsw 19/07/04
			BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; <>l_FS_FieldSortChangedAlert; $_l_offset)  //bsw 20/07/04
		End if 
	End if 
	
Else 
	If ($_bo_Local)
		If (BLOB size:C605([PERSONNEL:11]FormSettingsBLOB:40)>0)
			$_l_offset:=0
			BLOB TO VARIABLE:C533([PERSONNEL:11]FormSettingsBLOB:40; FS_at_FormReferences; $_l_offset)
			If (Type:C295(FS_at_FormReferences)=5)
				READ WRITE:C146([PERSONNEL:11])
				LOAD RECORD:C52([PERSONNEL:11])
				$_bo_OK:=False:C215
				If (Records in selection:C76([PREFERENCES:116])>0)
					$_bo_OK:=False:C215
					$_l_Repeats:=0
					$_l_Delay:=1
					Repeat 
						$_l_Repeats:=$_l_Repeats+1
						$_bo_OK:=Check_Locked(->[PERSONNEL:11]; 1)
						If (Not:C34($_bo_OK))
							If (($_l_Repeats/10)=(Int:C8($_l_Repeats/10)))
								//only increase every 10 tries
								$_l_Delay:=$_l_Delay+1  //increase the delay factor by 1
							End if 
							DelayTicks(2*$_l_Delay)
						End if 
					Until ($_bo_OK=True:C214)
				End if 
				SET BLOB SIZE:C606([PERSONNEL:11]FormSettingsBLOB:40; 0)
				DB_SaveRecord(->[PERSONNEL:11])
				AA_CheckFileUnlocked(->[PERSONNEL:11]Personnel_ID:48)
				UNLOAD RECORD:C212([PERSONNEL:11])
				READ ONLY:C145([PERSONNEL:11])
				LOAD RECORD:C52([PERSONNEL:11])
				FSettings_loadPreferences($1)
			Else 
				BLOB TO VARIABLE:C533([PERSONNEL:11]FormSettingsBLOB:40; FS_al_FormSortDirection; $_l_offset)
				If (Type:C295(FS_al_FormSortDirection)=5)
					READ WRITE:C146([PERSONNEL:11])
					$_bo_OK:=False:C215
					$_l_Repeats:=0
					$_l_Delay:=1
					Repeat 
						$_l_Repeats:=$_l_Repeats+1
						$_bo_OK:=Check_Locked(->[PERSONNEL:11]; 1)
						If (Not:C34($_bo_OK))
							If (($_l_Repeats/10)=(Int:C8($_l_Repeats/10)))
								//only increase every 10 tries
								$_l_Delay:=$_l_Delay+1  //increase the delay factor by 1
							End if 
							DelayTicks(2*$_l_Delay)
						End if 
					Until ($_bo_OK=True:C214)
					
					SET BLOB SIZE:C606([PERSONNEL:11]FormSettingsBLOB:40; 0)
					DB_SaveRecord(->[PERSONNEL:11])
					AA_CheckFileUnlocked(->[PERSONNEL:11]Personnel_ID:48)
					UNLOAD RECORD:C212([PERSONNEL:11])
					READ ONLY:C145([PERSONNEL:11])
					LOAD RECORD:C52([PERSONNEL:11])
					FSettings_loadPreferences($1)
				Else 
					BLOB TO VARIABLE:C533([PERSONNEL:11]FormSettingsBLOB:40; FS_al_FormSortFieldNum; $_l_offset)
					If (Type:C295(FS_al_FormSortFieldNum)=5)
						READ WRITE:C146([PERSONNEL:11])
						$_bo_OK:=False:C215
						$_l_Repeats:=0
						$_l_Delay:=1
						Repeat 
							$_l_Repeats:=$_l_Repeats+1
							$_bo_OK:=Check_Locked(->[PERSONNEL:11]; 1)
							If (Not:C34($_bo_OK))
								If (($_l_Repeats/10)=(Int:C8($_l_Repeats/10)))
									//only increase every 10 tries
									$_l_Delay:=$_l_Delay+1  //increase the delay factor by 1
								End if 
								DelayTicks(2*$_l_Delay)
							End if 
						Until ($_bo_OK=True:C214)
						SET BLOB SIZE:C606([PERSONNEL:11]FormSettingsBLOB:40; 0)
						DB_SaveRecord(->[PERSONNEL:11])
						AA_CheckFileUnlocked(->[PERSONNEL:11]Personnel_ID:48)
						UNLOAD RECORD:C212([PERSONNEL:11])
						READ ONLY:C145([PERSONNEL:11])
						LOAD RECORD:C52([PERSONNEL:11])
						FSettings_loadPreferences($1)
					Else 
						BLOB TO VARIABLE:C533([PERSONNEL:11]FormSettingsBLOB:40; FS_al_FormSortTableNum; $_l_offset)
						If (Type:C295(FS_al_FormSortTableNum)=5)
							READ WRITE:C146([PERSONNEL:11])
							$_bo_OK:=False:C215
							$_l_Repeats:=0
							$_l_Delay:=1
							Repeat 
								$_l_Repeats:=$_l_Repeats+1
								$_bo_OK:=Check_Locked(->[PERSONNEL:11]; 1)
								If (Not:C34($_bo_OK))
									If (($_l_Repeats/10)=(Int:C8($_l_Repeats/10)))
										//only increase every 10 tries
										$_l_Delay:=$_l_Delay+1  //increase the delay factor by 1
									End if 
									DelayTicks(2*$_l_Delay)
								End if 
							Until ($_bo_OK=True:C214)
							SET BLOB SIZE:C606([PERSONNEL:11]FormSettingsBLOB:40; 0)
							DB_SaveRecord(->[PERSONNEL:11])
							AA_CheckFileUnlocked(->[PERSONNEL:11]Personnel_ID:48)
							UNLOAD RECORD:C212([PERSONNEL:11])
							READ ONLY:C145([PERSONNEL:11])
							LOAD RECORD:C52([PERSONNEL:11])
							FSettings_loadPreferences($1)
						Else 
							BLOB TO VARIABLE:C533([PERSONNEL:11]FormSettingsBLOB:40; FS_at_FormSortvariable; $_l_offset)
							If (Type:C295(FS_at_FormSortvariable)=5)
								READ WRITE:C146([PERSONNEL:11])
								$_bo_OK:=False:C215
								$_l_Repeats:=0
								$_l_Delay:=1
								Repeat 
									$_l_Repeats:=$_l_Repeats+1
									$_bo_OK:=Check_Locked(->[PERSONNEL:11]; 1)
									If (Not:C34($_bo_OK))
										If (($_l_Repeats/10)=(Int:C8($_l_Repeats/10)))
											//only increase every 10 tries
											$_l_Delay:=$_l_Delay+1  //increase the delay factor by 1
										End if 
										DelayTicks(2*$_l_Delay)
									End if 
								Until ($_bo_OK=True:C214)
								SET BLOB SIZE:C606([PERSONNEL:11]FormSettingsBLOB:40; 0)
								DB_SaveRecord(->[PERSONNEL:11])
								AA_CheckFileUnlocked(->[PERSONNEL:11]Personnel_ID:48)
								UNLOAD RECORD:C212([PERSONNEL:11])
								READ ONLY:C145([PERSONNEL:11])
								LOAD RECORD:C52([PERSONNEL:11])
								FSettings_loadPreferences($1)
							Else 
								BLOB TO VARIABLE:C533([PERSONNEL:11]FormSettingsBLOB:40; FS_at_FormSortTextLabelName; $_l_offset)
								If (Type:C295(FS_at_FormSortTextLabelName)=5)
									READ WRITE:C146([PERSONNEL:11])
									$_bo_OK:=False:C215
									$_l_Repeats:=0
									$_l_Delay:=1
									Repeat 
										$_l_Repeats:=$_l_Repeats+1
										$_bo_OK:=Check_Locked(->[PERSONNEL:11]; 1)
										If (Not:C34($_bo_OK))
											If (($_l_Repeats/10)=(Int:C8($_l_Repeats/10)))
												//only increase every 10 tries
												$_l_Delay:=$_l_Delay+1  //increase the delay factor by 1
											End if 
											DelayTicks(2*$_l_Delay)
										End if 
									Until ($_bo_OK=True:C214)
									SET BLOB SIZE:C606([PERSONNEL:11]FormSettingsBLOB:40; 0)
									DB_SaveRecord(->[PERSONNEL:11])
									AA_CheckFileUnlocked(->[PERSONNEL:11]Personnel_ID:48)
									UNLOAD RECORD:C212([PERSONNEL:11])
									READ ONLY:C145([PERSONNEL:11])
									LOAD RECORD:C52([PERSONNEL:11])
									FSettings_loadPreferences($1)
								Else 
									BLOB TO VARIABLE:C533([PERSONNEL:11]FormSettingsBLOB:40; FS_at_FormSortvarLabelNames; $_l_offset)
									If (Type:C295(FS_at_FormSortvarLabelNames)=5)
										READ WRITE:C146([PERSONNEL:11])
										$_bo_OK:=False:C215
										$_l_Repeats:=0
										$_l_Delay:=1
										Repeat 
											$_l_Repeats:=$_l_Repeats+1
											$_bo_OK:=Check_Locked(->[PERSONNEL:11]; 1)
											If (Not:C34($_bo_OK))
												If (($_l_Repeats/10)=(Int:C8($_l_Repeats/10)))
													//only increase every 10 tries
													$_l_Delay:=$_l_Delay+1  //increase the delay factor by 1
												End if 
												DelayTicks(2*$_l_Delay)
											End if 
										Until ($_bo_OK=True:C214)
										SET BLOB SIZE:C606([PERSONNEL:11]FormSettingsBLOB:40; 0)
										DB_SaveRecord(->[PERSONNEL:11])
										AA_CheckFileUnlocked(->[PERSONNEL:11]Personnel_ID:48)
										UNLOAD RECORD:C212([PERSONNEL:11])
										READ ONLY:C145([PERSONNEL:11])
										LOAD RECORD:C52([PERSONNEL:11])
										FSettings_loadPreferences($1)
									End if 
								End if 
							End if 
						End if 
					End if 
				End if 
			End if 
			BLOB TO VARIABLE:C533([PERSONNEL:11]FormSettingsBLOB:40; l_FS_FieldNotIndexAlert; $_l_offset)  //bsw 19/07/04
			BLOB TO VARIABLE:C533([PERSONNEL:11]FormSettingsBLOB:40; l_FS_FieldSortChangedAlert; $_l_offset)  //bsw 20/07/04
			
		End if 
		
	Else 
		If (BLOB size:C605([PERSONNEL:11]FormSettingsBLOB:40)>0)
			$_l_offset:=0
			BLOB TO VARIABLE:C533([PERSONNEL:11]FormSettingsBLOB:40; <>FS_at_FormReference; $_l_offset)
			If (Type:C295(<>FS_at_FormReference)=5)
				READ WRITE:C146([PERSONNEL:11])
				LOAD RECORD:C52([PERSONNEL:11])
				$_bo_OK:=False:C215
				If (Records in selection:C76([PREFERENCES:116])>0)
					$_bo_OK:=False:C215
					$_l_Repeats:=0
					$_l_Delay:=1
					Repeat 
						$_l_Repeats:=$_l_Repeats+1
						$_bo_OK:=Check_Locked(->[PERSONNEL:11]; 1)
						If (Not:C34($_bo_OK))
							If (($_l_Repeats/10)=(Int:C8($_l_Repeats/10)))
								//only increase every 10 tries
								$_l_Delay:=$_l_Delay+1  //increase the delay factor by 1
							End if 
							DelayTicks(2*$_l_Delay)
						End if 
					Until ($_bo_OK=True:C214)
				End if 
				SET BLOB SIZE:C606([PERSONNEL:11]FormSettingsBLOB:40; 0)
				DB_SaveRecord(->[PERSONNEL:11])
				AA_CheckFileUnlocked(->[PERSONNEL:11]Personnel_ID:48)
				UNLOAD RECORD:C212([PERSONNEL:11])
				READ ONLY:C145([PERSONNEL:11])
				LOAD RECORD:C52([PERSONNEL:11])
				FSettings_loadPreferences($1)
			Else 
				BLOB TO VARIABLE:C533([PERSONNEL:11]FormSettingsBLOB:40; <>FS_al_FormSortDirection; $_l_offset)
				If (Type:C295(<>FS_al_FormSortDirection)=5)
					READ WRITE:C146([PERSONNEL:11])
					$_bo_OK:=False:C215
					$_l_Repeats:=0
					$_l_Delay:=1
					Repeat 
						$_l_Repeats:=$_l_Repeats+1
						$_bo_OK:=Check_Locked(->[PERSONNEL:11]; 1)
						If (Not:C34($_bo_OK))
							If (($_l_Repeats/10)=(Int:C8($_l_Repeats/10)))
								//only increase every 10 tries
								$_l_Delay:=$_l_Delay+1  //increase the delay factor by 1
							End if 
							DelayTicks(2*$_l_Delay)
						End if 
					Until ($_bo_OK=True:C214)
					
					SET BLOB SIZE:C606([PERSONNEL:11]FormSettingsBLOB:40; 0)
					DB_SaveRecord(->[PERSONNEL:11])
					AA_CheckFileUnlocked(->[PERSONNEL:11]Personnel_ID:48)
					UNLOAD RECORD:C212([PERSONNEL:11])
					READ ONLY:C145([PERSONNEL:11])
					LOAD RECORD:C52([PERSONNEL:11])
					FSettings_loadPreferences($1)
				Else 
					BLOB TO VARIABLE:C533([PERSONNEL:11]FormSettingsBLOB:40; <>FS_al_FormSortFieldNum; $_l_offset)
					If (Type:C295(<>FS_al_FormSortFieldNum)=5)
						READ WRITE:C146([PERSONNEL:11])
						$_bo_OK:=False:C215
						$_l_Repeats:=0
						$_l_Delay:=1
						Repeat 
							$_l_Repeats:=$_l_Repeats+1
							$_bo_OK:=Check_Locked(->[PERSONNEL:11]; 1)
							If (Not:C34($_bo_OK))
								If (($_l_Repeats/10)=(Int:C8($_l_Repeats/10)))
									//only increase every 10 tries
									$_l_Delay:=$_l_Delay+1  //increase the delay factor by 1
								End if 
								DelayTicks(2*$_l_Delay)
							End if 
						Until ($_bo_OK=True:C214)
						SET BLOB SIZE:C606([PERSONNEL:11]FormSettingsBLOB:40; 0)
						DB_SaveRecord(->[PERSONNEL:11])
						AA_CheckFileUnlocked(->[PERSONNEL:11]Personnel_ID:48)
						UNLOAD RECORD:C212([PERSONNEL:11])
						READ ONLY:C145([PERSONNEL:11])
						LOAD RECORD:C52([PERSONNEL:11])
						FSettings_loadPreferences($1)
					Else 
						BLOB TO VARIABLE:C533([PERSONNEL:11]FormSettingsBLOB:40; <>FS_al_FormSortTableNum; $_l_offset)
						If (Type:C295(<>FS_al_FormSortTableNum)=5)
							READ WRITE:C146([PERSONNEL:11])
							$_bo_OK:=False:C215
							$_l_Repeats:=0
							$_l_Delay:=1
							Repeat 
								$_l_Repeats:=$_l_Repeats+1
								$_bo_OK:=Check_Locked(->[PERSONNEL:11]; 1)
								If (Not:C34($_bo_OK))
									If (($_l_Repeats/10)=(Int:C8($_l_Repeats/10)))
										//only increase every 10 tries
										$_l_Delay:=$_l_Delay+1  //increase the delay factor by 1
									End if 
									DelayTicks(2*$_l_Delay)
								End if 
							Until ($_bo_OK=True:C214)
							SET BLOB SIZE:C606([PERSONNEL:11]FormSettingsBLOB:40; 0)
							DB_SaveRecord(->[PERSONNEL:11])
							AA_CheckFileUnlocked(->[PERSONNEL:11]Personnel_ID:48)
							UNLOAD RECORD:C212([PERSONNEL:11])
							READ ONLY:C145([PERSONNEL:11])
							LOAD RECORD:C52([PERSONNEL:11])
							FSettings_loadPreferences($1)
						Else 
							BLOB TO VARIABLE:C533([PERSONNEL:11]FormSettingsBLOB:40; <>FS_at_FormSortvariable; $_l_offset)
							If (Type:C295(<>FS_at_FormSortvariable)=5)
								READ WRITE:C146([PERSONNEL:11])
								$_bo_OK:=False:C215
								$_l_Repeats:=0
								$_l_Delay:=1
								Repeat 
									$_l_Repeats:=$_l_Repeats+1
									$_bo_OK:=Check_Locked(->[PERSONNEL:11]; 1)
									If (Not:C34($_bo_OK))
										If (($_l_Repeats/10)=(Int:C8($_l_Repeats/10)))
											//only increase every 10 tries
											$_l_Delay:=$_l_Delay+1  //increase the delay factor by 1
										End if 
										DelayTicks(2*$_l_Delay)
									End if 
								Until ($_bo_OK=True:C214)
								SET BLOB SIZE:C606([PERSONNEL:11]FormSettingsBLOB:40; 0)
								DB_SaveRecord(->[PERSONNEL:11])
								AA_CheckFileUnlocked(->[PERSONNEL:11]Personnel_ID:48)
								UNLOAD RECORD:C212([PERSONNEL:11])
								READ ONLY:C145([PERSONNEL:11])
								LOAD RECORD:C52([PERSONNEL:11])
								FSettings_loadPreferences($1)
							Else 
								BLOB TO VARIABLE:C533([PERSONNEL:11]FormSettingsBLOB:40; <>FS_at_FormSortTextLabelName; $_l_offset)
								If (Type:C295(<>FS_at_FormSortTextLabelName)=5)
									READ WRITE:C146([PERSONNEL:11])
									$_bo_OK:=False:C215
									$_l_Repeats:=0
									$_l_Delay:=1
									Repeat 
										$_l_Repeats:=$_l_Repeats+1
										$_bo_OK:=Check_Locked(->[PERSONNEL:11]; 1)
										If (Not:C34($_bo_OK))
											If (($_l_Repeats/10)=(Int:C8($_l_Repeats/10)))
												//only increase every 10 tries
												$_l_Delay:=$_l_Delay+1  //increase the delay factor by 1
											End if 
											DelayTicks(2*$_l_Delay)
										End if 
									Until ($_bo_OK=True:C214)
									SET BLOB SIZE:C606([PERSONNEL:11]FormSettingsBLOB:40; 0)
									DB_SaveRecord(->[PERSONNEL:11])
									AA_CheckFileUnlocked(->[PERSONNEL:11]Personnel_ID:48)
									UNLOAD RECORD:C212([PERSONNEL:11])
									READ ONLY:C145([PERSONNEL:11])
									LOAD RECORD:C52([PERSONNEL:11])
									FSettings_loadPreferences($1)
								Else 
									BLOB TO VARIABLE:C533([PERSONNEL:11]FormSettingsBLOB:40; <>FS_at_FormSortVarLabelName; $_l_offset)
									If (Type:C295(<>FS_al_FormSortDirection)=5)
										READ WRITE:C146([PERSONNEL:11])
										$_bo_OK:=False:C215
										$_l_Repeats:=0
										$_l_Delay:=1
										Repeat 
											$_l_Repeats:=$_l_Repeats+1
											$_bo_OK:=Check_Locked(->[PERSONNEL:11]; 1)
											If (Not:C34($_bo_OK))
												If (($_l_Repeats/10)=(Int:C8($_l_Repeats/10)))
													//only increase every 10 tries
													$_l_Delay:=$_l_Delay+1  //increase the delay factor by 1
												End if 
												DelayTicks(2*$_l_Delay)
											End if 
										Until ($_bo_OK=True:C214)
										SET BLOB SIZE:C606([PERSONNEL:11]FormSettingsBLOB:40; 0)
										DB_SaveRecord(->[PERSONNEL:11])
										AA_CheckFileUnlocked(->[PERSONNEL:11]Personnel_ID:48)
										UNLOAD RECORD:C212([PERSONNEL:11])
										READ ONLY:C145([PERSONNEL:11])
										LOAD RECORD:C52([PERSONNEL:11])
										FSettings_loadPreferences($1)
									End if 
								End if 
							End if 
						End if 
					End if 
				End if 
			End if 
			BLOB TO VARIABLE:C533([PERSONNEL:11]FormSettingsBLOB:40; <>l_FS_FieldNotIndexAlert; $_l_offset)  //bsw 19/07/04
			BLOB TO VARIABLE:C533([PERSONNEL:11]FormSettingsBLOB:40; <>l_FS_FieldSortChangedAlert; $_l_offset)  //bsw 20/07/04
			
		End if 
	End if 
End if 

If ($_bo_Local)
	FS_bo_FSettingsLoaded:=True:C214
Else 
	<>FS_bo_FSettingsLoaded:=True:C214
End if 
CLEAR SEMAPHORE:C144("$WriteFormsortPref")

ON ERR CALL:C155("")
ERR_MethodTrackerReturn("FSettings_loadPreferences"; $_t_oldMethodName)