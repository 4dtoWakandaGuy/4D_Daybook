//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Letters File
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 12/02/2010 16:22
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>SYS_bo_StatsView; $0; SYS_bo_StatsView)
	C_LONGINT:C283(<>MENU_l_BarModule; MOD_l_CurrentModuleAccess; vAdd; vTr)
	C_POINTER:C301(vFilePtr)
	C_TEXT:C284($_t_DocumentWriteType; $_t_oldMethodName; vSVCF; WIN_t_CurrentOutputform)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Letters File")
Start_ProcMail

$_t_DocumentWriteType:=Letters_FileI

$0:=True:C214
If ($_t_DocumentWriteType#"")
	FORM SET OUTPUT:C54([DOCUMENTS:7]; "Letters Out")
	WIN_t_CurrentOutputform:="Letters Out"
	MOD_l_CurrentModuleAccess:=DB_GetModuleSettingByNUM(<>MENU_l_BarModule)
	If (MOD_l_CurrentModuleAccess#3)
		READ WRITE:C146([DOCUMENTS:7])
	End if 
	If (MOD_l_CurrentModuleAccess<2)
		$0:=False:C215
	End if 
	vAdd:=0
	vTr:=1
	SYS_bo_StatsView:=<>SYS_bo_StatsView
	If ((vAdd=0) & (<>SYS_bo_StatsView))
		vFilePtr:=->[DOCUMENTS:7]
		SYS_bo_StatsView:=True:C214
		vSVCF:="Letters_SVCF"
		StatsView_ArFiS("Documents/7/Letters_Sel/Diary/12/Diary_Sel/")
		StatsView_ArF1S("9/10.11/")
	End if 
End if 
ERR_MethodTrackerReturn("Letters File"; $_t_oldMethodName)