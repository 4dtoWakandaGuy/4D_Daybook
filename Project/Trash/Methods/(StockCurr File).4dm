//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      StockCurr File
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
	C_TEXT:C284($_t_oldMethodName; vSVCF)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("StockCurr File")
//DEFAULT TABLE([CURRENT STOCK])
StockCurr_FileI
StockCurr_FileO
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
		READ WRITE:C146([CURRENT_STOCK:62])
	End if 
End if 
SYS_bo_StatsView:=<>SYS_bo_StatsView
If ((vAdd=0) & (<>SYS_bo_StatsView))
	vFilePtr:=->[CURRENT_STOCK:62]
	SYS_bo_StatsView:=True:C214
	vSVCF:=""
	StatsView_ArFiS("Current Stock/62/StockCurr_Sel/")
	StatsView_ArF1S("1.9/3.59/8.61/10.36/11.71/12.76/")
End if 
ERR_MethodTrackerReturn("StockCurr File"; $_t_oldMethodName)
