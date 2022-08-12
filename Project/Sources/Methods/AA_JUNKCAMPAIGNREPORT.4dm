//%attributes = {}

If (False:C215)
	//Project Method Name:      AA_JUNKCAMPAIGNREPORT
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  17/02/2020
	//Created BY:  Nigel Greenlee
	
	//Date Modified: 
	//Modified By: Nigel Greenlee
	//Modification notes
End if 

//Variable Declarations
If (True:C214)
	//_o_array string(0;QV_at_LevelsOptions;0)
	//_o_array string(0;QV_at_YearOptions;0)
	//ARRAY BOOLEAN(QV_abo_Exclude;0)
	//ARRAY BOOLEAN(QV_abo_include;0)
	//ARRAY DATE(AV_ad_DiaryActionDate;0;0)
	//ARRAY INTEGER(QV_ai_Exclude;0)
	//ARRAY INTEGER(QV_ai_include;0)
	//ARRAY LONGINT(AV_al_NumberofActions;0;0)
	//ARRAY LONGINT(QV_al_ActiveChasing;0)
	//ARRAY LONGINT(QV_al_ActiveWaiting;0)
	//ARRAY LONGINT(QV_al_DeadLead;0)
	//ARRAY LONGINT(QV_al_GroupIDs;0)
	//ARRAY LONGINT(QV_al_LeadsAlive;0)
	//ARRAY LONGINT(QV_al_Levels;0)
	//ARRAY LONGINT(QV_al_QualityGroupsIDs;0)
	//ARRAY LONGINT(QV_al_QualityIDs;0)
	//ARRAY LONGINT(QV_al_QualityLevelLevels;0)
	//ARRAY LONGINT(QV_al_QualityPropertiesNUM;0;0)
	//ARRAY LONGINT(QV_al_QualityQualityYears;0)
	//ARRAY LONGINT(QV_al_QualitySubGroupsIDs;0)
	//ARRAY LONGINT(QV_al_QualityYear;0)
	//ARRAY LONGINT(QV_al_SalesMade;0)
	//ARRAY LONGINT(QV_al_SourceGroupsIDs;0)
	//ARRAY LONGINT(QV_al_SourceNumberOfLeads;0)
	//ARRAY LONGINT(QV_al_TableRestrictionIDs;0)
	//ARRAY LONGINT(QV_at_QualityYears;0)
	//ARRAY TEXT(AV_at_DiaryAction;0;0)
	//ARRAY TEXT(AV_at_OUtcome;0;0)
	//ARRAY TEXT(QV_at_AllSourceNM;0)
	//ARRAY TEXT(QV_at_ColumnTypes;0)
	//ARRAY TEXT(QV_at_CompanyCodes;0)
	//ARRAY TEXT(QV_at_GroupNames;0)
	//ARRAY TEXT(QV_at_LevelOptions;0)
	//ARRAY TEXT(QV_at_QualityGroups;0)
	//ARRAY TEXT(QV_at_QualityGroupsNM;0)
	//ARRAY TEXT(QV_at_QualityNames;0)
	//ARRAY TEXT(QV_at_QualityProperties;0;0)
	//ARRAY TEXT(QV_at_QualityPropertiesNAM;0;0)
	//ARRAY TEXT(QV_at_QualitySubGroupsNM;0)
	//ARRAY TEXT(QV_at_QueryType;0)
	//ARRAY TEXT(QV_at_ReportColumns;0)
	//ARRAY TEXT(QV_at_SourceNames;0)
	//ARRAY TEXT(QV_at_TableRestrictionNMs;0)
	C_BOOLEAN:C305(QV_bo_ReturnQuals)
	C_LONGINT:C283(QV_l_ActionPosition; QV_l_CampaignRow; QV_l_Column; QV_l_COntacts; QV_l_CurrentTable; QV_l_Export; QV_l_GetSources; QV_l_ListID; QV_l_Ref; QV_l_RESListID; QV_l_SendActions)
	C_LONGINT:C283(QV_l_SendActions2; QV_l_SourceRow; QV_l_SubListNUM; QV_l_TableRow; QV_l_TotalForCampaign; QV_l_YetiRow)
	C_TEXT:C284(QV_t_Action; QV_T_QualitiesAsText)
	C_TIME:C306(QV_ti_Doc)
