//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Purch CheqLP
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
	C_DATE:C307(vDate)
	C_LONGINT:C283($_r_Amount2)
	C_REAL:C285($_r_Amount; vAmount)
	C_TEXT:C284(<>SYS_t_BaseCurrency; $_t_oldMethodName; ACC_t_CurrencyCode; vCompName; vTitle1; vTitle2; vTitle3; vTitle4; vTitle5; vTitle6)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Purch CheqLP")
RELATE ONE:C42([PURCHASE_INVOICES:37]Company_Code:2)
If ([COMPANIES:2]Invoice_Name:25#"")
	vCompName:=[COMPANIES:2]Invoice_Name:25
Else 
	vCompName:=[COMPANIES:2]Company_Name:2
End if 
vDate:=[PURCHASE_INVOICES:37]Invoice_Date:5
vAmount:=[PURCHASE_INVOICES:37]Total_Paid:8
$_r_Amount:=vAmount
If (([PURCHASE_INVOICES:37]Currency_Code:23="") | ([PURCHASE_INVOICES:37]Currency_Code:23=<>SYS_t_BaseCurrency))
	ACC_t_CurrencyCode:=""
Else 
	ACC_t_CurrencyCode:=[PURCHASE_INVOICES:37]Currency_Code:23
End if 
If ($_r_Amount>=100000)
	$_r_Amount2:=Int:C8($_r_Amount/100000)
	vTitle1:=Uppercase:C13(Num_Words($_r_Amount2))
	$_r_Amount:=$_r_Amount-($_r_Amount2*100000)
Else 
	vTitle1:="NIL"
End if 
If ($_r_Amount>=10000)
	$_r_Amount2:=Int:C8($_r_Amount/10000)
	vTitle2:=Uppercase:C13(Num_Words($_r_Amount2))
	$_r_Amount:=$_r_Amount-($_r_Amount2*10000)
Else 
	vTitle2:="NIL"
End if 
If ($_r_Amount>=1000)
	$_r_Amount2:=Int:C8($_r_Amount/1000)
	vTitle3:=Uppercase:C13(Num_Words($_r_Amount2))
	$_r_Amount:=$_r_Amount-($_r_Amount2*1000)
Else 
	vTitle3:="NIL"
End if 
If ($_r_Amount>=100)
	$_r_Amount2:=Int:C8($_r_Amount/100)
	vTitle4:=Uppercase:C13(Num_Words($_r_Amount2))
	$_r_Amount:=$_r_Amount-($_r_Amount2*100)
Else 
	vTitle4:="NIL"
End if 
If ($_r_Amount>=10)
	$_r_Amount2:=Int:C8($_r_Amount/10)
	vTitle5:=Uppercase:C13(Num_Words($_r_Amount2))
	$_r_Amount:=$_r_Amount-($_r_Amount2*10)
Else 
	vTitle5:="NIL"
End if 
If ($_r_Amount>=1)
	$_r_Amount2:=Int:C8($_r_Amount)
	vTitle6:=Uppercase:C13(Num_Words($_r_Amount2))
Else 
	vTitle6:="NIL"
End if 
ERR_MethodTrackerReturn("Purch CheqLP"; $_t_oldMethodName)
