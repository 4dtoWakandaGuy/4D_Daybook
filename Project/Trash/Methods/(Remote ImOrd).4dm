//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Remote ImOrd
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 04/09/2009 16:13
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_Create)
	C_LONGINT:C283(<>Process; <>SYS_l_CancelProcess; $_l_Index)
	C_TEXT:C284($_t_CompanyCode; $_t_ExportStamp; $_t_Items; $_t_oldMethodName; $_t_OrderCode; $_t_Remainder; vFld; vRec; vText)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Remote ImOrd")
//Remote ImOrd
CREATE EMPTY SET:C140([ORDERS:24]; "Master")
CREATE EMPTY SET:C140([ORDERS:24]; "Extra")
CREATE EMPTY SET:C140([ORDERS:24]; "Not")
$_t_ExportStamp:="Start"
While (($_t_ExportStamp#"*END*") & (<>SYS_l_CancelProcess#<>Process))
	$_t_ExportStamp:=Remote_Packet(vFld)
	If ($_t_ExportStamp#"*END*")
		$_t_OrderCode:=Remote_Packet(vFld)
		$_t_CompanyCode:=Remote_Packet(vFld)
		$_t_Items:=Remote_Packet(vFld)
		If (Length:C16($_t_OrderCode)>1)
			$_bo_Create:=False:C215
			QUERY:C277([ORDERS:24]; [ORDERS:24]Order_Code:3=$_t_OrderCode)
			If (Records in selection:C76([ORDERS:24])=0)
				CREATE RECORD:C68([ORDERS:24])
				[ORDERS:24]Order_Code:3:=$_t_OrderCode
				$_bo_Create:=True:C214
				OK:=1
			Else 
				Remote_ImOverCh([ORDERS:24]Export:24)
				If (OK=0)
					MESSAGE:C88("         Cannot overwrite "+$_t_OrderCode+Char:C90(13))
					ONE RECORD SELECT:C189([ORDERS:24])
					FIRST RECORD:C50([ORDERS:24])
					ADD TO SET:C119([ORDERS:24]; "Not")
					OK:=0
				End if 
			End if 
			If (OK=1)
				MESSAGE:C88("         "+$_t_OrderCode+"  "+$_t_CompanyCode+"  "+$_t_Items+" Items"+Char:C90(13))
				[ORDERS:24]Export:24:=$_t_ExportStamp
				[ORDERS:24]Company_Code:1:=$_t_CompanyCode
				[ORDERS:24]Contact_Code:2:=Remote_Rec
				[ORDERS:24]Order_Date:4:=Date:C102(Remote_Rec)
				[ORDERS:24]Person:5:=Remote_Rec
				[ORDERS:24]Total_Amount:6:=Num:C11(Remote_Rec)
				[ORDERS:24]Total_TAX:7:=Num:C11(Remote_Rec)
				[ORDERS:24]Total_Total:8:=Num:C11(Remote_Rec)
				[ORDERS:24]Required_Date:9:=Date:C102(Remote_Rec)
				[ORDERS:24]Your_Order_Number:10:=Remote_Rec
				[ORDERS:24]Comments:14:=Remote_Rec
				[ORDERS:24]State:15:=Remote_Rec
				[ORDERS:24]Taken_By:17:=Remote_Rec
				[ORDERS:24]Source:18:=Remote_Rec
				[ORDERS:24]Offer_Price:20:=(Remote_Rec="1")
				[ORDERS:24]Enclosures:21:=Remote_Rec
				[ORDERS:24]Forecast_PC:22:=Num:C11(Remote_Rec)
				[ORDERS:24]Forecast_Date:23:=Date:C102(Remote_Rec)
				QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Order_Code:1=$_t_OrderCode)  //;*)
				// SEARCH([ORDER ITEMS]; & ;[ORDER ITEMS]Locked=False)
				DELETE SELECTION:C66([ORDER_ITEMS:25])
				$_t_Remainder:=Remote_Packet(vFld)
				$_l_Index:=0
				While (($_t_Remainder#"*ITEMEND*") & ($_l_Index<200) & (<>SYS_l_CancelProcess#<>Process))
					CREATE RECORD:C68([ORDER_ITEMS:25])
					[ORDER_ITEMS:25]Order_Code:1:=$_t_OrderCode
					[ORDER_ITEMS:25]Product_Code:2:=$_t_Remainder
					[ORDER_ITEMS:25]Quantity:3:=Num:C11(Remote_Rec)
					[ORDER_ITEMS:25]Sales_Price:4:=Num:C11(Remote_Rec)
					[ORDER_ITEMS:25]Sales_Amount:7:=Num:C11(Remote_Rec)
					[ORDER_ITEMS:25]TAX_Amount:8:=Num:C11(Remote_Rec)
					[ORDER_ITEMS:25]Total_Amount:9:=Num:C11(Remote_Rec)
					[ORDER_ITEMS:25]Required_Date:10:=Date:C102(Remote_Rec)
					[ORDER_ITEMS:25]Tax_Code:12:=Remote_Rec
					[ORDER_ITEMS:25]Product_Name:13:=Remote_Rec
					[ORDER_ITEMS:25]Person:14:=Remote_Rec
					[ORDER_ITEMS:25]Supplier_Code:20:=Remote_Rec
					[ORDER_ITEMS:25]Sort_Order:26:=Num:C11(Remote_Rec)
					OrderI_No
					[ORDER_ITEMS:25]Price_Code:36:=Remote_Rec
					[ORDER_ITEMS:25]Discount:37:=Num:C11(Remote_Rec)
					[ORDER_ITEMS:25]Retail_Price:38:=Num:C11(Remote_Rec)
					[ORDER_ITEMS:25]Standard_Price:39:=Num:C11(Remote_Rec)
					[ORDER_ITEMS:25]Standard_Amount:40:=Num:C11(Remote_Rec)
					[ORDER_ITEMS:25]Standard_Cost:41:=Num:C11(Remote_Rec)
					[ORDER_ITEMS:25]Standard_Cost_Amount:42:=Num:C11(Remote_Rec)
					[ORDER_ITEMS:25]Standard_Margin:43:=Num:C11(Remote_Rec)
					[ORDER_ITEMS:25]Description:44:=Remote_Rec
					[ORDER_ITEMS:25]Print_Description:45:=(Remote_Rec="1")
					[ORDER_ITEMS:25]State:46:=Remote_Rec
					[ORDER_ITEMS:25]Component_Level:47:=Num:C11(Remote_Rec)
					[ORDER_ITEMS:25]Level_Up_Item_Number:48:=Num:C11(Remote_Rec)
					[ORDER_ITEMS:25]Delivery_Number:49:=Remote_Rec
					[ORDER_ITEMS:25]Price_Per:50:=Num:C11(Remote_Rec)
					DB_SaveRecord(->[ORDER_ITEMS:25])
					AA_CheckFileUnlockedByTableNUM(Table:C252(->[ORDER_ITEMS:25]))
					$_t_Remainder:=Remote_Packet(vFld)
					If (($_t_Remainder="") & (vText=(vRec+"@")))  //fix for incorrection inclusion of vRec
						vText:=Substring:C12(vText; 2; 32500)
						$_t_Remainder:=Remote_Packet(vFld)
					End if 
					$_l_Index:=$_l_Index+1
				End while 
				[ORDERS:24]Enquiry_Date:25:=Date:C102(Remote_Rec)
				[ORDERS:24]Quotation_Date:26:=Date:C102(Remote_Rec)
				[ORDERS:24]Sort_Number:27:=Num:C11(Remote_Rec)
				[ORDERS:24]Part_Shipment:28:=(Remote_Rec="1")
				[ORDERS:24]Delivery_Company:29:=Remote_Rec
				[ORDERS:24]Delivery_Contact:30:=Remote_Rec
				[ORDERS:24]Deliver_To:31:=Remote_Rec
				[ORDERS:24]Currency_Code:32:=Remote_Rec
				[ORDERS:24]Analysis_Code:33:=Remote_Rec
				[ORDERS:24]Tax_Rate:34:=Num:C11(Remote_Rec)
				[ORDERS:24]Area_Code:35:=Remote_Rec
				[ORDERS:24]Total_StandM:36:=Num:C11(Remote_Rec)
				[ORDERS:24]Total_StandMPC:37:=Num:C11(Remote_Rec)
				[ORDERS:24]Total_StandA:38:=Num:C11(Remote_Rec)
				[ORDERS:24]Total_StandC:39:=Num:C11(Remote_Rec)
				[ORDERS:24]Comments_2:40:=Remote_Rec
				[ORDERS:24]Shipping_Agent:41:=Remote_Rec
				[ORDERS:24]Order_Period:42:=Remote_Rec
				[ORDERS:24]Order_Type:43:=Remote_Rec
				[ORDERS:24]Print_Comments:44:=(Remote_Rec="1")
				[ORDERS:24]Export_Batch_Number:45:=Num:C11(Remote_Rec)
				[ORDERS:24]Export_Document_Number:46:=Num:C11(Remote_Rec)
				[ORDERS:24]Layer_Code:47:=Remote_Rec
				[ORDERS:24]Credit_Card_No:49:=Remote_Rec
				[ORDERS:24]CC_Expiry:50:=Remote_Rec
				[ORDERS:24]CC_Address:51:=Remote_Rec
				[ORDERS:24]Delivery_Terms:52:=Remote_Rec
				Remote_ImSaveSe(->[ORDERS:24]; $_bo_Create)
				$_t_Remainder:=Remote_Packet(vRec)
			Else 
				$_t_Remainder:=Remote_Packet(vRec)
			End if 
		Else 
			$_t_Remainder:=Remote_Packet(vRec)
		End if 
	End if 
	If ($_t_Remainder="*END*@")
		$_t_ExportStamp:="*END*"
	End if 
End while 
Remote_ImSetSav("New Ord"; "Mod Ord"; "Not Ord"; "R"; ->[ORDERS:24])
ERR_MethodTrackerReturn("Remote ImOrd"; $_t_oldMethodName)
