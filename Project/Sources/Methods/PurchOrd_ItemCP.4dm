//%attributes = {}
If (False:C215)
	//Project Method Name:      PurchOrd_ItemCP
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/11/2009`Method: PurchOrd_ItemCP
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("PurchOrd_ItemCP")
If ([PURCHASE_ORDERS_ITEMS:169]Item_Number:6>0)
	CUT NAMED SELECTION:C334([ORDER_ITEMS:25]; "$OI")
	CUT NAMED SELECTION:C334([ORDERS:24]; "$OR")
	READ WRITE:C146([ORDER_ITEMS:25])
	READ WRITE:C146([ORDERS:24])
	QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Item_Number:27=[PURCHASE_ORDERS_ITEMS:169]Item_Number:6)
	RELATE ONE:C42([ORDER_ITEMS:25]Order_Code:1)
	If ((Locked:C147([ORDERS:24])) | (Locked:C147([ORDER_ITEMS:25])))
		Gen_Alert("NB: The Order or Order Item linked to this Purchase Order Item is locked"+" by another user or process, so its Cost Price cannot be updated"; "")
	Else 
		If ([PURCHASE_ORDERS:57]Currency_Code:16=[ORDERS:24]Currency_Code:32)
			[ORDER_ITEMS:25]Cost_Price:5:=[PURCHASE_ORDERS_ITEMS:169]Cost_Price:4
		Else 
			[ORDER_ITEMS:25]Cost_Price:5:=Cat_ConvertValue([PURCHASE_ORDERS_ITEMS:169]Cost_Price:4; [PURCHASE_ORDERS:57]Currency_Code:16; [ORDERS:24]Currency_Code:32; Current date:C33(*))
		End if 
		Calc_Item
		
		DB_SaveRecord(->[ORDER_ITEMS:25])
		AA_CheckFileUnlockedByTableNUM(Table:C252(->[ORDER_ITEMS:25]))
		QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Order_Code:1=[ORDERS:24]Order_Code:3)
		Orders_InLPTot(False:C215)
		DB_SaveRecord(->[ORDERS:24])
		AA_CheckFileUnlocked(->[ORDERS:24]x_ID:58)
	End if 
	USE NAMED SELECTION:C332("$OR")
	USE NAMED SELECTION:C332("$OI")
End if 
ERR_MethodTrackerReturn("PurchOrd_ItemCP"; $_t_oldMethodName)