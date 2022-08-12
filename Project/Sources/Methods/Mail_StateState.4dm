//%attributes = {}
If (False:C215)
	//Project Method Name:      Mail_StateState
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:   14/06/2010 15:35
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(cEnvelopes; cExport; cLabels; cLetters; cList; cMerged; cOC; cPreview; rState)
	C_TEXT:C284($_t_oldMethodName; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Mail_StateState")
If ((cList=1) | (cLetters=1) | (cOC=1) | (cPreview=1) | (cMerged=1) | (cEnvelopes=1) | (cLabels=1) | (cExport=1))
	Gen_Confirm("Print one or multiple Invoices per page?"; "Multiple"; "One")
	If (OK=1)
		If (cList=1)
			Gen_Confirm("Are you ready to print Statements?"; "Yes"; "No")
			If (OK=1)
				FORM SET OUTPUT:C54([COMPANIES:2]; "Statement")
				PRINT SELECTION:C60([COMPANIES:2])
			End if 
		End if 
		If (rState=2)
			rState:=3
		End if 
		MailP_Let(->[COMPANIES:2])
		MailP_Lab(->[COMPANIES:2])
		MailP_Env(->[COMPANIES:2])
		MailP_Exp(->[COMPANIES:2])
	Else 
		
		ORDER BY:C49([INVOICES:39]; [INVOICES:39]Company_Code:2; >; [INVOICES:39]Invoice_Date:4; >)
		If (cList=1)
			Gen_Confirm("Are you ready to print Statements?"; "Yes"; "No")
			If (OK=1)
				FORM SET OUTPUT:C54([INVOICES:39]; "Form")
				DB_t_CurrentFormUsage:="State"
				PRINT SELECTION:C60([INVOICES:39])
			End if 
		End if 
		MailP_Let(->[INVOICES:39])
		MailP_Lab(->[INVOICES:39])
		MailP_Env(->[INVOICES:39])
		MailP_Exp(->[INVOICES:39])
	End if 
End if 
ERR_MethodTrackerReturn("Mail_StateState"; $_t_oldMethodName)