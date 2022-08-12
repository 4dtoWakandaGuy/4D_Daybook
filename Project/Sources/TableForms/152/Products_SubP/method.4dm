If (False:C215)
	//Table Form Method Name: [SERVICE_CALLS_PRODUCTS]Products SubP
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 27/08/2009 18:14
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName; vContType; vDates)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FM [SERVICE_CALLS_PRODUCTS].Products SubP"; Form event code:C388)

//Calls Products_Sub
Case of 
	: (Form event code:C388=On Printing Detail:K2:18)  // (During)
		// RELATE ONE(Product Code)
		// vProduct:=[PRODUCTS]Product Name
		RELATE ONE:C42([SERVICE_CALLS_PRODUCTS:152]Contract_Code:3)
		vContType:=[CONTRACTS:17]Contract_Type_Code:4
		vDates:=String:C10([CONTRACTS:17]Start_Date:5; "Short")+" - "+String:C10([CONTRACTS:17]End_Date:6; "Short")
End case 
ERR_MethodTrackerReturn("FM [SERVICE_CALLS_PRODUCTS].Products SubP"; $_t_oldMethodName)
