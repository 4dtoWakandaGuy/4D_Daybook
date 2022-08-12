//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Invoices Posted
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
	C_TEXT:C284($_t_oldMethodName; vStatus)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Invoices Posted")
Menu_Record("Invoices Posted"; "Opening Balance")
If (In_ButtChkMan(->[INVOICES:39]; "2 4 5 13"))
	If ([INVOICES:39]State:10=0)
		Gen_Confirm("Are you absolutely sure?  This prevents posting to the Nominal."; "No"; "Yes")
		If (OK=0)
			If (([INVOICES:39]Invoice_Number:1="0") | ([INVOICES:39]Invoice_Number:1=""))
				Inv_No
			End if 
			If (([INVOICES:39]Invoice_Number:1#"0") & ([INVOICES:39]Invoice_Number:1#""))
				[INVOICES:39]Total_Due:7:=[INVOICES:39]Total_Invoiced:5
				[INVOICES:39]Posted_Date:8:=<>DB_d_CurrentDate
				[INVOICES:39]State:10:=3
				vStatus:="SL Only"
				DB_SaveRecord(->[INVOICES:39])
				ACCEPT:C269
				OK:=1
			End if 
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("Invoices Posted"; $_t_oldMethodName)