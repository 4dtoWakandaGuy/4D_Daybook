//%attributes = {}
If (False:C215)
	//Project Method Name:      Orders_InLPBEn
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
	//C_UNKNOWN(vSelPrev)
	C_DATE:C307(ORD_d_EntryDateFrom)
	C_TEXT:C284(vSelPrev; $_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Orders_InLPBEn")
OBJECT SET ENTERABLE:C238([ORDERS:24]Company_Code:1; True:C214)
OBJECT SET ENTERABLE:C238([ORDERS:24]Contact_Code:2; True:C214)
OBJECT SET ENTERABLE:C238([ORDERS:24]Order_Code:3; True:C214)
OBJECT SET ENTERABLE:C238([ORDERS:24]Person:5; True:C214)
OBJECT SET ENTERABLE:C238([ORDERS:24]Taken_By:17; True:C214)
OBJECT SET ENTERABLE:C238([ORDERS:24]Terms:16; True:C214)
OBJECT SET ENTERABLE:C238([ORDERS:24]Source:18; True:C214)
OBJECT SET ENTERABLE:C238([ORDERS:24]Order_Type:43; True:C214)
OBJECT SET ENTERABLE:C238([ORDERS:24]Order_Date:4; True:C214)
OBJECT SET ENTERABLE:C238([ORDERS:24]Your_Order_Number:10; True:C214)
OBJECT SET ENTERABLE:C238([ORDERS:24]Required_Date:9; True:C214)
OBJECT SET ENTERABLE:C238([ORDERS:24]Offer_Price:20; True:C214)
OBJECT SET ENTERABLE:C238([ORDERS:24]State:15; True:C214)
OBJECT SET ENTERABLE:C238([ORDERS:24]Delivery_Method:19; True:C214)
OBJECT SET ENTERABLE:C238([ORDERS:24]Forecast_Date:23; True:C214)
OBJECT SET ENTERABLE:C238([ORDERS:24]Forecast_PC:22; True:C214)
OBJECT SET ENTERABLE:C238([ORDERS:24]Analysis_Code:33; True:C214)
OBJECT SET ENTERABLE:C238([ORDERS:24]Layer_Code:47; True:C214)
OBJECT SET ENTERABLE:C238([ORDERS:24]Currency_Code:32; True:C214)
OBJECT SET ENTERABLE:C238([ORDERS:24]Delivery_Company:29; True:C214)
OBJECT SET ENTERABLE:C238([ORDERS:24]Delivery_Contact:30; True:C214)
OBJECT SET ENTERABLE:C238([ORDERS:24]Shipping_Agent:41; True:C214)
OBJECT SET ENTERABLE:C238([ORDERS:24]Deliver_To:31; True:C214)
OBJECT SET ENTERABLE:C238([ORDERS:24]Area_Code:35; True:C214)
OBJECT SET ENTERABLE:C238([ORDERS:24]Tax_Rate:34; True:C214)
OBJECT SET ENTERABLE:C238([ORDERS:24]Order_Period:42; True:C214)
OBJECT SET ENTERABLE:C238([ORDERS:24]Enquiry_Date:25; True:C214)
OBJECT SET ENTERABLE:C238([ORDERS:24]Quotation_Date:26; True:C214)
OBJECT SET ENTERABLE:C238([ORDERS:24]Credit_Card_No:49; True:C214)
OBJECT SET ENTERABLE:C238([ORDERS:24]CC_Expiry:50; True:C214)
OBJECT SET ENTERABLE:C238([ORDERS:24]CC_Address:51; True:C214)
OBJECT SET ENTERABLE:C238([ORDERS:24]Print_Comments:44; True:C214)
OBJECT SET ENTERABLE:C238(ORD_d_EntryDateFrom; True:C214)
DB_MenuAction("Functions"; "Add Product Items"; 3; "")
DB_MenuAction("Functions"; "QuickAdd Items"; 3; "")
DB_MenuAction("Functions"; "Duplicate an Item"; 3; "")
//ENABLE MENU ITEM(2051;1)
//ENABLE MENU ITEM(2051;2)
//ENABLE MENU ITEM(2051;3)
vSelPrev:=""
ERR_MethodTrackerReturn("Orders_InLPBEn"; $_t_oldMethodName)
