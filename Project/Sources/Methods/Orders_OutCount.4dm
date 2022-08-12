//%attributes = {}
If (False:C215)
	//Project Method Name:      Orders_OutCount
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
	C_REAL:C285($_r_CostPrice; $_r_SalesMargin; $_r_SalesMarginPC)
	C_TEXT:C284($_t_oldMethodName; vRec; vText)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Orders_OutCount")
Orders_OutCntV
$_r_CostPrice:=Sum:C1([ORDERS:24]Total_Cost:11)
$_r_SalesMargin:=Sum:C1([ORDERS:24]Total_Margin:12)
$_r_SalesMarginPC:=Round:C94(($_r_SalesMargin/Sum:C1([ORDERS:24]Total_Amount:6)*100); 2)
vText:=vText+"Cost: "+String:C10($_r_CostPrice; "|Accounts")+vRec
vText:=vText+"Margin: "+String:C10($_r_SalesMargin; "|Accounts")+"  ("+String:C10($_r_SalesMarginPC; "|Percent")+")"
ERR_MethodTrackerReturn("Orders_OutCount"; $_t_oldMethodName)
