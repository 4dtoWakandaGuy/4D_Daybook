//%attributes = {}
If (False:C215)
	//Project Method Name:      Orders_MenV
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:   14/09/2010 22:49
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(ORD_al_SubAreaTables;0)
	//ARRAY POINTER(ORD_aptr_SubAreaPointers;0)
	ARRAY TEXT:C222($_at_ProductCodes; 0)
	ARRAY TEXT:C222($_at_PurchaseOrderNumbers; 0)
	C_BOOLEAN:C305(<>AutoFind; <>DB_bo_AutoOut; $_bo_FromIN; $_bo_Reselect; ORD_bo_IsRevision; VFromin)
	C_LONGINT:C283(<>AutoProc; $_l_BlankRow; $_l_Menu; $_l_OrderItemsRow; $1; SD_l_CompanionMenuTable; SD3_l_CallActionNum)
	C_POINTER:C301($_ptr_HighlightSet; $_ptr_ListBoxSetup)
	C_TEXT:C284(<>AutoFile; <>CompCode; <>ContCode; <>OrderCode; $_t_HighlightSetName; $_t_oldMethodName; SD3_t_DiaryRelatedRecord)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Orders_MenV")
If (Count parameters:C259>=1)
	$_l_Menu:=$1
Else 
	$_l_Menu:=Sel_LPmi("Orders_MenV")
End if 
$_bo_FromIN:=VFromin

