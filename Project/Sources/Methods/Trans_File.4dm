//%attributes = {}
If (False:C215)
	//Project Method Name:      Trans_File
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
	C_BOOLEAN:C305(<>SYS_bo_StatsView; $0)
	C_LONGINT:C283(MOD_l_CurrentModuleAccess; vD; vTr)
	C_TEXT:C284($_t_oldMethodName; WIN_t_CurrentInputForm; WIN_t_CurrentOutputform)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Trans_File")
//DEFAULT TABLE([TRANSACTIONS])
FORM SET INPUT:C55([TRANSACTIONS:29]; "Trans_in")  //NG April 2004 Removed ◊Screen
WIN_t_CurrentInputForm:="Trans_in"
FORM SET OUTPUT:C54([TRANSACTIONS:29]; "Trans_Out")
WIN_t_CurrentOutputform:="Trans_Out"
vTr:=1
MOD_l_CurrentModuleAccess:=DB_GetModuleSettingByNUM(Module_NominalLedger)

$0:=True:C214
If (MOD_l_CurrentModuleAccess<2)
	Gen_Alert("You do not have access to the Nominal Ledger Module"; "Cancel")
	OK:=0
	vD:=0
	$0:=False:C215
	
Else 
	If (MOD_l_CurrentModuleAccess#3)
		READ WRITE:C146([TRANSACTIONS:29])
	End if 
End if 
SYS_bo_StatsView:=<>SYS_bo_StatsView
If ((vAdd=0) & (<>SYS_bo_StatsView))
	Trans_SV
End if 
ERR_MethodTrackerReturn("Trans_File"; $_t_oldMethodName)
