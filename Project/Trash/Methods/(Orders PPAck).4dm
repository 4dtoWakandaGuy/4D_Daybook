//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Orders PPAck
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 29/03/2011 10:41
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Orders PPAck")
Menu_Record("Orders PPAck"; "Order Acknowledgement")
//If (Gen_PPCreditChk (»[ORDERS]Company Code;»[CREDIT STAGES]Prevent Conf;"Acknowl
//edged)
COPY NAMED SELECTION:C331([ORDER_ITEMS:25]; "OITemp")
Orders_InLPA(False:C215)
Orders_PPGen(->[ORDERS:24]; "Form"; "Orders Out"; "Order"; "Order Ack"; "Orders_PPFormL2"; 8; ->[ORDERS:24]State:15; "Order Ack"; [ORDERS:24]Analysis_Code:33)
//End if
USE NAMED SELECTION:C332("OITemp")
ERR_MethodTrackerReturn("Orders PPAck"; $_t_oldMethodName)