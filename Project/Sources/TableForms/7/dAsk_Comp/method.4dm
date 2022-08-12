If (False:C215)
	//Table Form Method Name: [DOCUMENTS]dAsk_Comp
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 16/10/2012 12:32
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(DB_bo_NoLoad)
	C_LONGINT:C283($_l_event; ch1; r3)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("FM [DOCUMENTS].dAsk_Comp"; Form event code:C388)
$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		OpenHelp(Table:C252(->[DOCUMENTS:7]); "dAsk_Comp")
		r3:=1
		ch1:=1
		INT_SetDialog
		
	: ($_l_event=On Deactivate:K2:10)
		// PAUSE PROCESS(Current process)
	: ($_l_event=On Outside Call:K2:11)
		In_ButtdCall(->[DOCUMENTS:7])
		
End case 
ERR_MethodTrackerReturn("FM [DOCUMENTS].dAsk_Comp"; $_t_oldMethodName)
