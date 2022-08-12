//%attributes = {}

If (False:C215)
	//Project Method Name:      JC_AddDiaryTimeJSPRelation
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

$_t_oldMethodName:=ERR_MethodTracker("JC_AddDiaryTimeJSPRelation")


//added 28/02/07 -kmw


$_t_oldMethodName:=ERR_MethodTracker("JC_AddDiaryTimeJSPRelation")


If (Count parameters:C259>=2)  //
	$_l_DiaryID:=$1
	$_l_StageID:=$2
	//
	$_l_TableNumber:=Table:C252(->[JOB PERSONNEL:48])
	//
	READ WRITE:C146([xDiaryRelations:137])
	CREATE RECORD:C68([xDiaryRelations:137])
	[xDiaryRelations:137]xTableNUM:3:=$_l_TableNumber
	[xDiaryRelations:137]xDiaryID:1:=$_l_DiaryID
	[xDiaryRelations:137]xRecordID:4:=$_l_StageID
	DB_SaveRecord(->[xDiaryRelations:137])
	READ ONLY:C145([xDiaryRelations:137])
	
End if 
ERR_MethodTrackerReturn("JC_AddDiaryTimeJSPRelation"; $_t_oldMethodName)