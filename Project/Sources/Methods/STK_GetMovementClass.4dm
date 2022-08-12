//%attributes = {}
If (False:C215)
	//Project Method Name:      STK_GetMovementClass
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 28/12/2011 17:26
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($2)
	C_LONGINT:C283($_l_Process; $_l_Retries; $1; $3)
	C_TEXT:C284($_t_MovementClass; $_t_oldMethodName; $0; STK_t_Class)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("STK_GetMovementClass")



If (Count parameters:C259>=1)
	If ($2)
		STK_t_Class:=""
		$_l_Process:=New process:C317("STK_GetMovementClass"; 12800; "Get Previous Item Class"; $1; False:C215; Current process:C322)
		$_l_Retries:=0
		While (Process state:C330($_l_Process)>=0) & (Process_Name($_l_Process)="Get Previous Item Class")
			$_l_Retries:=$_l_Retries+1
			DelayTicks(2*$_l_Retries)
		End while 
		$0:=STK_t_Class
		
	Else 
		
		$_t_MovementClass:="NUL"
		QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_ID:16=$1)
		If ([STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30#"")
			QUERY:C277([MOVEMENT_TYPES:60]; [MOVEMENT_TYPES:60]Type_Code:1=[STOCK_MOVEMENT_ITEMS:27]x_Stock_Movement_Type:30)
			
			Case of 
				: ([MOVEMENT_TYPES:60]Alloc_Type:10)
					$_t_MovementClass:="Allocation"
				: ([MOVEMENT_TYPES:60]Assembly_Type:23)
					$_t_MovementClass:="Assembly"
				: ([MOVEMENT_TYPES:60]Delivery_Type:12)
					$_t_MovementClass:="Delivery"
				: ([MOVEMENT_TYPES:60]Purch_Ord_Type:11)
					$_t_MovementClass:="Purchase Order"
				: ([MOVEMENT_TYPES:60]Unalloc_Type:13)
					$_t_MovementClass:="Unallocation"
				: ([MOVEMENT_TYPES:60]UseForAnalysisMove:30)
					$_t_MovementClass:="AnalysisChange"
				: ([MOVEMENT_TYPES:60]UseForCurrencyMove:32)
					$_t_MovementClass:="CurrencyChange"
				: ([MOVEMENT_TYPES:60]UseForLayerMove:31)
					$_t_MovementClass:="LayerChange"
				: ([MOVEMENT_TYPES:60]UseForLocationMove:29)
					$_t_MovementClass:="LpcationCharnge"
				: ([MOVEMENT_TYPES:60]UseForpurchaseCancellation:34)
					$_t_MovementClass:="PurchaseOrderCancellation"
				: ([MOVEMENT_TYPES:60]UseForStockReceipt:33)
					$_t_MovementClass:="StockReceipt"
				: ([MOVEMENT_TYPES:60]UseForValueChange:28)
					$_t_MovementClass:="ValueChange"
				Else 
					$_t_MovementClass:="NUL"
			End case 
		Else 
			$_t_MovementClass:="NUL"
		End if 
		If (Count parameters:C259>=3)
			SET PROCESS VARIABLE:C370($3; STK_t_Class; $_t_MovementClass)
		Else 
			$0:=$_t_MovementClass
		End if 
		
	End if 
End if 
ERR_MethodTrackerReturn("STK_GetMovementClass"; $_t_oldMethodName)
