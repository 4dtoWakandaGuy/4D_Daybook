//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      OrderI_NoStockS
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
	C_LONGINT:C283(vNo)
	C_TEXT:C284($_t_oldMethodName; vText)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OrderI_NoStockS")
vText:=""
vNo:=0
FIRST RECORD:C50([ORDER_ITEMS:25])
While (Not:C34(End selection:C36([ORDER_ITEMS:25])))
	If ([ORDER_ITEMS:25]Product_Code:2#"")
		QUERY:C277([STOCK_MOVEMENT_ITEMS:27]; [STOCK_MOVEMENT_ITEMS:27]Item_Number:8=[ORDER_ITEMS:25]Item_Number:27)
		If (Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])=0)
			vText:=vText+"Order "+[ORDER_ITEMS:25]Order_Code:1+", Item "+String:C10([ORDER_ITEMS:25]Item_Number:27)+", Product "+[ORDER_ITEMS:25]Product_Code:2+", Invoice "+[ORDER_ITEMS:25]Invoice_Number:17+Char:C90(13)
			vNo:=vNo+1
		End if 
	End if 
	NEXT RECORD:C51([ORDER_ITEMS:25])
End while 
Gen_Alert(String:C10(vNo))
PRINT SETTINGS:C106
If (OK=1)
	Print form:C5([DOCUMENTS:7]; "Form")
	PAGE BREAK:C6
End if 
ERR_MethodTrackerReturn("OrderI_NoStockS"; $_t_oldMethodName)