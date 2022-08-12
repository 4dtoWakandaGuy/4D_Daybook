//%attributes = {}
If (False:C215)
	//Project Method Name:      Trans_OutCount
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

$_t_oldMethodName:=ERR_MethodTracker("Trans_OutCount")
$_r_Amount:=Gen_Round(Sum:C1([TRANSACTIONS:29]Amount:6); 2; 2)
$VAT:=Gen_Round(Sum:C1([TRANSACTIONS:29]Tax_Amount:16); 2; 2)
$_r_Total:=Gen_Round(Sum:C1([TRANSACTIONS:29]Total:17); 2; 2)
vText:=vText+"Amount: "+String:C10($_r_Amount; "|Accounts")+vRec+"VAT: "+String:C10($VAT; "|Accounts")+vRec
vText:=vText+"Total: "+String:C10($_r_Total; "|Accounts")+vRec
ERR_MethodTrackerReturn("Trans_OutCount"; $_t_oldMethodName)