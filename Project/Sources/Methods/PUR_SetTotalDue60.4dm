//%attributes = {}
If (False:C215)
	//Project Method Name:      PUR_SetTotalDue60
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:   11/11/2010 20:15
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_DATE:C307(PUR_D_Date)
	C_LONGINT:C283(PUR_l_Calcon)
	C_REAL:C285($0; PUR_R_TotalDue60)
	C_TEXT:C284($_t_oldMethodName; PER_t_Period2)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("PUR_SetTotalDue60")
QUERY:C277([PURCHASE_INVOICES:37]; [PURCHASE_INVOICES:37]Company_Code:2=[COMPANIES:2]Company_Code:1; *)
QUERY:C277([PURCHASE_INVOICES:37];  & ; [PURCHASE_INVOICES:37]Total_Due:9#0; *)
If (PUR_l_Calcon=1)
	QUERY:C277([PURCHASE_INVOICES:37];  & ; [PURCHASE_INVOICES:37]Invoice_Date:5>=(PUR_D_Date-DB_GetLedgerADStageTwo); *)
	QUERY:C277([PURCHASE_INVOICES:37];  & ; [PURCHASE_INVOICES:37]Invoice_Date:5<(PUR_D_Date-DB_GetLedgerADStageOne))
Else 
	//period based
	If (PER_t_Period2="")
		QUERY:C277([PERIODS:33]; [PERIODS:33]From_Date:3<(PUR_D_Date-DB_GetLedgerADStageTwo); *)
		QUERY:C277([PERIODS:33]; [PERIODS:33]To_Date:4>=(PUR_D_Date-DB_GetLedgerADStageTwo))
		PER_t_Period2:=[PERIODS:33]Period_Code:1
	End if 
	QUERY:C277([PURCHASE_INVOICES:37];  & ; [PURCHASE_INVOICES:37]Period_Code:3=PER_t_Period2)
End if 

$0:=Gen_Round((Sum:C1([PURCHASE_INVOICES:37]Total_Due:9)); 2; 2)
PUR_R_TotalDue60:=PUR_R_TotalDue60+$0
ERR_MethodTrackerReturn("PUR_SetTotalDue60"; $_t_oldMethodName)
