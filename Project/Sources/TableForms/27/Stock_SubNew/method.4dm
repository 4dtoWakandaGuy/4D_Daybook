If (False:C215)
	//Table Form Method Name: [STOCK_MOVEMENT_ITEMS]Stock_SubNew
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
	C_TEXT:C284($_t_oldMethodName; vLocation; vProduct)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("FM [STOCK_MOVEMENT_ITEMS].Stock_SubNew"; Form event code:C388)
$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Data Change:K2:15)
		If (Modified record:C314([STOCK_MOVEMENT_ITEMS:27]))
			If ([STOCK_MOVEMENT_ITEMS:27]Company_To:2="@MINUS")
				Gen_Alert("You cannot modify the Assembled Items"; "Cancel")
				LOAD RECORD:C52([STOCK_MOVEMENT_ITEMS:27])
			Else 
				StockI_SubLP
			End if 
		End if 
		If ([STOCK_MOVEMENT_ITEMS:27]Product_Code:1#[PRODUCTS:9]Product_Code:1)
			RELATE ONE:C42([STOCK_MOVEMENT_ITEMS:27]Product_Code:1)
		End if 
		vProduct:=[PRODUCTS:9]Product_Name:2
		If ([STOCK_MOVEMENT_ITEMS:27]Location:7#[LOCATIONS:61]Location_Code:1)
			RELATE ONE:C42([STOCK_MOVEMENT_ITEMS:27]Location:7)
			vLocation:=[LOCATIONS:61]Location_Name:2
		End if 
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		OpenHelp(Table:C252(->[STOCK_MOVEMENT_ITEMS:27]); "Stock_SubNew")
		StockI_SubLPB
End case 
ERR_MethodTrackerReturn("FM [STOCK_MOVEMENT_ITEMS].Stock_SubNew"; $_t_oldMethodName)
