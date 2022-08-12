//%attributes = {}
If (False:C215)
	//Project Method Name:      SVS_LoadPreferences
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 17/11/2009 20:14
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(SVS_al_PriorityNumbers;0)
	//ARRAY TEXT(SVS_at_priorityNames;0)
	C_BOOLEAN:C305($_bo_Save; $1)
	C_LONGINT:C283($_l_Index; $_l_ItemID; $_l_ModuleRow; $_l_offset; SVS_l_DefaultLocationID; SVS_l_DefaultResponseTiming; SVS_l_DefaultResponseType)
	C_TEXT:C284($_t_oldMethodName; SVS_t_ResolvedCallState; SVS_t_ResolvedCallName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SVS_LoadPreferences")

READ ONLY:C145([PREFERENCES:116])
While (Semaphore:C143("LoadingSVSPrefs"))
	DelayTicks(2)
End while 
$_l_ItemID:=PREF_GetPreferenceID("Service Call Preferences")
CLEAR SEMAPHORE:C144("LoadingSVSPrefs")
QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=$_l_ItemID)
If (Records in selection:C76([PREFERENCES:116])=0)
	ARRAY LONGINT:C221(SVS_al_PriorityNumbers; 0)
	ARRAY TEXT:C222(SVS_at_priorityNames; 0)
	
	ARRAY TEXT:C222(SVS_at_priorityNames; 5)
	ARRAY LONGINT:C221(SVS_al_PriorityNumbers; 5)
	SVS_at_priorityNames{1}:="Highest"
	SVS_at_priorityNames{2}:="High"
	SVS_at_priorityNames{3}:="Normal"
	SVS_at_priorityNames{4}:="Low"
	SVS_at_priorityNames{5}:="Lowest"
	For ($_l_Index; 1; 5)
		SVS_al_PriorityNumbers{$_l_ModuleRow}:=$_l_ModuleRow
	End for 
	READ WRITE:C146([PREFERENCES:116])
	CREATE RECORD:C68([PREFERENCES:116])
	[PREFERENCES:116]IDNumber:1:=$_l_ItemID
	$_l_offset:=0
	VARIABLE TO BLOB:C532(SVS_t_ResolvedCallState; [PREFERENCES:116]DataBlob:2; *)
	VARIABLE TO BLOB:C532(SVS_l_DefaultResponseTiming; [PREFERENCES:116]DataBlob:2; *)
	VARIABLE TO BLOB:C532(SVS_l_DefaultResponseType; [PREFERENCES:116]DataBlob:2; *)
	VARIABLE TO BLOB:C532(SVS_al_PriorityNumbers; [PREFERENCES:116]DataBlob:2; *)
	VARIABLE TO BLOB:C532(SVS_at_priorityNames; [PREFERENCES:116]DataBlob:2; *)
	VARIABLE TO BLOB:C532(SVS_l_DefaultLocationID; [PREFERENCES:116]DataBlob:2; *)
	DB_SaveRecord(->[PREFERENCES:116])
	UNLOAD RECORD:C212([PREFERENCES:116])
	READ ONLY:C145([PREFERENCES:116])
	QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=$_l_ItemID)
End if 
$_bo_Save:=False:C215
If (Count parameters:C259>=1)
	$_bo_Save:=$1
End if 
If ($_bo_Save)  //Save preferences
	READ WRITE:C146([PREFERENCES:116])
	LOAD RECORD:C52([PREFERENCES:116])
	SET BLOB SIZE:C606([PREFERENCES:116]DataBlob:2; 0)
	VARIABLE TO BLOB:C532(SVS_t_ResolvedCallState; [PREFERENCES:116]DataBlob:2; *)
	VARIABLE TO BLOB:C532(SVS_l_DefaultResponseTiming; [PREFERENCES:116]DataBlob:2; *)
	VARIABLE TO BLOB:C532(SVS_l_DefaultResponseType; [PREFERENCES:116]DataBlob:2; *)
	VARIABLE TO BLOB:C532(SVS_al_PriorityNumbers; [PREFERENCES:116]DataBlob:2; *)
	VARIABLE TO BLOB:C532(SVS_at_priorityNames; [PREFERENCES:116]DataBlob:2; *)
	VARIABLE TO BLOB:C532(SVS_l_DefaultLocationID; [PREFERENCES:116]DataBlob:2; *)
	DB_SaveRecord(->[PREFERENCES:116])
	UNLOAD RECORD:C212([PREFERENCES:116])
	READ ONLY:C145([PREFERENCES:116])
	
