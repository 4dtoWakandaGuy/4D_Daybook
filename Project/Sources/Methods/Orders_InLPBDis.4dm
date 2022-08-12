//%attributes = {}
If (False:C215)
	//Project Method Name:      Orders_InLPBDis
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 04/09/2009 16:38
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//C_UNKNOWN(vButtDisOrd)
	//C_UNKNOWN(vSelPrev)
	C_DATE:C307(ORD_d_EntryDateFrom)
	C_TEXT:C284(vButtDisOrd; vSelPrev; $_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Orders_InLPBDis")
OBJECT SET ENTERABLE:C238([ORDERS:24]Company_Code:1; False:C215)
OBJECT SET ENTERABLE:C238([ORDERS:24]Contact_Code:2; False:C215)
OBJECT SET ENTERABLE:C238([ORDERS:24]Order_Code:3; False:C215)
OBJECT SET ENTERABLE:C238([ORDERS:24]Person:5; False:C215)
OBJECT SET ENTERABLE:C238([ORDERS:24]Taken_By:17; False:C215)
OBJECT SET ENTERABLE:C238([ORDERS:24]Terms:16; False:C215)
OBJECT SET ENTERABLE:C238([ORDERS:24]Source:18; False:C215)
OBJECT SET ENTERABLE:C238([ORDERS:24]Order_Type:43; False:C215)
OBJECT SET ENTERABLE:C238([ORDERS:24]Order_Date:4; False:C215)
OBJECT SET ENTERABLE:C238([ORDERS:24]Your_Order_Number:10; False:C215)
OBJECT SET ENTERABLE:C238([ORDERS:24]Required_Date:9; False:C215)
OBJECT SET ENTERABLE:C238([ORDERS:24]Offer_Price:20; False:C215)
OBJECT SET ENTERABLE:C238([ORDERS:24]State:15; False:C215)
OBJECT SET ENTERABLE:C238([ORDERS:24]Delivery_Method:19; False:C215)
OBJECT SET ENTERABLE:C238([ORDERS:24]Forecast_Date:23; False:C215)
OBJECT SET ENTERABLE:C238([ORDERS:24]Forecast_PC:22; False:C215)
OBJECT SET ENTERABLE:C238([ORDERS:24]Analysis_Code:33; False:C215)
OBJECT SET ENTERABLE:C238([ORDERS:24]Layer_Code:47; False:C215)
OBJECT SET ENTERABLE:C238([ORDERS:24]Currency_Code:32; False:C215)
OBJECT SET ENTERABLE:C238([ORDERS:24]Delivery_Company:29; False:C215)
OBJECT SET ENTERABLE:C238([ORDERS:24]Delivery_Contact:30; False:C215)
OBJECT SET ENTERABLE:C238([ORDERS:24]Shipping_Agent:41; False:C215)
OBJECT SET ENTERABLE:C238([ORDERS:24]Deliver_To:31; False:C215)
OBJECT SET ENTERABLE:C238([ORDERS:24]Area_Code:35; False:C215)
OBJECT SET ENTERABLE:C238([ORDERS:24]Tax_Rate:34; False:C215)
OBJECT SET ENTERABLE:C238([ORDERS:24]Order_Period:42; False:C215)
OBJECT SET ENTERABLE:C238([ORDERS:24]Enquiry_Date:25; False:C215)
OBJECT SET ENTERABLE:C238([ORDERS:24]Quotation_Date:26; False:C215)
OBJECT SET ENTERABLE:C238([ORDERS:24]Credit_Card_No:49; False:C215)
OBJECT SET ENTERABLE:C238([ORDERS:24]CC_Expiry:50; False:C215)
OBJECT SET ENTERABLE:C238([ORDERS:24]CC_Address:51; False:C215)
OBJECT SET ENTERABLE:C238([ORDERS:24]Print_Comments:44; False:C215)
OBJECT SET ENTERABLE:C238(ORD_d_EntryDateFrom; False:C215)
vButtDisOrd:=Substring:C12(vButtDisOrd; 1; 2)+"DPMO"+Substring:C12(vButtDisOrd; 7; 99)
//vButtDisOrd≤3≥:="D"
//vButtDisOrd≤4≥:="P"
//vButtDisOrd≤5≥:="M"
//vButtDisOrd≤6≥:="O"
DB_MenuAction("Functions"; "Add Product Items"; 3; "")
DB_MenuAction("Functions"; "QuickAdd Items"; 3; "")
DB_MenuAction("Functions"; "Duplicate an Item"; 3; "")
//DISABLE MENU ITEM(2051;1)
//DISABLE MENU ITEM(2051;2)
//DISABLE MENU ITEM(2051;3)
vSelPrev:="&Dis"
ERR_MethodTrackerReturn("Orders_InLPBDis"; $_t_oldMethodName)
