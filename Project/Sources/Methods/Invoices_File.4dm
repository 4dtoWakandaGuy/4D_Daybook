//%attributes = {}
If (False:C215)
	//Project Method Name:      Invoices_File
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 12/02/2010 15:50
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>SYS_bo_StatsView; $0; SYS_bo_StatsView)
	C_LONGINT:C283(MOD_l_CurrentModuleAccess; vIn)
	C_POINTER:C301(vFilePtr)
	C_TEXT:C284(<>SYS_t_ACCOpenBalancesStatus; $_t_oldMethodName; ACC_t_CurrencyCode; vSVCF)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Invoices_File")

Invoices_FileI
Invoices_FileO
vIn:=1
MOD_l_CurrentModuleAccess:=DB_GetModuleSettingByNUM(Module_SalesLedger)
ACC_t_CurrencyCode:=""
$0:=True:C214
If (MOD_l_CurrentModuleAccess<2)
	Gen_Alert("You do not have access to the Sales Ledger Module"; "Cancel")
	OK:=0
	vIn:=0
	$0:=False:C215
	//Process_End
	//ABORT
Else 
	If (<>SYS_t_ACCOpenBalancesStatus#"")
		Gen_Confirm("You cannot access the Sales Ledger until all Opening Balance"+" postings have been completed."+Char:C90(13)+Char:C90(13)+"Would you like to see the Opening Balances screen now?"; "Opening Bals"; "Cancel")
		If (OK=1)
			ZStartup_SetOB
		End if 
		OK:=0
		vIn:=0
		$0:=False:C215
		// Process_End
		// ABORT
	Else 
		If (MOD_l_CurrentModuleAccess#3)
			READ WRITE:C146([INVOICES:39])
		End if 
	End if 
End if 
SYS_bo_StatsView:=<>SYS_bo_StatsView
If ((vAdd=0) & (<>SYS_bo_StatsView))
	vFilePtr:=->[INVOICES:39]
	SYS_bo_StatsView:=True:C214
	vSVCF:="Invoices_SVCF"
	StatsView_ArFiS("Sales Ledger/39/Invoices_Sel/General Ledger/29/Trans_Sel/")
	StatsView_ArF1S("2.2/3.1.2,5/10/13.33/17.36/21/22.54/27.71/29.3/38.76/39.41/42.11/")
End if 
ERR_MethodTrackerReturn("Invoices_File"; $_t_oldMethodName)
