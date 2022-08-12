//%attributes = {}
If (False:C215)
	//Project Method Name:      Stock_File
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 12/02/2010 19:08
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>SYS_bo_StatsView; $0; SYS_bo_StatsView)
	C_LONGINT:C283(MOD_l_CurrentModuleAccess; vSt)
	C_POINTER:C301(vFilePtr)
	C_TEXT:C284($_t_oldMethodName; vSVCF; WIN_t_CurrentInputForm; WIN_t_CurrentOutputform)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Stock_File")

FORM SET INPUT:C55([STOCK_MOVEMENT_ITEMS:27]; "Stock_in")  //NG April 2004 Removed ◊Screen
WIN_t_CurrentInputForm:="Stock_in"
FORM SET OUTPUT:C54([STOCK_MOVEMENT_ITEMS:27]; "Stock_out")
WIN_t_CurrentOutputform:="Stock_out"
vSt:=1
MOD_l_CurrentModuleAccess:=DB_GetModuleSettingByNUM(Module_StockControl)
If (MOD_l_CurrentModuleAccess#3)
	READ WRITE:C146([STOCK_MOVEMENT_ITEMS:27])
End if 
$0:=True:C214
If (MOD_l_CurrentModuleAccess<2)
	$0:=False:C215
End if 
SYS_bo_StatsView:=<>SYS_bo_StatsView

If ((vAdd=0) & (<>SYS_bo_StatsView))
	vFilePtr:=->[STOCK_MOVEMENT_ITEMS:27]
	SYS_bo_StatsView:=True:C214
	vSVCF:=""
	StatsView_ArFiS("Stock Items/27/Stock_Sel/")
	StatsView_ArF1S("1.9/2.2/7.61/")
End if 
ERR_MethodTrackerReturn("Stock_File"; $_t_oldMethodName)
