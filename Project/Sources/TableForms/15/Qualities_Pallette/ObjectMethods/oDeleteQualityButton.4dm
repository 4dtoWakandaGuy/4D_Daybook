If (False:C215)
	//object Name: [USER]Qualities_Pallette.Button2
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
	//ARRAY LONGINT(QV_al_QualityDeletions;0)
	//ARRAY LONGINT(QV_al_QualityRecordID;0)
	//ARRAY LONGINT(QV_al_QualityYear;0)
	//ARRAY LONGINT(QV_al_QualityYears;0)
	//ARRAY REAL(QV_ar_QualityLevel;0)
	//ARRAY REAL(QV_ar_QualityLevels;0)
	//ARRAY TEXT(AA_at_SubSublistPOPNMs;0)
	//ARRAY TEXT(QV_at_GroupsPopUPNM;0)
	C_BOOLEAN:C305($_bo_Expanded; QV_bo_AddAllowed)
	C_LONGINT:C283($_l_ItemReference; $_l_ListItemRow; $_l_SelectedListItem; $_l_SublistID; Badd; BDelete; Bedit; QV_HL_QualitiesList; QV_l_CurrentMode; QV_l_QualityYear; QV_l_SelectedQualityID)
	C_REAL:C285(QV_R_QualityLevel)
	C_TEXT:C284($_t_ItemText; $_t_oldMethodName; QV_t_QualitiesGroupName; QV_t_QualityDescription; QV_t_QualityName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].Qualities_Pallette.Button2"; Form event code:C388)
If (QV_bo_AddAllowed)
	Case of 
		: (QV_l_CurrentMode=2)
			//clear
			QV_l_SelectedQualityID:=0
			QV_t_QualitiesGroupName:=""
			QV_t_QualityName:=""
			QV_t_QualityDescription:=""
			QV_R_QualityLevel:=0
			QV_l_QualityYear:=0
			OBJECT SET ENTERABLE:C238(QV_t_QualitiesGroupName; False:C215)
			OBJECT SET ENTERABLE:C238(QV_t_QualityName; False:C215)
			OBJECT SET ENTERABLE:C238(QV_t_QualityDescription; False:C215)
			ARRAY TEXT:C222(AA_at_SubSublistPOPNMs; 0)
			ARRAY LONGINT:C221(AA_al_SubListItemsPOPIDs; 0)
			OBJECT SET VISIBLE:C603(AA_at_SubSublistPOPNMs; False:C215)
			// SET ENTERABLE(QV_R_QualityLevel;False)
			OBJECT SET VISIBLE:C603(QV_ar_QualityLevels; False:C215)
			OBJECT SET VISIBLE:C603(*; "Picture25"; False:C215)
			OBJECT SET VISIBLE:C603(*; "Picture26"; False:C215)
			OBJECT SET VISIBLE:C603(*; "Picture27"; False:C215)
			OBJECT SET VISIBLE:C603(QV_at_GroupsPopUPNM; False:C215)
			OBJECT SET VISIBLE:C603(*; "Picture28"; False:C215)
			OBJECT SET VISIBLE:C603(QV_al_QualityYears; False:C215)  //NG Checked April 2020
			QV_al_QualityYear:=0  //NG Checked April 2020
			QV_ar_QualityLevel:=0
			GOTO OBJECT:C206(QV_HL_QualitiesList)
			OBJECT SET TITLE:C194(Badd; "Add")
			OBJECT SET TITLE:C194(BDelete; "Delete")
			//Object Set Enabled(Bedit;FALSE)
			//Object Set Enabled(BDelete;FALSE)
			OBJECT SET ENABLED:C1123(Bedit; False:C215)
			OBJECT SET ENABLED:C1123(BDelete; False:C215)
			QV_l_CurrentMode:=1
			
		: (QV_l_CurrentMode=3)
			$_l_SelectedListItem:=Selected list items:C379(QV_HL_QualitiesList)
			If ($_l_SelectedListItem>0)
				GET LIST ITEM:C378(QV_HL_QualitiesList; $_l_SelectedListItem; $_l_ItemReference; $_t_ItemText; $_l_SublistID; $_bo_Expanded)
				$_l_ListItemRow:=Find in array:C230(QV_al_QualityRecordID; $_l_ItemReference)
				If ($_l_ListItemRow>0)
					QV_al_QualityDeletions{$_l_ListItemRow}:=1
					DELETE FROM LIST:C624(QV_HL_QualitiesList; $_l_ItemReference)
				End if 
				QV_l_SelectedQualityID:=0
				QV_t_QualitiesGroupName:=""
				QV_t_QualityName:=""
				QV_t_QualityDescription:=""
				QV_R_QualityLevel:=0
				QV_l_QualityYear:=0
				OBJECT SET ENTERABLE:C238(QV_t_QualitiesGroupName; False:C215)
				OBJECT SET ENTERABLE:C238(QV_t_QualityName; False:C215)
				OBJECT SET ENTERABLE:C238(QV_t_QualityDescription; False:C215)
				ARRAY TEXT:C222(AA_at_SubSublistPOPNMs; 0)
				ARRAY LONGINT:C221(AA_al_SubListItemsPOPIDs; 0)
				OBJECT SET VISIBLE:C603(AA_at_SubSublistPOPNMs; False:C215)
				// SET ENTERABLE(QV_R_QualityLevel;False)
				OBJECT SET VISIBLE:C603(QV_ar_QualityLevels; False:C215)
				OBJECT SET VISIBLE:C603(*; "Picture25"; False:C215)
				OBJECT SET VISIBLE:C603(*; "Picture26"; False:C215)
				OBJECT SET VISIBLE:C603(*; "Picture27"; False:C215)
				OBJECT SET VISIBLE:C603(QV_at_GroupsPopUPNM; False:C215)
				OBJECT SET VISIBLE:C603(*; "Picture28"; False:C215)
				OBJECT SET VISIBLE:C603(QV_al_QualityYears; False:C215)  //NG Checked April 2020
				QV_al_QualityYear:=0  //NG Checked April 2020
				QV_ar_QualityLevel:=0
				////////_o_REDRAW LIST(QV_HL_QualitiesList)
				GOTO OBJECT:C206(QV_HL_QualitiesList)
				OBJECT SET TITLE:C194(Badd; "Add")
				OBJECT SET TITLE:C194(BDelete; "Delete")
				//Object Set Enabled(Bedit;FALSE)
				//Object Set Enabled(BDelete;FALSE)
				OBJECT SET ENABLED:C1123(Bedit; False:C215)
				OBJECT SET ENABLED:C1123(BDelete; False:C215)
				QV_l_CurrentMode:=1
				
			End if 
			
	End case 
End if 
ERR_MethodTrackerReturn("OBJ [USER].Qualities_Pallette.Button2"; $_t_oldMethodName)
