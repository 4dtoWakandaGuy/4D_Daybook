//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Orders Date
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
	C_DATE:C307($0)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Orders Date")
Case of 
	: ([ORDERS:24]Order_Date:4#!00-00-00!)
		$0:=[ORDERS:24]Order_Date:4
	: ([ORDERS:24]Quotation_Date:26#!00-00-00!)
		$0:=[ORDERS:24]Quotation_Date:26
	Else 
		$0:=[ORDERS:24]Enquiry_Date:25
End case 
ERR_MethodTrackerReturn("Orders Date"; $_t_oldMethodName)