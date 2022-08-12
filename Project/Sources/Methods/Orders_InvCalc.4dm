//%attributes = {}
If (False:C215)
	//Project Method Name:      Orders_InvCalc
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 19/08/2009 17:01
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//C_UNKNOWN(vTotal)
	//C_UNKNOWN(vVAT)
	C_REAL:C285(vTotal; vVAT; vSubtotal)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Orders_InvCalc")
//Orders_InvCalc
vSubtotal:=0
vVAT:=0
vTotal:=0
ORDER BY:C49([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Sort_Order:26; >)
If (True:C214)
	FIRST RECORD:C50([ORDER_ITEMS:25])
	While (Not:C34(End selection:C36([ORDER_ITEMS:25])))
		vSubtotal:=Round:C94(vSubtotal+[ORDER_ITEMS:25]Sales_Amount:7; 2)
		vVAT:=Round:C94(vVAT+[ORDER_ITEMS:25]TAX_Amount:8; 2)
		vTotal:=Round:C94(vTotal+[ORDER_ITEMS:25]Total_Amount:9; 2)
		NEXT RECORD:C51([ORDER_ITEMS:25])
	End while 
	FIRST RECORD:C50([ORDER_ITEMS:25])
Else 
	vSubtotal:=(Round:C94(Sum:C1([ORDER_ITEMS:25]Sales_Amount:7); 2))
	vVAT:=(Round:C94(Sum:C1([ORDER_ITEMS:25]TAX_Amount:8); 2))
	vTotal:=(Round:C94(Sum:C1([ORDER_ITEMS:25]Total_Amount:9); 2))
End if 
ERR_MethodTrackerReturn("Orders_InvCalc"; $_t_oldMethodName)
