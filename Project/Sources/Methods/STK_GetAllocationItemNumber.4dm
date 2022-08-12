//%attributes = {}
If (False:C215)
	//Project Method Name:      STK_GetAllocationItemNumber
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  13/08/2011 14:33
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY TEXT:C222($_at_OrderCodes; 0)
	C_BOOLEAN:C305(<>STK_bo_AllocationLog; $_bo_AllocCLog; STK_bo_PreviousCAllback; STK_bo_PreviousItemNumberTested)
	C_DATE:C307($_d_StockMovementDate)
	C_LONGINT:C283($_l_ItemNumber; $_l_Retries; $2; $3; STK_l_PreviousItemNumber)
	C_REAL:C285($_r_Quantity)
	C_TEXT:C284(<>STK_T_AllocLog; $_t_CompanyFrom; $_t_oldMethodName; $_t_productCode; $1)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("STK_GetAllocationItemNumber")

//This method is called as process when we have a stock item that is an un-allocation and does not know the order item number.

$_bo_AllocCLog:=(STK_bo_AllocCLog) | (<>STK_bo_AllocationLog)
If ($_bo_AllocCLog)
	<>STK_T_AllocLog:=<>STK_T_AllocLog+Char:C90(13)+String:C10(Current process:C322)+Process_Name(Current process:C322)+"Find Stock movement item  "+String:C10(Current time:C178)
End if 
QUERY:C277([STOCK_MOVEMENTS:40]; [STOCK_MOVEMENTS:40]Movement_Code:1=$1)
$_l_ItemNumber:=0
If (Records in selection:C76([STOCK_MOVEMENTS:40])>=1)
	If ($_bo_AllocCLog)
		<>STK_T_AllocLog:=<>STK_T_AllocLog+Char:C90(13)+String:C10(Current process:C322)+Process_Name(Current process:C322)+"Stock movement item Found "+String:C10(Current time:C178)
	End if 
	$_t_CompanyFrom:=[STOCK_MOVEMENTS:40]Company_From:2
	$_d_StockMovementDate:=[STOCK_MOVEMENTS:40]Movement_Date:5
	QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]x_ID:16=$2)
	$_t_productCode:=[STOCK_MOVEMENT_ITEMS:27]Product_Code:1
	$_r_Quantity:=[STOCK_MOVEMENT_ITEMS:27]Quantity:12
	If ($_bo_AllocCLog)
		<>STK_T_AllocLog:=<>STK_T_AllocLog+Char:C90(13)+String:C10(Current process:C322)+Process_Name(Current process:C322)+"Find Sales Order Item number  "+String:C10(Current time:C178)
	End if 
	QUERY:C277([ORDERS:24]; [ORDERS:24]Company_Code:1=$_t_CompanyFrom; *)
	QUERY:C277([ORDERS:24];  & ; [ORDERS:24]Order_Date:4<=$_d_StockMovementDate)
	SELECTION TO ARRAY:C260([ORDERS:24]Order_Code:3; $_at_OrderCodes)
	QUERY WITH ARRAY:C644([ORDER_ITEMS:25]Order_Code:1; $_at_OrderCodes)
	QUERY SELECTION:C341([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Product_Code:2=$_t_productCode)
	QUERY SELECTION:C341([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Quantity:3>=$_r_Quantity)
	ORDER BY:C49([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Item_Number:27; <)
	$_l_ItemNumber:=[ORDER_ITEMS:25]Item_Number:27
	If ($_bo_AllocCLog)
		<>STK_T_AllocLog:=<>STK_T_AllocLog+Char:C90(13)+String:C10(Current process:C322)+Process_Name(Current process:C322)+"Sales Order Item number found "+String:C10($_l_ItemNumber)+" "+String:C10(Current time:C178)
	End if 
End if 
STK_bo_PreviousCAllback:=False:C215
SET PROCESS VARIABLE:C370($3; STK_l_PreviousItemNumber; $_l_ItemNumber)
SET PROCESS VARIABLE:C370($3; STK_bo_PreviousItemNumberTested; True:C214)
RESUME PROCESS:C320($3)
$_l_Retries:=0
If ($_bo_AllocCLog)
	<>STK_T_AllocLog:=<>STK_T_AllocLog+Char:C90(13)+String:C10(Current process:C322)+Process_Name(Current process:C322)+"Called back to proces "+String:C10($3)+" "+String:C10(Current time:C178)
End if 
Repeat 
	//MESSAGE("wating for process number"+String($3))
	If ($_bo_AllocCLog)
		<>STK_T_AllocLog:=<>STK_T_AllocLog+Char:C90(13)+String:C10(Current process:C322)+Process_Name(Current process:C322)+"Wating for response from "+String:C10($3)+" "+String:C10(Current time:C178)
	End if 
	$_l_Retries:=$_l_Retries+1
	RESUME PROCESS:C320($3)
	DelayTicks(2*$_l_Retries)
Until (STK_bo_PreviousCAllback)
If ($_bo_AllocCLog)
	<>STK_T_AllocLog:=<>STK_T_AllocLog+Char:C90(13)+String:C10(Current process:C322)+Process_Name(Current process:C322)+"Response Received "+String:C10($3)+" "+String:C10(Current time:C178)
End if 
ERR_MethodTrackerReturn("STK_GetAllocationItemNumber"; $_t_oldMethodName)
