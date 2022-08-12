//%attributes = {}
If (False:C215)
	//Project Method Name:      FIX_ANALYSIS_CODE_INV_D
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 28/09/2012 10:03
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($I)
	C_TEXT:C284($_t_oldMethodName; vWT_AnalysisCode; vWT_AnalysisCodeReq; ACC_t_AnalysisPeriodtoFix; vWT_InvNo)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FIX_ANALYSIS_CODE_INV_D")
// Project Method FIX_ANALYSIS_COD/3/2(ID 17113-1480)

READ WRITE:C146(*)

//ALL RECORDS([INVOICES])`10/07/02 pb
QUERY:C277([INVOICES:39]; [INVOICES:39]Analysis_Code:17=""; *)
QUERY:C277([INVOICES:39];  & ; [INVOICES:39]Period_Code:13=ACC_t_AnalysisPeriodtoFix)
CREATE SET:C116([INVOICES:39]; "WT_One")
If (Records in selection:C76([INVOICES:39])>0)
	For ($i; 1; Records in set:C195("WT_One"))
		USE SET:C118("WT_One")
		GOTO SELECTED RECORD:C245([INVOICES:39]; $i)
		QUERY:C277([INVOICES_ALLOCATIONS:162]; [INVOICES_ALLOCATIONS:162]INVOICES_CODE:6=[INVOICES:39]Invoice_Number:1)
		QUERY:C277([INVOICES_ITEMS:161]; [INVOICES_ITEMS:161]INVOICES_CODE:18=[INVOICES:39]Invoice_Number:1)
		
		MESSAGE:C88("Please wait, processing Invoice Record Number "+String:C10($i)+" of "+String:C10(Records in set:C195("WT_One")))
		If (Substring:C12([INVOICES:39]Invoice_Number:1; 1; 2)="*R")
			QUERY:C277([INVOICES_ALLOCATIONS:162]; [INVOICES_ALLOCATIONS:162]INVOICES_CODE:6=[INVOICES:39]Invoice_Number:1)
			
			vWT_InvNo:=[INVOICES_ALLOCATIONS:162]Invoice_Number:1
			QUERY:C277([INVOICES:39]; [INVOICES:39]Invoice_Number:1=vWT_InvNo)
			vWT_AnalysisCode:=[INVOICES:39]Analysis_Code:17
			USE SET:C118("WT_One")
			GOTO SELECTED RECORD:C245([INVOICES:39]; $i)
			[INVOICES:39]Analysis_Code:17:=vWT_AnalysisCode
			DB_SaveRecord(->[INVOICES:39])
		Else 
			FIRST RECORD:C50([INVOICES_ITEMS:161])
			vWT_AnalysisCode:=[INVOICES_ITEMS:161]Analysis_Code:10
			[INVOICES:39]Analysis_Code:17:=vWT_AnalysisCode
			DB_SaveRecord(->[INVOICES:39])
		End if 
	End for 
End if 
ERR_MethodTrackerReturn("FIX_ANALYSIS_CODE_INV_D"; $_t_oldMethodName)