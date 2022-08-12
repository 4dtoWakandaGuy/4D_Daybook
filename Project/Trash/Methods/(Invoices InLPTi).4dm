//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Invoices_InLPTi
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
	C_TEXT:C284(<>SYS_t_FormSizeName; $_t_oldMethodName; vInvTitle; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; vTitle1; vTitle2)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Invoices_InLPTi")
If ([INVOICES:39]State:10=-3)
	vTitle1:="Receipt No"
	If (<>SYS_t_FormSizeName="")
		vTitle2:="Date/Period"
	Else 
		vTitle2:="Receipt Date"
	End if 
	vInvTitle:="RECEIPT"
Else 
	If ([INVOICES:39]State:10=-2)
		If ([INVOICES:39]Total_Paid:6>=0)
			vTitle1:="Deposit No"
			If (<>SYS_t_FormSizeName="")
				vTitle2:="Date/Period"
			Else 
				vTitle2:="Deposit Date"
			End if 
			vInvTitle:="DEPOSIT"
		Else 
			vTitle1:="Refund No"
			If (<>SYS_t_FormSizeName="")
				vTitle2:="Date/Period"
			Else 
				vTitle2:="Refund Date"
			End if 
			vInvTitle:="REFUND"
		End if 
		
	Else 
		If ([INVOICES:39]State:10=-1)
			vTitle1:="Proforma No"
			If (<>SYS_t_FormSizeName="")
				vTitle2:="Date/Period"
			Else 
				vTitle2:="Date"
			End if 
			vInvTitle:="PROFORMA"
		Else 
			If ((([INVOICES:39]Total_Invoiced:5=0) & (DB_t_CurrentFormUsage="CN")) | ([INVOICES:39]Total_Invoiced:5<0))
				vTitle1:="Credit No"
				If (<>SYS_t_FormSizeName="")
					vTitle2:="Credit Date/Prd"
				Else 
					vTitle2:="Credit Date"
				End if 
				vInvTitle:="CREDIT NOTE"
			Else 
				vTitle1:="Invoice No"
				If (<>SYS_t_FormSizeName="")
					vTitle2:="Invoice Date/Prd"
				Else 
					vTitle2:="Invoice Date"
				End if 
				vInvTitle:="INVOICE"
			End if 
		End if 
	End if 
End if 
vInvTitle:=Uppercase:C13(Term_SLPLWT(vInvTitle))
ERR_MethodTrackerReturn("Invoices_InLPTi"; $_t_oldMethodName)