//%attributes = {}
If (False:C215)
	//Project Method Name:      Order_Buttons
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
	//ARRAY TEXT(STK_at_AllStockTypes;0)
	C_LONGINT:C283($i)
	C_TEXT:C284(<>STK_t_PhysicalStockType; $_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Order_Buttons")
READ ONLY:C145([STOCK_TYPES:59])
ALL RECORDS:C47([STOCK_TYPES:59])
ARRAY TEXT:C222(STK_at_AllStockTypes; 0)
SELECTION TO ARRAY:C260([STOCK_TYPES:59]Type_Code:1; STK_at_AllStockTypes)
SORT ARRAY:C229(STK_at_AllStockTypes; >)
APPEND TO ARRAY:C911(STK_at_AllStockTypes; "-")
APPEND TO ARRAY:C911(STK_at_AllStockTypes; "•ALL")
STK_at_AllStockTypes:=Find in array:C230(STK_at_AllStockTypes; <>STK_t_PhysicalStockType)


//used in OrdDel_AllowSrc to Store Types allowed alloction
ERR_MethodTrackerReturn("Order_Buttons"; $_t_oldMethodName)