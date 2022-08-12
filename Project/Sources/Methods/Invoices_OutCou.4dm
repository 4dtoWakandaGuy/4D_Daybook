//%attributes = {}
If (False:C215)
	//Project Method Name:      Invoices_OutCou
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 05/09/2012 15:36
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY DATE:C224($_ad_InvoiceDate; 0)
	ARRAY REAL:C219($_ar_InvoiceTotalDue; 0)
	C_DATE:C307($_d_CurrentDate)
	C_REAL:C285($_l_Index; $_l_SizeofArray; $_r_Due; $_r_Due2; $_r_InvoicedAmount; $_r_NumberofDays; $_r_Paid; v0; v31; v61; v91)
	C_TEXT:C284($_t_oldMethodName; vRec; vT; vText)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Invoices_OutCou")

COPY NAMED SELECTION:C331([INVOICES:39]; "$Sel2")
QUERY SELECTION:C341([INVOICES:39]; [INVOICES:39]State:10>-2)
$_r_InvoicedAmount:=Round:C94(Sum:C1([INVOICES:39]Total_Invoiced:5); 2)
$_r_Paid:=Round:C94(Sum:C1([INVOICES:39]Total_Paid:6); 2)
$_r_Due:=Round:C94(Sum:C1([INVOICES:39]Total_Due:7); 2)
vText:=vText+"Proformas/Invoices:"+vRec
vText:=vText+"Invoiced: "+String:C10($_r_InvoicedAmount; "|Accounts")+vRec
vText:=vText+"Received: "+String:C10($_r_Paid; "|Accounts")+vRec+"Due: "+String:C10($_r_Due; "|Accounts")+vRec
USE NAMED SELECTION:C332("$Sel2")
QUERY SELECTION:C341([INVOICES:39]; [INVOICES:39]State:10<-1)
$_r_Paid:=Round:C94(Sum:C1([INVOICES:39]Total_Paid:6); 2)
$_r_Due2:=Round:C94(Sum:C1([INVOICES:39]Total_Due:7); 2)
vT:=vRec+vRec+vRec+"Receipts/Deposits:"+vRec+vRec
vT:=vT+"Received: "+String:C10($_r_Paid; "|Accounts")+vRec
vT:=vT+"Due: "+String:C10($_r_Due2; "|Accounts")+vRec
$_r_Due:=$_r_Due+$_r_Due2

USE NAMED SELECTION:C332("$Sel2")
SELECTION TO ARRAY:C260([INVOICES:39]Invoice_Date:4; $_ad_InvoiceDate; [INVOICES:39]Total_Due:7; $_ar_InvoiceTotalDue)
$_l_SizeofArray:=Size of array:C274($_ad_InvoiceDate)
$_d_CurrentDate:=Current date:C33
v91:=0
v61:=0
v31:=0
v0:=0
For ($_l_Index; 1; $_l_SizeofArray)
	$_r_NumberofDays:=$_d_CurrentDate-$_ad_InvoiceDate{$_l_Index}
	If ($_r_NumberofDays>DB_GetLedgerADStageThree)
		v91:=v91+$_ar_InvoiceTotalDue{$_l_Index}
	End if 
	If (($_r_NumberofDays>DB_GetLedgerADStageTwo) & ($_r_NumberofDays<=DB_GetLedgerADStageThree))
		v61:=v61+$_ar_InvoiceTotalDue{$_l_Index}
	End if 
	If (($_r_NumberofDays>DB_GetLedgerADStageOne) & ($_r_NumberofDays<=DB_GetLedgerADStageTwo))
		v31:=v31+$_ar_InvoiceTotalDue{$_l_Index}
	End if 
	If ($_r_NumberofDays<=DB_GetLedgerADStageOne)
		v0:=v0+$_ar_InvoiceTotalDue{$_l_Index}
	End if 
End for 

vText:=vText+vRec+"<"+String:C10(DB_GetLedgerADStageOne)+" days: "+String:C10(v0; "|Accounts")+vRec
vText:=vText+String:C10(DB_GetLedgerADStageOne+1)+"-"+String:C10(DB_GetLedgerADStageTwo)+" days: "+String:C10(v31; "|Accounts")+vRec
vText:=vText+String:C10(DB_GetLedgerADStageTwo+1)+"-"+String:C10(DB_GetLedgerADStageThree)+" days: "+String:C10(v61; "|Accounts")+vRec
vText:=vText+">"+String:C10(DB_GetLedgerADStageThree)+" days: "+String:C10(v91; "|Accounts")+vRec

vText:=vText+vRec+"TOTAL DUE: "+String:C10($_r_Due; "|Accounts")+vRec
ERR_MethodTrackerReturn("Invoices_OutCou"; $_t_oldMethodName)