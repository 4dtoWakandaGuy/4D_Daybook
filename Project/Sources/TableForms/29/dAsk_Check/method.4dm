If (False:C215)
	//Table Form Method Name: [TRANSACTIONS]dask_Check
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 16/10/2012 12:12
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(DB_bo_NoLoad)
	C_LONGINT:C283($_l_event; ch0; ch2; ch3)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FM [TRANSACTIONS].dask_Check"; Form event code:C388)
$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		OpenHelp(Table:C252(->[TRANSACTIONS:29]); "dask_Check")
		ch0:=1
		If ((DB_GetModuleSettingByNUM(Module_MultiCurrency))<2)
			OBJECT SET ENABLED:C1123(ch2; False:C215)
		End if 
		If ((DB_GetModuleSettingByNUM(Module_MultiLayer))<2)
			OBJECT SET ENABLED:C1123(ch3; False:C215)
		End if 
		INT_SetDialog
		
	: ($_l_event=On Deactivate:K2:10)
		//PAUSE PROCESS(vProc)
	: ($_l_event=On Outside Call:K2:11)
		In_ButtdCall(->[TRANSACTIONS:29])
		
End case 
ERR_MethodTrackerReturn("FM:dask_Check"; $_t_oldMethodName)
