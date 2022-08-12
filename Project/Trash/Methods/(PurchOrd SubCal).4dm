//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      PurchOrd SubCal
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/08/2009 15:55
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(DB_bo_RecordModified)
	C_REAL:C285(vTot)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("PurchOrd SubCal")
//PurchOrd SubCal
If ([PURCHASE_ORDERS_ITEMS:169]Price_Per:12=0)
	[PURCHASE_ORDERS_ITEMS:169]Price_Per:12:=1
End if 
[PURCHASE_ORDERS_ITEMS:169]Cost_Amount:5:=Gen_Round((([PURCHASE_ORDERS_ITEMS:169]Quantity:3/[PURCHASE_ORDERS_ITEMS:169]Price_Per:12)*[PURCHASE_ORDERS_ITEMS:169]Cost_Price:4); 2; 1)
If ([PURCHASE_ORDERS_ITEMS:169]Original_Cost:11=0)
	[PURCHASE_ORDERS_ITEMS:169]Discount:10:=0
Else 
	[PURCHASE_ORDERS_ITEMS:169]Discount:10:=Gen_Round(((100-(([PURCHASE_ORDERS_ITEMS:169]Cost_Price:4/[PURCHASE_ORDERS_ITEMS:169]Original_Cost:11)*100))); 1; 3)
End if 
vTot:=1
DB_bo_RecordModified:=True:C214
ERR_MethodTrackerReturn("PurchOrd SubCal"; $_t_oldMethodName)