//%attributes = {}
If (False:C215)
	//Project Method Name:      TransB_File
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 01/04/2010 13:37
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>SYS_bo_StatsView; SYS_bo_StatsView)
	C_LONGINT:C283(MOD_l_CurrentModuleAccess; vTr)
	C_POINTER:C301(vFilePtr)
	C_TEXT:C284(<>SYS_t_ACCOpenBalancesStatus; $_t_oldMethodName; vLayer; vSVCF; WIN_t_CurrentOutputform)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("TransB_File")

TransB_FileI
FORM SET OUTPUT:C54([TRANSACTION_BATCHES:30]; "TransB_Out")
WIN_t_CurrentOutputform:="TransB_Out"
vTr:=1
MOD_l_CurrentModuleAccess:=DB_GetModuleSettingByNUM(Module_NominalLedger)
If (MOD_l_CurrentModuleAccess<2)
	Gen_Alert("You do not have access to the General Ledger Module"; "Cancel")
	OK:=0
	vTr:=0
	//  Process_End
	// ABORT
Else 
	If (<>SYS_t_ACCOpenBalancesStatus#"")
		Gen_Confirm("You cannot access the General Ledger until all Opening Balance"+" postings have been completed."+Char:C90(13)+Char:C90(13)+"Would you like to see the Opening Balances screen now?"; "Opening Bals"; "Cancel")
		If (OK=1)
			ZStartup_SetOB
		End if 
		OK:=0
		vTr:=0
		//  Process_End
		//  ABORT
	Else 
		If (MOD_l_CurrentModuleAccess#3)
			READ WRITE:C146([TRANSACTION_BATCHES:30])
		End if 
		vLayer:=""
	End if 
End if 
SYS_bo_StatsView:=<>SYS_bo_StatsView
If ((vAdd=0) & (<>SYS_bo_StatsView))
	vFilePtr:=->[TRANSACTION_BATCHES:30]
	SYS_bo_StatsView:=True:C214
	vSVCF:=""
	StatsView_ArFiS("Batches/30/TransB_Sel/")
	StatsView_ArF1S("11/14/15/")
End if 
ERR_MethodTrackerReturn("TransB_File"; $_t_oldMethodName)
