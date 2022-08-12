If (False:C215)
	//Table Form Method Name: [AREAS]dMinor_Sel
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 09/05/2013 13:00
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(DB_bo_NoLoad)
	C_LONGINT:C283($_l_event)
	C_POINTER:C301(vFilePtr)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("FM [AREAS].dMinor_Sel"; Form event code:C388)

Sel_LProc2(vFilePtr)
$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		OpenHelp(Table:C252(->[AREAS:3]); "dMinor_Sel")
		INT_SetDialog
		SD2_SetDiaryPopup
		WS_AutoscreenSize(2; 300; 592)
End case 
ERR_MethodTrackerReturn("FM [AREAS].dMinor_Sel"; $_t_oldMethodName)
