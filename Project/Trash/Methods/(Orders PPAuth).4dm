//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Orders PPAuth
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

$_t_oldMethodName:=ERR_MethodTracker("Orders PPAuth")
Menu_Record("Orders PPAuth"; "Order Authorisation")
COPY NAMED SELECTION:C331([ORDER_ITEMS:25]; "OITemp")
Orders_InLPA(False:C215)

USE NAMED SELECTION:C332("OITemp")
Orders_PPGen(->[ORDERS:24]; "Order Auth"; "Orders Out"; "Order Auth"; "Order Auth"; "Orders_PPAuthL2"; 7; ->[ORDERS:24]State:15; "Order Auth"; [ORDERS:24]Analysis_Code:33)
ERR_MethodTrackerReturn("Orders PPAuth"; $_t_oldMethodName)