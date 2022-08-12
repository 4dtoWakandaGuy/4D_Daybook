//%attributes = {}
If (False:C215)
	//Project Method Name:      Order_Title
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(<>SYS_at_RecStateAbbrev;0)
	//ARRAY TEXT(<>SYS_at_RecStateCodes;0)
	C_BOOLEAN:C305(<>StatesLoaded)
	C_DATE:C307(ORD_d_EntryDateFrom)
	C_TEXT:C284($_t_oldMethodName; Ord_t_DateLabel; Ord_t_EnquiryLabel; Ord_t_QuotationsLabel; vDateTitle; vResDesc)
End if 
//Code Starts Here

//TRACE
$_t_oldMethodName:=ERR_MethodTracker("Order_Title")
//Order_Title
If (Not:C34(<>StatesLoaded))
	States_Load
End if 
Case of 
	: ([ORDERS:24]Order_Date:4#!00-00-00!)
		ORD_d_EntryDateFrom:=[ORDERS:24]Order_Date:4
		If (Size of array:C274(<>SYS_at_RecStateCodes{24})>2)
			Ord_t_DateLabel:=<>SYS_at_RecStateAbbrev{24}{3}+" Date"
		Else 
			Ord_t_DateLabel:="Order Date"
		End if 
	: ([ORDERS:24]Quotation_Date:26#!00-00-00!)
		ORD_d_EntryDateFrom:=[ORDERS:24]Quotation_Date:26
		If (Size of array:C274(<>SYS_at_RecStateCodes{24})>1)
			Ord_t_DateLabel:=<>SYS_at_RecStateAbbrev{24}{2}+" Date"
		Else 
			Ord_t_DateLabel:=Term_OrdWT("Qtn Date")
		End if 
	Else 
		ORD_d_EntryDateFrom:=[ORDERS:24]Enquiry_Date:25
		If (Size of array:C274(<>SYS_at_RecStateCodes{24})>0)
			Ord_t_DateLabel:=<>SYS_at_RecStateAbbrev{24}{1}+" Date"
		Else 
			Ord_t_DateLabel:=Term_OrdWT("Enquiry Date")
		End if 
End case 
OBJECT SET TITLE:C194(*; "oOrderDateEntryLabel"; Ord_t_DateLabel+" :")

//oOrderDateEntryLabel
If (Size of array:C274(<>SYS_at_RecStateCodes{24})>0)
	Ord_t_EnquiryLabel:=<>SYS_at_RecStateAbbrev{24}{1}+" Date"
Else 
	Ord_t_EnquiryLabel:=Term_OrdWT("Enquiry Date")
End if 
OBJECT SET TITLE:C194(*; "oEnquriesLabel"; Ord_t_EnquiryLabel+" :")

If (Size of array:C274(<>SYS_at_RecStateCodes{24})>1)
	Ord_t_QuotationsLabel:=<>SYS_at_RecStateAbbrev{24}{2}+" Date"
Else 
	Ord_t_QuotationsLabel:=Term_OrdWT("Qtn Date")
End if 
OBJECT SET TITLE:C194(*; "oQuotationsLabel"; Ord_t_QuotationsLabel+" :")

ERR_MethodTrackerReturn("Order_Title"; $_t_oldMethodName)
