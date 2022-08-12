If (False:C215)
	//Table Form Method Name: [COMPANIES]dClose
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:05
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>OneEntry; <>SCPT_bo_NoAutoScripts; DB_bo_NoLoad)
	C_LONGINT:C283($_l_event; xNext)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("FM [COMPANIES].dClose"; Form event code:C388)
$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		OpenHelp(Table:C252(->[COMPANIES:2]); "dClose")
		WS_AutoscreenSize(2; 95; 423)
		If ((vAdd=0) | (<>OneEntry))
			If (<>SCPT_bo_NoAutoScripts=False:C215)
				PLAY:C290("Daybook Confirm"; 0)
			End if 
			OBJECT SET ENABLED:C1123(xNext; False:C215)
		End if 
		INT_SetDialog
		
	: ($_l_event=On Deactivate:K2:10)
		//    PAUSE PROCESS(Current process)
		//: (Outside call)
		// In_ButtdCall
End case 
ERR_MethodTrackerReturn("FM [COMPANIES].dClose"; $_t_oldMethodName)
