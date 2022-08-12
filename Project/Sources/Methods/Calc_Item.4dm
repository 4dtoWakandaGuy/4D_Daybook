//%attributes = {}
If (False:C215)
	//Project Method Name:      Calc_Item
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 28/11/2010 18:09
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_REAL:C285(vTot)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Calc_Item")
//Calc_Item
If ([ORDER_ITEMS:25]Price_Per:50=0)
	[ORDER_ITEMS:25]Price_Per:50:=1
End if 
[ORDER_ITEMS:25]Sales_Amount:7:=Gen_Round((([ORDER_ITEMS:25]Quantity:3/[ORDER_ITEMS:25]Price_Per:50)*[ORDER_ITEMS:25]Sales_Price:4); 2; 2)
Calc_ItemCost
[ORDER_ITEMS:25]Standard_Amount:40:=Gen_Round((([ORDER_ITEMS:25]Quantity:3/[ORDER_ITEMS:25]Price_Per:50)*[ORDER_ITEMS:25]Standard_Price:39); 2; 2)
[ORDER_ITEMS:25]Standard_Cost_Amount:42:=Gen_Round((([ORDER_ITEMS:25]Quantity:3/[ORDER_ITEMS:25]Price_Per:50)*[ORDER_ITEMS:25]Standard_Cost:41); 2; 2)
Calc_ItemVAT
[ORDER_ITEMS:25]Total_Amount:9:=Gen_Round(([ORDER_ITEMS:25]Sales_Amount:7+[ORDER_ITEMS:25]TAX_Amount:8); 2; 2)
If ([ORDER_ITEMS:25]Retail_Price:38=0)
	[ORDER_ITEMS:25]Discount:37:=0
Else 
	[ORDER_ITEMS:25]Discount:37:=Gen_Round(((100-(([ORDER_ITEMS:25]Sales_Price:4/[ORDER_ITEMS:25]Retail_Price:38)*100))); 1; 3)
End if 
vTot:=1
Orders_InLPM
If ((DB_GetModuleSettingByNUM(Module_Subscriptions))>1)
	If ([ORDER_ITEMS:25]Invoice_Number:17="SUBS")
		[ORDER_ITEMS:25]Invoice_Number:17:="SUBS*"
	End if 
End if 
ERR_MethodTrackerReturn("Calc_Item"; $_t_oldMethodName)
