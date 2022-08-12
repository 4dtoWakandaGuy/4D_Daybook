//%attributes = {}
If (False:C215)
	//Project Method Name:      Sm_SetUserSearchPrefs
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/11/2009`Method: Sm_SetUserSearchPrefs
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(Sm_al_ContextID;0)
	//ARRAY LONGINT(Sm_al_DefaultQuery;0)
	//ARRAY LONGINT(Sm_al_userID;0)
	//ARRAY TEXT(SM_at_UserAndContext;0)
	C_BOOLEAN:C305($_bo_OK; $1)
	C_LONGINT:C283($_l_ContextRow; $_l_Delay; $_l_ItemID; $_l_offset; $_l_Repeats; $5)
	C_REAL:C285($0; $2; $3; $4)
	C_TEXT:C284($_t_oldMethodName; $_t_UserContext)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Sm_SetUserSearchPrefs")
//NG Feb 2005 New method to load/Save search default parameters
If (Count parameters:C259>=3)
	While (Semaphore:C143("LoadingSearchPrefs"))
		DelayTicks
	End while 
	$_l_ItemID:=PREF_GetPreferenceID("Query Default Prefs")
	
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
	End if   //this will be ONE record
	$_l_offset:=0
	ARRAY TEXT:C222(SM_at_UserAndContext; 0)
	ARRAY LONGINT:C221(Sm_al_userID; 0)
	ARRAY LONGINT:C221(Sm_al_ContextID; 0)
	ARRAY LONGINT:C221(Sm_al_DefaultQuery; 0)
	If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_offset)
		BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; SM_at_UserAndContext; $_l_offset)
		If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_offset)
			BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; Sm_al_userID; $_l_offset)  //The' local' name of the service
			If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_offset)
				BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; Sm_al_ContextID; $_l_offset)
				If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_offset)
					BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; Sm_al_DefaultQuery; $_l_offset)
				End if 
			End if 
		End if 
	End if 
	$_t_UserContext:=""
	If (Count parameters:C259>=5)
		$_t_UserContext:=String:C10($3)+("0"*(25-Length:C16(String:C10($3))))+((String:C10($2*255))+String:C10($5))
		
	Else 
		$_t_UserContext:=String:C10($3)+("0"*(25-Length:C16(String:C10($3))))+String:C10($2)
	End if 
	
	
	If ($1=False:C215)  //find false to save send true
		$_l_ContextRow:=Find in array:C230(SM_at_UserAndContext; $_t_UserContext)
		If ($_l_ContextRow>0)
			$0:=Sm_al_DefaultQuery{$_l_ContextRow}
		Else 
			$0:=0
		End if 
	Else 
		//Update
		$_l_ContextRow:=Find in array:C230(SM_at_UserAndContext; $_t_UserContext)
		If ($_l_ContextRow<0)
			$_l_ContextRow:=Size of array:C274(SM_at_UserAndContext)+1
			INSERT IN ARRAY:C227(SM_at_UserAndContext; $_l_ContextRow)
			INSERT IN ARRAY:C227(Sm_al_userID; $_l_ContextRow)
			INSERT IN ARRAY:C227(Sm_al_ContextID; $_l_ContextRow)
			INSERT IN ARRAY:C227(Sm_al_DefaultQuery; $_l_ContextRow)
			SM_at_UserAndContext{$_l_ContextRow}:=$_t_UserContext
		End if 
		Sm_al_userID{$_l_ContextRow}:=$3
		If (Count parameters:C259>=5)
			Sm_al_ContextID{$_l_ContextRow}:=($2*255)+$5
		Else 
			Sm_al_ContextID{$_l_ContextRow}:=$2
		End if 
		Sm_al_DefaultQuery{$_l_ContextRow}:=$4
		
		READ WRITE:C146([PREFERENCES:116])
		LOAD RECORD:C52([PREFERENCES:116])
		SET BLOB SIZE:C606([PREFERENCES:116]DataBlob:2; 0)
		VARIABLE TO BLOB:C532(SM_at_UserAndContext; [PREFERENCES:116]DataBlob:2; *)
		VARIABLE TO BLOB:C532(Sm_al_userID; [PREFERENCES:116]DataBlob:2; *)
		VARIABLE TO BLOB:C532(Sm_al_ContextID; [PREFERENCES:116]DataBlob:2; *)
		VARIABLE TO BLOB:C532(Sm_al_DefaultQuery; [PREFERENCES:116]DataBlob:2; *)
		
		DB_SaveRecord(->[PREFERENCES:116]; False:C215)
		DB_SaveRecord(->[PREFERENCES:116])
		
		
	End if 
	UNLOAD RECORD:C212([PREFERENCES:116])
	READ ONLY:C145([PREFERENCES:116])
	CLEAR SEMAPHORE:C144("LoadingSearchPrefs")
	
End if 
ERR_MethodTrackerReturn("Sm_SetUserSearchPrefs"; $_t_oldMethodName)
