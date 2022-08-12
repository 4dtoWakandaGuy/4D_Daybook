//%attributes = {}

If (False:C215)
	//Project Method Name:      WF_UpdateWorkflowWindow
	//------------------ Method Notes ------------------
	//this method is called by the worker process in the context of the current displayed window
	//------------------ Revision Control ----------------
	//Date Created:  02/01/2020
	//Created BY:  DefaultUser
	
	//Date Modified: 
	//Modified By: DefaultUser
	//Modification notes
End if 
//Variable Declarations
If (True:C214)
	//ARRAY DATE(SD2_ad_DisplayDateFrom;0)
	ARRAY LONGINT:C221($_al_ObjectPropertyTypes; 0)
	ARRAY LONGINT:C221($_al_PropertyTypes; 0)
	ARRAY LONGINT:C221($_al_RelatedRecordIDS; 0)
	ARRAY LONGINT:C221($_al_RelatedTables; 0)
	//ARRAY LONGINT(SD2_al_RelatedTableNumber;0)
	ARRAY OBJECT:C1221($_aobj_DiaryRecords; 0)
	ARRAY TEXT:C222($_at_ObjectProperties; 0)
	ARRAY TEXT:C222($_at_Properties; 0)
	ARRAY TEXT:C222($_at_RelatedRecordCodes; 0)
	//ARRAY TEXT(DOC_at_RecordCode;0)
	//ARRAY TEXT(SD_at_DisplayPersonCode;0)
	//ARRAY TEXT(SD2_at_ActionNames;0)
	//ARRAY TEXT(SD2_at_CampaignNames;0)
	//ARRAY TEXT(SD2_at_CampaignUUID;0)
	//ARRAY TEXT(SD2_at_CompanyNames;0)
	//ARRAY TEXT(SD2_At_DiaryCode;0)
	//ARRAY TEXT(SD2_at_DIsplayCompanyCode;0)
	//ARRAY TEXT(SD2_at_OwnerNames;0)
	//ARRAY TEXT(SD2_at_RelatedRecordCode;0)
	//ARRAY TEXT(SD2_at_RelatedTableName;0)
	//ARRAY TEXT(SD2_at_WFDiaryactions;0)
	//ARRAY TIME(SD2_ati_DisplayTimeFrom;0)
	C_BOOLEAN:C305($_bo_Continue)
	C_LONGINT:C283($_l_BuildList; $_l_BuildScreen; $_l_PrimeRelationstable; $_l_Ref; $_l_WindowID)
	C_OBJECT:C1216($_obj_UpdateObject; $1)
	C_TEXT:C284($_t_CompaignUUID; $_t_Method; $_t_WFAction)
End if 

//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("WF_UpdateWorkflowWindow")

$_obj_UpdateObject:=$1
ARRAY TEXT:C222(SD2_At_DiaryCode; 0)
ARRAY TEXT:C222(SD2_at_WFDiaryactions; 0)
ARRAY DATE:C224(SD2_ad_DisplayDateFrom; 0)
ARRAY TIME:C1223(SD2_ati_DisplayTimeFrom; 0)
ARRAY TEXT:C222(SD2_at_RelatedTableName; 0)
ARRAY LONGINT:C221(SD2_al_RelatedTableNumber; 0)
ARRAY TEXT:C222(SD2_at_RelatedRecordCode; 0)
ARRAY TEXT:C222(SD_at_DisplayPersonCode; 0)
ARRAY TEXT:C222(SD2_at_CampaignUUID; 0)
ARRAY TEXT:C222(SD2_at_DIsplayCompanyCode; 0)
OB GET PROPERTY NAMES:C1232($_obj_UpdateObject; $_at_ObjectProperties; $_al_ObjectPropertyTypes)
$_l_Ref:=Find in array:C230($_at_ObjectProperties; "action")
If ($_l_Ref>0)
	$_bo_Continue:=True:C214
	$_t_WFAction:=OB Get:C1224($_obj_UpdateObject; "action")
	$_l_Ref:=Find in array:C230($_at_ObjectProperties; "Method")
	
	If ($_l_Ref>0)
		$_bo_Continue:=True:C214
		
		$_t_Method:=OB Get:C1224($_obj_UpdateObject; "Method")
		$_l_Ref:=Find in array:C230($_at_ObjectProperties; "window_id")
		
		If ($_l_Ref>0)
			$_bo_Continue:=True:C214
			$_l_WindowID:=OB Get:C1224($_obj_UpdateObject; "window_id")
			OB GET ARRAY:C1229($_obj_UpdateObject; "Data"; $_aobj_DiaryRecords)
		Else 
			$_bo_Continue:=False:C215
		End if 
	Else 
		$_bo_Continue:=False:C215
	End if 
Else 
	$_bo_Continue:=False:C215
