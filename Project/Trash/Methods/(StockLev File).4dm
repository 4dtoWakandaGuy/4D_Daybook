//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      StockLev File
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
	C_BOOLEAN:C305(<>SYS_bo_StatsView; $0; SYS_bo_StatsView)
	C_LONGINT:C283(MOD_l_CurrentModuleAccess; vPu)
	C_POINTER:C301(vFilePtr)
	C_TEXT:C284($_t_oldMethodName; vSVCF; WIN_t_CurrentInputForm; WIN_t_CurrentOutputform)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("StockLev File")

FORM SET INPUT:C55([STOCK_LEVELS:58]; "StockLev In13")  //NG April 2004 Removed ◊Screen
WIN_t_CurrentInputForm:="StockLev In13"
FORM SET OUTPUT:C54([STOCK_LEVELS:58]; "StockLev Out")
WIN_t_CurrentOutputform:="StockLev Out"
vPu:=1
MOD_l_CurrentModuleAccess:=DB_GetModuleSettingByNUM(Module_StockControl)
$0:=True:C214
If (MOD_l_CurrentModuleAccess<2)
	Gen_Alert("You do not have access to the Stock_Module"; "Cancel")
	vPu:=0
	OK:=0
	$0:=False:C215
Else 
	If (MOD_l_CurrentModuleAccess#3)
		READ WRITE:C146([STOCK_LEVELS:58])
	End if 
End if 
SYS_bo_StatsView:=<>SYS_bo_StatsView
If ((vAdd=0) & (<>SYS_bo_StatsView))
	vFilePtr:=->[STOCK_LEVELS:58]
	SYS_bo_StatsView:=True:C214
	vSVCF:=""
	StatsView_ArFiS("Stock Levels/58/StockLev_Sel/")
	StatsView_ArF1S("1.9/2.59/7.36/8.71/9.76/")
End if 
ERR_MethodTrackerReturn("StockLev File"; $_t_oldMethodName)
