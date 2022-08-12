//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Gen ScrRepSrc
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45:42If (False)// ----------------------------------------------------
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//C_UNKNOWN(a01Stri1)
	C_LONGINT:C283($1; xNext)
	C_TEXT:C284($_t_oldMethodName; vTitle)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Gen ScrRepSrc")
Case of 
	: (vTitle=Term_SLPLWT("Debtors@"))
		If (xNext=1)
			USE NAMED SELECTION:C332("Scr")
			QUERY SELECTION:C341([INVOICES:39]; [INVOICES:39]Company_Code:2=a01Stri1{$1})
		Else 
			QUERY:C277([INVOICES:39]; [INVOICES:39]Company_Code:2=a01Stri1{$1}; *)
			QUERY:C277([INVOICES:39];  & ; [INVOICES:39]Total_Due:7#0)
		End if 
	: (vTitle=Term_SLPLWT("Creditors@"))
		If (xNext=1)
			USE NAMED SELECTION:C332("Scr")
			QUERY SELECTION:C341([PURCHASE_INVOICES:37]; [PURCHASE_INVOICES:37]Company_Code:2=a01Stri1{$1})
		Else 
			QUERY:C277([PURCHASE_INVOICES:37]; [PURCHASE_INVOICES:37]Company_Code:2=a01Stri1{$1}; *)
			QUERY:C277([PURCHASE_INVOICES:37];  & ; [PURCHASE_INVOICES:37]Total_Due:9#0)
		End if 
End case 
ERR_MethodTrackerReturn("Gen ScrRepSrc"; $_t_oldMethodName)