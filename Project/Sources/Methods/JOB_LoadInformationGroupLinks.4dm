//%attributes = {}
If (False:C215)
	//Project Method Name:      JOB_LoadInformationGroupLinks
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
	//ARRAY LONGINT(JOB_al_PermJobInfoClass;0)
	//ARRAY LONGINT(JOB_al_PermJobInfoQuals;0)
	//ARRAY TEXT(JOB_at_PermJobInfos;0)
	C_BOOLEAN:C305($_bo_Load; $_bo_OK; $1)
	C_LONGINT:C283($_l_Delay; $_l_ItemID; $_l_offset; $_l_Repeats; $_l_SizeofArray)
	C_POINTER:C301($2; $3; $4)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("JOB_LoadInformationGroupLinks")

//NG April 2007
// New method to load Information settings for Information on perm jobs
While (Semaphore:C143("LoadingInformationGroups"))
	DelayTicks(2)
End while 

$_l_ItemID:=PREF_GetPreferenceID("Perm Job Information")


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
	
	SET BLOB SIZE:C606([PREFERENCES:116]DataBlob:2; 0)
	VARIABLE TO BLOB:C532(JOB_at_PermJobInfos; [PREFERENCES:116]DataBlob:2; *)
	VARIABLE TO BLOB:C532(JOB_al_PermJobInfoClass; [PREFERENCES:116]DataBlob:2; *)
	VARIABLE TO BLOB:C532(JOB_al_PermJobInfoQuals; [PREFERENCES:116]DataBlob:2; *)
	DB_SaveRecord(->[PREFERENCES:116])
	UNLOAD RECORD:C212([PREFERENCES:116])
	READ ONLY:C145([PREFERENCES:116])
	
Else 
	$_l_offset:=0
	ARRAY TEXT:C222(JOB_at_PermJobInfos; 0)
	ARRAY LONGINT:C221(JOB_al_PermJobInfoClass; 0)
	ARRAY LONGINT:C221(JOB_al_PermJobInfoQuals; 0)
	
	If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_offset)
		BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; JOB_at_PermJobInfos; $_l_offset)
		If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_offset)
			BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; JOB_al_PermJobInfoClass; $_l_offset)
			If (BLOB size:C605([PREFERENCES:116]DataBlob:2)>$_l_offset)
				BLOB TO VARIABLE:C533([PREFERENCES:116]DataBlob:2; JOB_al_PermJobInfoQuals; $_l_offset)
				
				
				
			End if 
		End if 
		$_l_SizeofArray:=Size of array:C274(JOB_at_PermJobInfos)
		
		ARRAY LONGINT:C221(JOB_al_PermJobInfoClass; $_l_SizeofArray)
		ARRAY LONGINT:C221(JOB_al_PermJobInfoQuals; $_l_SizeofArray)
	Else 
		// The diary actions have not been classified
		ARRAY TEXT:C222(JOB_at_PermJobInfos; 0)
		ARRAY LONGINT:C221(JOB_al_PermJobInfoClass; 0)
		APPEND TO ARRAY:C911(JOB_at_PermJobInfos; "Client Job Specification")  //Description
		APPEND TO ARRAY:C911(JOB_al_PermJobInfoClass; 0)  //Text Only
		APPEND TO ARRAY:C911(JOB_at_PermJobInfos; "Client Description")  //Description of client
		APPEND TO ARRAY:C911(JOB_al_PermJobInfoClass; 3)  //Short Text Only
		APPEND TO ARRAY:C911(JOB_at_PermJobInfos; "Job Boards")  //²
		APPEND TO ARRAY:C911(JOB_al_PermJobInfoClass; 2)  //List of only-no text
		APPEND TO ARRAY:C911(JOB_at_PermJobInfos; "Market Sectors")  //²
		APPEND TO ARRAY:C911(JOB_al_PermJobInfoClass; 1)  //Text  with list
		APPEND TO ARRAY:C911(JOB_at_PermJobInfos; "Skills")  //²
		APPEND TO ARRAY:C911(JOB_al_PermJobInfoClass; 1)  //Text  with list
		APPEND TO ARRAY:C911(JOB_at_PermJobInfos; "Job Description For Job Boards")  //²
		APPEND TO ARRAY:C911(JOB_al_PermJobInfoClass; 0)  //Text  with list
		//APPEND TO ARRAY(JOB_at_PermJobInfos;"Job Description for Adverts")
		//APPEND TO ARRAY(JOB_al_PermJobInfoClass;0)  `Text
		APPEND TO ARRAY:C911(JOB_at_PermJobInfos; "Qualifications and Commercial Experience Required")  //²
		APPEND TO ARRAY:C911(JOB_al_PermJobInfoClass; 1)  //Text  with list
		APPEND TO ARRAY:C911(JOB_at_PermJobInfos; "Equipment and Software experience Required")  //²
		APPEND TO ARRAY:C911(JOB_al_PermJobInfoClass; 1)  //Text  with list
		APPEND TO ARRAY:C911(JOB_at_PermJobInfos; "Skills required")  //²
		APPEND TO ARRAY:C911(JOB_al_PermJobInfoClass; 1)  //Text  with list
		APPEND TO ARRAY:C911(JOB_at_PermJobInfos; "Personal qualities required")  //²
		APPEND TO ARRAY:C911(JOB_al_PermJobInfoClass; 1)  //Text  with list
		APPEND TO ARRAY:C911(JOB_at_PermJobInfos; "Type of work and typical clients")  //²
		APPEND TO ARRAY:C911(JOB_al_PermJobInfoClass; 0)  //Text only
		APPEND TO ARRAY:C911(JOB_at_PermJobInfos; "Career prospects")  //²
		APPEND TO ARRAY:C911(JOB_al_PermJobInfoClass; 0)  //Text only
		APPEND TO ARRAY:C911(JOB_at_PermJobInfos; "Renumeration package")
		APPEND TO ARRAY:C911(JOB_al_PermJobInfoClass; 0)  //Text only
		ARRAY LONGINT:C221(JOB_al_PermJobInfoQuals; Size of array:C274(JOB_al_PermJobInfoClass))
		
	End if 
End if 
UNLOAD RECORD:C212([PREFERENCES:116])
CLEAR SEMAPHORE:C144("LoadingInformationGroups")
ERR_MethodTrackerReturn("SD2_LoadActionGroups"; $_t_oldMethodName)