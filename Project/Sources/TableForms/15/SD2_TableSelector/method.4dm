If (False:C215)
	//Table Form Method Name: [USER]SD2_TableSelector
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 25/10/2012 12:02
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(SD2_Lb_TableSelector;0)
	//ARRAY INTEGER(SD2_ai_SelectedTables;0)
	//ARRAY TEXT(SD2_at_SelectableTables;0)
	C_BOOLEAN:C305(DB_bo_NoLoad)
	C_LONGINT:C283($_l_event; SD_l_Changes; TC2_l_BUT1; TC2_l_But2; TC2_l_BUT3; TC2_l_BUT4; TC2_l_BUT5; TC2_l_BUT6; TC2_l_BUT7; TC2_l_BUT8; TC2_l_BUT9)
	C_TEXT:C284($_t_oldMethodName; TC2_t_COL1; TC2_t_COL2; TC2_t_COL3; TC2_t_COL4; TC2_t_COL5; TC2_t_COL6; TC2_t_COL7; TC2_t_COL8; TC2_t_COL9; TC2_t_HED1)
	C_TEXT:C284(TC2_t_HED2; TC2_t_HED3; TC2_t_HED4; TC2_t_HED5; TC2_t_HED6; TC2_t_HED7; TC2_t_HED8; TC2_t_HED9)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FM [USER].SD2_TableSelector"; Form event code:C388)
$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		OpenHelp(Table:C252(->[USER:15]); "SD2_TableSelector")
		SD_l_Changes:=0
		//
		
		LB_SetupListbox(->SD2_Lb_TableSelector; "TC2_t"; "TC2_L"; 1; ->SD2_ai_SelectedTables; ->SD2_at_SelectableTables)
		
		LB_SetColumnHeaders(->SD2_Lb_TableSelector; "TC2_L"; 1; "Selected"; "Table Name")
		LB_SetColumnWidths(->SD2_Lb_TableSelector; "TC2_t"; 1; 21; 225)
		
		LB_SetEnterable(->SD2_Lb_TableSelector; False:C215; 0)
		LB_StyleSettings(->SD2_Lb_TableSelector; "Black"; 9; "TC2_t"; ->[DIARY:12])
		
		
		INT_SetLongintCheckFormat(->SD2_ai_SelectedTables)
		
		
		WS_AutoscreenSize(3; 177; 480)
End case 
ERR_MethodTrackerReturn("FM:SD2_TableSelector"; $_t_oldMethodName)
