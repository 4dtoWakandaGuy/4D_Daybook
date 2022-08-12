If (False:C215)
	//object Name: [DIARY]Diary_PDTEditor.oSetPopup
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:11
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(PDT_al_EditMode;0)
	//ARRAY POINTER(SD2_aptr_LBOrderItemsSetup;0)
	//ARRAY TEXT(PDT_at_editMode;0)
	C_BOOLEAN:C305($_bo_Reset; $_bo_Switch)
	C_LONGINT:C283($_l_event; $_l_Index; $_l_SelectedValue)
	C_PICTURE:C286(PDT_Pi_EditMode)
	C_TEXT:C284($_t_MenuReference; $_t_oldMethodName; $_t_SelectedValue)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [DIARY].Diary_PDTEditor.oSetPopup"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4)
		$_bo_Switch:=True:C214
		$_t_MenuReference:=Create menu:C408
		For ($_l_Index; 1; Size of array:C274(PDT_at_editMode))
			APPEND MENU ITEM:C411($_t_MenuReference; PDT_at_editMode{$_l_Index})
			SET MENU ITEM PARAMETER:C1004($_t_MenuReference; -1; String:C10($_l_Index))
			
		End for 
		$_t_SelectedValue:=Dynamic pop up menu:C1006($_t_MenuReference)
		$_l_SelectedValue:=Num:C11($_t_SelectedValue)
		If ($_l_SelectedValue>0)
			PDT_at_editMode:=$_l_SelectedValue
			$_bo_Reset:=(PDT_al_EditMode{PDT_at_editMode}=3)
			//LBi_EditListLay (->COM_aptr_LBItemsSetup;->ALModeCompanies;->COM_Pi_Mode)
			LBi_EditListLay(->SD2_aptr_LBOrderItemsSetup; ->PDT_at_editMode; ->PDT_Pi_EditMode; ->PDT_al_EditMode; $_bo_Switch)
			If (OK=1) & ($_bo_Reset)
				LBi_EditListUpd(->SD2_aptr_LBOrderItemsSetup)
			End if 
			//GET PICTURE FROM LIBRARY(22542; PDT_Pi_EditMode)
			PDT_Pi_EditMode:=Get_Picture(22542)
		End if 
End case 
ERR_MethodTrackerReturn("OBJ [DIARY].Diary_PDTEditor.oSetPopup"; $_t_oldMethodName)
