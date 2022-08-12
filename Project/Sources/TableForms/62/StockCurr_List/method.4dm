If (False:C215)
	//Table Form Method Name: [CURRENT_STOCK]StockCurr_List
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:46
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(DB_bo_NoLoad)
	C_LONGINT:C283($_l_event)
	C_REAL:C285(vQuantity; vTotal)
	C_TEXT:C284($_t_oldMethodName; vCompany; vCompCode; vOrderCode; vTitleR)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("FM [CURRENT_STOCK].StockCurr_List"; Form event code:C388)

$_l_event:=Form event code:C388


Case of 
	: ($_l_event=On Header:K2:17)
		
		
		
		vTitleR:=Uppercase:C13(Term_StoWT("Current Stock_List"))
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		
		
		RELATE ONE:C42([CURRENT_STOCK:62]Stock_Type:3)
		RELATE ONE:C42([CURRENT_STOCK:62]Location:8)
		RELATE ONE:C42([CURRENT_STOCK:62]Product_Code:1)
		RELATE ONE:C42([CURRENT_STOCK:62]Item_Number:5)
		vOrderCode:=[ORDER_ITEMS:25]Order_Code:1
		If (vOrderCode#"")
			RELATE ONE:C42([ORDER_ITEMS:25]Order_Code:1)
			vCompCode:=[ORDERS:24]Company_Code:1
			RELATE ONE:C42([ORDERS:24]Company_Code:1)
			vCompany:=[COMPANIES:2]Company_Name:2
		Else 
			vCompCode:=""
			vCompany:=""
		End if 
	: ($_l_event=On Printing Break:K2:19)
		
		
		vQuantity:=Round:C94((Subtotal:C97([CURRENT_STOCK:62]Quantity:4)); 2)
		vTotal:=Round:C94((Subtotal:C97([CURRENT_STOCK:62]Total_Cost:9)); 2)
End case 
ERR_MethodTrackerReturn("FM [CURRENT_STOCK].StockCurr_List"; $_t_oldMethodName)
