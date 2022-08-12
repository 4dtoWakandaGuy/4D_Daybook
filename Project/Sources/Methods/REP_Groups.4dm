//%attributes = {}

If (False:C215)
	//Project Method Name:      REP_Groups
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
	//ARRAY LONGINT(REP_al_ReportGroupIDs;0)
	//ARRAY LONGINT(REP_al_ReportGroupIncludes;0;0)
	//ARRAY TEXT(REP_at_ReportGroupNames;0)
	C_BOOLEAN:C305($_bo_OK; $_bo_Save; $1)
	C_LONGINT:C283($_l_Delay; $_l_Index; $_l_ItemID; $_l_offset; $_l_Repeats)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("REP_Groups")

//this method is used to save and load report groups
//note that there is a limit of groups to 32
$_t_oldMethodName:=ERR_MethodTracker("REP_Groups")
//NG Feb 2005 New method to load/Save search default parameters

While (Semaphore:C143("LoadingReportGroups"))
	DelayTicks
End while 
$_l_ItemID:=PREF_GetPreferenceID("Report Groups")
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
End if   //this will be ONE record
$_l_offset:=0
If (Count parameters:C259>=1)
	$_bo_Save:=$1
Else 
	$_bo_Save:=False:C215
End if 
If (Not:C34($_bo_Save))
	ARRAY TEXT:C222(REP_at_ReportGroupNames; 0)
	ARRAY LONGINT:C221(REP_al_ReportGroupIDs; 0)
	ARRAY LONGINT:C221(REP_al_ReportGroupIncludes; 0; 0)
	
	If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_offset)
		BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; REP_at_ReportGroupNames; $_l_offset)
		If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_offset)
			BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; REP_al_ReportGroupIDs; $_l_offset)  //The' local' name of the service
			ARRAY LONGINT:C221(REP_al_ReportGroupIncludes; Size of array:C274(REP_al_ReportGroupIDs); 0)
			For ($_l_Index; 1; Size of array:C274(REP_al_ReportGroupIDs))
				If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_offset)
					BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; REP_al_ReportGroupIncludes{$_l_Index}; $_l_offset)
				Else 
					$_l_Index:=99999
				End if 
			End for 
			
			
		End if 
	End if 
Else 
	//save the data
	READ WRITE:C146([PREFERENCES:116])
	LOAD RECORD:C52([PREFERENCES:116])
	SET BLOB SIZE:C606([PREFERENCES:116]DataBlob:2; 0)
	VARIABLE TO BLOB:C532(REP_at_ReportGroupNames; [PREFERENCES:116]DataBlob:2; *)
	VARIABLE TO BLOB:C532(REP_al_ReportGroupIDs; [PREFERENCES:116]DataBlob:2; *)
	For ($_l_Index; 1; Size of array:C274(REP_al_ReportGroupIDs))
		VARIABLE TO BLOB:C532(REP_al_ReportGroupIncludes{$_l_Index}; [PREFERENCES:116]DataBlob:2; *)
		
	End for 
	SAVE RECORD:C53([PREFERENCES:116])
	DB_SaveRecord(->[PREFERENCES:116])
	UNLOAD RECORD:C212([PREFERENCES:116])
	READ ONLY:C145([PREFERENCES:116])
	
End if 
CLEAR SEMAPHORE:C144("LoadingReportGroups")
ERR_MethodTrackerReturn("REP_Groups"; $_t_oldMethodName)
