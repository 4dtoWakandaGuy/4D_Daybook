If (False:C215)
	//object Method Name: Object Name:      [USER].SD2_TabSettingForm.oLBTabsActionsInclude
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 25/10/2012 11:08
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(SD_abo_ActionInclude;0)
	//ARRAY BOOLEAN(SD2_Lb_IncludedActions;0)
	//ARRAY LONGINT(SD_al_ActionInclude;0)
	//ARRAY TEXT(SD_at_ActionName;0)
	C_BOOLEAN:C305(SD_bo_TabitemsModified)
	C_LONGINT:C283($_l_event; $_l_index; $_l_SelectedColumn; $_l_SelectedRow)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].SD2_TabSettingForm.oLBTabsActionsInclude"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4) | ($_l_event=On Double Clicked:K2:5)
		LISTBOX GET CELL POSITION:C971(*; "oLBTabsActionsInclude"; $_l_SelectedColumn; $_l_SelectedRow)
		
		
		If ($_l_SelectedRow>0)
			//$_l_SelectedColumn:=LB_GetColumn (->SD2_Lb_IncludedActions;$_l_SelectedColumnName)
			Case of 
				: ($_l_SelectedColumn=2) | ($_l_SelectedColumn=3)
					Case of 
						: (SD_at_ActionName{$_l_SelectedRow}[[1]]="•")  // it is a group
							SD_al_ActionInclude{$_l_SelectedRow}:=Abs:C99((SD_al_ActionInclude{$_l_SelectedRow})-1)
							SD_abo_ActionInclude{$_l_SelectedRow}:=(SD_al_ActionInclude{$_l_SelectedRow}=1)
							SD_bo_TabitemsModified:=True:C214
							For ($_l_index; SD_al_ActionInclude+1; Size of array:C274(SD_al_ActionInclude))
								If ((Character code:C91(SD_at_ActionName{$_l_index}[[1]])=9))
									//it is a subitem
									SD_al_ActionInclude{$_l_index}:=0
									SD_abo_ActionInclude{$_l_index}:=(SD_al_ActionInclude{$_l_index}=1)
								Else 
									$_l_index:=Size of array:C274(SD_al_ActionInclude)
								End if 
								
							End for 
							
						: (Character code:C91(SD_at_ActionName{$_l_SelectedRow}[[1]])=9)  // it is a group sub item
							
							For ($_l_index; SD_al_ActionInclude-1; 1; -1)
								If (SD_at_ActionName{$_l_index}[[1]]="•")  // it is a group
									//this is the group item
									//if it is 0 then you can select the sub item
									If (SD_al_ActionInclude{$_l_index}=0)
										SD_al_ActionInclude{$_l_SelectedRow}:=Abs:C99((SD_al_ActionInclude{$_l_SelectedRow})-1)
										SD_abo_ActionInclude{$_l_SelectedRow}:=(SD_al_ActionInclude{$_l_SelectedRow}=1)
										SD_bo_TabitemsModified:=True:C214
									End if 
									
								End if 
								
							End for 
							
							
							
						Else 
							SD_al_ActionInclude{$_l_SelectedRow}:=Abs:C99((SD_al_ActionInclude{$_l_SelectedRow})-1)
							SD_abo_ActionInclude{$_l_SelectedRow}:=(SD_al_ActionInclude{$_l_SelectedRow}=1)
							SD_bo_TabitemsModified:=True:C214
							
							
					End case 
					
					
			End case 
			
		Else 
			LISTBOX SELECT ROW:C912(SD2_Lb_IncludedActions; 1; 0)
		End if 
End case 
ERR_MethodTrackerReturn("OBJ [USER].SD2_TabSettingForm.oLBTabsActionsInclude"; $_t_oldMethodName)
