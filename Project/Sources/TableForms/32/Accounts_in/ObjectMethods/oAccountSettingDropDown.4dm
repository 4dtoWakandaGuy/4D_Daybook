
If (False:C215)
	//Object Name:      [ACCOUNTS].Accounts_in.Variable12
	//------------------ Script Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  02/08/2019
	//Created BY:  DefaultUser
	
	//Date Modified: 
	//Modified By: DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(ACC_al_Mode;0)
	//ARRAY POINTER(ACC_aptr_AccBalPointers;0)
	//ARRAY POINTER(ACC_aptr_SubAreaPointers;0)
	//ARRAY TEXT(ACC_at_AccountSetting;0)
	//ARRAY TEXT(ACC_at_ViewTabsFormNames;0)
	//ARRAY TEXT(ACC_at_ViewTabsFormSettings;0)
	//ARRAY TEXT(ACC_at_ViewTabsLabels;0)
	C_BOOLEAN:C305($_bo_NewLevel; $_bo_Reload; $_bo_Switch)
	C_LONGINT:C283($_l_ReuseLevel; $_l_SortFieldNumber; ACC_l_ViewTabsLabelsOLD; SD_l_CurrentTable)
	C_PICTURE:C286(ACC_Pi_EditMode)
	C_POINTER:C301($_ptr_ListBoxSetup)
	C_REAL:C285(ACC_r_Balances)
	C_TEXT:C284($_t_HandlerCharacter1; $_t_oldMethodName; $_t_Reference)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("OBJ [ACCOUNTS]Accounts_in.Variable12"; Form event code:C388)
Case of 
	: (Form event code:C388=On Clicked:K2:4)
		$_bo_Reload:=(ACC_al_Mode{ACC_at_AccountSetting}=3)
		$_bo_Switch:=False:C215
		$_ptr_ListBoxSetup:=ACC_aptr_SubAreaPointers{1}
		SD_l_CurrentTable:=Table:C252(->[ACCOUNTS:32])
		LBi_EditListLay($_ptr_ListBoxSetup; ->ACC_at_AccountSetting; ->ACC_Pi_EditMode; ->ACC_al_Mode; $_bo_Switch)
		
		If (OK=1) & ($_bo_Reload)
			QUERY:C277([ACCOUNT_BALANCES:34]; [ACCOUNT_BALANCES:34]Account_Code:2=[ACCOUNTS:32]Account_Code:2)
			If (Size of array:C274($_ptr_ListBoxSetup->)=0) | (ACC_l_ViewTabsLabelsOLD#ACC_at_ViewTabsLabels)
				ACC_l_ViewTabsLabelsOLD:=ACC_at_ViewTabsLabels
				//see also Contacts_InLPß
				//NG April 2004 Removed ◊Screen
				If ($_bo_NewLevel)
					LBi_ArrDefFill($_ptr_ListBoxSetup; ->ACC_r_Balances; ->[ACCOUNT_BALANCES:34]x_ID:7; ->[ACCOUNTS:32]Account_Code:2; $_t_Reference; ACC_at_ViewTabsFormNames{ACC_at_ViewTabsLabels}; Num:C11(ACC_at_ViewTabsFormSettings{ACC_at_ViewTabsLabels}); "Acc Balances"; "Account Balance"; ""; $_bo_NewLevel; $_l_ReuseLevel; "ACC_SelectedRelated")
				End if 
			Else 
				
				OK:=1
				$_l_SortFieldNumber:=0
				LBi_Prefs11(->ACC_aptr_AccBalPointers)
			End if 
			$_t_HandlerCharacter1:="P"
			LBi_LoadSetup(->ACC_aptr_AccBalPointers; $_t_HandlerCharacter1; 3)
			
		End if 
End case 
ERR_MethodTrackerReturn("OBJ [ACCOUNTS]Accounts_in.Variable12"; $_t_oldMethodName)