Else 
	
	ARRAY LONGINT:C221(SVS_al_PriorityNumbers; 0)
	ARRAY TEXT:C222(SVS_at_priorityNames; 0)
	
	//Load preferences
	$_l_offset:=0
	If ($_l_offset<BLOB size:C605([PREFERENCES:116]DataBlob:2))
		BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; SVS_t_ResolvedCallState; $_l_offset)
		If ($_l_offset<BLOB size:C605([PREFERENCES:116]DataBlob:2))
			BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; SVS_l_DefaultResponseTiming; $_l_offset)
			If ($_l_offset<BLOB size:C605([PREFERENCES:116]DataBlob:2))
				BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; SVS_l_DefaultResponseType; $_l_offset)
				If ($_l_offset<BLOB size:C605([PREFERENCES:116]DataBlob:2))
					BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; SVS_al_PriorityNumbers; $_l_offset)
					If ($_l_offset<BLOB size:C605([PREFERENCES:116]DataBlob:2))
						BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; SVS_at_priorityNames; $_l_offset)
						If ($_l_offset<BLOB size:C605([PREFERENCES:116]DataBlob:2))
							BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; SVS_l_DefaultLocationID; $_l_offset)
						Else 
							SVS_l_DefaultLocationID:=0
						End if 
					Else 
						
						ARRAY LONGINT:C221(SVS_al_PriorityNumbers; 0)
						ARRAY TEXT:C222(SVS_at_priorityNames; 0)
						SVS_l_DefaultLocationID:=0
						
					End if 
				Else 
					
					
					ARRAY LONGINT:C221(SVS_al_PriorityNumbers; 0)
					ARRAY TEXT:C222(SVS_at_priorityNames; 0)
					SVS_l_DefaultLocationID:=0
				End if 
			Else 
				
				SVS_l_DefaultResponseType:=0
				ARRAY LONGINT:C221(SVS_al_PriorityNumbers; 0)
				ARRAY TEXT:C222(SVS_at_priorityNames; 0)
				SVS_l_DefaultLocationID:=0
			End if 
		Else 
			SVS_l_DefaultResponseTiming:=0
			SVS_l_DefaultResponseType:=0
			ARRAY LONGINT:C221(SVS_al_PriorityNumbers; 0)
			ARRAY TEXT:C222(SVS_at_priorityNames; 0)
			SVS_l_DefaultLocationID:=0
		End if 
	Else 
		SVS_t_ResolvedCallState:=""
		SVS_l_DefaultResponseTiming:=0
		SVS_l_DefaultResponseType:=0
		ARRAY LONGINT:C221(SVS_al_PriorityNumbers; 0)
		ARRAY TEXT:C222(SVS_at_priorityNames; 0)
		SVS_l_DefaultLocationID:=0
	End if 
	
	If (Size of array:C274(SVS_al_PriorityNumbers)=0)
		ARRAY LONGINT:C221(SVS_al_PriorityNumbers; 5)
		ARRAY TEXT:C222(SVS_at_priorityNames; 5)
		SVS_at_priorityNames{1}:="Highest"
		SVS_at_priorityNames{2}:="High"
		SVS_at_priorityNames{3}:="Normal"
		SVS_at_priorityNames{4}:="Low"
		SVS_at_priorityNames{5}:="Lowest"
		For ($_l_Index; 1; 5)
			SVS_al_PriorityNumbers{$_l_Index}:=$_l_Index
		End for 
	End if 
End if 
ERR_MethodTrackerReturn("SVS_LoadPreferences"; $_t_oldMethodName)
