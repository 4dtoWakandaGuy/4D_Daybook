//%attributes = {}
If (False:C215)
	//Project Method Name:      OrderI_File
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
	C_BOOLEAN:C305(<>DB_bo_PrefsLoaded; <>SYS_bo_StatsView; SYS_bo_StatsView)
	C_LONGINT:C283(MOD_l_CurrentModuleAccess; vOrdI; vProcaMod; Vst)
	C_POINTER:C301(vFilePtr)
	C_TEXT:C284($_t_oldMethodName; vSVCF; WIN_t_CurrentInputForm; WIN_t_CurrentOutputform)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OrderI_File")

//this is a temporary change
If (Not:C34(<>DB_bo_PrefsLoaded))
	DB_LoadErrorTrackPrefs
End if 


Vst:=0
FORM SET INPUT:C55([ORDER_ITEMS:25]; "Items_in")  //NG April 2004 removed reference to ◊screen
FORM SET OUTPUT:C54([ORDER_ITEMS:25]; "Items_Out")
WIN_t_CurrentOutputform:="Items_Out"
WIN_t_CurrentInputForm:="Items_in"
vOrdI:=1
vProcaMod:=17
MOD_l_CurrentModuleAccess:=(DB_GetModuleSettingByNUM(Module_SalesOrders))
If (MOD_l_CurrentModuleAccess#3)
	READ WRITE:C146([ORDER_ITEMS:25])
End if 
If ((DB_GetModuleSettingByNUM(Module_Subscriptions)=2) | (DB_GetModuleSettingByNUM(Module_Subscriptions)=4))
	READ WRITE:C146([SUBSCRIPTIONS:93])
End if 
SYS_bo_StatsView:=<>SYS_bo_StatsView
If ((vAdd=0) & (<>SYS_bo_StatsView))
	vFilePtr:=->[ORDER_ITEMS:25]
	SYS_bo_StatsView:=True:C214
	vSVCF:=""
	StatsView_ArFiS("Order Items/25/OrderI_Sel/")
	StatsView_ArF1S("2.9/14.11/20.2/29/34/35.45/36/46/")
End if 
ERR_MethodTrackerReturn("OrderI_File"; $_t_oldMethodName)
