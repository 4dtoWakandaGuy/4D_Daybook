//%attributes = {}
If (False:C215)
	//Project Method Name:      PUR_SetTotalDue
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 17/03/2011 19:06
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(PUR_bo_RESET)
	C_LONGINT:C283(LBI_l_ForrnulaCheckType)
	C_REAL:C285($0; PUR_R_TotalDue; PUR_R_TotalDue30; PUR_R_TotalDue60; PUR_R_TotalDue90; PUR_R_TotalDueg90)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("PUR_SetTotalDue")


If (PUR_bo_RESET)
	PUR_bo_RESET:=False:C215
	PUR_R_TotalDue:=0
	PUR_R_TotalDue30:=0
	PUR_R_TotalDue90:=0
	PUR_R_TotalDue60:=0
	PUR_R_TotalDueg90:=0
End if 
QUERY:C277([PURCHASE_INVOICES:37]; [PURCHASE_INVOICES:37]Company_Code:2=[COMPANIES:2]Company_Code:1; *)
QUERY:C277([PURCHASE_INVOICES:37];  & ; [PURCHASE_INVOICES:37]Total_Due:9#0)

$0:=Gen_Round((Sum:C1([PURCHASE_INVOICES:37]Total_Due:9)); 2; 2)

PUR_R_TotalDue:=PUR_R_TotalDue+$0
ERR_MethodTrackerReturn("PUR_SetTotalDue"; $_t_oldMethodName)
