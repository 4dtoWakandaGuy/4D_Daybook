If (False:C215)
	//object Name: [USER]Qualities_Pallette.Variable9
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
	//ARRAY LONGINT(AA_al_SubListItemsPOPIDs;0)
	//ARRAY LONGINT(QV_al_GroupsPOPUPID;0)
	//ARRAY LONGINT(QV_al_QualityGroupsIDs;0)
	//ARRAY LONGINT(QV_al_QualityPropertiesNUM;0)
	//ARRAY TEXT(AA_at_SubSublistPOPNMs;0)
	//ARRAY TEXT(QV_at_GroupsPopUPNM;0)
	//ARRAY TEXT(QV_at_QualityProperties;0)
	C_LONGINT:C283($_l_FormEvent; $_l_GroupRow; $_l_SubListColumn; $_l_SubListNUM)
	C_TEXT:C284($_t_oldMethodName; QV_t_QualitiesGroupName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].Qualities_Pallette.Variable9"; Form event code:C388)
$_l_FormEvent:=Form event code:C388
Case of 
	: ($_l_FormEvent=On Clicked:K2:4)
		If (QV_at_GroupsPopUPNM>0)
			
			QV_t_QualitiesGroupName:=QV_at_GroupsPopUPNM{QV_at_GroupsPopUPNM}
			$_l_GroupRow:=Find in array:C230(QV_al_QualityGroupsIDs; QV_al_GroupsPOPUPID{QV_at_GroupsPopUPNM})
			If ($_l_GroupRow>0)
				$_l_SubListNUM:=0
				$_l_SubListColumn:=Find in array:C230(QV_at_QualityProperties{$_l_GroupRow}; "SUBLIST")
				If ($_l_SubListColumn>0)
					$_l_SubListNUM:=QV_al_QualityPropertiesNUM{$_l_GroupRow}{$_l_SubListColumn}
				Else 
					QUERY:C277([LIST_ITEMS:95]; [LIST_ITEMS:95]X_ID:3=QV_al_QualityGroupsIDs{$_l_GroupRow})
					AA_GetListItemProperty("SUBLIST"; ->$_l_SubListNUM)
				End if 
			End if 
			ARRAY TEXT:C222(AA_at_SubSublistPOPNMs; 0)
			ARRAY LONGINT:C221(AA_al_SubListItemsPOPIDs; 0)
			If ($_l_SubListNUM>0)
				AA_LoadListbyID($_l_SubListNUM; ->AA_at_SubSublistPOPNMs; ->AA_al_SubListItemsPOPIDs; False:C215)
				SORT ARRAY:C229(AA_at_SubSublistPOPNMs; AA_al_SubListItemsPOPIDs)
				
			End if 
			
			QV_at_GroupsPopUPNM:=0
			
			OBJECT SET VISIBLE:C603(*; "oSubListQualityNames"; True:C214)
			
		End if 
End case 
ERR_MethodTrackerReturn("OBJ [USER].Qualities_Pallette.Variable9"; $_t_oldMethodName)
