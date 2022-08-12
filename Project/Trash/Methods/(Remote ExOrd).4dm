//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Remote ExOrd
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
	C_LONGINT:C283(<>Process; <>SYS_l_CancelProcess)
	C_TEXT:C284($_t_oldMethodName; vFld; vRec)
	C_TIME:C306(vDoc)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Remote ExOrd")
If (Records in selection:C76([ORDERS:24])>0)
	MESSAGE:C88("      "+String:C10(Records in selection:C76([ORDERS:24]))+" Orders"+Char:C90(13))
	SEND PACKET:C103(vDoc; "*FILE*"+vRec+"Orders"+vRec+String:C10(Records in selection:C76([ORDERS:24]))+vRec)
	FIRST RECORD:C50([ORDERS:24])
	While ((Not:C34(End selection:C36([ORDERS:24]))) & (<>SYS_l_CancelProcess#<>Process))
		QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Order_Code:1=[ORDERS:24]Order_Code:3)
		MESSAGE:C88("         "+[ORDERS:24]Order_Code:3+"  "+[ORDERS:24]Company_Code:1+"  "+String:C10(Records in selection:C76([ORDER_ITEMS:25]))+" Items"+Char:C90(13))
		SEND PACKET:C103(vDoc; [ORDERS:24]Export:24+vFld+[ORDERS:24]Order_Code:3+vFld+[ORDERS:24]Company_Code:1+vFld+String:C10(Records in selection:C76([ORDER_ITEMS:25]))+vFld)
		SEND PACKET:C103(vDoc; [ORDERS:24]Contact_Code:2+vFld+String:C10([ORDERS:24]Order_Date:4)+vFld+[ORDERS:24]Person:5+vFld)
		SEND PACKET:C103(vDoc; String:C10([ORDERS:24]Total_Amount:6)+vFld+String:C10([ORDERS:24]Total_TAX:7)+vFld+String:C10([ORDERS:24]Total_Total:8)+vFld)
		SEND PACKET:C103(vDoc; String:C10([ORDERS:24]Required_Date:9)+vFld+[ORDERS:24]Your_Order_Number:10+vFld+[ORDERS:24]Comments:14+vFld)
		SEND PACKET:C103(vDoc; [ORDERS:24]State:15+vFld+[ORDERS:24]Taken_By:17+vFld+[ORDERS:24]Source:18+vFld)
		SEND PACKET:C103(vDoc; String:C10(Num:C11([ORDERS:24]Offer_Price:20))+vFld+[ORDERS:24]Enclosures:21+vFld+String:C10([ORDERS:24]Forecast_PC:22)+vFld+String:C10([ORDERS:24]Forecast_Date:23)+vFld)
		FIRST RECORD:C50([ORDER_ITEMS:25])
		While (Not:C34(End selection:C36([ORDER_ITEMS:25])))
			SEND PACKET:C103(vDoc; [ORDER_ITEMS:25]Product_Code:2+vFld+String:C10([ORDER_ITEMS:25]Quantity:3)+vFld+String:C10([ORDER_ITEMS:25]Sales_Price:4)+vFld)
			SEND PACKET:C103(vDoc; String:C10([ORDER_ITEMS:25]Sales_Amount:7)+vFld+String:C10([ORDER_ITEMS:25]TAX_Amount:8)+vFld+String:C10([ORDER_ITEMS:25]Total_Amount:9)+vFld)
			SEND PACKET:C103(vDoc; String:C10([ORDER_ITEMS:25]Required_Date:10)+vFld+[ORDER_ITEMS:25]Tax_Code:12+vFld+[ORDER_ITEMS:25]Product_Name:13+vFld)
			SEND PACKET:C103(vDoc; [ORDER_ITEMS:25]Person:14+vFld+[ORDER_ITEMS:25]Supplier_Code:20+vFld+String:C10([ORDER_ITEMS:25]Sort_Order:26)+vFld)
			SEND PACKET:C103(vDoc; [ORDER_ITEMS:25]Price_Code:36+vFld+String:C10([ORDER_ITEMS:25]Discount:37)+vFld+String:C10([ORDER_ITEMS:25]Retail_Price:38)+vFld)
			SEND PACKET:C103(vDoc; String:C10([ORDER_ITEMS:25]Standard_Price:39)+vFld+String:C10([ORDER_ITEMS:25]Standard_Amount:40)+vFld+String:C10([ORDER_ITEMS:25]Standard_Cost:41)+vFld+String:C10([ORDER_ITEMS:25]Standard_Cost_Amount:42)+vFld+String:C10([ORDER_ITEMS:25]Standard_Margin:43)+vFld)
			SEND PACKET:C103(vDoc; [ORDER_ITEMS:25]Description:44+vFld+String:C10(Num:C11([ORDER_ITEMS:25]Print_Description:45))+vFld+[ORDER_ITEMS:25]State:46+vFld+String:C10([ORDER_ITEMS:25]Component_Level:47)+vFld+String:C10([ORDER_ITEMS:25]Level_Up_Item_Number:48)+vFld)
			SEND PACKET:C103(vDoc; [ORDER_ITEMS:25]Delivery_Number:49+vFld+String:C10([ORDER_ITEMS:25]Price_Per:50)+vFld)
			NEXT RECORD:C51([ORDER_ITEMS:25])
		End while 
		SEND PACKET:C103(vDoc; "*ITEMEND*"+vFld)
		SEND PACKET:C103(vDoc; String:C10([ORDERS:24]Enquiry_Date:25)+vFld+String:C10([ORDERS:24]Quotation_Date:26)+vFld+String:C10([ORDERS:24]Sort_Number:27)+vFld+String:C10(Num:C11([ORDERS:24]Part_Shipment:28))+vFld)
		SEND PACKET:C103(vDoc; [ORDERS:24]Delivery_Company:29+vFld+[ORDERS:24]Delivery_Contact:30+vFld+[ORDERS:24]Deliver_To:31+vFld)
		SEND PACKET:C103(vDoc; [ORDERS:24]Currency_Code:32+vFld+[ORDERS:24]Analysis_Code:33+vFld+String:C10([ORDERS:24]Tax_Rate:34)+vFld+[ORDERS:24]Area_Code:35+vFld)
		SEND PACKET:C103(vDoc; String:C10([ORDERS:24]Total_StandM:36)+vFld+String:C10([ORDERS:24]Total_StandMPC:37)+vFld+String:C10([ORDERS:24]Total_StandA:38)+vFld+String:C10([ORDERS:24]Total_StandC:39)+vFld)
		SEND PACKET:C103(vDoc; [ORDERS:24]Comments_2:40+vFld+[ORDERS:24]Shipping_Agent:41+vFld+[ORDERS:24]Order_Period:42+vFld+[ORDERS:24]Order_Type:43+vFld+String:C10(Num:C11([ORDERS:24]Print_Comments:44))+vFld)
		SEND PACKET:C103(vDoc; String:C10([ORDERS:24]Export_Batch_Number:45)+vFld+String:C10([ORDERS:24]Export_Document_Number:46)+vFld+[ORDERS:24]Layer_Code:47+vFld+[ORDERS:24]Credit_Card_No:49+vFld)
		SEND PACKET:C103(vDoc; [ORDERS:24]CC_Expiry:50+vFld+[ORDERS:24]CC_Address:51+vFld+[ORDERS:24]Delivery_Terms:52+vFld+vRec)
		NEXT RECORD:C51([ORDERS:24])
	End while 
	SEND PACKET:C103(vDoc; "*END*"+vFld+vRec)
End if 
ERR_MethodTrackerReturn("Remote ExOrd"; $_t_oldMethodName)