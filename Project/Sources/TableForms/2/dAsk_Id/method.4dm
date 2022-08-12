If (False:C215)
	//Table Form Method Name: [COMPANIES]dAsk_Id
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
	C_BOOLEAN:C305(DB_bo_NoLoad; GEN_bo_Autoquit; GEN_bo_ShowChangeAccess)
	C_LONGINT:C283($_l_event; xCancel; xNext)
	C_TEXT:C284(<>DB_t_PassLock; $_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FM [COMPANIES].dAsk_Id"; Form event code:C388)
$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		OpenHelp(Table:C252(->[COMPANIES:2]); "dAsk_Id")
		
		
		If (Is Windows:C1573)
			OBJECT SET TITLE:C194(xCancel; "Exit")
		End if 
		If (Not:C34(GEN_bo_ShowChangeAccess))
			OBJECT SET VISIBLE:C603(xNext; False:C215)
		End if 
		If (Not:C34(GEN_bo_Autoquit))
			OBJECT SET TITLE:C194(xCancel; "Cancel")
		End if 
		
		<>DB_t_PassLock:=""
		ON EVENT CALL:C190("")
		ON EVENT CALL:C190("On_EventID"; "$Events")
		// : (Outside call)
		//  In_ButtdCall
		INT_SetDialog
		SD2_SetDiaryPopup
End case 
ERR_MethodTrackerReturn("FM:dAsk_Id"; $_t_oldMethodName)
