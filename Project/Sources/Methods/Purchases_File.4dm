//%attributes = {}
If (False:C215)
	//Project Method Name:      Purchases_File
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 01/04/2010 13:56
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>SYS_bo_StatsView; SYS_bo_StatsView)
	C_LONGINT:C283(MOD_l_CurrentModuleAccess; vAdd; vPu)
	C_POINTER:C301(vFilePtr)
	C_TEXT:C284(<>SYS_t_ACCOpenBalancesStatus; $_t_oldMethodName; ACC_t_CurrencyCode; vSVCF; WIN_t_CurrentOutputform)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Purchases_File")

Purchases_FileI
FORM SET OUTPUT:C54([PURCHASE_INVOICES:37]; "Purchases_Out")
WIN_t_CurrentOutputform:="Purchases_Out"
vPu:=1
MOD_l_CurrentModuleAccess:=DB_GetModuleSettingByNUM(Module_PurchaseLedger)
vAdd:=0
ACC_t_CurrencyCode:=""
If (MOD_l_CurrentModuleAccess<2)
	Gen_Alert("You do not have access to the Purchase Ledger Module"; "Cancel")
	OK:=0
	vPu:=0
	// Process_End
	//ABORT
Else 
	If (<>SYS_t_ACCOpenBalancesStatus#"")
		Gen_Confirm("You cannot access the Purchase Ledger until all Opening Balance"+" postings have been completed."+Char:C90(13)+Char:C90(13)+"Would you like to see the Opening Balances screen now?"; "Opening Bals"; "Cancel")
		If (OK=1)
			ZStartup_SetOB
		End if 
		OK:=0
		vPu:=0
		//  Process_End
		// ABORT
	Else 
		If (MOD_l_CurrentModuleAccess#3)
			READ WRITE:C146([PURCHASE_INVOICES:37])
			READ WRITE:C146([PURCHASE_INVOICE_ITEMS:158])
		End if 
	End if 
End if 
SYS_bo_StatsView:=<>SYS_bo_StatsView
If ((vAdd=0) & (<>SYS_bo_StatsView))
	vFilePtr:=->[PURCHASE_INVOICES:37]
	SYS_bo_StatsView:=True:C214
	vSVCF:="Purchases_SVCF"
	StatsView_ArFiS("Purchase Ledger/37/Purchases_Sel/General Ledger/29/Trans_Sel/")
	
	StatsView_ArF1S("2.2/3.33/15.36/18/21.3/25.71/26/30.76/31.41/")
End if 
ERR_MethodTrackerReturn("Purchases_File"; $_t_oldMethodName)
