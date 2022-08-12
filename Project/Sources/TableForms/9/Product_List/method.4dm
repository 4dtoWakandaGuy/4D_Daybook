If (False:C215)
	//Table Form Method Name: [PRODUCTS]Product_List
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:07
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("FM [PRODUCTS].Product_List"; Form event code:C388)
If (DB_t_CurrentFormUsage="Sup")
	QUERY:C277([PRODUCTS_SUPPLIERS:148]; [PRODUCTS_SUPPLIERS:148]Product_Code:8=[PRODUCTS:9]Product_Code:1)
	
	
Else 
	REDUCE SELECTION:C351([PRODUCTS_SUPPLIERS:148]; 0)
	
End if 
ERR_MethodTrackerReturn("FM [PRODUCTS].Product_List"; $_t_oldMethodName)
