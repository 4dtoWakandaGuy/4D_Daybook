//%attributes = {}

If (False:C215)
	//Database Method Name:      SD2_LoadDiaryTypes
	//------------------ Method Notes ------------------
	//Description
	
	//Parameters
	//Declarations
	// ----------------------------------------------------
	//Project method Amendments
	//End Project method Amendments
	
	//------------------ Revision Control ----------------
End if 
//Variable Declarations
If (True:C214)
	//ARRAY INTEGER(SD2_aI_DiaryLocationsSEL;0)
	//ARRAY LONGINT(SD2_al_DiaryDone;0)
	//ARRAY LONGINT(SD2_al_DiaryLocations;0)
	//ARRAY LONGINT(SD2_al_DiaryTypeDiary;0)
	//ARRAY LONGINT(SD2_al_DiaryTypeIDS;0)
	//ARRAY LONGINT(SD2_al_DiaryTypeOriginal;0)
	//ARRAY LONGINT(SD2_AL_DiaryTypeSettings;0)
	//ARRAY LONGINT(SD2_al_DiaryTypeThreaded;0)
	//ARRAY TEXT(SD2_at_DiaryLocations;0)
	//ARRAY TEXT(SD2_at_DiaryTypes;0)
	C_BOOLEAN:C305(<>ProductionManager; $_bo_Load; $_bo_OK; $_bo_Save; $1; SD2_DiaryTypesLoaded)
	C_LONGINT:C283($_l_arraySize; $_l_Columns; $_l_Delay; $_l_Index; $_l_ItemID; $_l_ItemPosition; $_l_Offset; $_l_Repeats; SD2_l_actionID)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SD2_LoadDiaryTypes")
//NG--bit of confusion here-two methods created both creating action classes--see also SD2_LoadDiaryActionClasses
//NG September 2005

// New method to load diary action Types
While (Semaphore:C143("LoadingDiaryTypes"))
	DelayTicks
End while 
$_l_ItemID:=PREF_GetPreferenceID("Diary action Types")
QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=$_l_ItemID)  //One record for the database
If (Records in selection:C76([PREFERENCES:116])>0)
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
	$_bo_Load:=Not:C34($1)
End if 
If ($_bo_Load=False:C215)  // save updated values
	READ WRITE:C146([PREFERENCES:116])
	While (Not:C34(Check_Locked(->[PREFERENCES:116]; 0)))
		DelayTicks(10)
	End while 
	SET BLOB SIZE:C606([PREFERENCES:116]DataBlob:2; 0)
	//TRACE
	VARIABLE TO BLOB:C532(SD2_al_DiaryTypeIDS; [PREFERENCES:116]DataBlob:2; *)
	VARIABLE TO BLOB:C532(SD2_at_DiaryTypes; [PREFERENCES:116]DataBlob:2; *)
	VARIABLE TO BLOB:C532(SD2_al_DiaryTypeThreaded; [PREFERENCES:116]DataBlob:2; *)
	VARIABLE TO BLOB:C532(SD2_al_DiaryTypeOriginal; [PREFERENCES:116]DataBlob:2; *)
	VARIABLE TO BLOB:C532(SD2_al_DiaryTypeDiary; [PREFERENCES:116]DataBlob:2; *)
	VARIABLE TO BLOB:C532(SD2_al_DiaryDone; [PREFERENCES:116]DataBlob:2; *)
	
	For ($_l_Index; 1; Size of array:C274(SD2_at_DiaryTypes))
		VARIABLE TO BLOB:C532(SD2_AL_DiaryTypeSettings{$_l_Index}; [PREFERENCES:116]DataBlob:2; *)
	End for 
	DB_SaveRecord(->[PREFERENCES:116])
	
