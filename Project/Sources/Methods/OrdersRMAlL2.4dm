//%attributes = {}
If (False:C215)
	//Project Method Name:      OrdersRMAlL2
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 13/04/2011 17:06
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_DATE:C307(<>DB_d_CurrentDate; vDate; vDelDate)
	C_LONGINT:C283(r1)
	C_TEXT:C284($_t_oldMethodName; ORD_S20_ReturnsNumber; vButtDisOrd; vComments; vDetails; vLayCode; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; vNumber; vOurRef)
	C_TEXT:C284(vTitle; vTitle1; vTitle10; vTitle11; vTitle12; vTitle13; vTitle14; vTitle15; vTitle16; vTitle17; vTitle18)
	C_TEXT:C284(vTitle19; vTitle2; vTitle20; vTitle3; vTitle4; vTitle9)
End if 

//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OrdersRMAlL2")

Orders_PPDelDet
//
vTitle9:="Person"
vTitle10:="Account No"
//vTitle8:="Returns Method"<-dont think we are showing this
vTitle2:="Our Ref"
vTitle11:="Your Ref"
vTitle16:="Returns  Date"
vTitle17:="Order Date"
vTitle12:="Description"
vTitle13:="Qty"
vTitle14:="Serial No"
vTitle15:="Signature:   ___________________________________________________________"
vTitle18:="Date:   _______________________________________________________________"
vTitle19:="Print Name:   __________________________________________________________"
vTitle20:="Goods Collected"
vTitle:="RETURNS AUTHORISATION"
vTitle1:="Collect From"
vTitle3:="Returns  No"
vTitle4:="Invoice Date"
//
vOurRef:=[ORDERS:24]Order_Code:3
If ([ORDER_ITEMS:25]Invoice_Number:17#"")
	vOurRef:=vOurRef+" / "+[ORDER_ITEMS:25]Invoice_Number:17
End if 
If (vLayCode#[ORDERS:24]Order_Code:3)
	If (vButtDisOrd#"OI@")
		If (DB_t_CurrentFormUsage2="Sel")
			//don't search again cos you've come from Orders entry & want just those selected
		Else 
			//QUERY([ORDER ITEMS];[ORDER ITEMS]Order Code=[ORDERS]Order Code;*)
			//QUERY([ORDER ITEMS]; & ;[ORDER ITEMS]xReturnsNumber=ORD_S20_ReturnsNumber)  `
			
		End if 
	Else 
		
	End if 
	If ([ORDER_ITEMS:25]x_ReturnsNumber:64="")
		vNumber:=Gen_CodePref(13; ->[ORDER_ITEMS:25]x_ReturnsNumber:64)
	Else 
		vNumber:=[ORDER_ITEMS:25]x_ReturnsNumber:64
	End if 
	vDelDate:=[ORDER_ITEMS:25]x_ReturnedDate:65
	vDate:=[ORDER_ITEMS:25]Invoice_Date:25
	If (vDelDate=!00-00-00!)
		vDelDate:=<>DB_d_CurrentDate
	End if 
	
	Address_Lines(vDetails)
	Forms_GenTit(->[ORDERS:24]Analysis_Code:33)
	vLayCode:=[ORDERS:24]Order_Code:3
	
	vComments:=""
	
	r1:=0
End if 
ERR_MethodTrackerReturn("OrdersRMAlL2"; $_t_oldMethodName)