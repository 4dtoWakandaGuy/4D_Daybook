If (False:C215)
	//Table Form Method Name: [USER]PWGroupsManager
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/03/2010 05:34
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(DB_abo_UserAdministrator;0)
	//ARRAY BOOLEAN(DB_abo_Usergetswrite;0)
	//ARRAY BOOLEAN(DB_abo_UserisDesigner;0)
	//ARRAY BOOLEAN(DB_abo_UserIsManager;0)
	//ARRAY BOOLEAN(DB_abo_UserisUser;0)
	//ARRAY BOOLEAN(PW_lb_GroupAccess;0)
	//ARRAY LONGINT(DB_al_UserGroups;0)
	//ARRAY LONGINT(DB_al_UserIDS;0)
	//ARRAY TEXT(DB_at_UserNames;0)
	C_BOOLEAN:C305(DB_bo_NoLoad)
	C_LONGINT:C283($_l_event; $_l_WIndowWIdth; PW_l_BUT1; PW_l_BUT2; PW_l_BUT3; PW_l_BUT4; PW_l_BUT5; PW_l_BUT6; PW_l_BUT7; PW_l_BUT9; PW_L8)
	C_TEXT:C284($_t_oldMethodName; oPWGroups_COL1; oPWGroups_COL2; oPWGroups_COL3; oPWGroups_COL4; oPWGroups_COL5; oPWGroups_COL6; oPWGroups_COL7; oPWGroups_COL8; oPWGroups_COL9; oPWGroups_HED1)
	C_TEXT:C284(oPWGroups_HED2; oPWGroups_HED3; oPWGroups_HED4; oPWGroups_HED5; oPWGroups_HED6; oPWGroups_HED7; oPWGroups_HED8; oPWGroups_HED9)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FM [USER].PWGroupsManager"; Form event code:C388)
$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		
		LB_SetupListbox(->PW_lb_GroupAccess; "oUserSettings"; "PW_L"; 1; ->DB_at_UserNames; ->DB_abo_UserAdministrator; ->DB_abo_UserIsManager; ->DB_abo_UserisUser; ->DB_abo_Usergetswrite; ->DB_abo_UserisDesigner; ->DB_al_UserIDS; ->DB_al_UserGroups)
		
		LB_SetColumnHeaders(->PW_lb_GroupAccess; "PW_L"; 1; "User"; "Administrator"; "Manager"; "User"; "4D Write"; "Designer"; "ID"; "Groups")
		If (Current user:C182="Designer")
			LB_SetColumnWidths(->PW_lb_GroupAccess; "oUserSettings"; 1; 140; 100; 100; 100; 100; 100; 0; 0)
			$_l_WIndowWIdth:=640
		Else 
			LB_SetColumnWidths(->PW_lb_GroupAccess; "oUserSettings"; 1; 140; 100; 100; 100; 100; 0; 0; 0)
			$_l_WIndowWIdth:=540
		End if 
		LB_SetScroll(->PW_lb_GroupAccess; -3; -2)
		
		
		LBi_InclSetupJustStyle(->PW_lb_GroupAccess)
		WS_AutoscreenSize(2; 140; $_l_WIndowWIdth)
		SET WINDOW TITLE:C213("Set user Login Rights")
		
		
End case 
ERR_MethodTrackerReturn("FM [USER].PWGroupsManager"; $_t_oldMethodName)
