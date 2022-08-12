//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Stock_CalcL
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
	C_LONGINT:C283(vStockLevel; vStockUA)
	C_REAL:C285(vStockVal; vStockValUA)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Stock_CalcL")
//Stock_CalcL - for printing layouts
vStockLevel:=0
vStockUA:=0
vStockVal:=0
vStockValUA:=0
If ([PRODUCTS:9]Maintain_Stock:14=True:C214)
	Products_Reord2
	FIRST RECORD:C50([STOCK_LEVELS:58])
	While (Not:C34(End selection:C36([STOCK_LEVELS:58])))
		vStockLevel:=vStockLevel+[STOCK_LEVELS:58]Free_Level:3
		vStockVal:=vStockVal+[STOCK_LEVELS:58]Free_Cost:5
		vStockUA:=vStockUA+[STOCK_LEVELS:58]Allocated_Level:4
		vStockValUA:=vStockValUA+[STOCK_LEVELS:58]Allocated_Cost:6
		NEXT RECORD:C51([STOCK_LEVELS:58])
	End while 
End if 
ERR_MethodTrackerReturn("Stock_CalcL"; $_t_oldMethodName)