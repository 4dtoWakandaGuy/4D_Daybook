//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Orders OutCntV
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
	C_REAL:C285($_r_Amount; $_r_Total; $VAT)
	C_TEXT:C284($_t_oldMethodName; vRec; vText)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Orders OutCntV")
//Orders OutCntV
$_r_Amount:=Sum:C1([ORDERS:24]Total_Amount:6)
$VAT:=Sum:C1([ORDERS:24]Total_TAX:7)
$_r_Total:=Sum:C1([ORDERS:24]Total_Total:8)
vText:=vText+"Amount: "+String:C10($_r_Amount; "|Accounts")+vRec+"VAT: "+String:C10($VAT; "|Accounts")+vRec+"Total: "+String:C10($_r_Total; "|Accounts")+vRec
ERR_MethodTrackerReturn("Orders OutCntV"; $_t_oldMethodName)