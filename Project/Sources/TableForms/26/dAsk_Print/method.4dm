If (False:C215)
	//Table Form Method Name: [JOBS]dAsk_Print
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
	C_LONGINT:C283($_l_event; r0; r1; s1; s2; s3; s4)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("FM [JOBS].dAsk_Print"; Form event code:C388)
$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		OpenHelp(Table:C252(->[JOBS:26]); "dAsk_Print")
		r0:=1
		r1:=1
		If ((DB_GetModuleSettingByNUM(1))=5)
			OBJECT SET ENABLED:C1123(s1; False:C215)
			OBJECT SET ENABLED:C1123(s3; False:C215)
		Else 
			s1:=1
			s3:=1
		End if 
		s2:=1
		s4:=1
		INT_SetDialog
		
	: ($_l_event=On Deactivate:K2:10)
		// PAUSE PROCESS(vProc)
	: ($_l_event=On Outside Call:K2:11)
		In_ButtdCall(->[JOBS:26])
End case 
ERR_MethodTrackerReturn("FM [JOBS].dAsk_Print"; $_t_oldMethodName)
