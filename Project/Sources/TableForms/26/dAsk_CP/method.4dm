If (False:C215)
	//Table Form Method Name: [JOBS]dask_CP
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
	C_LONGINT:C283($_l_event; r0; r2; s1; s2)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("FM [JOBS].dask_CP"; Form event code:C388)
$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		OpenHelp(Table:C252(->[JOBS:26]); "dask_CP")
		r0:=1
		r2:=1
		If ((DB_GetModuleSettingByNUM(1))=5)
			s2:=1
			OBJECT SET ENABLED:C1123(s1; False:C215)
			OBJECT SET TITLE:C194(s2; "Copy Previous Actuals")
		Else 
			s1:=1
		End if 
		INT_SetDialog
		
	: ($_l_event=On Deactivate:K2:10)
		// PAUSE PROCESS(vProc)
	: ($_l_event=On Outside Call:K2:11)
		In_ButtdCall(->[JOBS:26])
End case 
ERR_MethodTrackerReturn("FM [JOBS].dask_CP"; $_t_oldMethodName)
