//%attributes = {}

If (False:C215)
	//Project Method Name:      JC_DelDiaryTimeJSPRelation
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
	C_LONGINT:C283($_l_DiaryID; $_l_StageID; $_l_TableNumber; $1; $2)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("JC_DelDiaryTimeJSPRelation")




//
If (Count parameters:C259>=2)
	$_l_DiaryID:=$1
	$_l_StageID:=$2
	//
	$_l_TableNumber:=Table:C252(->[JOB PERSONNEL:48])
	//
	READ WRITE:C146([xDiaryRelations:137])
	QUERY:C277([xDiaryRelations:137]; [xDiaryRelations:137]xTableNUM:3=$_l_TableNumber; *)
	QUERY:C277([xDiaryRelations:137];  & ; [xDiaryRelations:137]xDiaryID:1=$_l_DiaryID; *)
	QUERY:C277([xDiaryRelations:137];  & ; [xDiaryRelations:137]xRecordID:4=$_l_StageID)
	//
	DELETE RECORD:C58([xDiaryRelations:137])
	//
	READ ONLY:C145([xDiaryRelations:137])
	
End if 
ERR_MethodTrackerReturn("JC_DelDiaryTimeJSPRelation"; $_t_oldMethodName)