//%attributes = {}
If (False:C215)
	//Project Method Name:      TransB_OutCount
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

$_t_oldMethodName:=ERR_MethodTracker("TransB_OutCount")
$_r_Amount:=Sum:C1([TRANSACTION_BATCHES:30]Batch_Amount:3)
$VAT:=Sum:C1([TRANSACTION_BATCHES:30]Batch_Tax:4)
$_r_Total:=Sum:C1([TRANSACTION_BATCHES:30]Batch_Total:5)
vText:=vText+"Amount: "+String:C10($_r_Amount; "|Accounts")+vRec+"VAT: "+String:C10($VAT; "|Accounts")+vRec
vText:=vText+"Total: "+String:C10($_r_Total; "|Accounts")+vRec
ERR_MethodTrackerReturn("TransB_OutCount"; $_t_oldMethodName)