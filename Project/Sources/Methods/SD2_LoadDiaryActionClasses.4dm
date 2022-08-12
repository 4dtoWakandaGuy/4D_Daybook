//%attributes = {}
If (False:C215)
	//Project Method Name:      SD2_LoadDiaryActionClasses
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(SD_al_ActionTable;0)
	//ARRAY LONGINT(SD2_al_ActionInDone;0)
	//ARRAY LONGINT(SD2_al_ActionInSchedule;0)
	//ARRAY LONGINT(SD2_al_ActionInWorkflow;0)
	//ARRAY LONGINT(SD2_al_DiaryActionClassIDs;0)
	//ARRAY TEXT(SD2_at_DiaryActionClasses;0)
	C_BOOLEAN:C305($_bo_Load; $_bo_OK; $1)
	C_LONGINT:C283($_l_Delay; $_l_Index; $_l_IndextemID; $_l_offset; $_l_Repeats; $_l_SizeofArray; SD2_l_ActionID)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SD2_LoadDiaryActionClasses")
//NG March 2005
// New method to load diary action classes
If (False:C215)  //Until done
	While (Semaphore:C143("LoadingActionClasses"))
		DelayTicks
	End while 
	$_l_IndextemID:=PREF_GetPreferenceID("Diary Action Types")
	
	QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=$_l_IndextemID)  //One record for the database
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
	
	If (Records in selection:C76([PREFERENCES:116])=0)
		//add the the preferences list here
		READ WRITE:C146([PREFERENCES:116])
		CREATE RECORD:C68([PREFERENCES:116])
		[PREFERENCES:116]IDNumber:1:=$_l_IndextemID
		DB_SaveRecord(->[PREFERENCES:116])
	End if 
	$_bo_Load:=True:C214
	If (Count parameters:C259>=1)
		$_bo_Load:=$1
	End if 
	If ($_bo_Load=False:C215)  // save updated values
		READ WRITE:C146([PREFERENCES:116])
		LOAD RECORD:C52([PREFERENCES:116])
		SET BLOB SIZE:C606([PREFERENCES:116]DataBlob:2; 0)
		VARIABLE TO BLOB:C532(SD2_al_DiaryActionClassIDs; [PREFERENCES:116]DataBlob:2; *)
		VARIABLE TO BLOB:C532(SD2_at_DiaryActionClasses; [PREFERENCES:116]DataBlob:2; *)
		VARIABLE TO BLOB:C532(SD2_al_ActionInSchedule; [PREFERENCES:116]DataBlob:2; *)
		VARIABLE TO BLOB:C532(SD2_al_ActionInWorkflow; [PREFERENCES:116]DataBlob:2; *)
		VARIABLE TO BLOB:C532(SD2_al_ActionInDone; [PREFERENCES:116]DataBlob:2; *)
		For ($_l_Index; 1; Size of array:C274(SD_al_ActionTable))
			VARIABLE TO BLOB:C532(SD_al_ActionTable{$_l_Index}; [PREFERENCES:116]DataBlob:2; *)
		End for 
		SAVE RECORD:C53([PREFERENCES:116])
		DB_SaveRecord(->[PREFERENCES:116])
		
	Else 
		$_l_offset:=0
		ARRAY LONGINT:C221(SD2_al_DiaryActionClassIDs; 0)
		ARRAY TEXT:C222(SD2_at_DiaryActionClasses; 0)
		ARRAY LONGINT:C221(SD2_al_ActionInSchedule; 0)  //Item in schedule
		ARRAY LONGINT:C221(SD2_al_ActionInWorkflow; 0)  // Item is worklow
		ARRAY LONGINT:C221(SD2_al_ActionInDone; 0)  // Item is for done items
		ARRAY LONGINT:C221(SD_al_ActionTable; 0; 0)
		If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_offset)
			BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; SD2_al_DiaryActionClassIDs; $_l_offset)
			If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_offset)
				BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; SD2_at_DiaryActionClasses; $_l_offset)
				If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_offset)
					BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; SD2_al_ActionInSchedule; $_l_offset)
					If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_offset)
						BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; SD2_al_ActionInWorkflow; $_l_offset)
						If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_offset)
							BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; SD2_al_ActionInDone; $_l_offset)
							$_l_SizeofArray:=Size of array:C274(SD2_al_DiaryActionClassIDs)
							//Just to make sure everything is the same size
							ARRAY TEXT:C222(SD2_at_DiaryActionClasses; $_l_SizeofArray)
							ARRAY LONGINT:C221(SD2_al_ActionInSchedule; $_l_SizeofArray)  //Item in schedule
							ARRAY LONGINT:C221(SD2_al_ActionInWorkflow; $_l_SizeofArray)  // Item is worklow
							ARRAY LONGINT:C221(SD2_al_ActionInDone; $_l_SizeofArray)  // Item is for done items
							ARRAY LONGINT:C221(SD_Al_ActionTable; $_l_SizeofArray; 0)
							//Note this last array is two dimensional
							For ($_l_Index; 1; $_l_SizeofArray)
								If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_offset)
									BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; SD_Al_ActionTable{$_l_Index}; $_l_offset)
								Else 
									$_l_Index:=$_l_SizeofArray
								End if 
							End for 
							//if the applicable tables array is empty then it is all tables
						End if 
					End if 
				End if 
			End if 
		End if 
		$_l_SizeofArray:=Size of array:C274(SD2_al_DiaryActionClassIDs)
		For ($_l_Index; 1; $_l_SizeofArray)
			If (SD2_al_DiaryActionClassIDs{$_l_Index}=0)
				
				SD2_al_DiaryActionClassIDs{$_l_Index}:=AA_GetNextID(->SD2_l_ActionID)
			End if 
			
		End for 
		
		If (Size of array:C274(SD2_al_DiaryActionClassIDs)=0)
			ARRAY LONGINT:C221(SD2_al_DiaryActionClassIDs; 3)
			ARRAY TEXT:C222(SD2_at_DiaryActionClasses; 3)
			ARRAY LONGINT:C221(SD2_al_ActionInSchedule; 3)  //Item in schedule
			ARRAY LONGINT:C221(SD2_al_ActionInWorkflow; 3)  // Item is worklow
			ARRAY LONGINT:C221(SD2_al_ActionInDone; 3)  // Item is for done items
			ARRAY LONGINT:C221(SD_Al_ActionTable; 3; 0)
			SD2_al_DiaryActionClassIDs{1}:=AA_GetNextID(->SD2_l_ActionID)
			SD2_al_DiaryActionClassIDs{2}:=AA_GetNextID(->SD2_l_ActionID)
			SD2_al_DiaryActionClassIDs{3}:=AA_GetNextID(->SD2_l_ActionID)
			SD2_at_DiaryActionClasses{1}:="Scheduled Items"
			SD2_at_DiaryActionClasses{2}:="Work Flow Items"
			SD2_at_DiaryActionClasses{3}:="Notes Items"
			SD2_al_ActionInSchedule{1}:=1
			SD2_al_ActionInWorkflow{2}:=1
			SD2_al_ActionInDone{3}:=1
			SET BLOB SIZE:C606([PREFERENCES:116]DataBlob:2; 0)
			VARIABLE TO BLOB:C532(SD2_al_DiaryActionClassIDs; [PREFERENCES:116]DataBlob:2; *)
			VARIABLE TO BLOB:C532(SD2_at_DiaryActionClasses; [PREFERENCES:116]DataBlob:2; *)
			VARIABLE TO BLOB:C532(SD2_al_ActionInSchedule; [PREFERENCES:116]DataBlob:2; *)
			VARIABLE TO BLOB:C532(SD2_al_ActionInWorkflow; [PREFERENCES:116]DataBlob:2; *)
			VARIABLE TO BLOB:C532(SD2_al_ActionInDone; [PREFERENCES:116]DataBlob:2; *)
			For ($_l_Index; 1; Size of array:C274(SD_al_ActionTable))
				VARIABLE TO BLOB:C532(SD_al_ActionTable{$_l_Index}; [PREFERENCES:116]DataBlob:2; *)
			End for 
			SAVE RECORD:C53([PREFERENCES:116])
			DB_SaveRecord(->[PREFERENCES:116])
			
		End if 
		
		
	End if 
	UNLOAD RECORD:C212([PREFERENCES:116])
	READ ONLY:C145([PREFERENCES:116])
	CLEAR SEMAPHORE:C144("LoadingActionClasses")
	ERR_MethodTrackerReturn("SD2_LoadDiaryActionClasses"; $_t_oldMethodName)
End if 
ERR_MethodTrackerReturn("SD2_LoadDiaryActionClasses"; $_t_oldMethodName)
