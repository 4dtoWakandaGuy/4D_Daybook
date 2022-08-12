If (False:C215)
	//object Name: [USER]CON_SubDataArea.Variable22
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:46
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(CON_al_EditMode;0)
	//ARRAY LONGINT(CON_al_ViewTabsSettings;0)
	//ARRAY POINTER(CON_aptr_LBSetup;0)
	//ARRAY TEXT(CON_at_editMode;0)
	//ARRAY TEXT(CON_at_ViewTabsLabels;0)
	C_BOOLEAN:C305($_bo_Reset; $_bo_Switch)
	C_LONGINT:C283(SD_l_CurrentTable)
	C_PICTURE:C286(CON_Pi_EditMode)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].CON_SubDataArea.Variable22"; Form event code:C388)
$_bo_Switch:=True:C214
If (CON_al_EditMode{CON_at_editMode}=-1)
	Case of 
		: (CON_al_ViewTabsSettings{CON_at_ViewTabsLabels}=3)
			
			$_bo_Switch:=False:C215
			
		Else 
			$_bo_Switch:=True:C214
	End case 
End if 
SD_l_CurrentTable:=Table:C252(->[CONTACTS:1])
$_bo_Reset:=(CON_al_EditMode{CON_at_editMode}=3)
LBi_EditListLay(->CON_aptr_LBSetup; ->CON_at_editMode; ->CON_Pi_EditMode; ->CON_al_EditMode; $_bo_Switch)
If (OK=1) & ($_bo_Reset)
	CON_SubLPB  //reload the data
End if 
ERR_MethodTrackerReturn("OBJ [USER].CON_SubDataArea.Variable22"; $_t_oldMethodName)
