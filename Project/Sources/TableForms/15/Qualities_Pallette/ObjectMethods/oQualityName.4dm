If (False:C215)
	//object Name: [USER]Qualities_Pallette.Variable4
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
	//ARRAY LONGINT(AA_al_SubListItemID;0)
	//ARRAY LONGINT(QV_al_GroupsPOPUPID;0)
	//ARRAY LONGINT(QV_al_GroupsRelevantPOPUPID;0)
	//ARRAY LONGINT(QV_al_QualityGroupsIDs;0)
	//ARRAY LONGINT(QV_al_QualityPropertiesNUM;0)
	//ARRAY LONGINT(QV_al_ValidGroupID;0)
	//ARRAY LONGINT(QV_aValidGroupID;0)
	//ARRAY TEXT(AA_at_SubListItemNM;0)
	//ARRAY TEXT(AA_at_SubListItemProperty;0)
	//ARRAY TEXT(QV_at_GroupsPopUPNM;0)
	//ARRAY TEXT(QV_at_GroupsRelevantPOPUPNM;0)
	//ARRAY TEXT(QV_at_QualityProperties;0)
	C_BOOLEAN:C305($_bo_Stop)
	C_LONGINT:C283($_l_Count; $_l_CurrentRow; $_l_event; $_l_popupIndex; $_l_PropertyColumn; $_l_QualityRow; $_l_SubListID)
	C_TEXT:C284($_t_oldMethodName; QV_t_QualitiesGroupName; QV_t_QualityName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].Qualities_Pallette.Variable4"; Form event code:C388)
