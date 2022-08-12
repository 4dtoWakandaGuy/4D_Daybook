If (False:C215)
	//Table Form Method Name: [USER]PREF_SetUpTabPrefs
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/10/2012 09:05
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(PRF_LB_Tabs;0)
	//ARRAY LONGINT(PREF_al_TabObjectsDefault;0)
	//ARRAY LONGINT(PREF_al_TabObjectsIncludes;0)
	//ARRAY LONGINT(SP_al_GroupIDs;0)
	//ARRAY LONGINT(SP_al_PersonnelIDs;0)
	//ARRAY TEXT(PREF_at_TabObjects;0)
	//ARRAY TEXT(SP_at_GroupCodes;0)
	//ARRAY TEXT(SP_at_GroupNames;0)
	//ARRAY TEXT(SP_at_PersonnelGroupCodes;0)
	//ARRAY TEXT(SP_at_PersonnelNames;0)
	C_BOOLEAN:C305(DB_bo_NoLoad)
	C_LONGINT:C283(<>PER_l_CurrentUserID; $_l_event; $_l_PersonRow; PREF_l_GroupID; PREF_l_PersonelID; Pref_l_Save; PRF_l_BUT1; PRF_l_But2; PRF_l_BUT3; PRF_l_BUT4; PRF_l_BUT5)
	C_LONGINT:C283(PRF_l_BUT6; PRF_l_BUT7; PRF_l_BUT8; PRF_l_BUT9; SP_l_UsersnGroups)
	C_TEXT:C284($_t_oldMethodName; PREF_S80_AdHocName; PRF_t_COL1; PRF_t_COL2; PRF_t_COL3; PRF_t_COL4; PRF_t_COL5; PRF_t_COL6; PRF_t_COL7; PRF_t_COL8; PRF_t_COL9)
	C_TEXT:C284(PRF_t_HED1; PRF_t_HED2; PRF_t_HED3; PRF_t_HED4; PRF_t_HED5; PRF_t_HED6; PRF_t_HED7; PRF_t_HED8; PRF_t_HED9)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FM [USER].PREF_SetUpTabPrefs"; Form event code:C388)
$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		OpenHelp(Table:C252(->[USER:15]); "PREF_SetUpTabPrefs")
		WS_AutoscreenSize(3; 300; 350)
		
		ARRAY TEXT:C222(SP_at_GroupCodes; 0)
		ARRAY TEXT:C222(SP_at_GroupNames; 0)
		ARRAY LONGINT:C221(SP_al_GroupIDs; 0)
		ARRAY TEXT:C222(SP_at_PersonnelNames; 0)
		ARRAY TEXT:C222(SP_at_PersonnelGroupCodes; 0)
		ARRAY LONGINT:C221(SP_al_PersonnelIDs; 0)
		SP_GetUsersAndGroups
		If (Size of array:C274(SP_al_GroupIDs)=0)
			OBJECT SET VISIBLE:C603(SP_at_PersonnelNames; True:C214)
			OBJECT SET VISIBLE:C603(SP_l_UsersnGroups; False:C215)
		Else 
			OBJECT SET VISIBLE:C603(SP_at_PersonnelNames; False:C215)
			OBJECT SET VISIBLE:C603(SP_l_UsersnGroups; True:C214)
		End if 
		$_l_PersonRow:=Find in array:C230(SP_al_PersonnelIDs; <>PER_l_CurrentUserID)
		If ($_l_PersonRow>0)
			PREF_S80_AdHocName:=SP_at_PersonnelNames{$_l_PersonRow}
			PREF_l_PersonelID:=SP_al_PersonnelIDs{$_l_PersonRow}
			PREF_l_GroupID:=0
		End if 
		
		
		
		Pref_l_Save:=0
		//PRF_LB_Tabs
		
		LB_SetupListbox(->PRF_LB_Tabs; "PRF_t"; "PRF_L"; 1; ->PREF_al_TabObjectsIncludes; ->PREF_al_TabObjectsDefault; ->PREF_at_TabObjects)
		
		
		LB_SetColumnHeaders(->PRF_LB_Tabs; "PRF_L"; 1; "Include"; "Default"; "Tab Items")
		
		
		LB_SetColumnWidths(->PRF_LB_Tabs; "PRF_t"; 1; 43; 18; 158)
		
		LB_SetScroll(->PRF_LB_Tabs; -3; -2)
		LB_StyleSettings(->PRF_LB_Tabs; "Black"; 9; "PRF_t"; ->[PREFERENCES:116])
		LB_SetEnterable(->PRF_LB_Tabs; False:C215; 0)
		
		INT_SetLongintCheckFormat(->PREF_al_TabObjectsIncludes)
		INT_SetLongintCheckFormat(->PREF_al_TabObjectsDefault)
		
		
		INT_SetDialog
		
End case 
ERR_MethodTrackerReturn("FM:PREF_SetUpTabPrefs"; $_t_oldMethodName)
