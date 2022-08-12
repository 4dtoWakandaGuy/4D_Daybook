//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Orders_InvBP2
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
	C_DATE:C307(<>DB_d_CurrentDate; vDelDate; vInvDate)
	C_TEXT:C284($_t_oldMethodName; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Orders_InvBP2")
//Orders_InvBP2
vInvDate:=[ORDER_ITEMS:25]Invoice_Date:25
If (vInvDate=!00-00-00!)
	vInvDate:=<>DB_d_CurrentDate
End if 
vDelDate:=[ORDER_ITEMS:25]Delivery_Date:11
Orders_InvCalc
DB_t_CurrentFormUsage2:="NoMod"
Orders_InvTrans
ONE RECORD SELECT:C189([INVOICES:39])
ADD TO SET:C119([INVOICES:39]; "IMaster")
DB_t_CurrentFormUsage2:=""
ERR_MethodTrackerReturn("Orders_InvBP2"; $_t_oldMethodName)