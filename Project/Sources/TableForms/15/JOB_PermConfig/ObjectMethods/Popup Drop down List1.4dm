If (False:C215)
	//object Name: [USER]JOB_PermConfig.Popup Drop down List1
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
	//ARRAY LONGINT(JOB_al_PermJobInfoQuals;0)
	//ARRAY LONGINT(QV_al_QualityGroupsIDs;0)
	//ARRAY LONGINT(QV_al_QualityPropertiesNUM;0)
	//ARRAY LONGINT(QV_al_QualitySubGroupsIDs;0)
	//ARRAY TEXT(JOB_at_JobDataTypes;0)
	//ARRAY TEXT(JOB_at_PermJobInfos;0)
	//ARRAY TEXT(QV_at_QualityGroupsNM;0)
	//ARRAY TEXT(QV_at_QualityProperties;0)
	//ARRAY TEXT(QV_at_QualitySubGroups;0)
	//ARRAY TEXT(QV_at_QualitySubGroupsNM;0)
	C_BOOLEAN:C305(JOB_bo_ConfigisModified)
	C_LONGINT:C283($_l_event; $_l_GroupRow; $_l_PropertyColumn; $_l_ShowInfoList; $_l_SubListNUM; bAddQual; bdelQual; JOB_l_InfoClass; JOB_l_QualityID; JOB_l_QualitySubList)
	C_TEXT:C284($_t_oldMethodName; JOB_t_DataType)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].JOB_PermConfig.Popup Drop down List1"; Form event code:C388)

$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4)
		Case of 
			: (JOB_at_JobDataTypes=1)  //Text
				JOB_l_InfoClass:=0
				$_l_ShowInfoList:=0
				JOB_bo_ConfigisModified:=True:C214
				JOB_t_DataType:=JOB_at_JobDataTypes{JOB_at_JobDataTypes}
			: (JOB_at_JobDataTypes=2)  //Text with list
				JOB_l_InfoClass:=1
				$_l_ShowInfoList:=1
				JOB_bo_ConfigisModified:=True:C214
				JOB_t_DataType:=JOB_at_JobDataTypes{JOB_at_JobDataTypes}
			: (JOB_at_JobDataTypes=3)  //list
				JOB_l_InfoClass:=2
				$_l_ShowInfoList:=1
				JOB_bo_ConfigisModified:=True:C214
				JOB_t_DataType:=JOB_at_JobDataTypes{JOB_at_JobDataTypes}
			: (JOB_at_JobDataTypes=4)  //short Text
				JOB_l_InfoClass:=3
				$_l_ShowInfoList:=0
				JOB_bo_ConfigisModified:=True:C214
				JOB_t_DataType:=JOB_at_JobDataTypes{JOB_at_JobDataTypes}
		End case 
		ARRAY TEXT:C222(QV_at_QualitySubGroupsNM; 0)
		ARRAY LONGINT:C221(QV_al_QualitySubGroupsIDs; 0)
		ARRAY TEXT:C222(QV_at_QualitySubGroups; 0)
		JOB_l_QualityID:=JOB_al_PermJobInfoQuals{JOB_at_PermJobInfos}
		If ($_l_ShowInfoList=1)
			If (JOB_al_PermJobInfoQuals{JOB_at_PermJobInfos}>0)
				//load the QV_lb_QualityNames
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
						OBJECT SET VISIBLE:C603(bdelQual; False:C215)
						OBJECT SET VISIBLE:C603(bAddQual; False:C215)
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
		
End case 
ERR_MethodTrackerReturn("OBJ [USER].JOB_PermConfig.Popup Drop down List1"; $_t_oldMethodName)
