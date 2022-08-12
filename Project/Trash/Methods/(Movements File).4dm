//%attributes = {}
If (False:C215)
	//Project Method Name:      Movements File
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
	C_LONGINT:C283(MOD_l_CurrentModuleAccess; vD; vProcaMod; vPu)
	C_POINTER:C301(vFilePtr)
	C_TEXT:C284($_t_oldMethodName; vSVCF; WIN_t_CurrentInputForm; WIN_t_CurrentOutputform)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Movements File")

FORM SET INPUT:C55([STOCK_MOVEMENTS:40]; "Movements_in")  //NG April 2004 removed reference to ◊screen
WIN_t_CurrentInputForm:="Movements_in"
FORM SET OUTPUT:C54([STOCK_MOVEMENTS:40]; "Movements_out")
WIN_t_CurrentOutputform:="Movements_out"
vPu:=1
vProcaMod:=Module_StockControl


MOD_l_CurrentModuleAccess:=DB_GetModuleSettingByNUM(vProcaMod)
$0:=True:C214
If (MOD_l_CurrentModuleAccess<2)
	Gen_Alert("You do not have access to the "+Term_StoWT("Stock")+" Control Module"; "Cancel")
	OK:=0
	vD:=0
	//ABORT
	$0:=False:C215
Else 
	If (MOD_l_CurrentModuleAccess#3)
		READ WRITE:C146([STOCK_MOVEMENTS:40])
		READ WRITE:C146([STOCK_MOVEMENT_ITEMS:27])
		READ WRITE:C146([ORDER_ITEMS:25])
	End if 
End if 
SYS_bo_StatsView:=<>SYS_bo_StatsView
If ((vAdd=0) & (<>SYS_bo_StatsView))
	vFilePtr:=->[STOCK_MOVEMENTS:40]
	SYS_bo_StatsView:=True:C214
	vSVCF:="Movements_SVCF"
	StatsView_ArFiS("Stock Movements/40/Movements_Sel/Stock Items/27/Stock_Sel/")
	StatsView_ArF1S("2.2/6.60/9.36/10.71/11.76/")
End if 
ERR_MethodTrackerReturn("Movements File"; $_t_oldMethodName)
