//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Purch_InPLPA
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 08/02/2010 15:01
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(vPS)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Purch_InPLPA")
If (([PURCHASE_INVOICES:37]Posted_Date:12=!00-00-00!) & ([PURCHASE_INVOICES:37]Invoice_Date:5>!00-00-00!) & ([PURCHASE_INVOICES:37]Period_Code:3#"") & ([PURCHASE_INVOICES:37]Total_Paid:8#0))
	
	Gen_Confirm("Are you ready to Post this Pre-Payment?"; "Post it"; "Try again")
	If (OK=1)
		If ([PURCHASE_INVOICES:37]Purchase_Code:1="")
			[PURCHASE_INVOICES:37]Purchase_Code:1:="*P"+Gen_CodePref(28; ->[PURCHASE_INVOICES:37]Purchase_Code:1; "*P")
			[PURCHASE_INVOICES:37]Last_Modified_Stamp:36:=Export_Stamp3([PURCHASE_INVOICES:37]Last_Modified_Stamp:36)
		End if 
		If ([PURCHASE_INVOICES:37]Purchase_Code:1#"")
			
			[PURCHASE_INVOICES:37]Purchase_Invoice_Number:4:=[PURCHASE_INVOICES:37]Purchase_Code:1
			DB_SaveRecord(->[PURCHASE_INVOICES:37])
			If (OK=1)
				ACCEPT:C269
				Purch_PrePost
				vPS:=0
			End if 
		End if 
	End if 
Else 
	ACCEPT:C269
End if 
ERR_MethodTrackerReturn("Purch_InPLPA"; $_t_oldMethodName)