//%attributes = {}
If (False:C215)
	//Project Method Name:      PurchOrd_File
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
	C_TEXT:C284($_t_oldMethodName; vSVCF; WIN_t_CurrentOutputform)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("PurchOrd_File")

PurchOrd_FileI
FORM SET OUTPUT:C54([PURCHASE_ORDERS:57]; "PurchaseOrder_Out")
WIN_t_CurrentOutputform:="PurchaseOrder_Out"
vPu:=1
vProcaMod:=18
MOD_l_CurrentModuleAccess:=(DB_GetModuleSettingByNUM(Module_PurchaseOrders))
$0:=True:C214
If (MOD_l_CurrentModuleAccess<2)
	Gen_Alert("You do not have access to the Purchase Ordering Module"; "Cancel")
	OK:=0
	vD:=0
	//ABORT
	$0:=False:C215
Else 
	If (MOD_l_CurrentModuleAccess#3)
		READ WRITE:C146([PURCHASE_ORDERS:57])
	End if 
End if 
SYS_bo_StatsView:=<>SYS_bo_StatsView
If ((vAdd=0) & (<>SYS_bo_StatsView))
	vFilePtr:=->[PURCHASE_ORDERS:57]
	SYS_bo_StatsView:=True:C214
	vSVCF:=""
	StatsView_ArFiS("Purchase Orders/57/PurchOrd_Sel")
	StatsView_ArF1S("1.2/5.1.2,5/6.2/14/15.36/16.71/17.76/")
End if 
ERR_MethodTrackerReturn("PurchOrd_File"; $_t_oldMethodName)
