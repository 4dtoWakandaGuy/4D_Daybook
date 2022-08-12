If (False:C215)
	//Table Form Method Name: Object Name:      [CONTACTS].SD_SettingsDialogue
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 24/10/2012 14:16
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(SD2_lb_Actions;0)
	//ARRAY INTEGER(SD_ai_ActionCodes;0)
	//ARRAY INTEGER(SD_ai_ActionCodesOSW;0)
	//ARRAY LONGINT(SD_al_ActionCodesOST;0)
	//ARRAY LONGINT(SD_al_ActionTime;0)
	//ARRAY TEXT(SD_at_ActionCodes;0)
	//ARRAY TEXT(SD_at_ActioncodesOST;0)
	C_BOOLEAN:C305(DB_bo_NoLoad)
	C_LONGINT:C283($_l_event; SD2_l_BUT1; SD2_l_But2; SD2_l_BUT3; SD2_l_BUT4; SD2_l_BUT5; SD2_l_BUT6; SD2_l_BUT7; SD2_l_BUT8; SD2_l_BUT9)
	C_TEXT:C284($_t_oldMethodName; SD2_t_COL1; SD2_t_COL2; SD2_t_COL3; SD2_t_COL4; SD2_t_COL5; SD2_t_COL6; SD2_t_COL7; SD2_t_COL8; SD2_t_COL9; SD2_t_HED1)
	C_TEXT:C284(SD2_t_HED2; SD2_t_HED3; SD2_t_HED4; SD2_t_HED5; SD2_t_HED6; SD2_t_HED7; SD2_t_HED8; SD2_t_HED9)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FM [CONTACTS].SD_SettingsDialogue"; Form event code:C388)
$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		OpenHelp(Table:C252(->[CONTACTS:1]); "SD_SettingsDialogue")
		
		
		LB_SetupListbox(->SD2_lb_Actions; "SD2_t"; "SD2_L"; 1; ->SD_ai_ActionCodes; ->SD_at_ActionCodes; ->SD_al_ActionTime; ->SD_ai_ActionCodesOSW; ->SD_at_ActioncodesOST; ->SD_al_ActionCodesOST)
		LB_SetColumnHeaders(->SD2_lb_Actions; "SD2_L"; 1; "Available"; "Action Code"; "Default Amt Time"; "On Screen Reminder"; "Default Reminder Timing"; "")
		
		LB_SetColumnWidths(->SD2_lb_Actions; "SD2_t"; 1; 17; 170; 40; 26; 40; 0)
		
		LB_SetEnterable(->SD2_lb_Actions; False:C215; 0)
		LB_SetEnterable(->SD2_lb_Actions; False:C215; 1)
		
		LB_SetScroll(->SD2_lb_Actions; -3; -2)
		LB_StyleSettings(->SD2_lb_Actions; "Black"; 9; "SD2_t"; ->[ACCOUNTS:32])
End case 
ERR_MethodTrackerReturn("FM:SD_SettingsDialogue"; $_t_oldMethodName)
