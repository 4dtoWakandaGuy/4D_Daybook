If (False:C215)
	//Table Form Method Name: [USER]Qualities_Pallette
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 16/01/2012 19:38
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY DATE(QV_ad_QualityDate;0)
	//ARRAY LONGINT(AA_al_SubListItemsIDs;0)
	//ARRAY LONGINT(AA_al_SubListItemsPOPIDs;0)
	//ARRAY LONGINT(QV_al_GroupsPOPUPID;0)
	//ARRAY LONGINT(QV_al_QualityDeletions;0)
	//ARRAY LONGINT(QV_al_QualityGroupsIDs;0)
	//ARRAY LONGINT(QV_al_QualityGroupsUsed;0)
	//ARRAY LONGINT(QV_al_QualityID;0)
	//ARRAY LONGINT(QV_al_QualityParentID;0)
	//ARRAY LONGINT(QV_al_QualityPropertiesNUM;0;0)
	//ARRAY LONGINT(QV_al_QualityRecordID;0)
	//ARRAY LONGINT(QV_al_QualityYear;0)
	//ARRAY LONGINT(QV_al_QualityYears;0)
	//ARRAY LONGINT(QV_al_RelatedRecordNum;0)
	//ARRAY LONGINT(QV_al_RelevantTableIDs;0)
	//ARRAY LONGINT(QV_al_RelevanttableRecordIDs;0)
	//ARRAY LONGINT(QV_al_TableRestrictionIDs;0)
	//ARRAY LONGINT(QV_al_ValidGroupID;0)
	//ARRAY LONGINT(QV_aValidGroupID;0)
	//ARRAY REAL(QV_ar_QualityLevel;0)
	//ARRAY REAL(QV_ar_QualityLevels;0)
	//ARRAY TEXT(AA_at_SubSublistItemNMs;0)
	//ARRAY TEXT(AA_at_SubSublistPOPNMs;0)
	//ARRAY TEXT(QV_at_GroupsPopUPNM;0)
	//ARRAY TEXT(QV_at_QualityDetail;0)
	//ARRAY TEXT(QV_at_QualityGroups;0)
	//ARRAY TEXT(QV_at_QualityGroupsNM;0)
	//ARRAY TEXT(QV_at_QualityGroupsUSED;0)
	//ARRAY TEXT(QV_at_QualityProperties;0;0)
	//ARRAY TEXT(QV_at_QualityPropertiesNAM;0;0)
	//ARRAY TEXT(QV_at_RelevantTableNames;0)
	//ARRAY TEXT(QV_at_TableRestrictionNMs;0)
	C_BOOLEAN:C305(DB_bo_NoLoad; QV_bo_AddAllowed; QV_bo_AlPopulated; QV_bo_Modified)
	C_LONGINT:C283($_l_event; $_l_Retries; Badd; BDelete; Bedit; QV_HL_QualitiesList; QV_l_CallActionID; QV_l_CurrentMode; QV_l_DisplayedOwnerID; QV_l_DisplayedOwnerTableID; QV_l_Powerview)
	C_LONGINT:C283(QV_l_QualityYear; QV_l_SelectedOwnerFieldID; QV_l_SelectedOwnerID; QV_l_SelectedOwnerTableID; QV_l_SelectedQualityID)
	C_REAL:C285(QV_R_QualityLevel)
	C_TEXT:C284($_t_oldMethodName; QV_T_MultiADD; QV_t_QualitiesGroupName; QV_t_QualitiesOwnerName; QV_t_QualityDescription; QV_t_QualityName; QV_t_SetName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("FM [USER].Qualities_Pallette"; Form event code:C388)
$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		OpenHelp(Table:C252(->[USER:15]); "Qualities_Pallette")
		
		ARRAY TEXT:C222(AA_at_SubSublistPOPNMs; 0)
		ARRAY LONGINT:C221(AA_al_SubListItemsPOPIDs; 0)
		//4/11/2009
		//HIDE PROCESS(Current process)
		ARRAY LONGINT:C221(QV_al_ValidGroupID; 0)
		WS_AutoscreenSize(2; 414; 340)
		QV_t_QualitiesOwnerName:=""
		QV_t_QualitiesGroupName:=""
		QV_t_QualityName:=""
		QV_t_QualityDescription:=""
		QV_R_QualityLevel:=0
		QV_l_QualityYear:=0
		QV_l_SelectedOwnerFieldID:=0
		ARRAY TEXT:C222(QV_at_RelevantTableNames; 0)
		ARRAY LONGINT:C221(QV_al_RelevantTableIDs; 0)
		ARRAY LONGINT:C221(QV_al_RelevanttableRecordIDs; 0)
		$_l_Retries:=0
		While (Semaphore:C143("$QVlock"))
			$_l_Retries:=$_l_Retries+1
			DelayTicks(2*$_l_Retries)
		End while 
		
		
		QV_palletePowerviewSetup
		
		If (QV_l_SelectedOwnerID>0)
			//this is the owner record ID of the qualities
			
			QV_RelevantTables(->QV_l_SelectedOwnerID; ->QV_l_SelectedOwnerTableID; ->QV_at_RelevantTableNames; ->QV_al_RelevantTableIDs; ->QV_al_RelevanttableRecordIDs)
			//now set up the tabs and set them to 1
			//then call the method to fill the qualities info
			//MESSAGE("Setting QV_l_SelectedOwnerID is "+String(QV_l_SelectedOwnerID)+"in Form Method")
			
			QV_l_DisplayedOwnerID:=QV_l_SelectedOwnerID
			
			QV_ShowQualities(QV_l_SelectedOwnerID; QV_l_SelectedOwnerTableID; QV_l_SelectedOwnerFieldID)
			QV_l_DisplayedOwnerTableID:=QV_l_SelectedOwnerTableID
			QV_l_SelectedOwnerTableID:=0
			QV_l_SelectedOwnerID:=0
			//MESSAGE("Setting QV_l_SelectedOwnerID from Form Method to Zero")
			
			SHOW PROCESS:C325(Current process:C322)
		Else 
			If (QV_l_SelectedOWnerID=-9999)
				//apply to selection
				
				
				//this is the owner record ID of the qualities
				QV_RelevantTables(->QV_l_SelectedOwnerID; ->QV_l_SelectedOwnerTableID; ->QV_at_RelevantTableNames; ->QV_al_RelevantTableIDs; ->QV_al_RelevanttableRecordIDs)
				
				QV_l_DisplayedOwnerID:=QV_l_SelectedOwnerID
				
				QV_ShowQualities(QV_l_SelectedOwnerID; QV_l_SelectedOwnerTableID; QV_l_SelectedOwnerFieldID)
				QV_l_DisplayedOwnerID:=QV_l_SelectedOwnerID
				QV_l_DisplayedOwnerTableID:=QV_l_SelectedOwnerTableID
				QV_l_SelectedOwnerTableID:=0
				QV_l_SelectedOwnerID:=0
				//MESSAGE("Setting QV_l_SelectedOwnerID from Form Method to Zero")
				
				If (QV_t_SetName#"")
					USE SET:C118(QV_t_SetName)
					CREATE SET:C116(Table:C252(QV_l_DisplayedOwnerTableID)->; "RecordSelection")
					CLEAR SET:C117(QV_t_SetName)
					QV_t_SetName:=""
					
				End if 
				
				SHOW PROCESS:C325(Current process:C322)
			Else 
				
				QV_ShowQualities(0; QV_l_SelectedOwnerTableID; QV_l_SelectedOwnerFieldID)
				HIDE PROCESS:C324(Current process:C322)
			End if 
		End if 
		CLEAR SEMAPHORE:C144("$QVlock")
		SHOW PROCESS:C325(Current process:C322)
		
		INT_SetDialog
		
	: ($_l_event=On Outside Call:K2:11)
		$_l_Retries:=0
		While (Semaphore:C143("$QVlock"))
			$_l_Retries:=$_l_Retries+1
			DelayTicks(2*$_l_Retries)
		End while 
		Case of 
			: (QV_l_CallActionID>0)
				
				Case of 
					: (QV_l_CallActionID=1)
						Case of 
							: (FORM Get current page:C276=2)
								If (QV_T_MultiADD#"")
									QV_SaveFromMultiAdd
								End if 
							: (FORM Get current page:C276=3)
								If (QV_bo_AlPopulated)
									//the al was already populated so save it first
									CONFIRM:C162("Save "+QV_t_QualitiesGroupName+"?"; "Yes"; "No")
									If (OK=1)
										QV_SaveFromPowerview(QV_t_QualitiesGroupName)
									End if 
								End if 
								
						End case 
						FORM GOTO PAGE:C247(1)
						QV_SaveQualities(QV_l_DisplayedOwnerID; QV_l_DisplayedOwnerTableID; QV_l_SelectedOwnerFieldID; False:C215)
						QV_bo_Modified:=False:C215
						QV_l_SelectedOwnerID:=0
					: (QV_l_CallActionID=2)
						//clear-no save
						QV_l_SelectedQualityID:=0
						QV_t_QualitiesGroupName:=""
						QV_t_QualityName:=""
						QV_t_QualityDescription:=""
						QV_R_QualityLevel:=0
						QV_l_QualityYear:=0
						OBJECT SET ENTERABLE:C238(*; "oQualitiesGroupName"; False:C215)
						OBJECT SET ENTERABLE:C238(*; "oQualityName"; False:C215)
						OBJECT SET ENTERABLE:C238(*; "oQualitiesDescription"; False:C215)
						// SET ENTERABLE(QV_R_QualityLevel;False)
						OBJECT SET VISIBLE:C603(*; "oQualityLevelsDropDown"; False:C215)
						OBJECT SET VISIBLE:C603(*; "oQualityYearsDropDown"; False:C215)
						QV_al_QualityYear:=0  //NG Checked April 2020
						QV_ar_QualityLevel:=0
						GOTO OBJECT:C206(*; "oHLInfolist")
						OBJECT SET TITLE:C194(*; "oAddQualityButton"; "Add")
						OBJECT SET TITLE:C194(*; "oDeleteQualityButton"; "Delete")
						OBJECT SET ENABLED:C1123(*; "oEditQualityButton"; False:C215)
						OBJECT SET ENABLED:C1123(*; "oDeleteQualityButton"; False:C215)
						
						
						QV_l_CurrentMode:=1
						QV_l_DisplayedOwnerID:=0
						QV_l_DisplayedOwnerTableID:=0
						ARRAY TEXT:C222(QV_at_QualityDetail; 0)
						ARRAY REAL:C219(QV_ar_QualityLevel; 0)
						ARRAY LONGINT:C221(QV_al_QualityYear; 0)  //NG Checked April 2020
						ARRAY DATE:C224(QV_ad_QualityDate; 0)
						ARRAY LONGINT:C221(QV_al_RelatedRecordNum; 0)
						ARRAY LONGINT:C221(QV_al_QualityID; 0)
						ARRAY LONGINT:C221(QV_al_QualityParentID; 0)
						ARRAY LONGINT:C221(QV_al_QualityRecordID; 0)
						ARRAY LONGINT:C221(QV_al_QualityDeletions; 0)
						If (Is a list:C621(QV_HL_QualitiesList))
							CLEAR LIST:C377(QV_HL_QualitiesList; *)
						End if 
						ARRAY TEXT:C222(QV_at_QualityGroupsNM; 0)
						ARRAY LONGINT:C221(QV_al_QualityGroupsIDs; 0)
						ARRAY TEXT:C222(QV_at_QualityGroups; 0)
						ARRAY TEXT:C222(QV_at_QualityProperties; 0; 0)
						ARRAY LONGINT:C221(QV_al_QualityPropertiesNUM; 0; 0)
						ARRAY TEXT:C222(QV_at_QualityPropertiesNAM; 0; 0)
						ARRAY TEXT:C222(QV_at_QualityGroupsUSED; 0)
						ARRAY LONGINT:C221(QV_al_QualityGroupsUsed; 0)
						ARRAY TEXT:C222(AA_at_SubSublistItemNMs; 0)
						ARRAY LONGINT:C221(AA_al_SubListItemsIDs; 0)
						ARRAY LONGINT:C221(QV_al_TableRestrictionIDs; 0)
						ARRAY TEXT:C222(QV_at_TableRestrictionNMs; 0)
						ARRAY TEXT:C222(QV_at_GroupsPopUPNM; 0)
						ARRAY LONGINT:C221(QV_al_GroupsPOPUPID; 0)
						//  HIDE PROCESS(Current process)
						FORM GOTO PAGE:C247(1)
						QV_bo_Modified:=False:C215
					: (QV_l_CallActionID=3)  //delete
						QV_bo_Modified:=False:C215
					: (QV_l_CallActionID=4)
						HIDE PROCESS:C324(Current process:C322)
						
						
				End case 
				QV_l_CallActionID:=0
			Else 
				
				If (QV_l_SelectedOwnerID>0) | (QV_l_SelectedOwnerID<0)
					If (QV_l_DisplayedOwnerID#QV_l_SelectedOwnerID) | (QV_l_SelectedOwnerTableID#QV_l_DisplayedOwnerTableID)
						If (QV_l_DisplayedOwnerID>0) | (QV_l_DisplayedOwnerID<0)
							Case of 
								: (FORM Get current page:C276=2)
									If (QV_T_MultiADD#"")
										QV_SaveFromMultiAdd
									End if 
									
								: (FORM Get current page:C276=3)
									If (QV_bo_AlPopulated)
										//the al was already populated so save it first
										CONFIRM:C162("Save "+QV_t_QualitiesGroupName+"?"; "Yes"; "No")
										If (OK=1)
											QV_SaveFromPowerview(QV_t_QualitiesGroupName)
										End if 
									End if 
									
							End case 
							QV_SaveQualities(QV_l_DisplayedOwnerID; QV_l_DisplayedOwnerTableID; QV_l_SelectedOwnerFieldID)
							QV_bo_Modified:=False:C215
						End if 
						
						// The displayed record is changed
						//this is the owner record ID of the qualities
						QV_RelevantTables(->QV_l_SelectedOwnerID; ->QV_l_SelectedOwnerTableID; ->QV_at_RelevantTableNames; ->QV_al_RelevantTableIDs; ->QV_al_RelevanttableRecordIDs)
						//now set up the tabs and set them to 1
						//then call the method to fill the qualities info
						QV_ShowQualities(QV_l_SelectedOwnerID; QV_l_SelectedOwnerTableID; QV_l_SelectedOwnerFieldID)
						
						QV_bo_Modified:=False:C215
						FORM GOTO PAGE:C247(1)
						QV_l_DisplayedOwnerID:=QV_l_SelectedOwnerID
						QV_l_DisplayedOwnerTableID:=QV_l_SelectedOwnerTableID
						QV_l_SelectedOwnerTableID:=0
						//MESSAGE("Setting QV_l_SelectedOwnerID from Form Method to Zero")
						
						QV_l_SelectedOwnerID:=0
						If (QV_t_SetName#"")
							USE SET:C118(QV_t_SetName)
							CREATE SET:C116(Table:C252(QV_l_DisplayedOwnerTableID)->; "RecordSelection")
							CLEAR SET:C117(QV_t_SetName)
							QV_t_SetName:=""
						End if 
					Else 
						
						QV_l_DisplayedOwnerID:=QV_l_SelectedOwnerID
						QV_l_DisplayedOwnerTableID:=QV_l_SelectedOwnerTableID
						QV_l_SelectedOwnerTableID:=0
						//MESSAGE("Setting QV_l_SelectedOwnerID from Form Method to Zero")
						
						QV_l_SelectedOwnerID:=0
						
					End if 
					SHOW PROCESS:C325(Current process:C322)
					BRING TO FRONT:C326(Current process:C322)
				Else 
					//` HIDE PROCESS(Current process)
					
					QV_l_DisplayedOwnerID:=QV_l_SelectedOwnerID
					QV_l_DisplayedOwnerTableID:=QV_l_SelectedOwnerTableID
					QV_l_SelectedOwnerTableID:=0
					//MESSAGE("Setting QV_l_SelectedOwnerID from Form Method to Zero")
					
					QV_l_SelectedOwnerID:=0
					QV_bo_Modified:=False:C215
				End if 
		End case 
		CLEAR SEMAPHORE:C144("$QVlock")
		
	: ($_l_event=On Resize:K2:27)
		INT_SetDialog
		If (FORM Get current page:C276=3)
			
			QV_PalletteSetobjectPositions
			
			
		End if 
		
		
End case 
ERR_MethodTrackerReturn("FM [USER].Qualities_Pallette"; $_t_oldMethodName)
