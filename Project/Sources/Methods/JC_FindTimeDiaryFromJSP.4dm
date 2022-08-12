//%attributes = {}

If (False:C215)
	//Project Method Name:      JC_FindTimeDiaryFromJSP
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
	C_LONGINT:C283($_l_JSPersonID; $_l_NumberofDiaryRelations; $_l_TableNumber; $1)
	C_TEXT:C284(<>TimeAct; $_t_JSJobCode; $_t_JSJobStageCode; $_t_JSPersonCode; $_t_oldMethodName; $2; $3; $4)
End if 

//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("JC_FindTimeDiaryFromJSP")


//JC_FindTimeDiaryFromJSP

//Added 27/02/07 -kmw

//Finds current JSP record's Diary records (or uses passed parameters to find Diary records)

//Tries to find using xDiaryRelations and also via the three field query on job, stage and person composite key.


$_t_oldMethodName:=ERR_MethodTracker("JC_FindTimeDiaryFromJSP")


//
If (Count parameters:C259>0)
	$_l_JSPersonID:=$1
Else 
	$_l_JSPersonID:=[JOB PERSONNEL:48]X_ID:14
End if 
If (Count parameters:C259>1)
	$_t_JSPersonCode:=$2
Else 
	$_t_JSPersonCode:=[JOB PERSONNEL:48]Person:3
End if 
If (Count parameters:C259>2)
	$_t_JSJobCode:=$3
Else 
	$_t_JSJobCode:=[JOB PERSONNEL:48]Job_Code:1
End if 
If (Count parameters:C259>3)
	$_t_JSJobStageCode:=$4
Else 
	$_t_JSJobStageCode:=[JOB PERSONNEL:48]Stage_Code:2
End if 
//
$_l_TableNumber:=Table:C252(->[JOB PERSONNEL:48])


//***********get selection of diary records by finding relations between this job personnel and any diary records ***********
QUERY:C277([xDiaryRelations:137]; [xDiaryRelations:137]xTableNUM:3=$_l_TableNumber; *)
//If (Count parameters>0)
QUERY:C277([xDiaryRelations:137];  & ; [xDiaryRelations:137]xRecordID:4=$_l_JSPersonID)
//Else
//QUERY([xDiaryRelations]; & ;[xDiaryRelations]xRecordID=[JOB PERSONNEL]X_ID)
//End if
$_l_NumberofDiaryRelations:=Records in selection:C76([xDiaryRelations:137])
Case of 
	: ($_l_NumberofDiaryRelations=0)
		REDUCE SELECTION:C351([DIARY:12]; 0)
	: ($_l_NumberofDiaryRelations=1)
		QUERY:C277([DIARY:12]; [DIARY:12]x_ID:50=[xDiaryRelations:137]xDiaryID:1)
	Else 
		SELECTION TO ARRAY:C260([xDiaryRelations:137]xDiaryID:1; $_al_JobPeronnelIDS)
		QUERY WITH ARRAY:C644([DIARY:12]x_ID:50; $_al_JobPeronnelIDS)
End case 
CREATE SET:C116([DIARY:12]; "DiaryRecsFromJSPRels")
//***************************************************************************************
//***********get selection of diary records by finding relations between this job personnel and any diary records ***********
QUERY:C277([DIARY:12]; [DIARY:12]Person:8=$_t_JSPersonCode; *)
QUERY:C277([DIARY:12];  & ; [DIARY:12]Job_Code:19=$_t_JSJobCode; *)
QUERY:C277([DIARY:12];  & ; [DIARY:12]Stage_Code:21=$_t_JSJobStageCode)
CREATE SET:C116([DIARY:12]; "DiaryRecsFromJSPCK")
//***************************************************************************************
UNION:C120("DiaryRecsFromJSPRels"; "DiaryRecsFromJSPCK"; "DiaryRecsFromJSP")
//
USE SET:C118("DiaryRecsFromJSP")
//
QUERY SELECTION:C341([DIARY:12]; [DIARY:12]Action_Code:9=<>TimeAct)  //reduce down to just TIME diary records (at some point this will be made more complicated because there will be more than one time action code)
ERR_MethodTrackerReturn("JC_FindTimeDiaryFromJSP"; $_t_oldMethodName)