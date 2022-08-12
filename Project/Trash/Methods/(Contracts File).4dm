//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Contracts File
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 01/04/2010 13:44
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>SYS_bo_StatsView; $0; SYS_bo_StatsView)
	C_LONGINT:C283(MOD_l_CurrentModuleAccess; vContr; vD; vProcaMod)
	C_POINTER:C301(vFilePtr)
	C_TEXT:C284($_t_oldMethodName; vSVCF; WIN_t_CurrentInputForm; WIN_t_CurrentOutputform)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Contracts File")
//Contracts file

FORM SET INPUT:C55([CONTRACTS:17]; "Contracts_In13")  //NG April 2004 removed reference to ◊screen
WIN_t_CurrentInputForm:="Contracts_In13"
FORM SET OUTPUT:C54([CONTRACTS:17]; "Contracts Out")
WIN_t_CurrentOutputform:="Contracts Out"
vContr:=1
vProcaMod:=Module_ServiceCentre


MOD_l_CurrentModuleAccess:=DB_GetModuleSettingByNUM(vProcaMod)
$0:=True:C214
If (MOD_l_CurrentModuleAccess<2)
	Gen_Alert("You do not have access to the Service Centre Module"; "Cancel")
	OK:=0
	vD:=0
	//ABORT NG JUne 2004 removed
	$0:=False:C215
Else 
	If (MOD_l_CurrentModuleAccess#3)
		READ WRITE:C146([CONTRACTS:17])
		READ WRITE:C146([ORDER_ITEMS:25])
		READ WRITE:C146([CONTRACT_RECORD_ANALYSIS:88])
	End if 
End if 
Start_ProcMail
SYS_bo_StatsView:=<>SYS_bo_StatsView
If ((vAdd=0) & (<>SYS_bo_StatsView))
	vFilePtr:=->[CONTRACTS:17]
	SYS_bo_StatsView:=True:C214
	vSVCF:=""
	StatsView_ArFiS("Contracts/17/Contracts_Sel/")
	StatsView_ArF1S("1.2/2.1.2,5/4.19/9.2/")
End if 
ERR_MethodTrackerReturn("Contracts File"; $_t_oldMethodName)