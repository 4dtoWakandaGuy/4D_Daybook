//%attributes = {}
If (False:C215)
	//Project Method Name:      SD2_LoadCurrentSchedules
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 26/01/2010 15:37
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY DATE(SD2_ad_EndDateRange;0)
	//ARRAY DATE(SD2_ad_StartDateRange;0)
	//ARRAY LONGINT(SD_al_INCpersonIDS;0)
	//ARRAY LONGINT(SD2_al_CurrentUserIDs;0)
	//ARRAY LONGINT(SD2_al_EndTimeRange;0)
	//ARRAY LONGINT(SD2_al_ExcludeDone;0)
	//ARRAY LONGINT(SD2_al_SearchUIDs;0)
	//ARRAY LONGINT(SD2_al_StartTimeRange;0)
	//ARRAY TEXT(SD_at_INCACTIONCODES;0)
	//ARRAY TEXT(SD2_at_LastAccessStamp;0)
	//ARRAY TEXT(SD2_at_MachineIDS;0)
	//ARRAY TEXT(SD2_at_PrioritesINC;0)
	//ARRAY TEXT(SD2_at_StatusINC;0)
	C_BOOLEAN:C305($_bo_Load; $_bo_OK; $1)
	C_LONGINT:C283($_l_CurrentRow; $_l_Delay; $_l_Index; $_l_ItemID; $_l_offset; $_l_Repeats; $_l_SizeofArray)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("SD2_LoadCurrentSchedules")

While (Semaphore:C143("$UIDRegisterUpdate"))
	DelayTicks(2)
End while 
$_l_ItemID:=PREF_GetPreferenceID("Current Schedules")

QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=$_l_ItemID)  //One record for the database
If (Records in selection:C76([PREFERENCES:116])>0)  //The preference exists
	$_bo_OK:=False:C215
	$_l_Repeats:=0
	$_l_Delay:=1
	Repeat 
		$_l_Repeats:=$_l_Repeats+1
		$_bo_OK:=Check_Locked(->[PREFERENCES:116]; 0)
		If (Not:C34($_bo_OK))
			If (($_l_Repeats/10)=(Int:C8($_l_Repeats/10)))
				//only increase every 10 tries
				$_l_Delay:=$_l_Delay+1  //increase the delay factor by 1
			End if 
			DelayTicks(2*$_l_Delay)
			
		End if 
	Until ($_bo_OK=True:C214)
	
End if 

If (Records in selection:C76([PREFERENCES:116])=0)
	//add the the preferences list here
	READ WRITE:C146([PREFERENCES:116])
	CREATE RECORD:C68([PREFERENCES:116])
	[PREFERENCES:116]IDNumber:1:=$_l_ItemID
	DB_SaveRecord(->[PREFERENCES:116])
	
End if 
$_bo_Load:=True:C214
If (Count parameters:C259>=1)
	$_bo_Load:=$1
