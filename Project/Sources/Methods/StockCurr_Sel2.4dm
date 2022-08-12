//%attributes = {}
If (False:C215)
	//Project Method Name:      StockCurr_Sel2
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
	C_TEXT:C284($_t_oldMethodName; vProdCode; vStatus)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("StockCurr_Sel2")
If (vStatus="•ALL")
	QUERY:C277([CURRENT_STOCK:62]; [CURRENT_STOCK:62]Product_Code:1=vProdCode)
Else 
	QUERY:C277([CURRENT_STOCK:62]; [CURRENT_STOCK:62]Product_Code:1=vProdCode; *)
	QUERY:C277([CURRENT_STOCK:62];  & ; [CURRENT_STOCK:62]Stock_Type:3=vStatus)
End if 
ERR_MethodTrackerReturn("StockCurr_Sel2"; $_t_oldMethodName)