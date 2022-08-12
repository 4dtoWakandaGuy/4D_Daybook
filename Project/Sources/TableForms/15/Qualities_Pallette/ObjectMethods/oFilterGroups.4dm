If (False:C215)
	//object Name: [USER]Qualities_Pallette.oFilterGroups
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
	//ARRAY LONGINT(QV_al_QualityGroupsUsed;0)
	//ARRAY LONGINT(QV_al_QualityYear;0)
	//ARRAY LONGINT(QV_al_QualityYears;0)
	//ARRAY REAL(QV_ar_QualityLevel;0)
	//ARRAY REAL(QV_ar_QualityLevels;0)
	//ARRAY TEXT(AA_at_SubSublistPOPNMs;0)
	//ARRAY TEXT(QV_at_GroupsPopUPNM;0)
	//ARRAY TEXT(QV_at_QualityGroupsUSED;0)
	C_LONGINT:C283(Badd; BDelete; Bedit; QV_HL_QualitiesList; QV_l_CurrentMode; QV_l_DisplayedOwnerID; QV_l_DisplayedOwnerTableID; QV_l_QualityYear; QV_l_SelectedOwnerFieldID; QV_l_SelectedQualityID)
	C_REAL:C285(QV_R_QualityLevel)
	C_TEXT:C284($_t_oldMethodName; QV_t_QualitiesGroupName; QV_t_QualityDescription; QV_t_QualityName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].Qualities_Pallette.oFilterGroups"; Form event code:C388)
Case of 
	: (QV_l_CurrentMode=1)
	: (QV_l_CurrentMode=2)
		//UNSAVED ITEM IS LOADED
		
		QV_SaveCurrentQuality(False:C215; QV_l_SelectedQualityID)
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
		OBJECT SET ENABLED:C1123(Bedit; False:C215)
		OBJECT SET ENABLED:C1123(BDelete; False:C215)
		QV_l_CurrentMode:=1
		If (QV_l_DisplayedOwnerID>0) | (QV_l_DisplayedOwnerID<0)
			QV_SaveQualities(QV_l_DisplayedOwnerID; QV_l_DisplayedOwnerTableID; QV_l_SelectedOwnerFieldID)
		End if 
	: (QV_l_CurrentMode=3)
		//an existing item is loaded(from the QV_HL_QualitiesList)
		QV_SaveCurrentQuality(False:C215; QV_l_SelectedQualityID)
		QV_l_SelectedQualityID:=-1
		QV_t_QualitiesGroupName:=""
		QV_t_QualityName:=""
		QV_t_QualityDescription:=""
		QV_R_QualityLevel:=0
		QV_l_QualityYear:=0
		ARRAY TEXT:C222(AA_at_SubSublistPOPNMs; 0)
		ARRAY LONGINT:C221(AA_al_SubListItemsPOPIDs; 0)
		
		OBJECT SET VISIBLE:C603(AA_at_SubSublistPOPNMs; False:C215)
		OBJECT SET ENTERABLE:C238(QV_t_QualitiesGroupName; False:C215)
		OBJECT SET ENTERABLE:C238(QV_t_QualityName; False:C215)
		OBJECT SET ENTERABLE:C238(QV_t_QualityDescription; False:C215)
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
		QV_l_CurrentMode:=1
		OBJECT SET ENABLED:C1123(Bedit; False:C215)
		OBJECT SET ENABLED:C1123(BDelete; False:C215)
		If (QV_l_DisplayedOwnerID>0) | (QV_l_DisplayedOwnerID<0)
			QV_SaveQualities(QV_l_DisplayedOwnerID; QV_l_DisplayedOwnerTableID; QV_l_SelectedOwnerFieldID)
		End if 
End case 
If (QV_at_QualityGroupsUSED>0)
	QV_ShowQualities(QV_l_DisplayedOwnerID; QV_l_DisplayedOwnerTableID; QV_l_SelectedOwnerFieldID; QV_al_QualityGroupsUsed{QV_at_QualityGroupsUSED})
	QV_at_QualityGroupsUSED:=0
Else 
	QV_ShowQualities(QV_l_DisplayedOwnerID; QV_l_DisplayedOwnerTableID; QV_l_SelectedOwnerFieldID)
	QV_at_QualityGroupsUSED:=0
	
End if 
ERR_MethodTrackerReturn("OBJ [USER].Qualities_Pallette.oFilterGroups"; $_t_oldMethodName)
