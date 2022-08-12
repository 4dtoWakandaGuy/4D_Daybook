If (False:C215)
	//Table Form Method Name: [INVOICES]dPaymentReconcile
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 16/10/2012 12:22
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(DB_bo_NoLoad)
	C_LONGINT:C283($_l_event; r0; r1; r2)
	C_REAL:C285(v61)
	C_TEXT:C284($_t_oldMethodName; ACC_t_BadDebts)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("FM [INVOICES].dPaymentReconcile"; Form event code:C388)
$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		OpenHelp(Table:C252(->[INVOICES:39]); "dPaymentReconcile")
		WS_AutoscreenSize(3; 246; 391)
		r1:=1
		CUR_GetDebtPreference
		If (ACC_t_BadDebts="")
			CANCEL:C270
		End if 
		QUERY:C277([ACCOUNTS:32]; [ACCOUNTS:32]Account_Code:2=ACC_t_BadDebts)
		If (Records in selection:C76([ACCOUNTS:32])=0)
			r0:=1
			r1:=0
			OBJECT SET ENABLED:C1123(r1; False:C215)
		End if 
		If (v61#0)
			r1:=1
			r0:=0
			r2:=0
		Else 
			r1:=0
			r0:=1
		End if 
		INT_SetDialog
		
	: ($_l_event=On Deactivate:K2:10)
		//PAUSE PROCESS(vProc)
	: ($_l_event=On Outside Call:K2:11)
		In_ButtdCall(->[INVOICES:39])
End case 
ERR_MethodTrackerReturn("FM [INVOICES].dPaymentReconcile"; $_t_oldMethodName)
