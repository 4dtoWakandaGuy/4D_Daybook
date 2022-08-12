If (False:C215)
	//Table Form Method Name: [DIARY]Diary_Appointments
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:10
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(DIA_lb_Appointments;0)
	//ARRAY TEXT(GEN_at_Identity;0)
	//ARRAY TEXT(GEN_at_Name;0)
	//ARRAY TEXT(GEN_at_RecordCode;0)
	C_BOOLEAN:C305(DB_bo_NoLoad)
	C_LONGINT:C283($_l_event; DIA_l_BUT1; DIA_l_But2; DIA_l_BUT3; DIA_l_BUT4; DIA_l_BUT5; DIA_l_BUT6; DIA_l_BUT7; DIA_l_BUT8; DIA_l_BUT9)
	C_TEXT:C284($_t_oldMethodName; DIA_t_COL1; DIA_t_COL2; DIA_t_COL3; DIA_t_COL4; DIA_t_COL5; DIA_t_COL6; DIA_t_COL7; DIA_t_COL8; DIA_t_COL9; DIA_t_HED1)
	C_TEXT:C284(DIA_t_HED2; DIA_t_HED3; DIA_t_HED4; DIA_t_HED5; DIA_t_HED6; DIA_t_HED7; DIA_t_HED8; DIA_t_HED9; WIN_t_CurrentInputForm)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FM [DIARY].Diary_Appointments"; Form event code:C388)
$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Header:K2:17) | ($_l_event=On Resize:K2:27)
		WS_AutoscreenSize(2; 410; 590)
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		OpenHelp(Table:C252(->[DIARY:12]); "Diary_Appointments")
		WS_AutoscreenSize(2; 410; 590)
		
		LB_SetupListbox(->DIA_lb_Appointments; "DIA_t"; "DIA_L"; 1; ->GEN_at_RecordCode; ->GEN_at_Identity; ->GEN_at_Name)
		LB_SetColumnHeaders(->DIA_lb_Appointments; "DIA_L"; 1; "Code"; "Name"; "Next")
		
		LB_SetColumnWidths(->DIA_lb_Appointments; "DIA_t"; 1; 59; 204; 249)
		
		LB_SetEnterable(->DIA_lb_Appointments; False:C215; 0)
		LB_SetScroll(->DIA_lb_Appointments; -3; -2)
		LB_StyleSettings(->DIA_lb_Appointments; "Black"; 9; "DIA_t"; ->[ACCOUNTS:32])
		INT_SetInput(Table:C252(->[DIARY:12]); WIN_t_CurrentInputForm)
End case 
Diary_ApptsLP
ERR_MethodTrackerReturn("FM:Diary_Appointments"; $_t_oldMethodName)
