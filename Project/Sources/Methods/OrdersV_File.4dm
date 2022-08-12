//%attributes = {}
If (False:C215)
	//Project Method Name:      OrdersV_File
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
	C_BOOLEAN:C305(<>DB_bo_PrefsLoaded; <>SalesOrder; <>SYS_bo_StatsView)
	C_LONGINT:C283(MOD_l_CurrentModuleAccess; vOrd; vProcaMod)
	C_TEXT:C284($_t_oldMethodName; WIN_t_CurrentOutputform)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OrdersV_File")

//this is a temporary change
If (Not:C34(<>DB_bo_PrefsLoaded))
	DB_LoadErrorTrackPrefs
End if 

vOrd:=1
vProcaMod:=13
MOD_l_CurrentModuleAccess:=(DB_GetModuleSettingByNUM(Module_Enquiries))
If (MOD_l_CurrentModuleAccess<2)
	Gen_Alert("You do not have access to the Enquiries Module"; "Cancel")
	vOrd:=0
	OK:=0
	ABORT:C156
Else 
	If (MOD_l_CurrentModuleAccess#3)
		READ WRITE:C146([ORDERS:24])
		READ WRITE:C146([ORDER_ITEMS:25])
	End if 
	If (<>SalesOrder)
		FORM SET OUTPUT:C54([ORDERS:24]; "Orders_OutV")
		WIN_t_CurrentOutputform:="Orders_OutV"
		Orders_FileI
	Else 
		FORM SET OUTPUT:C54([ORDERS:24]; "Orders_OutV")
		WIN_t_CurrentOutputform:="Orders_OutV"
		OrdersV_FileI
	End if 
End if 
SYS_bo_StatsView:=<>SYS_bo_StatsView
If ((vAdd=0) & (<>SYS_bo_StatsView))
	Orders_SV
End if 
ERR_MethodTrackerReturn("OrdersV_File"; $_t_oldMethodName)