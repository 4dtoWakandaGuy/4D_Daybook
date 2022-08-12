If (False:C215)
	//Table Form Method Name: [INVOICES]Delivery Note
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 01/09/2009 10:24
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//C_UNKNOWN(Vdetails)
	//C_UNKNOWN(vNumber)
	//C_UNKNOWN(vOurRef)
	C_BOOLEAN:C305(DB_bo_NoLoad)
	C_DATE:C307(vDelDate)
	C_LONGINT:C283($_l_event; <>DataSize; $_l_event)
	C_TEXT:C284($_t_oldMethodName; Vdetails; vNumber; vOurRef; <>TitPayB; $_t_oldMethodName)
End if 
//Code Starts Here



$_t_oldMethodName:=ERR_MethodTracker("FM [INVOICES].Delivery_Note"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: (($_l_event=On Load:K2:1) | ($_l_event=On Printing Detail:K2:18)) & (Not:C34(DB_bo_NoLoad))
		
		Forms_SetFonts
		SetFontsByPointerParameter(<>DataSize; ""; 0; ->vNumber; ->vDate; ->[ORDERS:24]Person:5; ->vDelDate; ->vDetails; ->vOurRef)
		SetFontsByPointerParameter(<>DataSize; ""; 0; ->[ORDERS:24]Order_Code:3; ->[ORDERS:24]Order_Date:4; ->[INVOICES:39]Your_Order_Number:14; ->[ORDERS:24]Delivery_Method:19; ->[INVOICES:39]Company_Code:2; -><>TitPayB; ->vTitReg; ->vTitDepCo; ->vTitAdd)
		
		
		//Set_Fonts ("vNumber+vDate+[ORDERS]Person+vDelDate+vDetails+vOurRef";◊DataSize)
		//Set_Fonts ("[ORDERS]Order Code+[ORDERS]Order Date+[INVOICES]Your Order No"+"+[ORDERS]Delivery Method+[INVOICES]Company Code";◊DataSize)
		//Set_Fonts ("◊TitPayB+vTitReg+vTitDepCo+vTitAdd";◊TextSize)
		RELATE ONE:C42([INVOICES_ITEMS:161]Order_Code:11)
		RELATE ONE:C42([INVOICES_ITEMS:161]Item_Number:12)
		If ((([ORDERS:24]Company_Code:1#"") & ([INVOICES:39]Deliver_To:32#"") | ([INVOICES:39]x_DeliveryAddressID:48>0)) | (([INVOICES:39]Delivery_Company:30#"") & ([INVOICES:39]Delivery_Company:30#[INVOICES:39]Company_Code:2)))
			
			
			Case of 
				: ([INVOICES:39]x_DeliveryAddressID:48>0)
					QUERY:C277([AddressRecords:125]; [AddressRecords:125]X_ID:1=[INVOICES:39]x_DeliveryAddressID:48)
					If ([INVOICES:39]Delivery_Company:30#"")
						RELATE ONE:C42([INVOICES:39]Delivery_Company:30)
						Vdetails:=[COMPANIES:2]Company_Name:2+Char:C90(13)+[AddressRecords:125]FormattedAddress:12
					Else 
						Vdetails:=[AddressRecords:125]FormattedAddress:12
					End if 
				: ([INVOICES:39]Deliver_To:32#"")
					vDetails:=[INVOICES:39]Deliver_To:32
				Else 
					If ([INVOICES:39]Delivery_Company:30#"")
						RELATE ONE:C42([INVOICES:39]Delivery_Company:30)
						RELATE ONE:C42([INVOICES:39]Delivery_Contact:31)
					Else 
						RELATE ONE:C42([INVOICES:39]Company_Code:2)
						RELATE ONE:C42([INVOICES:39]Contact_Code:3)
					End if 
					Letter_Details
			End case 
			RELATE ONE:C42([INVOICES:39]Company_Code:2)
			vDetails:=vDetails+Char:C90(13)+"Invoice to: "+[COMPANIES:2]Company_Name:2
		Else 
			RELATE ONE:C42([INVOICES:39]Company_Code:2)
			RELATE ONE:C42([INVOICES:39]Contact_Code:3)
			Letter_Details
		End if 
		Forms_InvTit
		Forms_DelTit
		vNumber:=String:C10(Gen_Code(13))
		RELATE ONE:C42([INVOICES_ITEMS:161]Order_Code:11)
		RELATE ONE:C42([INVOICES_ITEMS:161]Item_Number:12)
		vDelDate:=[ORDER_ITEMS:25]Delivery_Date:11
		vOurRef:=[ORDERS:24]Order_Code:3+" / "+[INVOICES:39]Invoice_Number:1
End case 
Case of 
	: (Form event code:C388=On Printing Detail:K2:18)  // (During)
		
		Set_FontsTitle
End case 
ERR_MethodTrackerReturn("FM [INVOICES].Delivery Note"; $_t_oldMethodName)
