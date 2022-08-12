If (False:C215)
	//object Name: [USER]JOB_PermConfig.oPermJobInfos
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/08/2013 17:24
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(QV_lb_QualityNames;0)
	//ARRAY LONGINT(JOB_al_PermJobInfoClass;0)
	//ARRAY LONGINT(JOB_al_PermJobInfoQuals;0)
	//ARRAY LONGINT(QV_al_QualityGroupsIDs;0)
	//ARRAY LONGINT(QV_al_QualityPropertiesNUM;0)
	//ARRAY LONGINT(QV_al_QualitySubGroupsIDs;0)
	//ARRAY LONGINT(QV_al_QualityItemsDeleted;0)
	//ARRAY TEXT(JOB_at_JobDataTypes;0)
	//ARRAY TEXT(JOB_at_PermJobInfos;0)
	//ARRAY TEXT(QV_at_QualityGroupsNM;0)
	//ARRAY TEXT(QV_at_QualityProperties;0)
	//ARRAY TEXT(QV_at_QualitySubGroups;0)
	//ARRAY TEXT(QV_at_QualitySubGroupsNM;0)
	C_BOOLEAN:C305(JOB_bo_ConfigisModified)
	C_LONGINT:C283($_l_event; $_l_GroupIndex; $_l_GroupRow; $_l_PropertyColumn; $_l_ShowInfoList; $_l_SubListNUM; bAddQual; bdelQual; JOB_l_InfoClass; JOB_l_QualityID; JOB_l_QualitySubList)
	C_LONGINT:C283(JOB_l_SelectedInfo)
	C_TEXT:C284($_t_oldMethodName; Job_t_DataName; JOB_t_DataType)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].JOB_PermConfig.oPermJobInfos"; Form event code:C388)

