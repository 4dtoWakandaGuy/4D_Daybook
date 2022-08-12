//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      StockAss_InLPA
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
	C_LONGINT:C283(vAdd; vSNo)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("StockAss_InLPA")
If (vAdd=1)
	QUERY:C277([COMPONENTS:86]; [COMPONENTS:86]Product_Code:1=[STOCK_MOVEMENT_ITEMS:27]Product_Code:1)
	If (Records in selection:C76([COMPONENTS:86])>0)
		ACCEPT:C269
	Else 
		Gen_Alert("No Components have been specified for that Product"; "Try again")
	End if 
Else 
	If ([STOCK_MOVEMENT_ITEMS:27]Quantity:12<=vSNo)
		ACCEPT:C269
	Else 
		Gen_Alert("You can only Assemble as many items as there are available in "+Term_StoWT("Stock"); "Try again")
	End if 
End if 
ERR_MethodTrackerReturn("StockAss_InLPA"; $_t_oldMethodName)