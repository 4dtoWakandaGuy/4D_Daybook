//%attributes = {}
If (False:C215)
	//Project Method Name:      STK_GetTakeFromCurrentStockID
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:      28/12/2010 17:38
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_isAllocationType; $_bo_IsunallocationType; $_bo_SNWasOnPrevious; $15)
	C_DATE:C307($_d_Date; $14)
	C_LONGINT:C283($_l_CopiedFromStockItemID; $_l_CurrentStockID; $_l_ItemNumber; $_l_SelectedRecordNumber; $0; $12; $13; $9)
	C_REAL:C285($_r_CostPrice; $_r_Quantity; $4; $8)
	C_TEXT:C284($_t_AnalysisCode; $_t_CurrencyCode; $_t_LayerCode; $_t_Location; $_t_LocationWasOnPrevious; $_t_oldMethodName; $_t_productCode; $_t_SerialNumber; $_t_StockType; $1; $10)
	C_TEXT:C284($11; $16; $2; $3; $5; $6; $7; STK_t_MovementType)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("STK_GetTakeFromCurrentStockID")
READ ONLY:C145([MOVEMENT_TYPES:60])
COPY NAMED SELECTION:C331([CURRENT_STOCK:62]; "$TempCS")
$_l_SelectedRecordNumber:=Selected record number:C246([CURRENT_STOCK:62])

If ([MOVEMENT_TYPES:60]Type_Code:1#$1)
	QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Type_Code:1=$1)
End if 
$_t_productCode:=$3
$_t_LayerCode:=$6
$_r_Quantity:=$4
$_t_StockType:=$2
$_t_CurrencyCode:=$5
$_t_AnalysisCode:=$7
$_t_Location:=$10
$_t_SerialNumber:=$11
$_r_CostPrice:=$8
$_l_ItemNumber:=$9
$_bo_isAllocationType:=[MOVEMENT_TYPES:60]Alloc_Type:10
$_bo_IsunallocationType:=[MOVEMENT_TYPES:60]Unalloc_Type:13
$_l_CurrentStockID:=$13
$_l_CopiedFromStockItemID:=$12
$_d_Date:=$14
$_bo_SNWasOnPrevious:=$15
$_t_LocationWasOnPrevious:=$16
STK_t_MovementType:=$1
$0:=STK_GetCurrentStockID(0; $_t_productCode; $_t_StockType; $_l_ItemNumber; $_t_CurrencyCode; $_t_LayerCode; $_t_AnalysisCode; $_t_Location; $_t_SerialNumber; $_r_CostPrice; $_bo_isAllocationType; $_bo_IsunallocationType; $_l_CopiedFromStockItemID; $_l_CurrentStockID; $_d_Date; $_r_Quantity; $_bo_SNWasOnPrevious; $_t_LocationWasOnPrevious)
STK_t_MovementType:=""
USE NAMED SELECTION:C332("$TempCS")
If ($_l_SelectedRecordNumber>0)
	GOTO SELECTED RECORD:C245([CURRENT_STOCK:62]; $_l_SelectedRecordNumber)
End if 
ERR_MethodTrackerReturn("STK_GetTakeFromCurrentStockID"; $_t_oldMethodName)
