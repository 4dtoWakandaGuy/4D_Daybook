If (False:C215)
	//Table Form Method Name: [RECURRING_JOURNALS]dDup_Dates
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 13/04/2011 10:07
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(DB_bo_NoLoad)
	C_LONGINT:C283($_l_event; DB_l_ButtonClickedFunction; iCancel; iOK)
	C_TEXT:C284($_t_oldMethodName; vButtDisSJ)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FM [RECURRING_JOURNALS].dDup_Dates"; Form event code:C388)
$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		OpenHelp(Table:C252(->[RECURRING_JOURNALS:38]); "dDup_Dates")
		Standing_InLPB
		INT_SetDialog
		
	: ($_l_event=On Activate:K2:9)
		OpenHelp(Table:C252(->[RECURRING_JOURNALS:38]); "dDup_Dates")
		
		In_ButtChkDis(->vButtDisSJ)
		
	: ((($_l_event=On Outside Call:K2:11) & (DB_l_ButtonClickedFunction#0)) | (iOK=1) | (iCancel=1))
		In_ButtCall(""; ""; "Minor_Del"; ->[RECURRING_JOURNALS:38]; ->[RECURRING_JOURNALS:38]Transaction_Type_Code:2; "Standing"; ""; "Standing_InLPB"; ""; ""; ""; ->[IDENTIFIERS:16]; ->vButtDisSJ)
	: ($_l_event=On Data Change:K2:15)
		
	: ($_l_event=On Deactivate:K2:10)
		//PAUSE PROCESS(vProc)
End case 
ERR_MethodTrackerReturn("FM:dDup Dates"; $_t_oldMethodName)
