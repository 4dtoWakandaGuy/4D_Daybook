//%attributes = {}

If (False:C215)
	//Project Method Name:      SVS_LoadproblemTypes
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
	//ARRAY LONGINT(SD2_al_ProblemTypeIDs;0)
	//ARRAY TEXT(SD_at_ProblemTypeActionCodes;0)
	//ARRAY TEXT(SD_at_ProblemTypeActions;0)
	//ARRAY TEXT(SD2_at_ProblemTypeNames;0)
	C_BOOLEAN:C305($_bo_Load; $_bo_OK; $1)
	C_LONGINT:C283($_l_Delay; $_l_Index; $_l_ItemID; $_l_offset; $_l_Repeats; $_l_SizeofArray; $_l_SizeofArray2)
	C_POINTER:C301($2; $3; $4)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SVS_LoadproblemTypes")

//NG this method loads the problem type settings. Each problem type may create one or more Diary Actions(workflows)
$_t_oldMethodName:=ERR_MethodTracker("SVS_LoadproblemTypes")


//NG March 2005
// New method to load diary action classes
While (Semaphore:C143("LoadingProblemtypes"))
	DelayTicks(2)
End while 

$_l_ItemID:=PREF_GetPreferenceID("Problem Types")
QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=$_l_ItemID)  //One record for the database
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
	[PREFERENCES:116]IDNumber:1:=$_l_ItemID
	DB_SaveRecord(->[PREFERENCES:116])
	
End if 
$_bo_Load:=True:C214
If (Count parameters:C259>=1)
	$_bo_Load:=$1
End if 
If ($_bo_Load=False:C215)  // save updated values
	READ WRITE:C146([PREFERENCES:116])
	While (Not:C34(Check_Locked(->[PREFERENCES:116]; 1)))
		DelayTicks(10)
		
	End while 
	SET BLOB SIZE:C606([PREFERENCES:116]DataBlob:2; 0)
	VARIABLE TO BLOB:C532(SD2_al_ProblemTypeIDs; [PREFERENCES:116]DataBlob:2; *)
	VARIABLE TO BLOB:C532(SD2_at_ProblemTypeNames; [PREFERENCES:116]DataBlob:2; *)
	For ($_l_Index; 1; Size of array:C274(SD_at_ProblemTypeActions))  //note this the action code
		VARIABLE TO BLOB:C532(SD_at_ProblemTypeActions{$_l_Index}; [PREFERENCES:116]DataBlob:2; *)
	End for 
	For ($_l_Index; 1; Size of array:C274(SD_at_ProblemTypeActionCodes))  //note this the actionIDs
		VARIABLE TO BLOB:C532(SD_at_ProblemTypeActionCodes{$_l_Index}; [PREFERENCES:116]DataBlob:2; *)
	End for 
	DB_SaveRecord(->[PREFERENCES:116])
	UNLOAD RECORD:C212([PREFERENCES:116])
	READ ONLY:C145([PREFERENCES:116])
	
Else 
	$_l_offset:=0
	ARRAY LONGINT:C221(SD2_al_ProblemTypeIDs; 0)  // List of action group IDs
	ARRAY TEXT:C222(SD2_at_ProblemTypeNames; 0)  //List of Action Group Names
	ARRAY TEXT:C222(SD_at_ProblemTypeActions; 0; 0)
	ARRAY TEXT:C222(SD_at_ProblemTypeActionCodes; 0; 0)  // List of Actions in each group
	If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_offset)
		BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; SD2_al_ProblemTypeIDs; $_l_offset)
		If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_offset)
			BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; SD2_at_ProblemTypeNames; $_l_offset)
			
			$_l_SizeofArray:=Size of array:C274(SD2_at_ProblemTypeNames)
			ARRAY TEXT:C222(SD_at_ProblemTypeActions; $_l_SizeofArray; 0)  //LIST OF NAMES FOR EACH CONTEXT
			
			
			ARRAY TEXT:C222(SD_at_ProblemTypeActionCodes; $_l_SizeofArray; 0)  // LIST OF IDS FOR EACH CONTEXT
			$_l_SizeofArray2:=0
			For ($_l_Index; 1; $_l_SizeofArray)
				If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_offset)
					BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; SD_at_ProblemTypeActions{$_l_Index}; $_l_offset)
				Else 
					$_l_Index:=$_l_SizeofArray
				End if 
			End for 
			For ($_l_Index; 1; $_l_SizeofArray)
				If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_offset)
					BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; SD_at_ProblemTypeActionCodes{$_l_Index}; $_l_offset)
				Else 
					$_l_Index:=$_l_SizeofArray
				End if 
			End for 
		End if 
	Else 
		// The diary actions have not been classified
		
	End if 
End if 
UNLOAD RECORD:C212([PREFERENCES:116])
CLEAR SEMAPHORE:C144("LoadingProblemtypes")
ERR_MethodTrackerReturn("SVS_LoadproblemTypes"; $_t_oldMethodName)
