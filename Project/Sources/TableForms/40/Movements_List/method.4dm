If (False:C215)
	//Table Form Method Name: [STOCK_MOVEMENTS]Movements_List
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
	C_TEXT:C284($_t_oldMethodName; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; vTitleR)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("FM [STOCK_MOVEMENTS].Movements_List"; Form event code:C388)

Case of 
	: (Form event code:C388=On Header:K2:17)
		vTitleR:=Uppercase:C13(Term_StoWT("Stock Movements_List"))
	: (Form event code:C388=On Printing Detail:K2:18)
		RELATE ONE:C42([STOCK_MOVEMENTS:40]Company_From:2)
		If (DB_t_CurrentFormUsage="Stock")
			RELATE MANY:C262([STOCK_MOVEMENTS:40]Movement_Code:1)
		End if 
End case 
ERR_MethodTrackerReturn("FM [STOCK_MOVEMENTS].Movements_List"; $_t_oldMethodName)