End if 
//Code Starts Here
QV_l_CurrentTable:=Table:C252(->[COMPANIES:2])
QV_l_RESListID:=AA_GetListbyName("Table Restriction"; True:C214)
ARRAY LONGINT:C221(QV_al_TableRestrictionIDs; 0)
ARRAY TEXT:C222(QV_at_TableRestrictionNMs; 0)
AA_LoadListbyID(QV_l_RESListID; ->QV_at_TableRestrictionNMs; ->QV_al_TableRestrictionIDs)

If (QV_l_CurrentTable>0)
	If (Is table number valid:C999(QV_l_CurrentTable))
		QV_l_TableRow:=Find in array:C230(QV_at_TableRestrictionNMs; Table name:C256(Table:C252(QV_l_CurrentTable)))
		If (QV_l_TableRow<0)
			QV_l_ListID:=AA_ListAddItembyID(QV_l_RESListID; Table name:C256(Table:C252(QV_l_CurrentTable)))
			AA_LoadListbyID(QV_l_RESListID; ->QV_at_TableRestrictionNMs; ->QV_al_TableRestrictionIDs)
		Else 
			QV_l_ListID:=QV_al_TableRestrictionIDs{QV_l_TableRow}
		End if 
	End if 
End if 
ARRAY TEXT:C222(QV_at_QualityGroupsNM; 0)
ARRAY LONGINT:C221(QV_al_QualityGroupsIDs; 0)
ARRAY TEXT:C222(QV_at_QualityGroups; 0)
ARRAY TEXT:C222(QV_at_QualityProperties; 0; 0)
ARRAY LONGINT:C221(QV_al_QualityPropertiesNUM; 0; 0)
ARRAY TEXT:C222(QV_at_QualityPropertiesNAM; 0; 0)
QV_l_ListID:=AA_LoadList(->[INFORMATION:55]QualityID:14; ->QV_at_QualityGroupsNM; ->QV_al_QualityGroupsIDs; False:C215; ->QV_at_QualityGroups; ->QV_at_QualityProperties; ->QV_al_QualityPropertiesNUM; ->QV_at_QualityPropertiesNAM)

