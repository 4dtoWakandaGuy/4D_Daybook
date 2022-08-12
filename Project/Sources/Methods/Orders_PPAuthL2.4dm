//%attributes = {}
If (False:C215)
	//Project Method Name:      Orders_PPAuthL2
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
	C_DATE:C307(<>DB_d_CurrentDate)
	C_LONGINT:C283(r1)
	C_TEXT:C284($_t_oldMethodName; vComments; vNumber; vTitle; vTitle1; vTitle10; vTitle11; vTitle12; vTitle13; vTitle14; vTitle15)
	C_TEXT:C284(vTitle17; vTitle18; vTitle19; vTitle2; vTitle20; vTitle3; vTitle4; vTitle8; vTitle9)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Orders_PPAuthL2")
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
vTitle17:="Order Date"
vTitle:="ORDER AUTHORISATION"
vTitle3:="Our Ref"
vNumber:=[ORDERS:24]Order_Code:3
vTitle4:="Printed"
vDate:=<>DB_d_CurrentDate
vTitle19:="Name:   ___________________________________"
vTitle18:="Date:   _______________________________"
vTitle20:="Signature:   ___________________________________________________"
Forms_GenTit(->[ORDERS:24]Analysis_Code:33)
//TRACE

Orders_FormRel
If ([ORDERS:24]Print_Comments:44=False:C215)
	vComments:=""
Else 
	vComments:=[ORDERS:24]Comments:14
End if 
r1:=0
ERR_MethodTrackerReturn("Orders_PPAuthL2"; $_t_oldMethodName)
