If (False:C215)
	//Table Form Method Name: [ANALYSES]dAsk_Analysis
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 16/10/2012 12:31
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(LB_lb_AnalysisListbox;0)
	//ARRAY TEXT(GEN_at_Name;0)
	//ARRAY TEXT(GEN_at_RecordCode;0)
	C_BOOLEAN:C305(DB_bo_NoLoad)
	C_LONGINT:C283($_l_event; ACC_l_BUT1; ACC_l_But2; ACC_l_BUT3; ACC_l_BUT4; ACC_l_BUT5; ACC_l_BUT6; ACC_l_BUT7; ACC_l_BUT8; ACC_l_BUT9; xCancel)
	C_PICTURE:C286(<>PictLogoMed)
	C_TEXT:C284($_t_oldMethodName; ACC_t_COL1; ACC_t_COL2; ACC_t_COL3; ACC_t_COL4; ACC_t_COL5; ACC_t_COL6; ACC_t_COL7; ACC_t_COL8; ACC_t_COL9; ACC_t_HED1)
	C_TEXT:C284(ACC_t_HED2; ACC_t_HED3; ACC_t_HED4; ACC_t_HED5; ACC_t_HED6; ACC_t_HED7; ACC_t_HED8; ACC_t_HED9)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FM [ANALYSES].dAsk_Analysis"; Form event code:C388)
$_l_event:=Form event code:C388


Case of 
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		//GET PICTURE FROM LIBRARY(20240; <>PictLogoMed)
		<>PictLogoMed:=Get_Picture(20240)
		OpenHelp(Table:C252(->[ANALYSES:36]); "dAsk_Analysis")
		WS_AutoscreenSize(2; 136; 357)
		GEN_at_Name:=1
		GEN_at_RecordCode:=1
		If (Is Windows:C1573)
			OBJECT SET TITLE:C194(xCancel; "Exit")
		End if 
		
		LB_SetupListbox(->LB_lb_AnalysisListbox; "ACC_t"; "ACC_L"; 1; ->GEN_at_RecordCode; ->GEN_at_Name)
		LB_SetColumnHeaders(->LB_lb_AnalysisListbox; "ACC_L"; 1; "Code"; "Name")
		LB_SetColumnWidths(->LB_lb_AnalysisListbox; "ACC_t"; 1; 87; 187)
		LB_SetEnterable(->LB_lb_AnalysisListbox; False:C215; 0)
		LB_SetScroll(->LB_lb_AnalysisListbox; -3; -2)
		LB_StyleSettings(->LB_lb_AnalysisListbox; "Black"; 9; "ACC_t"; ->[ACCOUNTS:32])
		INT_SetDialog
		SD2_SetDiaryPopup
	: ($_l_event=On Deactivate:K2:10)
		//PAUSE PROCESS(vProc)
	: ($_l_event=On Outside Call:K2:11)
		In_ButtdCall(->[PERSONNEL:11])
		
	: ($_l_event=On Activate:K2:9)
		SD2_SetDiaryPopup
		
End case 
ERR_MethodTrackerReturn("FM:dAsk_Analysis"; $_t_oldMethodName)
