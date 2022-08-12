If (False:C215)
	//Table Form Method Name: [COMPANIES]dAlert_Curr
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 16/10/2012 12:30
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>DB_bo_CurrenciesInited; <>SCPT_bo_NoAutoScripts; DB_bo_NoLoad)
	C_LONGINT:C283($_l_event)
	C_TEXT:C284(<>ButtOK; $_t_oldMethodName; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("FM [COMPANIES].dAlert_Curr"; Form event code:C388)
$_l_event:=Form event code:C388


Case of 
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		If (Not:C34(<>DB_bo_CurrenciesInited))
			Currencies_INIT
		End if 
		OpenHelp(Table:C252(->[COMPANIES:2]); "dAlert_Curr")
		If (<>ButtOK#"")
			OBJECT SET TITLE:C194(xOK; <>ButtOK)
		End if 
		If (<>SCPT_bo_NoAutoScripts=False:C215)
			PLAY:C290("Daybook Alert"; 0)
		End if 
		INT_SetDialog
		
	: ($_l_event=On Deactivate:K2:10)
		//PAUSE PROCESS(Current process)
	: ($_l_event=On Outside Call:K2:11)
		In_ButtdCall(->[COMPANIES:2])
		
End case 
ERR_MethodTrackerReturn("FM [COMPANIES].dAlert_Curr"; $_t_oldMethodName)