End if 
If ($_bo_Load=False:C215)  // save updated values
	//NG -here we need to load the current version and merge it with the arrays because it may have been updated by other users
	READ WRITE:C146([PREFERENCES:116])
	While (Not:C34(Check_Locked(->[PREFERENCES:116]; 0)))
		DelayTicks(10)
		
	End while 
	SET BLOB SIZE:C606([PREFERENCES:116]DataBlob:2; 0)
	
	VARIABLE TO BLOB:C532(SD2_al_SearchUIDs; [PREFERENCES:116]DataBlob:2; *)
	VARIABLE TO BLOB:C532(SD2_at_MachineIDS; [PREFERENCES:116]DataBlob:2; *)
	VARIABLE TO BLOB:C532(SD2_al_CurrentUserIDs; [PREFERENCES:116]DataBlob:2; *)
	VARIABLE TO BLOB:C532(SD2_at_LastAccessStamp; [PREFERENCES:116]DataBlob:2; *)
	VARIABLE TO BLOB:C532(SD2_ad_StartDateRange; [PREFERENCES:116]DataBlob:2; *)
	VARIABLE TO BLOB:C532(SD2_ad_EndDateRange; [PREFERENCES:116]DataBlob:2; *)
	VARIABLE TO BLOB:C532(SD2_al_StartTimeRange; [PREFERENCES:116]DataBlob:2; *)
	VARIABLE TO BLOB:C532(SD2_al_EndTimeRange; [PREFERENCES:116]DataBlob:2; *)
	VARIABLE TO BLOB:C532(SD2_al_ExcludeDone; [PREFERENCES:116]DataBlob:2; *)
	$_l_SizeofArray:=Size of array:C274(SD2_al_SearchUIDs)
	For ($_l_Index; 1; $_l_SizeofArray)
		If ($_l_Index>Size of array:C274(SD2_at_PrioritesINC))
			INSERT IN ARRAY:C227(SD2_at_PrioritesINC; Size of array:C274(SD2_at_PrioritesINC)+1; 1)
		End if 
		VARIABLE TO BLOB:C532(SD2_at_PrioritesINC{$_l_Index}; [PREFERENCES:116]DataBlob:2; *)
	End for 
	For ($_l_Index; 1; $_l_SizeofArray)
		If ($_l_Index>Size of array:C274(SD2_at_StatusINC))
			INSERT IN ARRAY:C227(SD2_at_StatusINC; Size of array:C274(SD2_at_StatusINC)+1; 1)
		End if 
		VARIABLE TO BLOB:C532(SD2_at_StatusINC{$_l_Index}; [PREFERENCES:116]DataBlob:2; *)
	End for 
	For ($_l_Index; 1; $_l_SizeofArray)
		If ($_l_Index>Size of array:C274(SD_al_INCpersonIDS))
			INSERT IN ARRAY:C227(SD_al_INCpersonIDS; Size of array:C274(SD_al_INCpersonIDS)+1; 1)
		End if 
		VARIABLE TO BLOB:C532(SD_al_INCpersonIDS{$_l_Index}; [PREFERENCES:116]DataBlob:2; *)
	End for 
	For ($_l_Index; 1; $_l_SizeofArray)
		If ($_l_Index>Size of array:C274(SD_at_INCACTIONCODES))
			INSERT IN ARRAY:C227(SD_at_INCACTIONCODES; Size of array:C274(SD_at_INCACTIONCODES)+1; 1)
		End if 
		VARIABLE TO BLOB:C532(SD_at_INCACTIONCODES{$_l_Index}; [PREFERENCES:116]DataBlob:2; *)
	End for 
	DB_SaveRecord(->[PREFERENCES:116])
	UNLOAD RECORD:C212([PREFERENCES:116])
	READ ONLY:C145([PREFERENCES:116])
