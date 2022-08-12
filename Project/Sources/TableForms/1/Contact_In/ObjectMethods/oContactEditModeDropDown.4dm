
If (False:C215)
	//Object Name:      [CONTACTS].Contact_In.Variable22
	//------------------ Script Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  22/07/2020
	//Created BY:  Unknown
	
	//Date Modified: 
	//Modified By: Nigel Greenlee
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//C_UNKNOWN(vCT)
	//ARRAY LONGINT(CON_al_DocIncludes;0)
	//ARRAY LONGINT(CON_al_EditMode;0)
	//ARRAY LONGINT(CON_AL_FormIDs;0)
	//ARRAY LONGINT(CON_al_TabIds;0)
	//ARRAY LONGINT(CON_al_TabIncludes;0;0)
	//ARRAY LONGINT(CON_al_ViewTabsSettings;0)
	//ARRAY POINTER(CON_aptr_LBSetup;0)
	//ARRAY TEXT(CON_at_editMode;0)
	//ARRAY TEXT(COn_at_TabNames;0)
	//ARRAY TEXT(CON_at_ViewTabsLabels;0)
	C_BOOLEAN:C305($_bo_Reset; $_bo_Switch)
	C_LONGINT:C283(SD_l_CurrentTable)
	C_PICTURE:C286(CON_Pi_EditMode)
End if 
//Code Starts Here
$_bo_Switch:=True:C214
If (CON_al_EditMode{CON_at_editMode}=-1)
	Case of 
		: (CON_al_ViewTabsSettings{CON_at_ViewTabsLabels}=3)
			
			$_bo_Switch:=False:C215
			
		Else 
			$_bo_Switch:=True:C214
	End case 
End if 


If (vCT=1)
	SD_l_CurrentTable:=Table:C252(->[CONTACTS:1])
	$_bo_Reset:=(CON_al_EditMode{CON_at_editMode}=3)
	//LBi_EditListLay (->CON_aptr_LBSetup;->ALModeCompanies;->COM_Pi_Mode)
	LBi_EditListLay(->CON_aptr_LBSetup; ->CON_at_editMode; ->CON_Pi_EditMode; ->CON_al_EditMode; $_bo_Switch)
	If (OK=1) & ($_bo_Reset)
		LBi_EditListUpd(->CON_aptr_LBSetup)
		ARRAY TEXT:C222(COn_at_TabNames; 0)
		ARRAY LONGINT:C221(CON_al_TabIds; 0)
		ARRAY LONGINT:C221(CON_AL_FormIDs; 0)
		ARRAY LONGINT:C221(CON_al_TabIncludes; 0; 0)
		ARRAY LONGINT:C221(CON_al_DocIncludes; 0)
		SD2_LoadTabSetting(True:C214; Table:C252(->[CONTACTS:1]); ->CON_at_TabNames; ->CON_al_TabIncludes; ->CON_al_DocIncludes; ->CON_al_TabIds; ->CON_Al_FormIDs)
		SD2_LoadActionGroups
		
		
		
	End if 
End if 
