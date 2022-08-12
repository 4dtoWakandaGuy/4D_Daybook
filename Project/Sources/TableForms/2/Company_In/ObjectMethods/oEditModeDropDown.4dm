If (False:C215)
	//object Name: [COMPANIES]Company_In.Variable22
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
	//ARRAY LONGINT(CO_al_ViewTabsSettings;0)
	//ARRAY LONGINT(COM_al_DocIncludes;0)
	//ARRAY LONGINT(COM_al_EditMode;0)
	//ARRAY LONGINT(COM_AL_FormIDs;0)
	//ARRAY LONGINT(COM_al_TabIds;0)
	//ARRAY LONGINT(COM_al_TabIncludes;0;0)
	//ARRAY POINTER(COM_aptr_LBItemsSetup;0)
	//ARRAY TEXT(CO_at_ViewTabsLabels;0)
	//ARRAY TEXT(COM_at_editMode;0)
	//ARRAY TEXT(COM_at_TabNames;0)
	C_BOOLEAN:C305($_bo_Reset; $_bo_Switch)
	C_LONGINT:C283(SD_l_CurrentTable; vCT)
	C_PICTURE:C286(COM_Pi_EditMode)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [COMPANIES].Company_In.Variable22"; Form event code:C388)
$_bo_Switch:=True:C214
If (COM_al_EditMode{COM_at_editMode}=-1)
	Case of 
		: (CO_al_ViewTabsSettings{CO_at_ViewTabsLabels}=3)
			
			$_bo_Switch:=False:C215
			//COM_at_editMode:=1
		Else 
			$_bo_Switch:=True:C214
	End case 
End if 


If (vCT=0)
	SD_l_CurrentTable:=Table:C252(->[COMPANIES:2])
	$_bo_Reset:=(COM_al_EditMode{COM_at_editMode}=3)
	//LBi_EditListLay (->COM_aptr_LBItemsSetup;->ALModeCompanies;->COM_Pi_Mode)
	LBi_EditListLay(->COM_aptr_LBItemsSetup; ->COM_at_editMode; ->COM_Pi_EditMode; ->COM_al_EditMode; $_bo_Switch)
	If (OK=1) & ($_bo_Reset)
		DB_SaveRecord(->[CONTACTS_COMPANIES:145])
		DB_SaveRecord(->[CONTACTS:1])
		AA_CheckFileUnlocked(->[CONTACTS:1]x_ID:33)
		CompCont_Srch
		LBi_EditListUpd(->COM_aptr_LBItemsSetup)
		ARRAY TEXT:C222(COM_at_TabNames; 0)
		ARRAY LONGINT:C221(COM_al_TabIds; 0)
		ARRAY LONGINT:C221(COM_AL_FormIDs; 0)
		ARRAY LONGINT:C221(COM_al_TabIncludes; 0; 0)
		ARRAY LONGINT:C221(COM_al_DocIncludes; 0)
		SD2_LoadTabSetting(True:C214; Table:C252(->[COMPANIES:2]); ->COM_at_TabNames; ->COM_al_TabIncludes; ->COM_al_DocIncludes; ->COM_al_TabIds; ->COM_Al_FormIDs)
		SD2_LoadActionGroups
		
		
	End if 
End if 
ERR_MethodTrackerReturn("OBJ:Company_In,ALModeCompanies"; $_t_oldMethodName)