Else 
	$_l_offset:=0
	ARRAY LONGINT:C221(SD2_al_SearchUIDs; 0)  //List of Current Search window
	ARRAY TEXT:C222(SD2_at_MachineIDS; 0)  //machine ID..this can be used on logout to kill all for this machine(cannot use the User name)
	ARRAY LONGINT:C221(SD2_al_CurrentUserIDs; 0)
	ARRAY TEXT:C222(SD2_at_LASTACCESSSTAMP; 0)  //last data and time
	ARRAY DATE:C224(SD2_ad_StartDateRange; 0)
	ARRAY DATE:C224(SD2_ad_EndDateRange; 0)
	ARRAY LONGINT:C221(SD2_al_StartTimeRange; 0)
	ARRAY LONGINT:C221(SD2_al_EndTimeRange; 0)
	ARRAY LONGINT:C221(SD2_al_ExcludeDone; 0)
	//THE FOLLOWING ARE ALL 2D
	ARRAY TEXT:C222(SD2_at_PrioritesINC; 0; 0)  //note if this blank it means all
	ARRAY TEXT:C222(SD2_at_StatusINC; 0; 0)  //note if this blank it means all
	ARRAY LONGINT:C221(SD_al_INCpersonIDS; 0; 0)  //note this is 2D if blank just the Current User ID
	ARRAY TEXT:C222(SD_at_INCACTIONCODES; 0; 0)
	If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_offset)
		BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; SD2_al_SearchUIDs; $_l_offset)
		If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_offset)
			BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; SD2_at_MachineIDS; $_l_offset)
			If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_offset)
				BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; SD2_al_CurrentUserIDs; $_l_offset)
				If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_offset)
					BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; SD2_at_LastAccessStamp; $_l_offset)
					
					If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_offset)
						BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; SD2_ad_StartDateRange; $_l_offset)
						If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_offset)
							BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; SD2_ad_EndDateRange; $_l_offset)
							If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_offset)
								BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; SD2_al_StartTimeRange; $_l_offset)
								If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_offset)
									BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; SD2_al_EndTimeRange; $_l_offset)
									If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_offset)
										BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; SD2_al_ExcludeDone; $_l_offset)
										$_l_SizeofArray:=Size of array:C274(SD2_al_SearchUIDs)
										ARRAY TEXT:C222(SD2_at_PrioritesINC; $_l_SizeofArray; 0)  //note if this blank it means all
										ARRAY TEXT:C222(SD2_at_StatusINC; $_l_SizeofArray; 0)  //note if this blank it means all
										ARRAY LONGINT:C221(SD_al_INCpersonIDS; $_l_SizeofArray; 0)  //note this is 2D if blank just the Current User ID
										ARRAY TEXT:C222(SD_at_INCACTIONCODES; $_l_SizeofArray; 0)
										$_l_CurrentRow:=0
										For ($_l_Index; 1; $_l_SizeofArray)
											If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_offset)
												BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; SD2_at_PrioritesINC{$_l_Index}; $_l_offset)
											Else 
												$_l_Index:=$_l_SizeofArray
											End if 
										End for 
										For ($_l_Index; 1; $_l_SizeofArray)
											If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_offset)
												BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; SD2_at_StatusINC{$_l_Index}; $_l_offset)
											Else 
												$_l_Index:=$_l_SizeofArray
											End if 
										End for 
										For ($_l_Index; 1; $_l_SizeofArray)
											If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_offset)
												BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; SD_al_INCpersonIDS{$_l_Index}; $_l_offset)
											Else 
												$_l_Index:=$_l_SizeofArray
											End if 
										End for 
										For ($_l_Index; 1; $_l_SizeofArray)
											If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_offset)
												BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; SD_at_INCACTIONCODES{$_l_Index}; $_l_offset)
											Else 
												$_l_Index:=$_l_SizeofArray
											End if 
										End for 
										
									Else 
										$_l_SizeofArray:=Size of array:C274(SD2_al_SearchUIDs)
										ARRAY TEXT:C222(SD2_at_PrioritesINC; $_l_SizeofArray; 0)  //note if this blank it means all
										ARRAY TEXT:C222(SD2_at_StatusINC; $_l_SizeofArray; 0)  //note if this blank it means all
										ARRAY LONGINT:C221(SD_al_INCpersonIDS; $_l_SizeofArray; 0)  //note this is 2D if blank just the Current User ID
										ARRAY TEXT:C222(SD_at_INCACTIONCODES; $_l_SizeofArray; 0)
									End if 
								End if 
							End if 
						End if 
					End if 
				End if 
			End if 
		End if 
		$_l_SizeofArray:=Size of array:C274(SD2_al_SearchUIDs)
		ARRAY TEXT:C222(SD2_at_MachineIDS; $_l_SizeofArray)  //machine ID..this can be used on logout to kill all for this machine(cannot use the User name)
		ARRAY LONGINT:C221(SD2_al_CurrentUserIDs; $_l_SizeofArray)
		ARRAY TEXT:C222(SD2_at_LASTACCESSSTAMP; $_l_SizeofArray)  //last data and time
		ARRAY DATE:C224(SD2_ad_StartDateRange; $_l_SizeofArray)
		ARRAY DATE:C224(SD2_ad_EndDateRange; $_l_SizeofArray)
		ARRAY LONGINT:C221(SD2_al_StartTimeRange; $_l_SizeofArray)
		ARRAY LONGINT:C221(SD2_al_EndTimeRange; $_l_SizeofArray)
		ARRAY LONGINT:C221(SD2_al_ExcludeDone; $_l_SizeofArray)
		
	Else 
		
	End if 
End if 
UNLOAD RECORD:C212([PREFERENCES:116])
CLEAR SEMAPHORE:C144("$UIDRegisterUpdate")
ERR_MethodTrackerReturn("SD2_LoadCurrentSchedules"; $_t_oldMethodName)
