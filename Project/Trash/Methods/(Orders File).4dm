//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Orders File
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
	C_BOOLEAN:C305(<>DB_bo_PrefsLoaded; <>SYS_bo_StatsView; $0; ORD_bo_IsRevision)
	C_LONGINT:C283(<>MENU_l_BarModule; MOD_l_CurrentModuleAccess; vAB; vOrd; vProcaMod; vST)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Orders File")

//this is a temporary change
If (Not:C34(<>DB_bo_PrefsLoaded))
	DB_LoadErrorTrackPrefs
End if 
$0:=True:C214
Orders_FileI
Orders_FileO
vOrd:=1
vAB:=0  //Used to store the current Component display level
vST:=0  //Used to count the number of levels in the OrderI_LevelCr proc
vProcaMod:=Module_SalesOrders
MOD_l_CurrentModuleAccess:=DB_GetModuleSettingByNUM(vProcaMod)
If (MOD_l_CurrentModuleAccess<2)
	Gen_Alert("You do not have access to the Sales Orders_Module"; "Cancel")
	vOrd:=0
	OK:=0
	$0:=False:C215
	// ABORT
Else 
	If (MOD_l_CurrentModuleAccess#3)
		If (ORD_bo_IsRevision)
			READ ONLY:C145([ORDERS:24])
			READ ONLY:C145([ORDER_ITEMS:25])
			READ ONLY:C145([SUBSCRIPTIONS:93])
		Else 
			
			READ WRITE:C146([ORDERS:24])
			READ WRITE:C146([ORDER_ITEMS:25])
			If ((DB_GetModuleSettingByNUM(Module_Subscriptions)=2) | (DB_GetModuleSettingByNUM(Module_Subscriptions)=4))
				READ WRITE:C146([SUBSCRIPTIONS:93])
			End if 
		End if 
	End if 
End if 
SYS_bo_StatsView:=<>SYS_bo_StatsView
If ((vAdd=0) & (<>SYS_bo_StatsView))
	Orders_SV
End if 
ERR_MethodTrackerReturn("Orders File"; $_t_oldMethodName)
