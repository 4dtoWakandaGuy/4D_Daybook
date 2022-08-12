//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Invoices FormL2
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  10/08/2011 17:19 v8.0.0/1
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_DATE:C307(vDate)
	C_LONGINT:C283(r1)
	C_REAL:C285(vSubtotal; vTotal; vVAT)
	C_TEXT:C284(<>TitPay; $_t_oldMethodName; $Det; vComments; vDates; vDesc; vDetails; vDetailsD; VLAYCODE; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2)
	C_TEXT:C284(DB_t_CurrentFormUsage3; vNumber; vOrderCode; vSolution; vTimes; vTitle; vTitle1; vTitle10; vTitle11; vTitle12; vTitle13)
	C_TEXT:C284(vTitle14; vTitle15; vTitle16; vTitle17; vTitle18; vTitle19; vTitle2; vTitle20; vTitle3; vTitle4; vTitle5)
	C_TEXT:C284(vTitle6; vTitle7; vTitle8; vTitle9; vTitPay)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Invoices FormL2")
//Invoices FormL2
//TRACE
If (vLayCode#[INVOICES:39]Invoice_Number:1)
	Inv_InvCalc
	RELATE ONE:C42([INVOICES:39]Company_Code:2)
	RELATE ONE:C42([INVOICES:39]Contact_Code:3)
	
	Comp_DetailsI
	If (vDetails="")
		Letter_Details
	End if 
	If ((Records in selection:C76([CONTACTS:1])=1) & (vDetails=("@"+[CONTACTS:1]Surname:5+"@")))
		vDetails:="Attn: "+vDetails
	End if 
	If (([INVOICES:39]Delivery_Company:30#"") | ([INVOICES:39]Deliver_To:32#"") | ([INVOICES:39]x_DeliveryAddressID:48>0))
		
		$Det:=vDetails
		Case of 
			: ([INVOICES:39]x_DeliveryAddressID:48>0)
				RELATE ONE:C42([INVOICES:39]Delivery_Company:30)
				QUERY:C277([AddressRecords:125]; [AddressRecords:125]X_ID:1=[INVOICES:39]x_DeliveryAddressID:48)
				Vdetails:=[COMPANIES:2]Company_Name:2+Char:C90(13)+[AddressRecords:125]FormattedAddress:12
			: ([INVOICES:39]Deliver_To:32#"")
				vDetails:=[INVOICES:39]Deliver_To:32
			Else 
				RELATE ONE:C42([INVOICES:39]Delivery_Company:30)
				RELATE ONE:C42([INVOICES:39]Delivery_Contact:31)
				MCont_Add("L")
		End case 
		vDetailsD:=vDetails
		vDetails:=$Det
		vTitle19:="Deliver To"
	End if 
	Forms_InvTit
	vTitle8:="Terms"
	vTitle2:="Our Ref"
	vTitle11:="Your Ref"
	vTitle12:="Description"
	vTitle13:="Unit Cost"
	vTitle14:="Qty"
	vTitle15:="Price "+[INVOICES:39]Currency_Code:27
	vTitle20:="Price "+"€"
	
	If (([INVOICES:39]TAX_Prefix:19#"") & ([INVOICES:39]TAX_Registration_Number:20#""))
		vTitle9:="Your VAT Reg. No."
		vTimes:=[INVOICES:39]TAX_Prefix:19+" "+[INVOICES:39]TAX_Registration_Number:20
	Else 
		vTitle9:=""
		vTimes:=""
	End if 
	If (DB_t_CurrentFormUsage="State")
		vTitle:="STATEMENT"
		vTitle1:="Statement To"
		vTitle3:="Invoice No"
		vTitle4:="Invoice Date"
		vTitle5:="Total Invoiced "+[INVOICES:39]Currency_Code:27
		vTitle6:="Total Received "+[INVOICES:39]Currency_Code:27
		vTitle7:="Total Due "+[INVOICES:39]Currency_Code:27
		vSubtotal:=vTotal
		vVAT:=[INVOICES:39]Total_Paid:6
		vTotal:=[INVOICES:39]Total_Due:7
	Else 
		Forms_Tit567Cur([INVOICES:39]Currency_Code:27)
		If (vTotal>=0)
			vTitle:="INVOICE"
			If (([INVOICES:39]Delivery_Company:30#"") | ([INVOICES:39]Deliver_To:32#""))
				vTitle1:="Invoice To"
			Else 
				vTitle1:="Invoice & Deliver To"
			End if 
			vTitle3:="Invoice No"
			vTitle4:="Invoice Date"
		Else 
			vTitle:="CREDIT NOTE"
			vTitle1:="Credit To"
			vTitle3:="Credit Note No"
			vTitle4:="Credit Date"
		End if 
		If ([INVOICES:39]State:10=-1)
			vTitle:="PROFORMA "+vTitle
			vTitle1:="Proforma To"
			vTitle3:="Proforma No"
			vTitle4:="Date"
		End if 
	End if 
	vTitle10:="Account No"
	vDate:=[INVOICES:39]Invoice_Date:4
	vNumber:=[INVOICES:39]Invoice_Number:1
	
	RELATE ONE:C42([INVOICES_ITEMS:161]Order_Code:11)
	RELATE ONE:C42([INVOICES_ITEMS:161]Item_Number:12)
	vOrderCode:=[INVOICES_ITEMS:161]Order_Code:11
	If (vOrderCode#"")
		vTitle16:="Order Date"
		vDates:=String:C10([ORDERS:24]Order_Date:4)
	Else 
		vTitle16:=""
		vDates:=""
		vTitle2:=""
	End if 
	If ([ORDER_ITEMS:25]Delivery_Date:11>!00-00-00!)
		vTitle17:="Delivery Date"
		vSolution:=String:C10([ORDER_ITEMS:25]Delivery_Date:11)
	Else 
		vTitle17:=""
		vSolution:=""
	End if 
	
	If ([INVOICES_ITEMS:161]Order_Code:11=[ORDERS:24]Order_Code:3) & ([ORDERS:24]Order_Code:3#"")
		If (([ORDERS:24]Company_Code:1#"") & ([ORDERS:24]Company_Code:1#[INVOICES:39]Company_Code:2))
			RELATE ONE:C42([ORDERS:24]Company_Code:1)
			vDetails:=vDetails+Char:C90(13)+"Delivery to: "+[COMPANIES:2]Company_Name:2
		End if 
	End if 
	Invoice_FormTot
	
	If ([INVOICES:39]Base_Text:23#"")
		vTitPay:=[INVOICES:39]Base_Text:23
	Else 
		vTitPay:=<>TitPay
	End if 
	If ([INVOICES:39]Print_Comments:25=False:C215)
		vComments:=""
	Else 
		vComments:=[INVOICES:39]Comments:12
	End if 
	r1:=0
	vTitle18:=Term VATWT("VAT %")
	Address_Lines(vDetails)
	vLayCode:=[INVOICES:39]Invoice_Number:1
	vDesc:=""
End if 
ERR_MethodTrackerReturn("Invoices FormL2"; $_t_oldMethodName)