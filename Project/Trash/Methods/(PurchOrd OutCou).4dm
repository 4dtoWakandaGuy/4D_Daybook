//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      PurchOrd OutCou
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
	C_REAL:C285($_r_Amount)
	C_TEXT:C284($_t_oldMethodName; vText)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("PurchOrd OutCou")
$_r_Amount:=Sum:C1([PURCHASE_ORDERS:57]Total_Cost:4)
vText:=vText+"Total Cost: "+String:C10($_r_Amount; "|Accounts")
ERR_MethodTrackerReturn("PurchOrd OutCou"; $_t_oldMethodName)