If (Not:C34(ORD_bo_IsRevision))
	DB_SaveRecord(->[ORDERS:24])
	AA_CheckFileUnlocked(->[ORDERS:24]x_ID:58)
	DB_SaveRecord(->[ORDER_ITEMS:25])
	AA_CheckFileUnlockedByTableNUM(Table:C252(->[ORDER_ITEMS:25]))
	
	If ($_l_Menu=11)  //Separate cos doesn't want OI to be unloaded
		If (Not:C34(ORD_bo_IsRevision))
			Orders_SuMod
		End if 
	Else 
		If ((FORM Get current page:C276=1) | ([ORDERS:24]Delivery_Company:29=""))
			<>CompCode:=[ORDERS:24]Company_Code:1
			<>ContCode:=[ORDERS:24]Contact_Code:2
		Else 
			<>CompCode:=[ORDERS:24]Delivery_Company:29
			<>ContCode:=[ORDERS:24]Delivery_Contact:30
		End if 
		<>OrderCode:=[ORDERS:24]Order_Code:3
		
		If ($_l_Menu<4)
			<>DB_bo_AutoOut:=False:C215
		Else 
			<>DB_bo_AutoOut:=True:C214
		End if 
		<>AutoFind:=True:C214
		<>AutoProc:=Current process:C322
		<>AutoFile:="Orders"
		SD3_t_DiaryRelatedRecord:=[ORDERS:24]Order_Code:3
		SD_l_CompanionMenuTable:=Table:C252(->[ORDERS:24])
		Case of 
			: ($_l_Menu=1)
				//DBI_MenuDisplayRecords ("Companies")
				DBI_DisplayRecord(-Current process:C322; Table:C252(->[COMPANIES:2]); ""; [ORDERS:24]Company_Code:1)
			: ($_l_Menu=2)
				DBI_DisplayRecord(-Current process:C322; Table:C252(->[CONTACTS:1]); ""; [ORDERS:24]Contact_Code:2)
				
				//ZContacts_Mod
				
			: ($_l_Menu=3)
				$_l_OrderItemsRow:=Find in array:C230(ORD_al_SubAreaTables; Table:C252(->[ORDER_ITEMS:25]))
				
				
				If ($_l_OrderItemsRow>0)
					COPY NAMED SELECTION:C331([ORDER_ITEMS:25]; "$TempOI")
					
					$_ptr_ListBoxSetup:=ORD_aptr_SubAreaPointers{$_l_OrderItemsRow}
					$_ptr_HighlightSet:=$_ptr_ListBoxSetup->{20}
					$_t_HighlightSetName:=$_ptr_HighlightSet->
					$_bo_Reselect:=False:C215
					If ($_t_HighlightSetName#"")
						If (Records in set:C195($_t_HighlightSetName)>0)
							USE SET:C118($_t_HighlightSetName)
							CREATE SET:C116([ORDER_ITEMS:25]; "$Reselection")
							$_bo_Reselect:=True:C214
						End if 
					End if 
					
					If (Records in selection:C76([ORDER_ITEMS:25])>0)
						
						SELECTION TO ARRAY:C260([ORDER_ITEMS:25]Product_Code:2; $_at_ProductCodes)
						QUERY WITH ARRAY:C644([PRODUCTS:9]Product_Code:1; $_at_ProductCodes)
						COPY NAMED SELECTION:C331([PRODUCTS:9]; "CurrentProducts")
						
						
						DBI_MenuDisplayRecords(Table name:C256(Table:C252(->[PRODUCTS:9])); Module_SalesOrders; "CurrentProducts"; ->[PRODUCTS:9]Product_Code:1; [ORDER_ITEMS:25]Product_Code:2)
						
					End if 
					USE NAMED SELECTION:C332("$TempOI")
				End if 
				
			: ($_l_Menu=5)
				//TRACE
				SD3_l_CallActionNum:=1
				DBI_MenuDisplayRecords(Table name:C256(Table:C252(->[DIARY:12])); Module_SalesOrders; ""; ->[DIARY:12]Order_Code:26; [ORDERS:24]Order_Code:3)
				
				SD3_l_CallActionNum:=0
			: ($_l_Menu=6)
				//TRACE
				DBI_MenuDisplayRecords(Table name:C256(Table:C252(->[INVOICES:39])); Module_SalesOrders; ""; ->[ORDER_ITEMS:25]Invoice_Number:17; [ORDERS:24]Order_Code:3)
				
			: ($_l_Menu=7)
				UNLOAD RECORD:C212([ORDER_ITEMS:25])
				DBI_MenuDisplayRecords(Table name:C256(Table:C252(->[ORDER_ITEMS:25])); Module_SalesOrders; ""; ->[ORDER_ITEMS:25]Order_Code:1; [ORDERS:24]Order_Code:3)
			: ($_l_Menu=8)
				
				DBI_MenuDisplayRecords("DiaryLetters"; Module_SalesOrders; ""; ->[DIARY:12]Order_Code:26; [ORDERS:24]Order_Code:3)
				
			: ($_l_Menu=9)
				DISTINCT VALUES:C339([ORDER_ITEMS:25]Purchase_Order_Number:18; $_at_PurchaseOrderNumbers)
				$_l_BlankRow:=Find in array:C230($_at_PurchaseOrderNumbers; "")
				If ($_l_BlankRow>0)
					DELETE FROM ARRAY:C228($_at_PurchaseOrderNumbers; $_l_BlankRow)
				End if 
				
				QUERY WITH ARRAY:C644([PURCHASE_ORDERS:57]Purchase_Order_Number:2; $_at_PurchaseOrderNumbers)
				COPY NAMED SELECTION:C331([PURCHASE_ORDERS:57]; "POtempSelection")
				
				DBI_MenuDisplayRecords(Table name:C256(Table:C252(->[PURCHASE_ORDERS:57])); Module_SalesOrders; "POtempSelection")
				
				//ZPurchOrd_Mod
			: ($_l_Menu=10)
				DBI_MenuDisplayRecords(Table name:C256(Table:C252(->[STOCK_MOVEMENT_ITEMS:27])); Module_StockControl; ""; ->[STOCK_MOVEMENT_ITEMS:27]Order_Code:3; [ORDERS:24]Order_Code:3)
				
				
				//ZInvoices_Mod
			: ($_l_Menu=12)
				
				FurthFld_Func2(->[ORDERS:24])
				
				
		End case 
		
	End if 
End if 
VFromin:=$_bo_FromIN
ERR_MethodTrackerReturn("Orders_MenV"; $_t_oldMethodName)