Else 
	$_l_Offset:=0
	If (Not:C34(SD2_DiaryTypesLoaded))
		ARRAY TEXT:C222(SD2_at_DiaryLocations; 0)
		ARRAY LONGINT:C221(SD2_al_DiaryLocations; 0)
		ARRAY INTEGER:C220(SD2_aI_DiaryLocationsSEL; 0)
		SD2_LoadDiaryLocations(->SD2_al_DiaryLocations; ->SD2_at_DiaryLocations)
		
		ARRAY LONGINT:C221(SD2_al_DiaryTypeIDS; 0)
		ARRAY TEXT:C222(SD2_at_DiaryTypes; 0)
		ARRAY LONGINT:C221(SD2_AL_DiaryTypeSettings; 0; 0)  //Appears in item settings
		ARRAY LONGINT:C221(SD2_al_DiaryTypeThreaded; 0)
		ARRAY LONGINT:C221(SD2_al_DiaryTypeOriginal; 0)
		ARRAY LONGINT:C221(SD2_al_DiaryTypeDiary; 0)
		ARRAY LONGINT:C221(SD2_al_DiaryDone; 0)
		
		If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_Offset)
			
			BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; SD2_al_DiaryTypeIDS; $_l_Offset)
			If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_Offset)
				BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; SD2_at_DiaryTypes; $_l_Offset)
				If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_Offset)
					BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; SD2_al_DiaryTypeThreaded; $_l_Offset)
					If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_Offset)
						BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; SD2_al_DiaryTypeOriginal; $_l_Offset)
						If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_Offset)
							BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; SD2_al_DiaryTypeDiary; $_l_Offset)
							If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_Offset)
								BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; SD2_al_DiaryDone; $_l_Offset)
								
								$_l_arraySize:=Size of array:C274(SD2_at_DiaryTypes)
								ARRAY LONGINT:C221(SD2_AL_DiaryTypeSettings; $_l_arraySize; 0)  //
								For ($_l_Index; 1; $_l_arraySize)
									If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_Offset)
										BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; SD2_AL_DiaryTypeSettings{$_l_Index}; $_l_Offset)
										
									Else 
										$_l_Index:=$_l_arraySize
									End if 
								End for 
							End if 
							
							
						End if 
					End if 
				End if 
			End if 
		End if 
		$_l_arraySize:=Size of array:C274(SD2_al_DiaryTypeIDS)
		ARRAY TEXT:C222(SD2_at_DiaryTypes; $_l_arraySize)
		$_l_Columns:=0
		For ($_l_Index; 1; Size of array:C274(SD2_AL_DiaryTypeSettings))
			If (Size of array:C274(SD2_AL_DiaryTypeSettings{$_l_Index})>$_l_Columns)
				$_l_Columns:=Size of array:C274(SD2_AL_DiaryTypeSettings{$_l_Index})
			End if 
		End for 
		
		ARRAY LONGINT:C221(SD2_AL_DiaryTypeSettings; $_l_arraySize; $_l_Columns)  //Appears in item settings
		ARRAY LONGINT:C221(SD2_al_DiaryTypeThreaded; $_l_arraySize)
		ARRAY LONGINT:C221(SD2_al_DiaryTypeOriginal; $_l_arraySize)
		ARRAY LONGINT:C221(SD2_al_DiaryTypeDiary; $_l_arraySize)
		ARRAY LONGINT:C221(SD2_al_DiaryDone; $_l_arraySize)
		
		SD2_DiaryTypesLoaded:=True:C214
	End if 
	//NG the following were being created by SD2_loadDiaryActionClasses-which is now defunct
	$_bo_Save:=False:C215
	$_l_ItemPosition:=Find in array:C230(SD2_at_DiaryTypes; "Scheduled items")
	If ($_l_ItemPosition<0)
		APPEND TO ARRAY:C911(SD2_al_DiaryTypeIDS; AA_GetNextID(->SD2_l_actionID))
		APPEND TO ARRAY:C911(SD2_at_DiaryTypes; "Scheduled Items")
		APPEND TO ARRAY:C911(SD2_al_DiaryTypethreaded; 0)
		APPEND TO ARRAY:C911(SD2_al_DiaryTypeOriginal; 0)
		APPEND TO ARRAY:C911(SD2_al_DiaryTypeDiary; 1)
		APPEND TO ARRAY:C911(SD2_al_DiaryDone; 1)
		INSERT IN ARRAY:C227(SD2_AL_DIARYTYPESETTINGS; Size of array:C274(SD2_AL_DiaryTypeSettings)+1; 1)
		APPEND TO ARRAY:C911(SD2_AL_DIARYTYPESETTINGS{Size of array:C274(SD2_AL_DIARYTYPESETTINGS)}; 1)
		$_bo_Save:=True:C214
		
	End if 
	$_l_ItemPosition:=Find in array:C230(SD2_at_DiaryTypes; "Work Flow Items")
	If ($_l_ItemPosition<0)
		$_l_ItemPosition:=Find in array:C230(SD2_at_DiaryTypes; "To Do Items")
		If ($_l_ItemPosition>0)
			SD2_at_DiaryTypes{$_l_ItemPosition}:="Work Flow Items"
		Else 
			APPEND TO ARRAY:C911(SD2_al_DiaryTypeIDS; AA_GetNextID(->SD2_l_actionID))
			APPEND TO ARRAY:C911(SD2_at_DiaryTypes; "Work Flow Items")
			APPEND TO ARRAY:C911(SD2_al_DiaryTypethreaded; 0)
			APPEND TO ARRAY:C911(SD2_al_DiaryTypeOriginal; 0)
			APPEND TO ARRAY:C911(SD2_al_DiaryTypeDiary; 1)
			APPEND TO ARRAY:C911(SD2_al_DiaryDone; 1)
			INSERT IN ARRAY:C227(SD2_AL_DIARYTYPESETTINGS; Size of array:C274(SD2_AL_DiaryTypeSettings)+1; 1)
			APPEND TO ARRAY:C911(SD2_AL_DIARYTYPESETTINGS{Size of array:C274(SD2_AL_DIARYTYPESETTINGS)}; 2)
		End if 
		$_bo_Save:=True:C214
	End if 
	$_l_ItemPosition:=Find in array:C230(SD2_at_DiaryTypes; "Notes Items")
	If ($_l_ItemPosition<0)
		APPEND TO ARRAY:C911(SD2_al_DiaryTypeIDS; AA_GetNextID(->SD2_l_actionID))
		APPEND TO ARRAY:C911(SD2_at_DiaryTypes; "Notes Items")
		APPEND TO ARRAY:C911(SD2_al_DiaryTypethreaded; 0)
		APPEND TO ARRAY:C911(SD2_al_DiaryTypeOriginal; 0)
		APPEND TO ARRAY:C911(SD2_al_DiaryTypeDiary; 1)
		APPEND TO ARRAY:C911(SD2_al_DiaryDone; 1)
		INSERT IN ARRAY:C227(SD2_AL_DIARYTYPESETTINGS; Size of array:C274(SD2_AL_DiaryTypeSettings)+1; 1)
		APPEND TO ARRAY:C911(SD2_AL_DIARYTYPESETTINGS{Size of array:C274(SD2_AL_DIARYTYPESETTINGS)}; 3)
		$_bo_Save:=True:C214
	End if 
	If (<>ProductionManager)  // if the production manager system
		$_l_ItemPosition:=Find in array:C230(SD2_at_DiaryTypes; "Production Batch Items")
		If ($_l_ItemPosition<0)
			APPEND TO ARRAY:C911(SD2_al_DiaryTypeIDS; AA_GetNextID(->SD2_l_actionID))
			APPEND TO ARRAY:C911(SD2_at_DiaryTypes; "Production Batch Items")
			APPEND TO ARRAY:C911(SD2_al_DiaryTypethreaded; 0)
			APPEND TO ARRAY:C911(SD2_al_DiaryTypeOriginal; 0)
			APPEND TO ARRAY:C911(SD2_al_DiaryTypeDiary; 1)
			APPEND TO ARRAY:C911(SD2_al_DiaryDone; 1)
			INSERT IN ARRAY:C227(SD2_AL_DIARYTYPESETTINGS; Size of array:C274(SD2_AL_DiaryTypeSettings)+1; 1)
			APPEND TO ARRAY:C911(SD2_AL_DIARYTYPESETTINGS{Size of array:C274(SD2_AL_DIARYTYPESETTINGS)}; 2)
			$_bo_Save:=True:C214
		End if 
		
	End if 
	If ($_bo_Save)
		CLEAR SEMAPHORE:C144("LoadingDiaryTypes")
		SD2_LoadDiaryTypes(True:C214)
		SD2_LoadDiaryTypes
		
	End if 
End if 

CLEAR SEMAPHORE:C144("LoadingDiaryTypes")
ERR_MethodTrackerReturn("SD2_LoadDiaryTypes"; $_t_oldMethodName)