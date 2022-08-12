If (False:C215)
	//Table Form Method Name: [COMPANIES]dAsk_Set
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 16/10/2012 12:29
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(DB_bo_NoLoad)
	C_LONGINT:C283($_l_event; cList)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("FM [COMPANIES].dAsk_Set"; Form event code:C388)
//dAsk_Set
$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		OpenHelp(Table:C252(->[COMPANIES:2]); "dAsk_Set")
		cList:=1
		INT_SetDialog
		SD2_SetDiaryPopup
	: ($_l_event=On Deactivate:K2:10)
		//   PAUSE PROCESS(Current process)
	: ($_l_event=On Outside Call:K2:11)
		In_ButtdCall(->[COMPANIES:2])
		
		
End case 
ERR_MethodTrackerReturn("FM [COMPANIES].dAsk_Set"; $_t_oldMethodName)
