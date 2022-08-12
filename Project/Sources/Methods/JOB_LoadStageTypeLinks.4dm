//%attributes = {}
If (False:C215)
	//Project Method Name:      JOB_LoadStageTypeLinks
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
	//ARRAY LONGINT(JOB_al_RelateAutoAdd;0)
	//ARRAY TEXT(JOB_at_JobCodes;0)
	//ARRAY TEXT(JOB_at_RelatedStageCodes;0)
	C_BOOLEAN:C305($_bo_Load; $_bo_OK; $1)
	C_LONGINT:C283($_l_ArraySize; $_l_Delay; $_l_Index; $_l_ItemID; $_l_offset; $_l_Repeats)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("JOB_LoadStageTypeLinks")

//this method loads a record from the prefs table which contains a list of all the job types and the related stage codes
While (Semaphore:C143("LoadingJobTypeLinks"))
	DelayTicks(2)
End while 
$_l_ItemID:=PREF_GetPreferenceID("Job Type Stage Links")
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
	LOAD RECORD:C52([PREFERENCES:116])
	SET BLOB SIZE:C606([PREFERENCES:116]DataBlob:2; 0)
	VARIABLE TO BLOB:C532(JOB_at_JobCodes; [PREFERENCES:116]DataBlob:2; *)
	$_l_ArraySize:=Size of array:C274(JOB_at_JobCodes)
	For ($_l_Index; 1; $_l_ArraySize)
		VARIABLE TO BLOB:C532(JOB_at_RelatedStageCodes{$_l_Index}; [PREFERENCES:116]DataBlob:2; *)
	End for 
	For ($_l_Index; 1; $_l_ArraySize)
		VARIABLE TO BLOB:C532(JOB_al_RelateAutoAdd{$_l_Index}; [PREFERENCES:116]DataBlob:2; *)
	End for 
	AA_CheckUUID(Table:C252(->[PREFERENCES:116]))
	
	SAVE RECORD:C53([PREFERENCES:116])
	DB_SaveRecord(->[PREFERENCES:116])
	
Else 
	$_l_offset:=0
	ARRAY TEXT:C222(JOB_at_JobCodes; 0)
	ARRAY TEXT:C222(JOB_at_RelatedStageCodes; 0; 0)  // 2D
	ARRAY LONGINT:C221(JOB_al_RelateAutoAdd; 0; 0)
	If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_offset)
		BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; JOB_at_JobCodes; $_l_offset)
		$_l_ArraySize:=Size of array:C274(JOB_at_JobCodes)
		ARRAY TEXT:C222(JOB_at_RelatedStageCodes; $_l_ArraySize; 0)  // 2D
		ARRAY LONGINT:C221(JOB_al_RelateAutoAdd; $_l_ArraySize; 0)
		If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_offset)
			
			For ($_l_Index; 1; $_l_ArraySize)
				If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_offset)
					BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; JOB_at_RelatedStageCodes{$_l_Index}; $_l_offset)
				End if 
			End for 
			If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_offset)
				
				For ($_l_Index; 1; $_l_ArraySize)
					If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_offset)
						BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; JOB_al_RelateAutoAdd{$_l_Index}; $_l_offset)
					End if 
				End for 
				
				
			End if 
			
			
		End if 
		
	End if 
	$_l_ArraySize:=Size of array:C274(JOB_at_JobCodes)
	If (Size of array:C274(JOB_at_RelatedStageCodes)<$_l_ArraySize)
		Repeat 
			INSERT IN ARRAY:C227(JOB_at_RelatedStageCodes; Size of array:C274(JOB_at_RelatedStageCodes)+1; 1)
		Until (Size of array:C274(JOB_at_RelatedStageCodes)=$_l_ArraySize)
	End if 
	If (Size of array:C274(JOB_al_RelateAutoAdd)<$_l_ArraySize)
		Repeat 
			INSERT IN ARRAY:C227(JOB_al_RelateAutoAdd; Size of array:C274(JOB_al_RelateAutoAdd)+1; 1)
		Until (Size of array:C274(JOB_al_RelateAutoAdd)=$_l_ArraySize)
	End if 
	If (Size of array:C274(JOB_at_JobCodes)<Size of array:C274(JOB_al_RelateAutoAdd))
		
	End if 
End if 
UNLOAD RECORD:C212([PREFERENCES:116])
READ ONLY:C145([PREFERENCES:116])
CLEAR SEMAPHORE:C144("LoadingJobTypeLinks")
ERR_MethodTrackerReturn("JOB_LoadStageTypeLinks"; $_t_oldMethodName)