//%attributes = {}
If (False:C215)
	//Project Method Name:      Purchases_OutCo
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 05/09/2012 15:33
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY DATE:C224($_ad_Date; 0)
	ARRAY REAL:C219($_ar_DueAmount; 0)
	C_DATE:C307($_d_CurrentDate)
	C_REAL:C285($_l_Index; $_l_numberofDays; $_l_SizeofArray; $_r_Due; $_r_Due2; $_r_Paid; $_r_TotalInvoiced; v0; v31; v61; v91)
	C_TEXT:C284($_t_oldMethodName; vRec; vT; vText)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Purchases_OutCo")
COPY NAMED SELECTION:C331([PURCHASE_INVOICES:37]; "$Sel2")
QUERY SELECTION:C341([PURCHASE_INVOICES:37]; [PURCHASE_INVOICES:37]State:24>-2)
$_r_TotalInvoiced:=Round:C94(Sum:C1([PURCHASE_INVOICES:37]Total_Invoiced:7); 2)
$_r_Paid:=Round:C94(Sum:C1([PURCHASE_INVOICES:37]Total_Paid:8); 2)
$_r_Due:=Round:C94(Sum:C1([PURCHASE_INVOICES:37]Total_Due:9); 2)
vText:=vText+"Purchase Invoices:"+vRec
vText:=vText+"Invoiced: "+String:C10($_r_TotalInvoiced; "|Accounts")+vRec
vText:=vText+"Paid: "+String:C10($_r_Paid; "|Accounts")+vRec+"Due: "+String:C10($_r_Due; "|Accounts")+vRec
USE NAMED SELECTION:C332("$Sel2")
QUERY SELECTION:C341([PURCHASE_INVOICES:37]; [PURCHASE_INVOICES:37]State:24<-1)
$_r_Paid:=Round:C94(Sum:C1([PURCHASE_INVOICES:37]Total_Paid:8); 2)
$_r_Due2:=Round:C94(Sum:C1([PURCHASE_INVOICES:37]Total_Due:9); 2)
vT:=vRec+vRec+vRec+"Payments/Pre-Pay.:"+vRec+vRec
vT:=vT+"Paid: "+String:C10($_r_Paid; "|Accounts")+vRec
vT:=vT+"Due: "+String:C10($_r_Due2; "|Accounts")+vRec
$_r_Due:=$_r_Due+$_r_Due2

USE NAMED SELECTION:C332("$Sel2")
SELECTION TO ARRAY:C260([PURCHASE_INVOICES:37]Invoice_Date:5; $_ad_Date; [PURCHASE_INVOICES:37]Total_Due:9; $_ar_DueAmount)
$_l_SizeofArray:=Size of array:C274($_ad_Date)
$_d_CurrentDate:=Current date:C33
v91:=0
v61:=0
v31:=0
v0:=0
For ($_l_Index; 1; $_l_SizeofArray)
	$_l_numberofDays:=$_d_CurrentDate-$_ad_Date{$_l_Index}
	If ($_l_numberofDays>DB_GetLedgerADStageThree)
		v91:=v91+$_ar_DueAmount{$_l_Index}
	End if 
	If (($_l_numberofDays>DB_GetLedgerADStageTwo) & ($_l_numberofDays<=DB_GetLedgerADStageThree))
		v61:=v61+$_ar_DueAmount{$_l_Index}
	End if 
	If (($_l_numberofDays>DB_GetLedgerADStageOne) & ($_l_numberofDays<=DB_GetLedgerADStageTwo))
		v31:=v31+$_ar_DueAmount{$_l_Index}
	End if 
	If ($_l_numberofDays<=DB_GetLedgerADStageOne)
		v0:=v0+$_ar_DueAmount{$_l_Index}
	End if 
End for 

vText:=vText+vRec+"<"+String:C10(DB_GetLedgerADStageOne)+" days: "+String:C10(v0; "|Accounts")+vRec
vText:=vText+String:C10(DB_GetLedgerADStageOne+1)+"-"+String:C10(DB_GetLedgerADStageTwo)+" days: "+String:C10(v31; "|Accounts")+vRec
vText:=vText+String:C10(DB_GetLedgerADStageTwo+1)+"-"+String:C10(DB_GetLedgerADStageThree)+" days: "+String:C10(v61; "|Accounts")+vRec
vText:=vText+">"+String:C10(DB_GetLedgerADStageThree)+" days: "+String:C10(v91; "|Accounts")+vRec

vText:=vText+vRec+"TOTAL DUE: "+String:C10($_r_Due; "|Accounts")+vRec
ERR_MethodTrackerReturn("Purchases_OutCo"; $_t_oldMethodName)
