//%attributes = {}
If (False:C215)
	//Project Method Name:      SD2_GetDataset
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 27/01/2010 14:51
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BLOB:C604($_blb_SearchBLOB)
	C_DATE:C307($_d_EndDate; $_d_StartDate; $4; $5)
	C_LONGINT:C283(<>DB_l_DiarySetmanagerProcess; $_l_ActionsCount; $_l_IncludeDocs; $_l_Index; $_l_OpenClosed; $_l_PersonID; $_l_PersonsCount; $_l_ResultsCount; $_l_StartSetManager; $_l_StatusCount; $3)
	C_LONGINT:C283($8; SD2_l_SearchReady)
	C_POINTER:C301($1; $10; $2; $9)
	C_REAL:C285($_l_SetManagerProcess)
	C_TEXT:C284($_t_ActionCode; $_t_oldMethodName; $_t_Results; $_t_SearchCharacteristics; $_t_Status; $0; SD2_t_SearchID)
	C_TIME:C306($_ti_EndTime; $_ti_StartTime; $6; $7)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SD2_GetDataset")
//First we are going to buld a string of the charecteristics..this makes it easy to compare characteristcs between sets, we will put the characteristics into a blob for maintained sets

SET BLOB SIZE:C606($_blb_SearchBLOB; 0)
$_l_PersonsCount:=Size of array:C274($1->)
VARIABLE TO BLOB:C532($_l_PersonsCount; $_blb_SearchBLOB; *)


$_t_SearchCharacteristics:=""
For ($_l_Index; 1; Size of array:C274($1->))
	$_l_PersonID:=$1->{$_l_Index}
	VARIABLE TO BLOB:C532($_l_PersonID; $_blb_SearchBLOB; *)
	
	$_t_SearchCharacteristics:=$_t_SearchCharacteristics+"_"+String:C10($1->{$_l_Index})
End for 
$_t_SearchCharacteristics:=$_t_SearchCharacteristics+"|"
$_l_ActionsCount:=Size of array:C274($2->)
VARIABLE TO BLOB:C532($_l_ActionsCount; $_blb_SearchBLOB; *)

For ($_l_Index; 1; Size of array:C274($2->))
	$_t_ActionCode:=$2->{$_l_Index}
	VARIABLE TO BLOB:C532($_t_ActionCode; $_blb_SearchBLOB; *)
	$_t_SearchCharacteristics:=$_t_SearchCharacteristics+"_"+$2->{$_l_Index}
End for 
$_t_SearchCharacteristics:=$_t_SearchCharacteristics+"|"

$_l_IncludeDocs:=$3
VARIABLE TO BLOB:C532($_l_IncludeDocs; $_blb_SearchBLOB; *)
$_t_SearchCharacteristics:=$_t_SearchCharacteristics+"_"+String:C10($_l_IncludeDocs)
$_t_SearchCharacteristics:=$_t_SearchCharacteristics+"|"

$_d_StartDate:=$4
VARIABLE TO BLOB:C532($_d_StartDate; $_blb_SearchBLOB; *)
$_t_SearchCharacteristics:=$_t_SearchCharacteristics+"_"+String:C10($_d_StartDate)
$_t_SearchCharacteristics:=$_t_SearchCharacteristics+"|"

$_d_EndDate:=$5
VARIABLE TO BLOB:C532($_d_EndDate; $_blb_SearchBLOB; *)
$_t_SearchCharacteristics:=$_t_SearchCharacteristics+"_"+String:C10($_d_EndDate)
$_t_SearchCharacteristics:=$_t_SearchCharacteristics+"|"

$_ti_StartTime:=$6
VARIABLE TO BLOB:C532($_ti_StartTime; $_blb_SearchBLOB; *)
$_t_SearchCharacteristics:=$_t_SearchCharacteristics+"_"+String:C10($_ti_StartTime*1)
$_t_SearchCharacteristics:=$_t_SearchCharacteristics+"|"

$_ti_EndTime:=$7
VARIABLE TO BLOB:C532($_ti_EndTime; $_blb_SearchBLOB; *)
$_t_SearchCharacteristics:=$_t_SearchCharacteristics+"_"+String:C10($_ti_EndTime*1)
$_t_SearchCharacteristics:=$_t_SearchCharacteristics+"|"

$_l_OpenClosed:=$8  //longint

VARIABLE TO BLOB:C532($_l_OpenClosed; $_blb_SearchBLOB; *)
$_t_SearchCharacteristics:=$_t_SearchCharacteristics+"_"+String:C10($_l_OpenClosed)
$_t_SearchCharacteristics:=$_t_SearchCharacteristics+"|"

