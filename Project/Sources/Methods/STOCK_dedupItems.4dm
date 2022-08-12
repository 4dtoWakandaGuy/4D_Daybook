//%attributes = {}
If (False:C215)
	//Project Method Name:      STOCK_dedupItems
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_DATE:C307($_d_ReceivedDate; $_d_ShippedDate)
	C_LONGINT:C283($_l_Index; $_l_RecordsinSelectionMovementIt; $_l_StockMovementItem; $_l_StockNumber)
	C_REAL:C285($_r_AssemblyQuantity; $_r_ComponentQuantity; $_r_CostPrice; $_r_Quantity; $_r_TotalCost)
	C_TEXT:C284($_t_CompanyToCode; $_t_Location; $_t_MovementCode; $_t_oldMethodName; $_t_OrderCode; $_t_ProductCode; $_t_SerialNumber)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("STOCK_dedupItems")
//this method is part of testing stock control
//in the data i have there are multiple stock items which are identical.
//this is to delete  those duplicates
ALL RECORDS:C47([STOCK_MOVEMENT_ITEMS:27])
CREATE SET:C116([STOCK_MOVEMENT_ITEMS:27]; "ALLRECORDS")
CREATE EMPTY SET:C140([STOCK_MOVEMENT_ITEMS:27]; "TODELETE")
For ($_l_Index; 1; Records in table:C83([STOCK_MOVEMENT_ITEMS:27]))
	MESSAGE:C88(String:C10($_l_Index))
	
	USE SET:C118("ALLRECORDS")
	GOTO SELECTED RECORD:C245([STOCK_MOVEMENT_ITEMS:27]; $_l_Index)
	$_t_ProductCode:=[STOCK_MOVEMENT_ITEMS:27]Product_Code:1
	$_t_CompanyToCode:=[STOCK_MOVEMENT_ITEMS:27]Company_To:2
	$_t_OrderCode:=[STOCK_MOVEMENT_ITEMS:27]Order_Code:3
	$_t_SerialNumber:=[STOCK_MOVEMENT_ITEMS:27]Serial_Number:4
	$_d_ReceivedDate:=[STOCK_MOVEMENT_ITEMS:27]Date_Received:5
	$_d_ShippedDate:=[STOCK_MOVEMENT_ITEMS:27]Date_Shipped:6
	$_t_Location:=[STOCK_MOVEMENT_ITEMS:27]Location:7
	$_l_StockMovementItem:=[STOCK_MOVEMENT_ITEMS:27]Item_Number:8
	$_l_StockNumber:=[STOCK_MOVEMENT_ITEMS:27]Stock_Number:9
	$_r_CostPrice:=[STOCK_MOVEMENT_ITEMS:27]Cost_Price:10
	$_t_MovementCode:=[STOCK_MOVEMENT_ITEMS:27]Movement_Code:11
	$_r_Quantity:=[STOCK_MOVEMENT_ITEMS:27]Quantity:12
	$_r_TotalCost:=[STOCK_MOVEMENT_ITEMS:27]Total_Cost:13
	$_r_AssemblyQuantity:=[STOCK_MOVEMENT_ITEMS:27]Assembly_Qty:14
	$_r_ComponentQuantity:=[STOCK_MOVEMENT_ITEMS:27]Component_Qty:15
	QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Product_Code:1=$_t_ProductCode; *)
	QUERY:C277([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]Company_To:2=$_t_CompanyToCode; *)
	QUERY:C277([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]Order_Code:3=$_t_OrderCode; *)
	QUERY:C277([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]Serial_Number:4=$_t_SerialNumber; *)
	QUERY:C277([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]Date_Received:5=$_d_ReceivedDate; *)
	QUERY:C277([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]Date_Shipped:6=$_d_ShippedDate; *)
	QUERY:C277([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]Location:7=$_t_Location; *)
	QUERY:C277([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]Item_Number:8=$_l_StockMovementItem; *)
	QUERY:C277([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]Stock_Number:9=$_l_StockNumber)
	
	QUERY:C277([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]Cost_Price:10=$_r_CostPrice; *)
	QUERY:C277([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]Movement_Code:11=$_t_MovementCode; *)
	QUERY:C277([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]Quantity:12=$_r_Quantity; *)
	QUERY:C277([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]Total_Cost:13=$_r_TotalCost; *)
	QUERY:C277([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]Assembly_Qty:14=$_r_AssemblyQuantity; *)
	QUERY:C277([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]Component_Qty:15=$_r_ComponentQuantity)
	If (Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])>1)
		$_l_RecordsinSelectionMovementIt:=Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])
		REDUCE SELECTION:C351([STOCK_MOVEMENT_ITEMS:27]; $_l_RecordsinSelectionMovementIt-1)
		CREATE SET:C116([STOCK_MOVEMENT_ITEMS:27]; "TEMP")
		UNION:C120("TODELETE"; "TEMP"; "TODELETE")
		CLEAR SET:C117("TEMP")
		
	End if 
End for 
USE SET:C118("TODELETE")
ERR_MethodTrackerReturn("STOCK_dedupItems"; $_t_oldMethodName)
