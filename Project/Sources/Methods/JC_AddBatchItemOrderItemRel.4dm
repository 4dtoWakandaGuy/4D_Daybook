//%attributes = {}

If (False:C215)
	//Project Method Name:      JC_AddBatchItemOrderItemRel
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
	C_LONGINT:C283($_l_BatchTransItemID; $_l_OrderItemID; $_l_StampTimeDate; $_l_TableNumber; $1; $2)
	C_TEXT:C284($_t_oldMethodName; $_t_RelationshipName; $3)
	C_TIME:C306($_ti_StampTime)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("JC_AddBatchItemOrderItemRel")

//added 09/03/07 -kmw


$_t_oldMethodName:=ERR_MethodTracker("JC_AddBatchItemOrderItemRel")


If (Count parameters:C259>=3)
	$_l_OrderItemID:=$1
	$_l_BatchTransItemID:=$2
	$_t_RelationshipName:=$3
	//
	$_l_TableNumber:=Table:C252(->[TRANSACTION_BATCHES:30])
	//
	READ WRITE:C146([xBatchItemRelations:140])
	CREATE RECORD:C68([xBatchItemRelations:140])
	[xBatchItemRelations:140]x_RelationshipName:7:=$_t_RelationshipName
	[xBatchItemRelations:140]xTableNUM:3:=$_l_TableNumber
	[xBatchItemRelations:140]xBatchItemID:1:=$_l_BatchTransItemID
	[xBatchItemRelations:140]xRecordID:4:=$_l_OrderItemID
	
	$_d_StampDate:=Current date:C33(*)
	$_ti_StampTime:=Current time:C178(*)
	$_l_StampTimeDate:=GEN_TimeDateStamp($_d_StampDate; $_ti_StampTime)
	[xBatchItemRelations:140]x_DisplayedName:6:=String:C10($_l_StampTimeDate)
	
	DB_SaveRecord(->[xBatchItemRelations:140])
	READ ONLY:C145([xBatchItemRelations:140])
	
	
End if 
ERR_MethodTrackerReturn("JC_AddBatchItemOrderItemRel"; $_t_oldMethodName)