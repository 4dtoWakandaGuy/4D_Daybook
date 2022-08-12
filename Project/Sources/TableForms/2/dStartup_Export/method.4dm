If (False:C215)
	//Table Form Method Name: [COMPANIES]dStartup_Export
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:06
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(COM_lb_Tables;0)
	//ARRAY LONGINT(MOD_al_ModuleAccessStatus;0)
	//ARRAY TEXT(<>DB_at_TableNames;0)
	C_BOOLEAN:C305(DB_bo_NoLoad)
	C_LONGINT:C283($_l_event; $_l_SIzeofArray; COM_l_BUT1; COM_l_But2; COM_l_BUT3; COM_l_BUT4; COM_l_BUT5; COM_l_BUT6; COM_l_BUT7; COM_l_BUT8; COM_l_BUT9)
	C_LONGINT:C283(r0; s1; vNo1; vNo2; vNo3)
	C_TEXT:C284($_t_oldMethodName; COM_t_COL1; COM_t_COL2; COM_t_COL3; COM_t_COL4; COM_t_COL5; COM_t_COL6; COM_t_COL7; COM_t_COL8; COM_t_COL9; COM_t_HED1)
	C_TEXT:C284(COM_t_HED2; COM_t_HED3; COM_t_HED4; COM_t_HED5; COM_t_HED6; COM_t_HED7; COM_t_HED8; COM_t_HED9; vText)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FM [COMPANIES].dStartup_Export"; Form event code:C388)
$_l_event:=Form event code:C388
If ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
	
	Load_Fields
	
	OpenHelp(Table:C252(->[COMPANIES:2]); "dStartup_Export")
	vNo1:=197
	vNo2:=198
	vNo3:=0
	r0:=1
	s1:=1
	vText:=""
	$_l_SIzeofArray:=Size of array:C274(<>DB_at_TableNames)
	ARRAY LONGINT:C221(MOD_al_ModuleAccessStatus; $_l_SIzeofArray)
	MOD_al_ModuleAccessStatus{3}:=1
	MOD_al_ModuleAccessStatus{4}:=1
	MOD_al_ModuleAccessStatus{5}:=1
	MOD_al_ModuleAccessStatus{6}:=1
	MOD_al_ModuleAccessStatus{8}:=1
	MOD_al_ModuleAccessStatus{10}:=1
	MOD_al_ModuleAccessStatus{13}:=1
	MOD_al_ModuleAccessStatus{14}:=1
	MOD_al_ModuleAccessStatus{15}:=1
	MOD_al_ModuleAccessStatus{31}:=1
	MOD_al_ModuleAccessStatus{32}:=1
	MOD_al_ModuleAccessStatus{33}:=1
	MOD_al_ModuleAccessStatus{35}:=1
	MOD_al_ModuleAccessStatus{36}:=1
	MOD_al_ModuleAccessStatus{54}:=1
	MOD_al_ModuleAccessStatus{59}:=1
	MOD_al_ModuleAccessStatus{60}:=1
	MOD_al_ModuleAccessStatus{61}:=1
	MOD_al_ModuleAccessStatus{65}:=1
	MOD_al_ModuleAccessStatus{71}:=1
	MOD_al_ModuleAccessStatus{73}:=1
	MOD_al_ModuleAccessStatus{74}:=1
	MOD_al_ModuleAccessStatus{75}:=1
	MOD_al_ModuleAccessStatus{76}:=1
	MOD_al_ModuleAccessStatus{84}:=1
	MOD_al_ModuleAccessStatus{87}:=1
	MOD_al_ModuleAccessStatus{90}:=1
	MOD_al_ModuleAccessStatus{91}:=1
	//MOD_al_ModuleAccessStatus
	//◊Files
	LB_SetupListbox(->COM_lb_Tables; "COM_t"; "COM_L"; 1; ->MOD_al_ModuleAccessStatus; -><>DB_at_TableNames)
	LB_SetColumnHeaders(->COM_lb_Tables; "COM_L"; 1; "Selected"; "Table Name")
	
	LB_SetColumnWidths(->COM_lb_Tables; "COM_t"; 1; 14; 147)
	LB_SetFormat(->COM_lb_Tables; 2; "|Code Use"; 1; 0; 3)
	
	LB_SetEnterable(->COM_lb_Tables; False:C215; 0)
	LB_SetScroll(->COM_lb_Tables; -3; -2)
	LB_StyleSettings(->COM_lb_Tables; "Black"; 9; "COM_t"; ->[ACCOUNTS:32])
	
End if 
ERR_MethodTrackerReturn("FM:dStartup_Export"; $_t_oldMethodName)
