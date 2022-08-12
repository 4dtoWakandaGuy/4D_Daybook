If (False:C215)
	//Table Form Method Name: [DOCUMENTS]dAsk_MS
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
	C_LONGINT:C283($_l_event; ch3; ch5; ch8)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("FM [DOCUMENTS].dAsk_MS"; Form event code:C388)
$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		OpenHelp(Table:C252(->[DOCUMENTS:7]); "dAsk_MS")
		//   ch4:=1`Don't default
		ch3:=Num:C11([USER:15]Mailsort UD:172)
		ch8:=1
		ch5:=1
		INT_SetDialog
		
	: ($_l_event=On Deactivate:K2:10)
		//PAUSE PROCESS(Current process)
	: ($_l_event=On Outside Call:K2:11)
		In_ButtdCall(->[DOCUMENTS:7])
		
End case 
ERR_MethodTrackerReturn("FM [DOCUMENTS].dAsk_MS"; $_t_oldMethodName)
