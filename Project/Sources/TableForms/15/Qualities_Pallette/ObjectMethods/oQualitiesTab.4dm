If (False:C215)
	//object Name: [USER]Qualities_Pallette.Tab Control1
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
	//ARRAY LONGINT(QV_al_RelevantTableFIELDIDs;0)
	//ARRAY LONGINT(QV_al_RelevantTableIDs;0)
	//ARRAY LONGINT(QV_al_RelevanttableRecordIDs;0)
	//ARRAY TEXT(QV_at_RelevantTableNames;0)
	C_BOOLEAN:C305(QV_bo_AlPopulated)
	C_LONGINT:C283($_l_event; QV_l_DisplayedOwnerID; QV_l_DisplayedOwnerTableID; QV_l_SelectedOwnerFieldID; QV_l_SelectedQualityID)
	C_TEXT:C284($_t_oldMethodName; QV_T_MultiADD; QV_t_QualitiesGroupName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].Qualities_Pallette.Tab Control1"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4)
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
		
		
		QV_SaveQualities(QV_l_DisplayedOwnerID; QV_l_DisplayedOwnerTableID; QV_l_SelectedOwnerFieldID; True:C214)
		
		QV_l_DisplayedOwnerID:=QV_al_RelevanttableRecordIDs{QV_at_RelevantTableNames}
		QV_l_DisplayedOwnerTableID:=QV_al_RelevantTableIDs{QV_at_RelevantTableNames}
		QV_l_SelectedOwnerFieldID:=QV_al_RelevantTableFIELDIDs{QV_at_RelevantTableNames}
		QV_ShowQualities(QV_l_DisplayedOwnerID; QV_l_DisplayedOwnerTableID; QV_l_SelectedOwnerFieldID)
End case 
ERR_MethodTrackerReturn("OBJ [USER].Qualities_Pallette.Tab Control1"; $_t_oldMethodName)
