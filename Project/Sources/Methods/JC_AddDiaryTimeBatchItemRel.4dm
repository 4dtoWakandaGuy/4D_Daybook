//%attributes = {}

If (False:C215)
	//Project Method Name:      JC_AddDiaryTimeBatchItemRel
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
	C_DATE:C307($_d_StampDate)
	C_LONGINT:C283($_l_BatchTransationID; $_l_BatchTransItemID; $_l_DiaryID; $_l_StampTimeDate; $_l_TableNumber; $1; $2; $3)
	C_TEXT:C284($_t_oldMethodName; $_t_RelationshipName; $4)
	C_TIME:C306($_ti_StampTime)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("JC_AddDiaryTimeBatchItemRel")

//added 09/03/07 -kmw


$_t_oldMethodName:=ERR_MethodTracker("JC_AddDiaryTimeBatchItemRel")


If (Count parameters:C259>=4)
	$_l_DiaryID:=$1
	$_l_BatchTransationID:=$2
	$_l_BatchTransItemID:=$3
	$_t_RelationshipName:=$4
	//
	$_l_TableNumber:=Table:C252(->[TRANSACTION_BATCHES:30])
	//
	READ WRITE:C146([xDiaryRelations:137])
	CREATE RECORD:C68([xDiaryRelations:137])
	[xDiaryRelations:137]x_RelationshipName:7:=$_t_RelationshipName
	[xDiaryRelations:137]xTableNUM:3:=$_l_TableNumber
	[xDiaryRelations:137]xDiaryID:1:=$_l_DiaryID
	[xDiaryRelations:137]xRecordID:4:=$_l_BatchTransationID  //normally these two would be unique code and unique XID for same table but in this case was convenient to use one to store parent record id and the other to store subrecord id
	[xDiaryRelations:137]XRecord_Code:5:=String:C10($_l_BatchTransItemID)  //normally these two would be unique code and unique XID for same table but in this case was convenient to use one to store parent record id and the other to store subrecord id
	
	
	$_d_StampDate:=Current date:C33(*)
	$_ti_StampTime:=Current time:C178(*)
	$_l_StampTimeDate:=GEN_TimeDateStamp($_d_StampDate; $_ti_StampTime)
	[xDiaryRelations:137]X_DisplayedName:6:=String:C10($_l_StampTimeDate)
	
	DB_SaveRecord(->[xDiaryRelations:137])
	READ ONLY:C145([xDiaryRelations:137])
	
End if 
ERR_MethodTrackerReturn("JC_AddDiaryTimeBatchItemRel"; $_t_oldMethodName)