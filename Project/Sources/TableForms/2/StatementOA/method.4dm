If (False:C215)
	//Table Form Method Name: [COMPANIES]StatementOA
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:06
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_DATE:C307(SRCH_d_EntryDateTo; vSDateT)
	C_REAL:C285(vSubtotal; vTotal; vVAT)
	C_TEXT:C284($_t_oldMethodName; ACC_t_CurrencyCode; vTitle13; vTitle15)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FM [COMPANIES].StatementOA"; Form event code:C388)
Case of 
	: (Form event code:C388=On Printing Detail:K2:18)
		If (vSDateT=!00-00-00!)
			SRCH_d_EntryDateTo:=Invoices_SOADat
		Else 
			SRCH_d_EntryDateTo:=vSDateT
		End if 
		//  SRCH_d_EntryDateFrom:=vSDateF
		Comp_StateLP
		vSubtotal:=0
		vVAT:=0
		vTotal:=0
		vTitle13:="Receipt Allocations"
		vTitle15:="Amount "+ACC_t_CurrencyCode
End case 
ERR_MethodTrackerReturn("FM:StatementOA"; $_t_oldMethodName)