$_l_ResultsCount:=Size of array:C274($9->)
VARIABLE TO BLOB:C532($_l_ResultsCount; $_blb_SearchBLOB; *)
For ($_l_Index; 1; Size of array:C274($9->))
	$_t_Results:=$9->{$_l_Index}
	VARIABLE TO BLOB:C532($_t_Results; $_blb_SearchBLOB; *)
	
	$_t_SearchCharacteristics:=$_t_SearchCharacteristics+"_"+$_t_Results
End for 
$_t_SearchCharacteristics:=$_t_SearchCharacteristics+"|"

$_l_StatusCount:=Size of array:C274($10->)
VARIABLE TO BLOB:C532($_l_StatusCount; $_blb_SearchBLOB; *)
For ($_l_Index; 1; Size of array:C274($10->))
	$_t_Status:=$10->{$_l_Index}
	VARIABLE TO BLOB:C532($_t_Status; $_blb_SearchBLOB; *)
	
	$_t_SearchCharacteristics:=$_t_SearchCharacteristics+"_"+$_t_Status
End for 
$_t_SearchCharacteristics:=$_t_SearchCharacteristics+"|"
//````````
If (Application type:C494=4D Remote mode:K5:5)  // | (True)
	
	While (Semaphore:C143("LockingSetManager"))
		DelayTicks(2)
	End while 
	
	GET PROCESS VARIABLE:C371(-1; <>DB_l_DiarySetmanagerProcess; <>DB_l_DiarySetmanagerProcess)
	If (<>DB_l_DiarySetmanagerProcess=0)
		$_l_SetManagerProcess:=Execute on server:C373("SD2_StartDiaryManager"; 64000; "Starting Diary Query Manager")
		Repeat 
			DelayTicks(10)
			GET PROCESS VARIABLE:C371(-1; <>DB_l_DiarySetmanagerProcess; <>DB_l_DiarySetmanagerProcess)
		Until (<>DB_l_DiarySetmanagerProcess>0)  //Note that when we start the process on the serve we set this var inside the process when it is ready to receive calls
	End if 
	SD2_l_SearchReady:=-1
	
	SET PROCESS VARIABLE:C370(-<>DB_l_DiarySetmanagerProcess; SD2_t_SearchCharacters; $_t_SearchCharacteristics)
	SET PROCESS VARIABLE:C370(-<>DB_l_DiarySetmanagerProcess; SD2_blb_SearchVars; $_blb_SearchBLOB)
	SET PROCESS VARIABLE:C370(-<>DB_l_DiarySetmanagerProcess; SD2_l_SearchReady; SD2_l_SearchReady)
	
	While (SD2_l_SearchReady<=0)
		GET PROCESS VARIABLE:C371(-<>DB_l_DiarySetmanagerProcess; SD2_l_SearchReady; SD2_l_SearchReady)
		If (SD2_l_SearchReady=0)
			DelayTicks(10)
		End if 
	End while 
	GET PROCESS VARIABLE:C371(-<>DB_l_DiarySetmanagerProcess; SD2_t_SearchID; SD2_t_SearchID)
	
	$0:=SD2_t_SearchID
	
	
	CLEAR SEMAPHORE:C144("LockingSetManager")
	
Else 
	//Running single user
	While (Semaphore:C143("LockingSetManager"))
		DelayTicks(2)
	End while 
	
	
	If (<>DB_l_DiarySetmanagerProcess=0)
		$_l_StartSetManager:=New process:C317("SD2_StartDiaryManager"; 512000; "Starting Diary Query Manager")
		Repeat 
			DelayTicks(10)
		Until (<>DB_l_DiarySetmanagerProcess>0)  //Note that when we start the process on the serve we set this var inside the process when it is ready to receive calls
	End if 
	SD2_l_SearchReady:=-1
	
	SET PROCESS VARIABLE:C370(<>DB_l_DiarySetmanagerProcess; SD2_t_SearchCharacters; $_t_SearchCharacteristics)
	SET PROCESS VARIABLE:C370(<>DB_l_DiarySetmanagerProcess; SD2_blb_SearchVars; $_blb_SearchBLOB)
	SET PROCESS VARIABLE:C370(<>DB_l_DiarySetmanagerProcess; SD2_l_SearchReady; SD2_l_SearchReady)
	
	While (SD2_l_SearchReady<=0)
		GET PROCESS VARIABLE:C371(<>DB_l_DiarySetmanagerProcess; SD2_l_SearchReady; SD2_l_SearchReady)
		If (SD2_l_SearchReady=0)
			DelayTicks(10)
		End if 
	End while 
	GET PROCESS VARIABLE:C371(<>DB_l_DiarySetmanagerProcess; SD2_t_SearchID; SD2_t_SearchID)
	$0:=SD2_t_SearchID
	
	
	CLEAR SEMAPHORE:C144("LockingSetManager")
End if 
ERR_MethodTrackerReturn("SD2_GetDataset"; $_t_oldMethodName)
