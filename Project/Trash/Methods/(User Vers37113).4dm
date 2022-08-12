//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      User Vers37113
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/08/2009 10:05
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY BOOLEAN:C223($_abo_PriceGroups; 0)
	ARRAY TEXT:C222($_at_CompanyCodes; 0)
	C_LONGINT:C283($_l_CountRecords; $_l_Index)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("User Vers37113")
//User Vers37113
READ ONLY:C145([PURCHASE_INVOICES:37])
ALL RECORDS:C47([PURCHASE_INVOICES:37])
If (Records in selection:C76([PURCHASE_INVOICES:37])>0)
	ARRAY TEXT:C222($_at_CompanyCodes; 0)
	
	DISTINCT VALUES:C339([PURCHASE_INVOICES:37]Company_Code:2; $_at_CompanyCodes)
	READ WRITE:C146([COMPANIES:2])
	$_l_CountRecords:=Size of array:C274($_at_CompanyCodes)
	User_Message(Char:C90(13)+"    Creating "+String:C10($_l_CountRecords)+" Company PL Terms")
	For ($_l_Index; 1; $_l_CountRecords)
		QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Code:1=$_at_CompanyCodes{$_l_Index})
		If ([COMPANIES:2]SL_Terms:40#"")
			[COMPANIES:2]PL_Terms:53:=[COMPANIES:2]SL_Terms:40
			DB_SaveRecord(->[COMPANIES:2])
			AA_CheckFileUnlocked(->[COMPANIES:2]x_ID:63)
		End if 
	End for 
	READ ONLY:C145([COMPANIES:2])
	UNLOAD RECORD:C212([COMPANIES:2])
End if 
UNLOAD RECORD:C212([PURCHASE_INVOICES:37])

If (Records in table:C83([PRICE_GROUPS:18])>0)
	READ WRITE:C146([PRICE_GROUPS:18])
	ALL RECORDS:C47([PRICE_GROUPS:18])
	$_l_CountRecords:=Records in selection:C76([PRICE_GROUPS:18])
	User_Message(Char:C90(13)+"    Updating "+String:C10($_l_CountRecords)+" Price Groups")
	ARRAY BOOLEAN:C223($_abo_PriceGroups; $_l_CountRecords)
	For ($_l_Index; 1; $_l_CountRecords)
		$_abo_PriceGroups{$_l_Index}:=False:C215
	End for 
	ARRAY TO SELECTION:C261($_abo_PriceGroups; [PRICE_GROUPS:18]Cost_Prices:4)
	READ ONLY:C145([PRICE_GROUPS:18])
	UNLOAD RECORD:C212([PRICE_GROUPS:18])
End if 

If (Records in table:C83([PURCHASE_ORDERS:57])>0)
	READ WRITE:C146([PURCHASE_ORDERS:57])
	ALL RECORDS:C47([PURCHASE_ORDERS:57])
	$_l_CountRecords:=Records in selection:C76([PURCHASE_ORDERS:57])
	User_Message(Char:C90(13)+"    Updating "+String:C10($_l_CountRecords)+" Purchase Orders")
	FIRST RECORD:C50([PURCHASE_ORDERS:57])
	While (Not:C34(End selection:C36([PURCHASE_ORDERS:57])))
		QUERY:C277([PURCHASE_ORDERS_ITEMS:169]; [PURCHASE_ORDERS_ITEMS:169]PURCHASE_ORDERS_CODE:18=[PURCHASE_ORDERS:57]Purchase_Order_Number:2)
		APPLY TO SELECTION:C70([PURCHASE_ORDERS_ITEMS:169]; [PURCHASE_ORDERS_ITEMS:169]Original_Cost:11:=[PURCHASE_ORDERS_ITEMS:169]Cost_Price:4)
		DB_SaveRecord(->[PURCHASE_ORDERS:57])
		NEXT RECORD:C51([PURCHASE_ORDERS:57])
	End while 
	READ ONLY:C145([PURCHASE_ORDERS:57])
	UNLOAD RECORD:C212([PURCHASE_ORDERS:57])
End if 
ERR_MethodTrackerReturn("User Vers37113"; $_t_oldMethodName)