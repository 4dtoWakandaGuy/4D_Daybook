//%attributes = {}

If (False:C215)
	//Project Method Name:      JC_FindJSPFromTimeDiary
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
	ARRAY LONGINT:C221($_al_JobPeronnelIDS; 0)
	C_LONGINT:C283($_l_DiaryID; $_l_NumberofDiaryRelations; $_l_TableNumber; $1)
	C_TEXT:C284($_t_DiaryJobCode; $_t_DiaryJobStageCode; $_t_DiaryPersonCode; $_t_oldMethodName; $2; $3; $4)
End if 

//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("JC_FindJSPFromTimeDiary")

//JC_FindJSPFromTimeDiary

//Added 26/02/07 -kmw

//Finds current Diary record's Job Personnel record (or uses passed parameters to find job Personnel record)

//Tries to find using xDiaryRelations and also via the three field query on job, stage and person composite key.


$_t_oldMethodName:=ERR_MethodTracker("JC_FindJSPFromTimeDiary")


//
If (Count parameters:C259>0)
	$_l_DiaryID:=$1
Else 
	$_l_DiaryID:=[DIARY:12]x_ID:50
End if 
If (Count parameters:C259>1)
	$_t_DiaryPersonCode:=$2
Else 
	$_t_DiaryPersonCode:=[DIARY:12]Person:8
End if 
If (Count parameters:C259>2)
	$_t_DiaryJobCode:=$3
Else 
	$_t_DiaryJobCode:=[DIARY:12]Job_Code:19
End if 
If (Count parameters:C259>3)
	$_t_DiaryJobStageCode:=$4
Else 
	$_t_DiaryJobStageCode:=[DIARY:12]Stage_Code:21
End if 
//
$_l_TableNumber:=Table:C252(->[JOB PERSONNEL:48])

//***********get selection of job personnel records by finding relations between this diary and any job personnel record (should only be 1 or none found) ***********
QUERY:C277([xDiaryRelations:137]; [xDiaryRelations:137]xTableNUM:3=$_l_TableNumber; *)
QUERY:C277([xDiaryRelations:137];  & ; [xDiaryRelations:137]xDiaryID:1=$_l_DiaryID)

$_l_NumberofDiaryRelations:=Records in selection:C76([xDiaryRelations:137])  //should hopefully only be one (a time diary record should only belong to one job personnel)
Case of 
	: ($_l_NumberofDiaryRelations=0)
		REDUCE SELECTION:C351([JOB PERSONNEL:48]; 0)
	: ($_l_NumberofDiaryRelations=1)
		QUERY:C277([JOB PERSONNEL:48]; [JOB PERSONNEL:48]X_ID:14=[xDiaryRelations:137]xRecordID:4)
	Else 
		SELECTION TO ARRAY:C260([xDiaryRelations:137]xRecordID:4; $_al_JobPeronnelIDS)
		QUERY WITH ARRAY:C644([JOB PERSONNEL:48]X_ID:14; $_al_JobPeronnelIDS)
End case 
CREATE SET:C116([JOB PERSONNEL:48]; "JSPRecsFromDiaryRels")
//*************************************************************************
//***********get selection of job personnel records by finding 3-filed-composite relations between this diary and any job personnel records (should only be 1 or none found) ***********
QUERY:C277([JOB PERSONNEL:48]; [JOB PERSONNEL:48]Person:3=$_t_DiaryPersonCode; *)
QUERY:C277([JOB PERSONNEL:48];  & ; [JOB PERSONNEL:48]Job_Code:1=$_t_DiaryJobCode; *)
QUERY:C277([JOB PERSONNEL:48];  & ; [JOB PERSONNEL:48]Stage_Code:2=$_t_DiaryJobStageCode)
CREATE SET:C116([JOB PERSONNEL:48]; "JSPRecsFromDiaryCK")
//*************************************************************************
UNION:C120("JSPRecsFromDiaryRels"; "JSPRecsFromDiaryCK"; "JSPRecsFromDiary")
//
USE SET:C118("JSPRecsFromDiary")  //should only be one in set (other wise we  either have extra relations that shouldn't be there or relation that doesn't match composite key)
//
ERR_MethodTrackerReturn("JC_FindJSPFromTimeDiary"; $_t_oldMethodName)