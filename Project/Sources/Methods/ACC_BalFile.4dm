//%attributes = {}
If (False:C215)
	//Project Method Name:      ACC_BalFIle
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 01/04/2010 13:44
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//C_UNKNOWN(vAB)
	//C_UNKNOWN(vD)
	//C_UNKNOWN(vTerms)
	//C_UNKNOWN(vTitle4)
	C_BOOLEAN:C305(<>SYS_bo_StatsView)
	C_LONGINT:C283(vAB; vAdd; vD; MOD_l_CurrentModuleAccess)
	C_TEXT:C284(vTerms; vTitle4; WIN_t_CurrentInputForm; WIN_t_CurrentOutputform; $_t_oldMethodName; WIN_t_CurrentInputForm; WIN_t_CurrentOutputform)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("ACC_BalFIle")

FORM SET INPUT:C55([ACCOUNT_BALANCES:34]; "AccBal_in")  //NG April 2004 removed reference to ◊screen
WIN_t_CurrentInputForm:="AccBal_in"
FORM SET OUTPUT:C54([ACCOUNT_BALANCES:34]; "AccBal_Out")
WIN_t_CurrentOutputform:="AccBal_Out"
vAB:=1
MOD_l_CurrentModuleAccess:=(DB_GetModuleSettingByNUM(Module_NominalLedger))
vTitle4:=""
If (MOD_l_CurrentModuleAccess<2)
	Gen_Alert("You do not have access to the General Ledger Module"; "Cancel")
	OK:=0
	vD:=0
	vAB:=0
	//ABORT
	vTerms:=""
Else 
	If (MOD_l_CurrentModuleAccess#3)
		READ WRITE:C146([ACCOUNT_BALANCES:34])
	End if 
End if 
SYS_bo_StatsView:=<>SYS_bo_StatsView
If ((vAdd=0) & (<>SYS_bo_StatsView))
	ACC_BalStatsView
End if 
ERR_MethodTrackerReturn("ACC_BalFIle"; $_t_oldMethodName)
