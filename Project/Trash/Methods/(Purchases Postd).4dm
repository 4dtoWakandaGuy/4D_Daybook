//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Purchases Postd
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
	C_DATE:C307(<>DB_d_CurrentDate)
	C_TEXT:C284($_t_oldMethodName; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; vStatus)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Purchases Postd")
Menu_Record("Purchases Postd"; "Opening Balance")
If (In_ButtChkMan(->[PURCHASE_INVOICES:37]; "2 3 4 5 7"))
	Gen_Confirm("Are you absolutely sure?  This prevents posting to the Nominal."; "No"; "Yes")
	If (OK=0)
		If ([PURCHASE_INVOICES:37]Purchase_Code:1="")
			Purch_Code
		End if 
		If (([PURCHASE_INVOICES:37]Purchase_Code:1#"") & ([PURCHASE_INVOICES:37]Purchase_Code:1#"0"))
			[PURCHASE_INVOICES:37]Purchase_Invoice_Number:4:=Uppercase:C13([PURCHASE_INVOICES:37]Purchase_Invoice_Number:4)
			[PURCHASE_INVOICES:37]Total_Due:9:=[PURCHASE_INVOICES:37]Total_Invoiced:7
			[PURCHASE_INVOICES:37]Posted_Date:12:=<>DB_d_CurrentDate
			[PURCHASE_INVOICES:37]State:24:=3
			vStatus:="PL Only"
			DB_SaveRecord(->[PURCHASE_INVOICES:37])
			ACCEPT:C269
			DB_t_CurrentFormUsage2:="NM"
			OK:=1
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("Purchases Postd"; $_t_oldMethodName)