If (False:C215)
	//Table Form Method Name: [STOCK_MOVEMENT_ITEMS]Stock_SubP
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
	C_TEXT:C284($_t_oldMethodName; vProduct)
End if 

//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("FM [STOCK_MOVEMENT_ITEMS].Stock_SubP"; Form event code:C388)
RELATE ONE:C42([STOCK_MOVEMENT_ITEMS:27]Product_Code:1)
vProduct:=[PRODUCTS:9]Product_Name:2
ERR_MethodTrackerReturn("FM [STOCK_MOVEMENT_ITEMS].Stock_SubP"; $_t_oldMethodName)