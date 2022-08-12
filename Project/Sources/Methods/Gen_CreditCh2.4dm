//%attributes = {}
If (False:C215)
	//Project Method Name:      Gen_CreditCh2
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45:41If (False)// ----------------------------------------------------
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($2)
	C_LONGINT:C283(vSNo)
	C_REAL:C285($_r_TotalDue)
	C_TEXT:C284($_t_oldMethodName; $_t_TotalDueSTR; $0; $1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Gen_CreditCh2")
//Gen_CreditCh2
If ([COMPANIES:2]Sales_Credit:35=0)
	$0:=[COMPANIES:2]Company_Name:2+" has no Credit Account"
	If ($2)
		vSNo:=1
	End if 
Else 
	
	QUERY:C277([INVOICES:39]; [INVOICES:39]Company_Code:2=$1; *)
	QUERY:C277([INVOICES:39];  & ; [INVOICES:39]Total_Due:7#0)
	$_r_TotalDue:=Sum:C1([INVOICES:39]Total_Due:7)
	$_t_TotalDueSTR:=String:C10($_r_TotalDue; "|Accounts")
	$0:=[COMPANIES:2]Company_Name:2+Char:C90(13)
	$0:=$0+"Limit: "+String:C10([COMPANIES:2]Sales_Credit:35; "|Accounts")+Char:C90(13)+"Used: "+$_t_TotalDueSTR
	If ($_r_TotalDue>[COMPANIES:2]Sales_Credit:35)
		$0:=$0+" (OVER)"
		If ($2)
			vSNo:=2
		End if 
	End if 
End if 
If ([COMPANIES:2]Default_Credit_Stage:42#"")
	RELATE ONE:C42([COMPANIES:2]Default_Credit_Stage:42)
	$0:=$0+Char:C90(13)+"Credit Stage: "+[COMPANIES:2]Default_Credit_Stage:42+"  "+[CREDIT_STAGES:54]Stage_Name:2+Char:C90(13)
	If (($2) & ([CREDIT_STAGES:54]Prevent_Invoice:7))
		vSNo:=3
	End if 
Else 
	$0:=$0+Char:C90(13)+Char:C90(13)
End if 
ERR_MethodTrackerReturn("Gen_CreditCh2"; $_t_oldMethodName)