QV_l_CampaignRow:=Find in array:C230(QV_at_QualityGroupsNM; "Campaign")
QUERY:C277([LIST_ITEMS:95]; [LIST_ITEMS:95]X_ID:3=QV_al_QualityGroupsIDs{QV_l_CampaignRow})
AA_GetListItemProperty("SUBLIST"; ->QV_l_SubListNUM)
AA_LoadListbyID(QV_l_SubListNUM; ->QV_at_QualitySubGroupsNM; ->QV_al_QualitySubGroupsIDs; False:C215)
QV_l_YetiRow:=Find in array:C230(QV_at_QualitySubGroupsNM; "Yeti Campaign")
If (QV_l_YetiRow>0)
	ARRAY TEXT:C222(QV_at_GroupNames; 0)
	ARRAY TEXT:C222(QV_at_QualityNames; 0)
	ARRAY LONGINT:C221(QV_al_GroupIDs; 0)
	ARRAY LONGINT:C221(QV_al_QualityIDs; 0)
	ARRAY LONGINT:C221(QV_al_QualityLevelLevels; 0)
	ARRAY LONGINT:C221(QV_al_QualityYear; 0)
	ARRAY INTEGER:C220(QV_ai_include; 0)
	ARRAY INTEGER:C220(QV_ai_Exclude; 0)
	ARRAY BOOLEAN:C223(QV_abo_include; 0)
	ARRAY BOOLEAN:C223(QV_abo_Exclude; 0)
	ARRAY TEXT:C222(QV_at_LevelOptions; 0)
	ARRAY TEXT:C222(QV_at_YearOptions; 0)
	//ARRAY INTEGER(QV_ai_Exclude;0)
	ARRAY TEXT:C222(QV_at_LevelsOptions; 6)
	ARRAY LONGINT:C221(QV_al_Levels; 6)
	
	TRACE:C157
	ARRAY TEXT:C222(QV_at_QueryType; 2)
	QV_at_QueryType{1}:="With any...."
	QV_at_QueryType{2}:="With all..."
	QV_at_QueryType:=1
	QV_bo_ReturnQuals:=True:C214
	
	QV_T_QualitiesAsText:="[CAMPAIGN]Yeti Campaign"
	QV_ParseText(QV_T_QualitiesAsText)
	QV_DoSearch(QV_l_CurrentTable)
	//TRACE
	CREATE SET:C116([COMPANIES:2]; "YetiLeads")
	
	///QV_T_QualitiesAsText:="[CAMPAIGN]Yeti Campaign"
	//QV_ParseText (QV_T_QualitiesAsText)
	//QV_DoSearch (QV_l_CurrentTable)
	//[Lead Source]
	QV_l_TotalForCampaign:=Records in selection:C76([COMPANIES:2])
	QV_l_SourceRow:=Find in array:C230(QV_at_QualityGroupsNM; "Lead Source")
	QUERY:C277([LIST_ITEMS:95]; [LIST_ITEMS:95]X_ID:3=QV_al_QualityGroupsIDs{QV_l_CampaignRow})
	AA_GetListItemProperty("SUBLIST"; ->QV_l_SubListNUM)
	ARRAY TEXT:C222(QV_at_AllSourceNM; 0)
	ARRAY LONGINT:C221(QV_al_SourceGroupsIDs; 0)
	QUERY:C277([X_LISTS:111]; [X_LISTS:111]x_ListName:2="Lead Source")
	QV_l_SubListNUM:=[X_LISTS:111]x_ID:1
	AA_LoadListbyID(QV_l_SubListNUM; ->QV_at_AllSourceNM; ->QV_al_SourceGroupsIDs; False:C215)
	ARRAY TEXT:C222(QV_at_SourceNames; 0)
	ARRAY LONGINT:C221(QV_al_SourceNumberOfLeads; 0)
	ARRAY LONGINT:C221(QV_al_LeadsAlive; 0)
	ARRAY LONGINT:C221(QV_al_SalesMade; 0)
	ARRAY LONGINT:C221(QV_al_DeadLead; 0)
	ARRAY LONGINT:C221(QV_al_ActiveWaiting; 0)
	ARRAY LONGINT:C221(QV_al_ActiveChasing; 0)
	ARRAY TEXT:C222(AV_at_DiaryAction; 0; 0)
	ARRAY DATE:C224(AV_ad_DiaryActionDate; 0; 0)
	ARRAY TEXT:C222(AV_at_OUtcome; 0; 0)
	ARRAY LONGINT:C221(AV_al_NumberofActions; 0; 0)
	For (QV_l_GetSources; 1; Size of array:C274(QV_at_AllSourceNM))
		If (QV_l_GetSources=4)
			
		End if 
		
		REDUCE SELECTION:C351([COMPANIES:2]; 0)
		CREATE EMPTY SET:C140([COMPANIES:2]; "QVTEMPADD")
		QV_bo_ReturnQuals:=True:C214
		QV_T_QualitiesAsText:="[Lead Source]"+QV_at_AllSourceNM{QV_l_GetSources}
		QV_ParseText(QV_T_QualitiesAsText)
		QV_DoSearch(QV_l_CurrentTable)
		
		CREATE SET:C116([COMPANIES:2]; "SourceLeads")
		INTERSECTION:C121("YetiLeads"; "SourceLeads"; "SourceLeads")
		USE SET:C118("SourceLeads")
		CREATE SET:C116([COMPANIES:2]; "ByStatus")
		
		If (Records in selection:C76([COMPANIES:2])>0)
			ARRAY TEXT:C222(QV_at_GroupNames; 0)
			ARRAY TEXT:C222(QV_at_QualityNames; 0)
			ARRAY LONGINT:C221(QV_al_GroupIDs; 0)
			ARRAY LONGINT:C221(QV_al_QualityIDs; 0)
			ARRAY LONGINT:C221(QV_al_QualityLevelLevels; 0)
			ARRAY LONGINT:C221(QV_al_QualityYear; 0)
			ARRAY INTEGER:C220(QV_ai_include; 0)
			ARRAY INTEGER:C220(QV_ai_Exclude; 0)
			ARRAY BOOLEAN:C223(QV_abo_include; 0)
			ARRAY BOOLEAN:C223(QV_abo_Exclude; 0)
			ARRAY TEXT:C222(QV_at_LevelOptions; 0)
			ARRAY TEXT:C222(QV_at_YearOptions; 0)
			//ARRAY INTEGER(QV_ai_Exclude;0)
			ARRAY TEXT:C222(QV_at_LevelsOptions; 6)
			ARRAY LONGINT:C221(QV_al_Levels; 6)
			APPEND TO ARRAY:C911(QV_at_SourceNames; QV_at_AllSourceNM{QV_l_GetSources})
			APPEND TO ARRAY:C911(QV_al_SourceNumberOfLeads; Records in selection:C76([COMPANIES:2]))
			//SO these are the Companies of this source for the yeti campaign
			SELECTION TO ARRAY:C260([COMPANIES:2]Company_Code:1; QV_at_CompanyCodes)
			QUERY WITH ARRAY:C644([DIARY:12]Company_Code:1; QV_at_CompanyCodes)
			INSERT IN ARRAY:C227(AV_at_DiaryAction; Size of array:C274(AV_at_DiaryAction)+1; 1)
			
			INSERT IN ARRAY:C227(AV_ad_DiaryActionDate; Size of array:C274(AV_at_DiaryAction)+1; 1)
			INSERT IN ARRAY:C227(AV_at_OUtcome; Size of array:C274(AV_at_DiaryAction)+1; 1)
			INSERT IN ARRAY:C227(AV_al_NumberofActions; Size of array:C274(AV_at_DiaryAction)+1; 1)
			ORDER BY:C49([DIARY:12]; [DIARY:12]x_ID:50; <)
			For (QV_l_COntacts; 1; Records in selection:C76([DIARY:12]))
				QUERY:C277([ACTIONS:13]; [ACTIONS:13]Action_Code:1=[DIARY:12]Action_Code:9)
				QUERY:C277([RESULTS:14]; [RESULTS:14]Result_Code:1=[DIARY:12]Result_Code:11)
				QV_l_Ref:=Find in array:C230(AV_at_DiaryAction{Size of array:C274(AV_at_DiaryAction)}; [ACTIONS:13]Action_Name:2)
				If (QV_l_Ref<0)
					APPEND TO ARRAY:C911(AV_at_DiaryAction{Size of array:C274(AV_at_DiaryAction)}; [ACTIONS:13]Action_Name:2)
					APPEND TO ARRAY:C911(AV_ad_DiaryActionDate{Size of array:C274(AV_ad_DiaryActionDate)}; [DIARY:12]Date_Done_From:5)
					APPEND TO ARRAY:C911(AV_at_OUtcome{Size of array:C274(AV_at_OUtcome)}; [RESULTS:14]Result_Name:2)
					APPEND TO ARRAY:C911(AV_al_NumberofActions{Size of array:C274(AV_at_OUtcome)}; 1)
					
				Else 
					AV_al_NumberofActions{Size of array:C274(AV_at_OUtcome)}{QV_l_Ref}:=AV_al_NumberofActions{Size of array:C274(AV_at_OUtcome)}{QV_l_Ref}+1
				End if 
				NEXT RECORD:C51([DIARY:12])
			End for 
			
			REDUCE SELECTION:C351([COMPANIES:2]; 0)
			//TRACE
			CREATE EMPTY SET:C140([COMPANIES:2]; "QVTEMPADD")
			QV_bo_ReturnQuals:=True:C214
			QV_T_QualitiesAsText:="[Lead Funnel status]"+"Yeti Campaign Sale Made"
			QV_ParseText(QV_T_QualitiesAsText)
			QV_DoSearch(QV_l_CurrentTable)
			CREATE SET:C116([COMPANIES:2]; "SalesMade")
			INTERSECTION:C121("ByStatus"; "SalesMade"; "SalesMade")
			USE SET:C118("SalesMade")
			DIFFERENCE:C122("ByStatus"; "SalesMade"; "ByStatus")
			
			APPEND TO ARRAY:C911(QV_al_SalesMade; Records in selection:C76([COMPANIES:2]))
			
			QV_T_QualitiesAsText:="[Lead Funnel status]"+"Yeti Campaign Dead Lead"
			REDUCE SELECTION:C351([COMPANIES:2]; 0)
			ARRAY TEXT:C222(QV_at_GroupNames; 0)
			ARRAY TEXT:C222(QV_at_QualityNames; 0)
			ARRAY LONGINT:C221(QV_al_GroupIDs; 0)
			ARRAY LONGINT:C221(QV_al_QualityIDs; 0)
			ARRAY LONGINT:C221(QV_al_QualityLevelLevels; 0)
			ARRAY LONGINT:C221(QV_al_QualityYear; 0)
			ARRAY INTEGER:C220(QV_ai_include; 0)
			ARRAY INTEGER:C220(QV_ai_Exclude; 0)
			ARRAY BOOLEAN:C223(QV_abo_include; 0)
			ARRAY BOOLEAN:C223(QV_abo_Exclude; 0)
			ARRAY TEXT:C222(QV_at_LevelOptions; 0)
			ARRAY TEXT:C222(QV_at_YearOptions; 0)
			//ARRAY INTEGER(QV_ai_Exclude;0)
			ARRAY TEXT:C222(QV_at_LevelsOptions; 6)
			ARRAY LONGINT:C221(QV_al_Levels; 6)
			CREATE EMPTY SET:C140([COMPANIES:2]; "QVTEMPADD")
			QV_bo_ReturnQuals:=True:C214
			QV_ParseText(QV_T_QualitiesAsText)
			QV_DoSearch(QV_l_CurrentTable)
			CREATE SET:C116([COMPANIES:2]; "SalesMade")
			INTERSECTION:C121("ByStatus"; "SalesMade"; "SalesMade")
			USE SET:C118("SalesMade")
			APPEND TO ARRAY:C911(QV_al_DeadLead; Records in selection:C76([COMPANIES:2]))
			DIFFERENCE:C122("ByStatus"; "SalesMade"; "ByStatus")
			QV_T_QualitiesAsText:="[Lead Funnel status]"+"Yeti Campaign Active Waiting"
			REDUCE SELECTION:C351([COMPANIES:2]; 0)
			ARRAY TEXT:C222(QV_at_GroupNames; 0)
			ARRAY TEXT:C222(QV_at_QualityNames; 0)
			ARRAY LONGINT:C221(QV_al_GroupIDs; 0)
			ARRAY LONGINT:C221(QV_al_QualityIDs; 0)
			ARRAY LONGINT:C221(QV_al_QualityLevelLevels; 0)
			ARRAY LONGINT:C221(QV_al_QualityYear; 0)
			ARRAY LONGINT:C221(QV_al_QualityQualityYears; 0)
			ARRAY INTEGER:C220(QV_ai_include; 0)
			ARRAY INTEGER:C220(QV_ai_Exclude; 0)
			ARRAY BOOLEAN:C223(QV_abo_include; 0)
			ARRAY BOOLEAN:C223(QV_abo_Exclude; 0)
			ARRAY TEXT:C222(QV_at_LevelOptions; 0)
			ARRAY TEXT:C222(QV_at_YearOptions; 0)
			//ARRAY INTEGER(QV_ai_Exclude;0)
			ARRAY TEXT:C222(QV_at_LevelsOptions; 6)
			ARRAY LONGINT:C221(QV_al_Levels; 6)
			CREATE EMPTY SET:C140([COMPANIES:2]; "QVTEMPADD")
			QV_bo_ReturnQuals:=True:C214
			QV_ParseText(QV_T_QualitiesAsText)
			QV_DoSearch(QV_l_CurrentTable)
			CREATE SET:C116([COMPANIES:2]; "SalesMade")
			INTERSECTION:C121("ByStatus"; "SalesMade"; "SalesMade")
			USE SET:C118("SalesMade")
			APPEND TO ARRAY:C911(QV_al_ActiveWaiting; Records in selection:C76([COMPANIES:2]))
			CREATE SET:C116([COMPANIES:2]; "SalesMade")
			DIFFERENCE:C122("ByStatus"; "SalesMade"; "ByStatus")
			
			QV_T_QualitiesAsText:="[Lead Funnel status]"+"Yeti Campaign Active chasing"
			REDUCE SELECTION:C351([COMPANIES:2]; 0)
			ARRAY TEXT:C222(QV_at_GroupNames; 0)
			ARRAY TEXT:C222(QV_at_QualityNames; 0)
			ARRAY LONGINT:C221(QV_al_GroupIDs; 0)
			ARRAY LONGINT:C221(QV_al_QualityIDs; 0)
			ARRAY LONGINT:C221(QV_al_QualityLevelLevels; 0)
			ARRAY LONGINT:C221(QV_al_QualityQualityYears; 0)
			ARRAY LONGINT:C221(QV_al_QualityYear; 0)
			ARRAY INTEGER:C220(QV_ai_include; 0)
			ARRAY INTEGER:C220(QV_ai_Exclude; 0)
			ARRAY BOOLEAN:C223(QV_abo_include; 0)
			ARRAY BOOLEAN:C223(QV_abo_Exclude; 0)
			ARRAY TEXT:C222(QV_at_LevelOptions; 0)
			ARRAY TEXT:C222(QV_at_YearOptions; 0)
			//ARRAY INTEGER(QV_ai_Exclude;0)
			ARRAY TEXT:C222(QV_at_LevelsOptions; 6)
			ARRAY LONGINT:C221(QV_al_Levels; 6)
			CREATE EMPTY SET:C140([COMPANIES:2]; "QVTEMPADD")
			QV_bo_ReturnQuals:=True:C214
			QV_ParseText(QV_T_QualitiesAsText)
			QV_DoSearch(QV_l_CurrentTable)
			CREATE SET:C116([COMPANIES:2]; "SalesMade")
			INTERSECTION:C121("ByStatus"; "SalesMade"; "SalesMade")
			USE SET:C118("SalesMade")
			APPEND TO ARRAY:C911(QV_al_ActiveChasing; Records in selection:C76([COMPANIES:2]))
			CREATE SET:C116([COMPANIES:2]; "SalesMade")
			DIFFERENCE:C122("ByStatus"; "SalesMade"; "ByStatus")
		End if 
		
	End for 
	QV_ti_Doc:=Create document:C266(""; "TEXT")
	SEND PACKET:C103(QV_ti_Doc; Char:C90(13))
	ARRAY TEXT:C222(QV_at_ReportColumns; 0)
	APPEND TO ARRAY:C911(QV_at_ReportColumns; "No Contact")
	
	//APPEND TO ARRAY(QV_at_ColumnTypes;"Send"
	APPEND TO ARRAY:C911(QV_at_ReportColumns; "Quoted")
	APPEND TO ARRAY:C911(QV_at_ReportColumns; "Demo Request")
	APPEND TO ARRAY:C911(QV_at_ReportColumns; "Demo")
	APPEND TO ARRAY:C911(QV_at_ReportColumns; "Finance")
	ARRAY TEXT:C222(QV_at_ColumnTypes; Size of array:C274(QV_at_ReportColumns); 0)
	APPEND TO ARRAY:C911(QV_at_ColumnTypes{1}; "Send Email")
	APPEND TO ARRAY:C911(QV_at_ColumnTypes{2}; "Quotation")
	APPEND TO ARRAY:C911(QV_at_ColumnTypes{4}; "Demo")
	
	SEND PACKET:C103(QV_ti_Doc; "Lead Source"+Char:C90(9)+"Number of Leads"+Char:C90(9))
	For (QV_l_Export; 1; Size of array:C274(QV_at_ReportColumns))
		SEND PACKET:C103(QV_ti_Doc; QV_at_ReportColumns{QV_l_Export}+Char:C90(9))
	End for 
	SEND PACKET:C103(QV_ti_Doc; "Sales made"+Char:C90(9)+"Active Chasing"+Char:C90(9)+"Active Waiting"+Char:C90(9)+"Dead"+Char:C90(13))
	
	For (QV_l_Export; 1; Size of array:C274(QV_at_SourceNames))
		SEND PACKET:C103(QV_ti_Doc; QV_at_SourceNames{QV_l_Export}+Char:C90(9))
		SEND PACKET:C103(QV_ti_Doc; String:C10(QV_al_SourceNumberOfLeads{QV_l_Export})+Char:C90(9))
		
		For (QV_l_SendActions; 1; Size of array:C274(QV_at_ReportColumns))
			If (Size of array:C274(QV_at_ColumnTypes{QV_l_SendActions})>0)
				For (QV_l_SendActions2; 1; Size of array:C274(QV_at_ColumnTypes{QV_l_SendActions}))
					QV_t_Action:=QV_at_ColumnTypes{QV_l_SendActions}{QV_l_SendActions2}
					QV_l_ActionPosition:=Find in array:C230(AV_at_DiaryAction{QV_l_Export}; QV_t_Action)
					If (QV_l_ActionPosition>0)
						///For (QV_l_SendActions;1;Size of array(AV_at_DiaryAction{QV_l_Export}))
						
						//SEND PACKET(QV_ti_Doc;AV_at_DiaryAction{QV_l_Export}{QV_l_ActionPosition}+Char(9))
						SEND PACKET:C103(QV_ti_Doc; String:C10(AV_al_NumberofActions{QV_l_Export}{QV_l_ActionPosition})+Char:C90(9))
						//SEND PACKET(QV_ti_Doc;AV_at_OUtcome{QV_l_Export}{QV_l_ActionPosition}+Char(9))
					Else 
						SEND PACKET:C103(QV_ti_Doc; Char:C90(9))
					End if 
				End for 
			Else 
				SEND PACKET:C103(QV_ti_Doc; Char:C90(9))
			End if 
		End for 
		SEND PACKET:C103(QV_ti_Doc; String:C10(QV_al_SalesMade{QV_l_Export})+Char:C90(9))
		SEND PACKET:C103(QV_ti_Doc; String:C10(QV_al_ActiveChasing{QV_l_Export})+Char:C90(9))
		SEND PACKET:C103(QV_ti_Doc; String:C10(QV_al_ActiveWaiting{QV_l_Export})+Char:C90(9))
		SEND PACKET:C103(QV_ti_Doc; String:C10(QV_al_DeadLead{QV_l_Export})+Char:C90(9))
		SEND PACKET:C103(QV_ti_Doc; Char:C90(13))
	End for 
	CLOSE DOCUMENT:C267(QV_ti_Doc)
	
	
End if 