$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4) | ($_l_event=On Selection Change:K2:29)
		If (JOB_l_SelectedInfo>0)
			//Save the values for the current setting
			If (JOB_bo_ConfigisModified)
				OBJECT SET ENTERABLE:C238(Job_t_DataName; False:C215)
				OBJECT SET ENTERABLE:C238(JOB_t_DataType; False:C215)
				
				JOB_at_PermJobInfos{JOB_l_SelectedInfo}:=Job_t_DataName
				JOB_al_PermJobInfoClass{JOB_l_SelectedInfo}:=JOB_l_InfoClass
				
				JOB_al_PermJobInfoQuals{JOB_l_SelectedInfo}:=JOB_l_QualityID
				//Update the qualities list as well?
				For ($_l_GroupIndex; 1; Size of array:C274(QV_at_QualitySubGroupsNM))
					If (QV_al_QualitySubGroupsIDs{$_l_GroupIndex}<0)
						READ WRITE:C146([LIST_ITEMS:95])
						QUERY:C277([LIST_ITEMS:95]; [LIST_ITEMS:95]X_ID:3=Abs:C99(QV_al_QualitySubGroupsIDs{$_l_GroupIndex}))
						If (Records in selection:C76([LIST_ITEMS:95])=0)
							CREATE RECORD:C68([LIST_ITEMS:95])
							[LIST_ITEMS:95]X_ID:3:=Abs:C99(QV_al_QualitySubGroupsIDs{$_l_GroupIndex})
						End if 
						[LIST_ITEMS:95]X_ListID:4:=JOB_l_QualitySubList
						[LIST_ITEMS:95]List_Entry:2:=QV_at_QualitySubGroupsNM{$_l_GroupIndex}
						DB_SaveRecord(->[LIST_ITEMS:95])
						AA_CheckFileUnlocked(->[LIST_ITEMS:95]X_ID:3)
						READ ONLY:C145([LIST_ITEMS:95])
					End if 
				End for 
				If (Size of array:C274(QV_al_QualityItemsDeleted)>0)
					For ($_l_GroupIndex; 1; Size of array:C274(QV_al_QualityItemsDeleted))
						READ WRITE:C146([LIST_ITEMS:95])
						QUERY:C277([LIST_ITEMS:95]; [LIST_ITEMS:95]X_ID:3=QV_al_QualityItemsDeleted{$_l_GroupIndex})
						[LIST_ITEMS:95]X_Item_Status:7:=-1
						DB_SaveRecord(->[LIST_ITEMS:95])
						AA_CheckFileUnlocked(->[LIST_ITEMS:95]X_ID:3)
						READ ONLY:C145([LIST_ITEMS:95])
					End for 
				End if 
			End if 
		End if 
		If (JOB_at_PermJobInfos>0)
			OBJECT SET ENTERABLE:C238(Job_t_DataName; True:C214)
			
			QV_at_QualityGroupsNM:=0
			Job_t_DataName:=""
			JOB_t_DataType:=""
			JOB_bo_ConfigisModified:=False:C215
			JOB_l_SelectedInfo:=JOB_at_PermJobInfos
			Job_t_DataName:=JOB_at_PermJobInfos{JOB_at_PermJobInfos}
			JOB_l_InfoClass:=JOB_al_PermJobInfoClass{JOB_at_PermJobInfos}
			Case of 
				: (JOB_al_PermJobInfoClass{JOB_at_PermJobInfos}=0)  //text on;y
					JOB_t_DataType:=JOB_at_JobDataTypes{1}
					$_l_ShowInfoList:=0
				: (JOB_al_PermJobInfoClass{JOB_at_PermJobInfos}=1)  // text with list
					JOB_t_DataType:=JOB_at_JobDataTypes{2}
					$_l_ShowInfoList:=1
				: (JOB_al_PermJobInfoClass{JOB_at_PermJobInfos}=2)  // list
					JOB_t_DataType:=JOB_at_JobDataTypes{3}
					$_l_ShowInfoList:=1
				: (JOB_al_PermJobInfoClass{JOB_at_PermJobInfos}=3)  //short text(255 char)
					JOB_t_DataType:=JOB_at_JobDataTypes{4}
					$_l_ShowInfoList:=0
			End case 
			ARRAY TEXT:C222(QV_at_QualitySubGroupsNM; 0)
			ARRAY LONGINT:C221(QV_al_QualitySubGroupsIDs; 0)
			ARRAY TEXT:C222(QV_at_QualitySubGroups; 0)
			ARRAY LONGINT:C221(QV_al_QualityItemsDeleted; 0)
			JOB_l_QualityID:=JOB_al_PermJobInfoQuals{JOB_at_PermJobInfos}
			If ($_l_ShowInfoList=1)
				If (JOB_al_PermJobInfoQuals{JOB_at_PermJobInfos}>0)
					//load the QV_lb_QualityNames
					$_l_GroupRow:=Find in array:C230(QV_al_QualityGroupsIDs; JOB_al_PermJobInfoQuals{JOB_at_PermJobInfos})
					If ($_l_GroupRow>0)
						$_l_GroupRow:=Find in array:C230(QV_al_QualityGroupsIDs; JOB_al_PermJobInfoQuals{JOB_at_PermJobInfos})
						If ($_l_GroupRow>0)
							$_l_SubListNUM:=0
							$_l_PropertyColumn:=Find in array:C230(QV_at_QualityProperties{$_l_GroupRow}; "SUBLIST")
							If ($_l_PropertyColumn>0)
								$_l_SubListNUM:=QV_al_QualityPropertiesNUM{$_l_GroupRow}{$_l_PropertyColumn}
							Else 
								QUERY:C277([LIST_ITEMS:95]; [LIST_ITEMS:95]X_ID:3=QV_al_QualityGroupsIDs{$_l_GroupRow})
								AA_GetListItemProperty("SUBLIST"; ->$_l_SubListNUM)
								
							End if 
							If ($_l_SubListNUM>0)
								JOB_l_QualitySubList:=$_l_SubListNUM
								AA_LoadListbyID($_l_SubListNUM; ->QV_at_QualitySubGroupsNM; ->QV_al_QualitySubGroupsIDs; False:C215)
								SORT ARRAY:C229(QV_at_QualitySubGroupsNM; QV_al_QualitySubGroupsIDs)
								OBJECT SET VISIBLE:C603(QV_at_QualityGroupsNM; False:C215)
								OBJECT SET VISIBLE:C603(QV_lb_QualityNames; True:C214)
								OBJECT SET VISIBLE:C603(*; "oInfoLabel"; True:C214)
								OBJECT SET VISIBLE:C603(bdelQual; True:C214)
								OBJECT SET VISIBLE:C603(bAddQual; True:C214)
							End if 
						End if 
					Else 
						//No quals list related so let the set up show the names of quality groups
						OBJECT SET VISIBLE:C603(QV_at_QualityGroupsNM; True:C214)
						OBJECT SET VISIBLE:C603(QV_lb_QualityNames; False:C215)
						OBJECT SET VISIBLE:C603(*; "oInfoLabel"; True:C214)
						OBJECT SET VISIBLE:C603(bdelQual; False:C215)
						OBJECT SET VISIBLE:C603(bAddQual; False:C215)
					End if 
				Else 
					OBJECT SET VISIBLE:C603(QV_at_QualityGroupsNM; False:C215)
					OBJECT SET VISIBLE:C603(QV_lb_QualityNames; False:C215)
					OBJECT SET VISIBLE:C603(*; "oInfoLabel"; False:C215)
					OBJECT SET VISIBLE:C603(bdelQual; False:C215)
					OBJECT SET VISIBLE:C603(bAddQual; False:C215)
				End if 
			End if 
		End if 
End case 
ERR_MethodTrackerReturn("OBJ [USER].JOB_PermConfig.oPermJobInfos"; $_t_oldMethodName)
