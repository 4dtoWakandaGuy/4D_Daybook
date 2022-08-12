If (False:C215)
	//Table Form Method Name: [PURCHASE_ORDERS]PurchOrd_List
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/08/2009 10:35
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(DB_bo_NoLoad)
	C_TEXT:C284($_t_oldMethodName; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; vStatus)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("FM [PURCHASE_ORDERS].PurchOrd_List"; Form event code:C388)

Case of 
	: (Form event code:C388=On Printing Detail:K2:18)  // (During)
		If (False:C215)
			If ([PURCHASE_ORDERS:57]State:14=-1)
				vStatus:="Unconfirmed"
			Else 
				vStatus:="Confirmed"
			End if 
		Else 
			VStatus:=PUR_GetFileState
		End if 
		
		If (DB_t_CurrentFormUsage="Items")
			QUERY:C277([PURCHASE_ORDERS_ITEMS:169]; [PURCHASE_ORDERS_ITEMS:169]PURCHASE_ORDERS_CODE:18=[PURCHASE_ORDERS:57]Purchase_Order_Number:2)
		Else 
			REDUCE SELECTION:C351([PURCHASE_ORDERS_ITEMS:169]; 0)
		End if 
		QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Code:1=[PURCHASE_ORDERS:57]Company_Code:1)
End case 
ERR_MethodTrackerReturn("FM [PURCHASE_ORDERS].PurchOrd_List"; $_t_oldMethodName)
