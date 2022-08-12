//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      PriceT File
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
	C_LONGINT:C283(MOD_l_CurrentModuleAccess; vP)
	C_POINTER:C301(vFilePtr)
	C_TEXT:C284($_t_oldMethodName; vSVCF; WIN_t_CurrentInputForm; WIN_t_CurrentOutputform)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("PriceT File")

FORM SET INPUT:C55([PRICE_TABLE:28]; "PriceT_in13")  //NG April 2004 Removed ◊Screen
WIN_t_CurrentInputForm:="PriceT_in13"
FORM SET OUTPUT:C54([PRICE_TABLE:28]; "PriceT out")
WIN_t_CurrentOutputform:="PriceT out"
vP:=1
MOD_l_CurrentModuleAccess:=DB_GetModuleSettingByNUM(Module_PriceTable)
$0:=True:C214
If (MOD_l_CurrentModuleAccess<2)
	Gen_Alert("You do not have access to the Price Table Module"; "Cancel")
	OK:=0
	vP:=0
	$0:=False:C215
Else 
	If (MOD_l_CurrentModuleAccess#3)
		READ WRITE:C146([PRICE_TABLE:28])
	End if 
End if 
SYS_bo_StatsView:=<>SYS_bo_StatsView
If ((vAdd=0) & (<>SYS_bo_StatsView))
	vFilePtr:=->[PRICE_TABLE:28]
	SYS_bo_StatsView:=True:C214
	vSVCF:="PriceT_SVCF"
	StatsView_ArFiS("Price Table/28/PriceT_Sel/Order Items/25/OrderI_Sel/")
	StatsView_ArF1S("1.9/2.18/6.10/7.8/8.2/13.71/")
End if 
ERR_MethodTrackerReturn("PriceT File"; $_t_oldMethodName)
