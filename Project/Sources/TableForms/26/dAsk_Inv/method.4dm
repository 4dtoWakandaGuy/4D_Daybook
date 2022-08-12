If (False:C215)
	//Table Form Method Name: [JOBS]dAsk_Inv
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 16/10/2012 12:21
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(DB_bo_NoLoad)
	C_LONGINT:C283($_l_event; ch1; r1; r2; s1; vAct2)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("FM [JOBS].dAsk_Inv"; Form event code:C388)
$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		OpenHelp(Table:C252(->[JOBS:26]); "dAsk_Inv")
		If ((DB_GetModuleSettingByNUM(1))=5)
			OBJECT SET ENABLED:C1123(r1; False:C215)
		End if 
		r2:=1
		s1:=1
		ch1:=1
		vAct2:=1
		INT_SetDialog
		
	: ($_l_event=On Deactivate:K2:10)
		//  PAUSE PROCESS(vProc)
	: ($_l_event=On Outside Call:K2:11)
		In_ButtdCall(->[JOBS:26])
End case 
ERR_MethodTrackerReturn("FM [JOBS].dAsk_Inv"; $_t_oldMethodName)
