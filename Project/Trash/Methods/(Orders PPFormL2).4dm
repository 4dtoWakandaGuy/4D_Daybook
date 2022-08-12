//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Orders PPFormL2
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
	C_BOOLEAN:C305(<>OrdDelAdd)
	C_DATE:C307(<>DB_d_CurrentDate; vDate)
	C_LONGINT:C283(r1)
	C_TEXT:C284($_t_oldMethodName; vComments; vCompCode; vDetails; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; vNumber; vTitle; vTitle1; vTitle10)
	C_TEXT:C284(vTitle11; vTitle12; vTitle13; vTitle14; vTitle15; vTitle2; vTitle3; vTitle4; vTitle8; vTitle9)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Orders PPFormL2")
vCompCode:=[ORDERS:24]Company_Code:1
If (<>OrdDelAdd)
	vTitle1:="Deliver To"
	Orders_PPDelDet
Else 
	vTitle1:="Order From"
	RELATE ONE:C42([ORDERS:24]Company_Code:1)
	RELATE ONE:C42([ORDERS:24]Contact_Code:2)
	MCont_Add("L")
End if 
Forms_Tit567Cur([ORDERS:24]Currency_Code:32)
vTitle3:="Our Ref"
vTitle2:="Your Ref"
vTitle11:="Required Date"
vTitle8:="Terms"
vTitle10:="Account No"
vTitle9:="Person"
vTitle12:="Description"
vTitle13:="Unit Cost"
vTitle14:="Qty"
vTitle15:="Price "+[ORDERS:24]Currency_Code:32
vNumber:=[ORDERS:24]Order_Code:3
Case of 
	: (DB_t_CurrentFormUsage="Order")
		Order
	Else 
		vTitle:=Uppercase:C13(Term_OrdWT("QUOTATION"))
		vTitle1:="Attn:"
		vTitle4:=Term_OrdWT("Quotation Date")
		vDate:=[ORDERS:24]Quotation_Date:26
		If (vDate=!00-00-00!)
			vDate:=<>DB_d_CurrentDate
		End if 
End case 
Address_Lines(vDetails)
Orders_FormRel
Forms_GenTit(->[ORDERS:24]Analysis_Code:33)
If ([ORDERS:24]Print_Comments:44=False:C215)
	vComments:=""
Else 
	vComments:=[ORDERS:24]Comments:14
End if 
r1:=0
ERR_MethodTrackerReturn("Orders PPFormL2"; $_t_oldMethodName)