//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      PurchOrd FormLP
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 04/09/2012 15:33
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>POTheirCode)
	C_DATE:C307(<>DB_d_CurrentDate; vDate; vDelDate)
	C_LONGINT:C283(r1)
	C_TEXT:C284(<>PER_t_CurrentUserInitials; $_t_oldMethodName; vComments; vCompCode; vContCode; vDetails; vDetailsD; vLayCode; vNumber; vPerson; vTitle)
	C_TEXT:C284(vTitle1; vTitle10; vTitle11; vTitle12; vTitle13; vTitle14; vTitle15; vTitle17; vTitle18; vTitle19; vTitle2)
	C_TEXT:C284(vTitle20; vTitle3; vTitle4; vTitle8; vTitle9)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("PurchOrd FormLP")
//PurchOrd FormLP
If (vLayCode#[PURCHASE_ORDERS:57]Purchase_Order_Number:2)
	PurchOrd_Calc
	If (([PURCHASE_ORDERS:57]Deliver_to_Company:6="") & ([PURCHASE_ORDERS:57]x_DeliveryAddressID:20=0))
		If ([PURCHASE_ORDERS:57]Analysis_Code:15#"")
			RELATE ONE:C42([PURCHASE_ORDERS:57]Analysis_Code:15)
			If ([ANALYSES:36]Title_Department_Co_Person:4#"")
				vDetailsD:=[ANALYSES:36]Title_Department_Co_Person:4
			Else 
				vDetailsD:=DB_GetOrganisation+Char:C90(13)+DB_GetOrganisationAddress
			End if 
		Else 
			vDetailsD:=DB_GetOrganisation+Char:C90(13)+DB_GetOrganisationAddress
		End if 
	Else 
		If ([PURCHASE_ORDERS:57]x_DeliveryAddressID:20>0)
			RELATE ONE:C42([PURCHASE_ORDERS:57]Deliver_to_Company:6)
			QUERY:C277([AddressRecords:125]; [AddressRecords:125]X_ID:1=[PURCHASE_ORDERS:57]x_DeliveryAddressID:20)
			vDetailsD:=[COMPANIES:2]Company_Name:2+Char:C90(13)+[AddressRecords:125]FormattedAddress:12
		Else 
			RELATE ONE:C42([PURCHASE_ORDERS:57]Deliver_to_Company:6)
			RELATE ONE:C42([PURCHASE_ORDERS:57]Deliver_to_Contact:7)
			MCont_Add("L")
			vDetailsD:=vDetails
		End if 
	End if 
	RELATE ONE:C42([PURCHASE_ORDERS:57]Company_Code:1)
	RELATE ONE:C42([PURCHASE_ORDERS:57]Contact_Code:5)
	MCont_Add("L")
	vTitle:="PURCHASE ORDER"
	vDate:=[PURCHASE_ORDERS:57]Purchase_Order_Date:3
	If (vDate=!00-00-00!)
		vDate:=<>DB_d_CurrentDate
	End if 
	vDelDate:=[PURCHASE_ORDERS:57]Supply_by_Date:10
	vCompCode:=[PURCHASE_ORDERS:57]Supplier_Ref:12
	vContCode:=[PURCHASE_ORDERS:57]Finance_Method:11
	vNumber:=[PURCHASE_ORDERS:57]Purchase_Order_Number:2
	Forms_Tit567Cur([PURCHASE_ORDERS:57]Currency_Code:16)
	vTitle1:="Attn:"
	vTitle3:="Purch Ord No"
	vTitle4:="Order Date"
	vTitle2:="Deliver by Date"
	vTitle10:="Your Ref"
	vTitle9:="Finance Method"
	vTitle8:="Contact"
	vTitle11:="Deliver To"
	vTitle12:="Description"
	If (<>POTheirCode)
		vTitle12:=vTitle12+"  (Product Code)"
	End if 
	vTitle13:="Unit Cost"
	vTitle14:="Qty"
	vTitle15:="Price "+[PURCHASE_ORDERS:57]Currency_Code:16
	vTitle20:="Price "+"€"
	vTitle17:="Authorised by:"
	vTitle19:="Name:   ___________________________________"
	vTitle18:="Date:   _______________________________"
	vTitle20:="Signature:   ___________________________________________________"
	READ ONLY:C145([PERSONNEL:11])
	QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Initials:1=<>PER_t_CurrentUserInitials)
	vPerson:=[PERSONNEL:11]Name:2
	vLayCode:=[PURCHASE_ORDERS:57]Purchase_Order_Number:2
	QUERY:C277([PURCHASE_ORDERS_ITEMS:169]; [PURCHASE_ORDERS_ITEMS:169]PURCHASE_ORDERS_CODE:18=[PURCHASE_ORDERS:57]Purchase_Order_Number:2)
	
	Forms_GenTit(->[PURCHASE_ORDERS:57]Analysis_Code:15)
	If ([PURCHASE_ORDERS:57]Print_Comments:18=False:C215)
		vComments:=""
	Else 
		vComments:=[PURCHASE_ORDERS:57]Comments:8
	End if 
	r1:=0
End if 
ERR_MethodTrackerReturn("PurchOrd FormLP"; $_t_oldMethodName)