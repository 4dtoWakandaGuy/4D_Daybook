//%attributes = {}
If (False:C215)
	//Project Method Name:      Stock_Calc
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 12/01/2012 16:59
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(vStockLevel; vStockUA)
	C_REAL:C285(vStockVal; vStockValUA)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Stock_Calc")
//Stock_Calc
If ([PRODUCTS:9]Maintain_Stock:14=True:C214)
	QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Product_Code:1=[PRODUCTS:9]Product_Code:1; *)
	QUERY:C277([STOCK_MOVEMENT_ITEMS:27];  & ; [STOCK_MOVEMENT_ITEMS:27]Date_Shipped:6=!00-00-00!)
	vStockLevel:=Sum:C1([STOCK_MOVEMENT_ITEMS:27]Moved_Quantity:40)
	vStockVal:=Sum:C1([STOCK_MOVEMENT_ITEMS:27]Total_Cost:13)
	QUERY SELECTION:C341([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Item_Number:8=0)
	vStockUA:=Sum:C1([STOCK_MOVEMENT_ITEMS:27]Quantity:12)
	vStockValUA:=Sum:C1([STOCK_MOVEMENT_ITEMS:27]Total_Cost:13)
Else 
	vStockLevel:=0
	vStockUA:=0
	vStockVal:=0
	vStockValUA:=0
End if 
ERR_MethodTrackerReturn("Stock_Calc"; $_t_oldMethodName)