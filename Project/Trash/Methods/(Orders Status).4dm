//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Orders Status
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
	C_DATE:C307(vDate)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Orders Status")
Case of 
	: ([ORDERS:24]Order_Date:4#!00-00-00!)
		vDate:=[ORDERS:24]Order_Date:4
	: ([ORDERS:24]Quotation_Date:26#!00-00-00!)
		vDate:=[ORDERS:24]Quotation_Date:26
	Else 
		vDate:=[ORDERS:24]Enquiry_Date:25
End case 
//Case of   `NB Duplicated into Orders Out LP & OutV LP
//  : ([ORDERS]State=-4)
//  vStatus:="Lost Order"
//  vDate:=[ORDERS]Enquiry Date
// : ([ORDERS]State=-3)
//  If (◊TermInq)
//   vStatus_:=Term_OrdWT ("Enquiry")
//  Else
//   vStatus_:="Enquiry"
//End if
//  vDate:=[ORDERS]Enquiry Date
//  : ([ORDERS]State=-2)
//  If (◊TermEst)
//     vStatus_:=Term_OrdWT ("Quotation")
//   Else
//     vStatus_:="Quotation"
//  End if
//  vDate:=[ORDERS]Quotation Date
//  : ([ORDERS]State=-1)
//  vStatus:="New"
//  vDate:=[ORDERS]Order Date
// : (([ORDERS]State=0) & ([ORDERS]Order Code#""))
//  vStatus:="Confirmed"
//  vDate:=[ORDERS]Order Date
// : ([ORDERS]State=1)
//  vStatus:="Cancelled"
//  vDate:=[ORDERS]Order Date
// Else
//  vStatus:=""
// vDate:=!00/00/00!
//End case
ERR_MethodTrackerReturn("Orders Status"; $_t_oldMethodName)