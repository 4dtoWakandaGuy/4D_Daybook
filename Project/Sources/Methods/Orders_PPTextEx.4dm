//%attributes = {}
If (False:C215)
	//Project Method Name:      Orders_PPTextEx
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 19/08/2009 17:01
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_DATE:C307(vDate)
	C_REAL:C285($_l_HW; $_l_HWT; $_l_SW; $_l_SWT)
	C_TEXT:C284($_t_oldMethodName; vFld; vLetterDate; vRec)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Orders_PPTextEx")
//Orders_PPTextEx (Avid Order)
Menu_Record("Orders_PPTextEx"; "Export Order to Disk")
Gen_Confirm("Please name the file in which to save Order "+[ORDERS:24]Order_Code:3; ""; "")
If (OK=1)
	SET CHANNEL:C77(12; "")
	If (OK=1)
		Orders_InLPOI
		vFld:=Char:C90(9)
		vRec:=Char:C90(13)
		SEND PACKET:C103(vRec+"Order Number:"+vFld+[ORDERS:24]Order_Code:3+vRec+vRec)
		vDate:=[ORDERS:24]Order_Date:4
		Letter_Date
		SEND PACKET:C103("Order Date:"+vFld+vLetterDate+vRec+vRec)
		SEND PACKET:C103("Sales Rep:"+vFld+[ORDERS:24]Person:5+vRec)
		SEND PACKET:C103("Customer Order #:"+vFld+[ORDERS:24]Your_Order_Number:10+vRec+vRec)
		SEND PACKET:C103("Ship To:"+vRec)
		RELATE ONE:C42([ORDERS:24]Company_Code:1)
		RELATE ONE:C42([ORDERS:24]Contact_Code:2)
		Orders_PPTextAd
		SEND PACKET:C103("Invoice To:"+vFld+"(If different from above)"+vRec)
		Orders_PPTextIA
		RELATE ONE:C42([ORDERS:24]Delivery_Company:29)
		RELATE ONE:C42([ORDERS:24]Delivery_Contact:30)
		SEND PACKET:C103("End User Info:"+vFld+"(If different from above)"+vRec)
		Orders_PPTextAd
		vDate:=[ORDERS:24]Required_Date:9
		Letter_Date
		SEND PACKET:C103("Requested Ship Date:"+vFld+vLetterDate+vRec+vRec)
		SEND PACKET:C103("System ID(s):"+vFld+[ORDERS:24]Comments_2:40+vRec)
		SEND PACKET:C103("NuVista Number(s):"+vFld+[ORDERS:24]Enclosures:21+vRec+vRec)
		SEND PACKET:C103("Shipping Method:"+vFld+[ORDERS:24]Delivery_Method:19+vRec)
		SEND PACKET:C103("Shipping Agent:"+vFld+[ORDERS:24]Shipping_Agent:41+vRec+vRec)
		SEND PACKET:C103("Special Instructions:"+vRec+[ORDERS:24]Comments:14+vRec+vRec)
		SEND PACKET:C103("PRODUCT #"+vFld+"DESCRIPTION"+vFld+"QTY"+vFld+"HW US$"+vFld+"SW US$"+vFld+"TOTAL US$"+vFld+"DISCOUNT %"+vRec+vRec)
		ORDER BY:C49([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Sort_Order:26; >)
		FIRST RECORD:C50([ORDER_ITEMS:25])
		$_l_HWT:=0
		$_l_SWT:=0
		While (Not:C34(End selection:C36([ORDER_ITEMS:25])))
			$_l_HW:=Round:C94(([ORDER_ITEMS:25]Standard_Price:39*((100-[ORDER_ITEMS:25]Discount:37)/100)); 2)
			$_l_SW:=Round:C94(([ORDER_ITEMS:25]Sales_Price:4-$_l_HW); 2)
			$_l_HWT:=Round:C94(($_l_HWT+($_l_HW*[ORDER_ITEMS:25]Quantity:3)); 2)
			$_l_SWT:=Round:C94(($_l_SWT+($_l_SW*[ORDER_ITEMS:25]Quantity:3)); 2)
			SEND PACKET:C103([ORDER_ITEMS:25]Product_Code:2+vFld+[ORDER_ITEMS:25]Product_Name:13+vFld+String:C10([ORDER_ITEMS:25]Quantity:3)+vFld+String:C10($_l_HW; "|Accounts")+vFld+String:C10($_l_SW; "|Accounts")+vFld+String:C10([ORDER_ITEMS:25]Sales_Price:4; "|Accounts")+vFld+String:C10([ORDER_ITEMS:25]Discount:37; "|Percent")+vRec)
			NEXT RECORD:C51([ORDER_ITEMS:25])
		End while 
		SEND PACKET:C103(vRec+vFld+"Price charged to Customer in US$"+vFld+vFld+String:C10($_l_HWT; "|Accounts")+vFld+String:C10($_l_SWT; "|Accounts")+vFld+String:C10([ORDERS:24]Total_Amount:6; "|Accounts")+vRec)
	End if 
	SET CHANNEL:C77(11)
End if 
ERR_MethodTrackerReturn("Orders_PPTextEx"; $_t_oldMethodName)