End if 
//SELECTION TO ARRAY([DIARY]Diary_Code;SD2_At_DiaryCode;[DIARY]Action_Code;SD2_at_WFDiaryactions;[DIARY]Display_Date_From;SD2_ad_DisplayDateFrom;[DIARY]Display_Time_From;SD2_ati_DisplayTimeFrom
//;[DIARY]Company_Code;SD2_at_DIsplayCompanyCode;[DIARY]Person;SD_at_DisplayPersonCode;[DIARY]CampaignUUID;SD2_at_CampaignUUID)
If ($_bo_Continue)
	For ($_l_BuildScreen; 1; Size of array:C274($_aobj_DiaryRecords))
		OB GET PROPERTY NAMES:C1232($_aobj_DiaryRecords{$_l_BuildScreen}; $_at_Properties; $_al_PropertyTypes)
		$_l_Ref:=Find in array:C230($_at_Properties; "RecordCode")
		If ($_l_Ref>0)
			APPEND TO ARRAY:C911(SD2_At_DiaryCode; OB Get:C1224($_aobj_DiaryRecords{$_l_BuildScreen}; "RecordCode"))
			$_l_Ref:=Find in array:C230($_at_Properties; "ActionCode")
			If ($_l_ref>0)
				APPEND TO ARRAY:C911(SD2_at_WFDiaryactions; OB Get:C1224($_aobj_DiaryRecords{$_l_BuildScreen}; "ActionCode"))
				QUERY:C277([ACTIONS:13]; [ACTIONS:13]Action_Code:1=SD2_at_WFDiaryactions{Size of array:C274(SD2_at_WFDiaryactions)})
				APPEND TO ARRAY:C911(SD2_at_ActionNames; [ACTIONS:13]Action_Name:2)
			End if 
			$_l_Ref:=Find in array:C230($_at_Properties; "DateDoFrom")
			If ($_l_ref>0)
				APPEND TO ARRAY:C911(SD2_ad_DisplayDateFrom; SD3_ObjectStringtoDate(OB Get:C1224($_aobj_DiaryRecords{$_l_BuildScreen}; "DateDoFrom")))
				
			End if 
			$_l_Ref:=Find in array:C230($_at_Properties; "TimeDoFrom")
			If ($_l_ref>0)
				APPEND TO ARRAY:C911(SD2_ati_DisplayTimeFrom; SD3_ObjectRealtoTime(OB Get:C1224($_aobj_DiaryRecords{$_l_BuildScreen}; "TimeDoFrom")))
			End if 
			$_l_Ref:=Find in array:C230($_at_Properties; "DataSourceTable")
			If ($_l_ref>0)
				$_l_PrimeRelationstable:=OB Get:C1224($_aobj_DiaryRecords{$_l_BuildScreen}; "DataSourceTable")
				If ($_l_PrimeRelationstable>0)
					OB GET ARRAY:C1229($_aobj_DiaryRecords{$_l_BuildScreen}; "RelationsTables"; $_al_RelatedTables)
					OB GET ARRAY:C1229($_aobj_DiaryRecords{$_l_BuildScreen}; "RelationsRecordIDS"; $_al_RelatedRecordIDS)
					OB GET ARRAY:C1229($_aobj_DiaryRecords{$_l_BuildScreen}; "RelationsRecordCodes"; $_at_RelatedRecordCodes)
					APPEND TO ARRAY:C911(SD2_ati_DisplayTimeFrom; OB Get:C1224($_aobj_DiaryRecords{$_l_BuildScreen}; "DataSourceTable"))
					$_l_Ref:=Find in array:C230($_al_RelatedTables; $_l_PrimeRelationstable)
					If ($_l_Ref>0)
						APPEND TO ARRAY:C911(SD2_al_RelatedTableNumber; $_l_PrimeRelationstable)
						APPEND TO ARRAY:C911(SD2_at_RelatedTableName; Table name:C256($_l_PrimeRelationstable))
						APPEND TO ARRAY:C911(SD2_at_RelatedRecordCode; $_at_RelatedRecordCodes{$_l_Ref})
						
					Else 
						
						Case of 
								
							: ($_l_PrimeRelationstable=Table:C252(->[SERVICE_CALLS:20]))
								APPEND TO ARRAY:C911(SD2_al_RelatedTableNumber; $_l_PrimeRelationstable)
								APPEND TO ARRAY:C911(SD2_at_RelatedRecordCode; OB Get:C1224($_aobj_DiaryRecords{$_l_BuildScreen}; "CallCode"))
								APPEND TO ARRAY:C911(SD2_at_RelatedTableName; "Service Call")
								
							: ($_l_PrimeRelationstable=Table:C252(->[COMPANIES:2]))
								APPEND TO ARRAY:C911(SD2_al_RelatedTableNumber; $_l_PrimeRelationstable)
								APPEND TO ARRAY:C911(SD2_at_RelatedRecordCode; OB Get:C1224($_aobj_DiaryRecords{$_l_BuildScreen}; "CompanyCode"))
								APPEND TO ARRAY:C911(SD2_at_RelatedTableName; "Company")
								
							: ($_l_PrimeRelationstable=Table:C252(->[CONTACTS:1]))
								APPEND TO ARRAY:C911(SD2_al_RelatedTableNumber; $_l_PrimeRelationstable)
								APPEND TO ARRAY:C911(SD2_at_RelatedRecordCode; OB Get:C1224($_aobj_DiaryRecords{$_l_BuildScreen}; "ContactCode"))
								APPEND TO ARRAY:C911(SD2_at_RelatedTableName; "Contact")
								
							: ($_l_PrimeRelationstable=Table:C252(->[JOBS:26]))
								APPEND TO ARRAY:C911(SD2_al_RelatedTableNumber; $_l_PrimeRelationstable)
								APPEND TO ARRAY:C911(SD2_at_RelatedRecordCode; OB Get:C1224($_aobj_DiaryRecords{$_l_BuildScreen}; "JobCode"))
								APPEND TO ARRAY:C911(SD2_at_RelatedTableName; "Job")
								
							: ($_l_PrimeRelationstable=Table:C252(->[ORDERS:24]))
								
								APPEND TO ARRAY:C911(SD2_al_RelatedTableNumber; $_l_PrimeRelationstable)
								APPEND TO ARRAY:C911(SD2_at_RelatedRecordCode; OB Get:C1224($_aobj_DiaryRecords{$_l_BuildScreen}; "OrderCode"))
								APPEND TO ARRAY:C911(SD2_at_RelatedTableName; "Order")
								
							: ($_l_PrimeRelationstable=Table:C252(->[PRODUCTS:9]))
								
								APPEND TO ARRAY:C911(SD2_al_RelatedTableNumber; $_l_PrimeRelationstable)
								APPEND TO ARRAY:C911(SD2_at_RelatedRecordCode; OB Get:C1224($_aobj_DiaryRecords{$_l_BuildScreen}; "ProductCode"))
								APPEND TO ARRAY:C911(SD2_at_RelatedTableName; "Product")
							: ($_l_PrimeRelationstable=Table:C252(->[JOB_STAGES:47]))
								
								APPEND TO ARRAY:C911(SD2_al_RelatedTableNumber; $_l_PrimeRelationstable)
								APPEND TO ARRAY:C911(SD2_at_RelatedRecordCode; OB Get:C1224($_aobj_DiaryRecords{$_l_BuildScreen}; "StageCode"))
								APPEND TO ARRAY:C911(SD2_at_RelatedTableName; "Job Stage")
						End case 
						
						
					End if 
				Else 
					//we have to guess...
					Case of 
						: (OB Get:C1224($_aobj_DiaryRecords{$_l_BuildScreen}; "StageCode")#"")
							
							APPEND TO ARRAY:C911(SD2_al_RelatedTableNumber; Table:C252(->[JOB_STAGES:47]))
							APPEND TO ARRAY:C911(SD2_at_RelatedRecordCode; OB Get:C1224($_aobj_DiaryRecords{$_l_BuildScreen}; "StageCode"))
							APPEND TO ARRAY:C911(SD2_at_RelatedTableName; "Job Stage")
							
						: (OB Get:C1224($_aobj_DiaryRecords{$_l_BuildScreen}; "JobCode")#"")
							APPEND TO ARRAY:C911(SD2_al_RelatedTableNumber; Table:C252(->[JOBS:26]))
							APPEND TO ARRAY:C911(SD2_at_RelatedRecordCode; OB Get:C1224($_aobj_DiaryRecords{$_l_BuildScreen}; "JobCode"))
							APPEND TO ARRAY:C911(SD2_at_RelatedTableName; "Job")
							
							
						: (OB Get:C1224($_aobj_DiaryRecords{$_l_BuildScreen}; "CallCode")#"")
							APPEND TO ARRAY:C911(SD2_al_RelatedTableNumber; Table:C252(->[SERVICE_CALLS:20]))
							APPEND TO ARRAY:C911(SD2_at_RelatedRecordCode; OB Get:C1224($_aobj_DiaryRecords{$_l_BuildScreen}; "CallCode"))
							APPEND TO ARRAY:C911(SD2_at_RelatedTableName; "Service Call")
							
						: (OB Get:C1224($_aobj_DiaryRecords{$_l_BuildScreen}; "OrderCode")#"")
							
							APPEND TO ARRAY:C911(SD2_al_RelatedTableNumber; Table:C252(->[ORDERS:24]))
							APPEND TO ARRAY:C911(SD2_at_RelatedRecordCode; OB Get:C1224($_aobj_DiaryRecords{$_l_BuildScreen}; "OrderCode"))
							APPEND TO ARRAY:C911(SD2_at_RelatedTableName; "Order")
							
							
						: (OB Get:C1224($_aobj_DiaryRecords{$_l_BuildScreen}; "CompanyCode")#"")
							APPEND TO ARRAY:C911(SD2_al_RelatedTableNumber; Table:C252(->[COMPANIES:2]))
							APPEND TO ARRAY:C911(SD2_at_RelatedRecordCode; OB Get:C1224($_aobj_DiaryRecords{$_l_BuildScreen}; "CompanyCode"))
							APPEND TO ARRAY:C911(SD2_at_RelatedTableName; "Company")
							
						: (OB Get:C1224($_aobj_DiaryRecords{$_l_BuildScreen}; "ContactCode")#"")
							APPEND TO ARRAY:C911(SD2_al_RelatedTableNumber; Table:C252(->[CONTACTS:1]))
							APPEND TO ARRAY:C911(SD2_at_RelatedRecordCode; OB Get:C1224($_aobj_DiaryRecords{$_l_BuildScreen}; "ContactCode"))
							APPEND TO ARRAY:C911(SD2_at_RelatedTableName; "Contact")
							
							
							
							
						: (OB Get:C1224($_aobj_DiaryRecords{$_l_BuildScreen}; "ProductCode")#"")
							
							APPEND TO ARRAY:C911(SD2_al_RelatedTableNumber; Table:C252(->[PRODUCTS:9]))
							APPEND TO ARRAY:C911(SD2_at_RelatedRecordCode; OB Get:C1224($_aobj_DiaryRecords{$_l_BuildScreen}; "ProductCode"))
							APPEND TO ARRAY:C911(SD2_at_RelatedTableName; "Product")
							
					End case 
					
					
				End if 
				
			End if 
			
			If (Not:C34(UTIL_isUUIDNil(OB Get:C1224($_aobj_DiaryRecords{$_l_BuildScreen}; "CampaignUUID"))))
				
				APPEND TO ARRAY:C911(SD2_at_CampaignUUID; OB Get:C1224($_aobj_DiaryRecords{$_l_BuildScreen}; "CampaignUUID"))
				If ([WORKFLOW_Campaign:209]UUID:1#SD2_at_CampaignUUID{Size of array:C274(SD2_at_CampaignUUID)})
					QUERY:C277([WORKFLOW_Campaign:209]; [WORKFLOW_Campaign:209]UUID:1=SD2_at_CampaignUUID{Size of array:C274(SD2_at_CampaignUUID)})
				End if 
				APPEND TO ARRAY:C911(SD2_at_CampaignNames; [WORKFLOW_Campaign:209]Campaign_Name:2)
				
			Else 
				APPEND TO ARRAY:C911(SD2_at_CampaignUUID; "")
				APPEND TO ARRAY:C911(SD2_at_CampaignNames; "N/A")
				
			End if 
			APPEND TO ARRAY:C911(SD_at_DisplayPersonCode; OB Get:C1224($_aobj_DiaryRecords{$_l_BuildScreen}; "Person"))
			
			If (SD_at_DisplayPersonCode{Size of array:C274(SD_at_DisplayPersonCode)}="")
				APPEND TO ARRAY:C911(SD2_at_OwnerNames; "Group task")
				
			Else 
				If ([PERSONNEL:11]Initials:1#SD_at_DisplayPersonCode{Size of array:C274(SD_at_DisplayPersonCode)})
					QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Initials:1=SD_at_DisplayPersonCode{Size of array:C274(SD_at_DisplayPersonCode)})
				End if 
				APPEND TO ARRAY:C911(SD2_at_OwnerNames; [PERSONNEL:11]Name:2)
			End if 
			
			If (OB Get:C1224($_aobj_DiaryRecords{$_l_BuildScreen}; "CompanyCode")#"")
				If ([COMPANIES:2]Company_Code:1#OB Get:C1224($_aobj_DiaryRecords{$_l_BuildScreen}; "CompanyCode"))
					QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Code:1=OB Get:C1224($_aobj_DiaryRecords{$_l_BuildScreen}; "CompanyCode"))
				End if 
				APPEND TO ARRAY:C911(SD2_at_CompanyNames; [COMPANIES:2]Company_Name:2)
			Else 
				APPEND TO ARRAY:C911(SD2_at_CompanyNames; "")
			End if 
			
		End if 
	End for 
End if 
UNLOAD RECORD:C212([WORKFLOW_Campaign:209])
UNLOAD RECORD:C212([PERSONNEL:11])
UNLOAD RECORD:C212([COMPANIES:2])
ERR_MethodTrackerReturn("WF_UpdateWorkflowWindow"; $_t_oldMethodName)