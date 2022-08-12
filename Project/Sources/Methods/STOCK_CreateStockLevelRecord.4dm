//%attributes = {}

If (False:C215)
	//Project Method Name:      STOCK_CreateStockLevelRecord
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
	C_BOOLEAN:C305(<>StockAnal; CSStockLevelCompleted; STK_bo_SLCreate)
	C_LONGINT:C283($_l_ApplicationType; $_l_Retries; $7)
	C_REAL:C285($1; CSStockLevelID)
	C_TEXT:C284($_t_oldMethodName; $2; $3; $4; $5; $6)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("STOCK_CreateStockLevelRecord")

$_l_ApplicationType:=Application type:C494

$_l_Retries:=0
While (Semaphore:C143("CSL"+$2+$5))
	If ($_l_ApplicationType=4D Server:K5:6)
		//MESSAGE("Waiting for Semaphore")
		
	End if 
	$_l_Retries:=$_l_Retries+1
	DelayTicks(10*$_l_Retries)
End while 
QUERY:C277([STOCK_LEVELS:58]; [STOCK_LEVELS:58]Product_Code:1=$2; *)
QUERY:C277([STOCK_LEVELS:58];  & ; [STOCK_LEVELS:58]Stock_Type:2=$5)
QUERY SELECTION:C341([STOCK_LEVELS:58]; [STOCK_LEVELS:58]Currency_Code:8=$6)
QUERY SELECTION:C341([STOCK_LEVELS:58]; [STOCK_LEVELS:58]Layer_Code:9=$4)
If (<>StockAnal)
	QUERY SELECTION:C341([STOCK_LEVELS:58]; [STOCK_LEVELS:58]Analysis_Code:7=$3)
End if 
If (Records in selection:C76([STOCK_LEVELS:58])=0)
	CREATE RECORD:C68([STOCK_LEVELS:58])
	If ($1>0)
		[STOCK_LEVELS:58]X_ID:10:=$1
	Else 
		[STOCK_LEVELS:58]X_ID:10:=AA_GetNextID(->[STOCK_LEVELS:58]X_ID:10)
		SET PROCESS VARIABLE:C370($7; CSStockLevelID; [STOCK_LEVELS:58]X_ID:10)
		
	End if 
	[STOCK_LEVELS:58]Stock_Type:2:=$5
	[STOCK_LEVELS:58]Product_Code:1:=$2
	[STOCK_LEVELS:58]Layer_Code:9:=$4
	If (<>StockAnal)
		[STOCK_LEVELS:58]Analysis_Code:7:=$3
	End if 
	[STOCK_LEVELS:58]Currency_Code:8:=$6
	If ($_l_ApplicationType=4D Server:K5:6)
		//MESSAGE("Saving Stock level")
		//`
	End if 
	DB_SaveRecord(->[STOCK_LEVELS:58])
	If ($_l_ApplicationType=4D Server:K5:6)
		//MESSAGE("Stock Level Saved")
		
	End if 
	
Else 
	SET PROCESS VARIABLE:C370($7; CSStockLevelID; [STOCK_LEVELS:58]X_ID:10)
End if 
STK_bo_SLCreate:=False:C215



CLEAR SEMAPHORE:C144("CSL"+$2+$5)
$_l_Retries:=0
While (Not:C34(STK_bo_SLCreate)) & ($_l_Retries<10)
	$_l_Retries:=$_l_Retries+1
	If ($_l_ApplicationType=4D Server:K5:6)
		//MESSAGE("Resuming Process"+String($7))
	End if 
	SET PROCESS VARIABLE:C370($7; CSStockLevelCompleted; True:C214)
	RESUME PROCESS:C320($7)
	DelayTicks(2*$_l_Retries)
End while 
ERR_MethodTrackerReturn("STOCK_CreateStockLevelRecord"; $_t_oldMethodName)
