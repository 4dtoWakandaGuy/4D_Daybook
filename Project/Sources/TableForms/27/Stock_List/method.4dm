If (False:C215)
	//Table Form Method Name: [STOCK_MOVEMENT_ITEMS]Stock_List
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
	C_TEXT:C284($_t_oldMethodName; vProduct; vTitleR)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("FM [STOCK_MOVEMENT_ITEMS].Stock_List"; Form event code:C388)
$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Header:K2:17)
		
		vTitleR:=Uppercase:C13(Term_StoWT("Stock Items List"))
	: ($_l_event=On Load:K2:1)
		
		RELATE ONE:C42([STOCK_MOVEMENT_ITEMS:27]Movement_Code:11)
		RELATE ONE:C42([STOCK_MOVEMENT_ITEMS:27]Product_Code:1)
		vProduct:=[PRODUCTS:9]Product_Name:2
		RELATE ONE:C42([STOCK_MOVEMENT_ITEMS:27]Location:7)
End case 
ERR_MethodTrackerReturn("FM [STOCK_MOVEMENT_ITEMS].Stock_List"; $_t_oldMethodName)
