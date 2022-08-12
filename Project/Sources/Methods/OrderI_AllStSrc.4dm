//%attributes = {}
If (False:C215)
	//Project Method Name:      OrderI_AllStSrc
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
	C_LONGINT:C283(ch1; vNo; vRecNo; vSNo; vStockLevel; vStockUA)
	C_TEXT:C284($_t_oldMethodName; vStatus; vTitle)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OrderI_AllStSrc")
StockCurr_Sel3
If (ch1=0)
	QUERY SELECTION:C341([CURRENT_STOCK:62]; [CURRENT_STOCK:62]Item_Number:5=0)
End if 
vNo:=Records in selection:C76([CURRENT_STOCK:62])
FIRST RECORD:C50([CURRENT_STOCK:62])
vStockLevel:=0
vStockUA:=0
While (Not:C34(End selection:C36([CURRENT_STOCK:62])))
	vStockLevel:=vStockLevel+[CURRENT_STOCK:62]Quantity:4
	vStockUA:=vStockUA+([CURRENT_STOCK:62]Quantity:4*Num:C11([CURRENT_STOCK:62]Item_Number:5=0))
	NEXT RECORD:C51([CURRENT_STOCK:62])
End while 
vTitle:=Uppercase:C13(Term_StoWT("CURRENT STOCK:  "+vStatus))
GOTO RECORD:C242([ORDER_ITEMS:25]; vRecNo)
vSNo:=[ORDER_ITEMS:25]Quantity:3-[ORDER_ITEMS:25]Allocated:28
ERR_MethodTrackerReturn("OrderI_AllStSrc"; $_t_oldMethodName)