$_l_event:=Form event code:C388
ARRAY TEXT:C222(AA_at_SubListItemNM; 0)
ARRAY LONGINT:C221(AA_al_SubListItemID; 0)
ARRAY TEXT:C222(AA_at_SubListItemProperty; 0)
//ARRAY LONGINT(QV_al_GroupsPOPUPID;0)
//ARRAY STRING(55;QV_at_GroupsPopUPNM;0)
ARRAY LONGINT:C221(QV_al_GroupsRelevantPOPUPID; Size of array:C274(QV_al_GroupsPOPUPID))
ARRAY TEXT:C222(QV_at_GroupsRelevantPOPUPNM; Size of array:C274(QV_al_GroupsPOPUPID))
ARRAY LONGINT:C221(QV_al_ValidGroupID; 0)
$_bo_Stop:=False:C215
$_l_CurrentRow:=0
Case of 
	: ($_l_event=On Data Change:K2:15)
		If (QV_t_QualityName#"")
			If (QV_t_QualitiesGroupName#"")
				$_l_QualityRow:=Find in array:C230(QV_at_GroupsPopUPNM; QV_t_QualitiesGroupName)
				If ($_l_QualityRow>0)
					//the group exists
					$_l_SubListID:=0
					$_l_PropertyColumn:=Find in array:C230(QV_at_QualityProperties{$_l_QualityRow}; "SUBLIST")
					If ($_l_PropertyColumn>0)
						$_l_SubListID:=QV_al_QualityPropertiesNUM{$_l_QualityRow}{$_l_PropertyColumn}
					Else 
						QUERY:C277([LIST_ITEMS:95]; [LIST_ITEMS:95]X_ID:3=QV_al_QualityGroupsIDs{$_l_QualityRow})
						AA_GetListItemProperty("SUBLIST"; ->$_l_SubListID)
					End if 
					If ($_l_SubListID>0)
						ARRAY TEXT:C222(AA_at_SubListItemNM; 0)
						ARRAY LONGINT:C221(AA_al_SubListItemID; 0)
						ARRAY TEXT:C222(AA_at_SubListItemProperty; 0)
						AA_LoadListbyID($_l_SubListID; ->AA_at_SubListItemNM; ->AA_al_SubListItemID; False:C215)
						$_l_QualityRow:=Find in array:C230(AA_at_SubListItemNM; QV_t_QualityName)
						If ($_l_QualityRow>0)
							$_l_CurrentRow:=$_l_CurrentRow+1
							QV_al_GroupsRelevantPOPUPID{$_l_CurrentRow}:=QV_al_GroupsPOPUPID{$_l_QualityRow}
							QV_at_GroupsRelevantPOPUPNM{$_l_CurrentRow}:=QV_at_GroupsPopUPNM{$_l_QualityRow}
						Else 
							Gen_Confirm(QV_t_QualityName+" is not in  information group "+QV_t_QualitiesGroupName+".  Do you wish to add it")
							If (OK=1)
								//add to group
								$_bo_Stop:=True:C214
								QV_BaddScript
							Else 
								//stop
								QV_t_QualityName:=""
								$_bo_Stop:=True:C214
							End if 
							
						End if 
						
						
					Else 
						//this has no sublist
						Gen_Confirm(QV_t_QualityName+" is not in  information group "+QV_t_QualitiesGroupName+".  Do you wish to add it")
						If (OK=1)
							//add to group
							$_bo_Stop:=True:C214
							QV_BaddScript
						Else 
							//stop
							$_bo_Stop:=True:C214
							QV_t_QualityName:=""
							$_bo_Stop:=True:C214
						End if 
						
					End if 
					
					
					
				Else 
					//group not known
					
				End if 
				
			Else 
				For ($_l_popupIndex; 1; Size of array:C274(QV_al_GroupsPOPUPID))
					$_l_QualityRow:=Find in array:C230(QV_al_QualityGroupsIDs; QV_al_GroupsPOPUPID{$_l_popupIndex})
					If ($_l_QualityRow>0)
						$_l_SubListID:=0
						$_l_PropertyColumn:=Find in array:C230(QV_at_QualityProperties{$_l_QualityRow}; "SUBLIST")
						If ($_l_PropertyColumn>0)
							$_l_SubListID:=QV_al_QualityPropertiesNUM{$_l_QualityRow}{$_l_PropertyColumn}
						Else 
							QUERY:C277([LIST_ITEMS:95]; [LIST_ITEMS:95]X_ID:3=QV_al_QualityGroupsIDs{$_l_QualityRow})
							AA_GetListItemProperty("SUBLIST"; ->$_l_SubListID)
						End if 
						If ($_l_SubListID>0)
							ARRAY TEXT:C222(AA_at_SubListItemNM; 0)
							ARRAY LONGINT:C221(AA_al_SubListItemID; 0)
							ARRAY TEXT:C222(AA_at_SubListItemProperty; 0)
							AA_LoadListbyID($_l_SubListID; ->AA_at_SubListItemNM; ->AA_al_SubListItemID; False:C215; ->AA_at_SubListItemProperty)
							$_l_QualityRow:=Find in array:C230(AA_at_SubListItemNM; QV_t_QualityName)
							If ($_l_QualityRow>0)
								$_l_CurrentRow:=$_l_CurrentRow+1
								QV_al_GroupsRelevantPOPUPID{$_l_CurrentRow}:=QV_al_GroupsPOPUPID{$_l_popupIndex}
								QV_at_GroupsRelevantPOPUPNM{$_l_CurrentRow}:=QV_at_GroupsPopUPNM{$_l_popupIndex}
							End if 
							
							
						Else 
							//this has no sublist
						End if 
						
						
					End if 
					
					
				End for 
			End if 
			If (Not:C34($_bo_Stop))
				ARRAY LONGINT:C221(QV_al_GroupsRelevantPOPUPID; $_l_CurrentRow)
				ARRAY TEXT:C222(QV_at_GroupsRelevantPOPUPNM; $_l_CurrentRow)
				$_l_CurrentRow:=0
				Case of 
					: (Size of array:C274(QV_al_GroupsRelevantPOPUPID)=0)
						If (QV_t_QualitiesGroupName#"")
							Gen_Alert("This qualiaitive information does not exist in any group. Select a group"+" from the following dialogue"+", click 'add' to add the group "+QV_t_QualitiesGroupName+" , or click cancel to edit")
							
						Else 
							Gen_Alert("This qualitative information does not exist in any group. Select a group"+" from the following dialogue"+" or click cancel to edit.")
						End if 
						
					: (Size of array:C274(QV_al_GroupsRelevantPOPUPID)=1)
						QV_t_QualitiesGroupName:=QV_at_GroupsRelevantPOPUPNM{1}
						OBJECT SET VISIBLE:C603(QV_at_GroupsPopUPNM; False:C215)
						ARRAY LONGINT:C221(QV_al_GroupsRelevantPOPUPID; 0)
						ARRAY TEXT:C222(QV_at_GroupsRelevantPOPUPNM; 0)
					Else 
						OBJECT SET VISIBLE:C603(QV_at_GroupsPopUPNM; False:C215)
						ARRAY LONGINT:C221(QV_al_ValidGroupID; 0)
						ARRAY LONGINT:C221(QV_al_ValidGroupID; Size of array:C274(QV_at_GroupsRelevantPOPUPNM))
						//show a window to select the group(s)
						$_l_Count:=0
						QV_SelectGroupORitem(4; QV_t_QualityName; ->QV_at_GroupsRelevantPOPUPNM; ->QV_al_GroupsRelevantPOPUPID; ->QV_al_ValidGroupID)
						$_l_Count:=Sum:C1(QV_al_ValidGroupID)
						
						
						If ($_l_Count>0)
							QV_t_QualitiesGroupName:=QV_at_GroupsRelevantPOPUPNM{Find in array:C230(QV_al_ValidGroupID; 1)}
						Else 
							//nothing selected so strip the entry
							QV_t_QualityName:=""
						End if 
						
				End case 
			End if 
			
			
		End if 
End case 
ARRAY TEXT:C222(AA_at_SubListItemNM; 0)
ARRAY LONGINT:C221(AA_al_SubListItemID; 0)
ARRAY TEXT:C222(AA_at_SubListItemProperty; 0)
ERR_MethodTrackerReturn("OBJ [USER].Qualities_Pallette.Variable4"; $_t_oldMethodName)
