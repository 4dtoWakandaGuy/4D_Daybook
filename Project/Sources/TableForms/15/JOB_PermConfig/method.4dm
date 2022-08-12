If (False:C215)
	//Table Form Method Name: [USER]JOB_PermConfig
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 04/03/2011 12:00
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
	//ARRAY LONGINT(QV_al_QualityPropertiesNUM;0;0)
	//ARRAY LONGINT(QV_al_QualitySubGroupsIDs;0)
	//ARRAY LONGINT(QV_al_QualityItemsDeleted;0)
	//ARRAY TEXT(JOB_at_JobDataTypes;0)
	//ARRAY TEXT(JOB_at_PermJobInfos;0)
	//ARRAY TEXT(QV_at_QualityGroups;0)
	//ARRAY TEXT(QV_at_QualityGroupsNM;0)
	//ARRAY TEXT(QV_at_QualityProperties;0;0)
	//ARRAY TEXT(QV_at_QualityPropertiesNAM;0;0)
	//ARRAY TEXT(QV_at_QualitySubGroups;0)
	//ARRAY TEXT(QV_at_QualitySubGroupsNM;0)
	C_BOOLEAN:C305(DB_bo_NoLoad; JOB_bo_ConfigisModified)
	C_LONGINT:C283($_l_ButtonPressed; $_l_event; $_l_GroupIndex; $_l_ListID; bAddQual; bdelQual; DB_l_ButtonClickedFunction; iCancel; iOK; JOB_l_InfoClass; JOB_l_QualityID)
	C_LONGINT:C283(JOB_l_QualitySubList; JOB_l_SelectedInfo; pJoba_l_BUT1; pJoba_l_BUT2; pJoba_l_BUT3; pJoba_l_BUT4; pJoba_l_BUT5; pJoba_l_BUT6; pJoba_l_BUT7; pJoba_l_BUT8; pJoba_l_BUT9)
	C_TEXT:C284($_t_oldMethodName; Job_t_DataName; JOB_t_DataType; oQuals_COL1; oQuals_COL2; oQuals_COL3; oQuals_COL4; oQuals_COL5; oQuals_COL6; oQuals_COL7; oQuals_COL8)
	C_TEXT:C284(oQuals_COL9; oQuals_HED1; oQuals_HED2; oQuals_HED3; oQuals_HED4; oQuals_HED5; oQuals_HED6; oQuals_HED7; oQuals_HED8; oQuals_HED9)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FM [USER].JOB_PermConfig"; Form event code:C388)

$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		WS_AutoscreenSize(2; 460; 730)
		SET WINDOW TITLE:C213("Perm Job Information configuration")
		JOB_l_SelectedInfo:=0
		OBJECT SET ENTERABLE:C238(Job_t_DataName; False:C215)
		OBJECT SET ENTERABLE:C238(JOB_t_DataType; False:C215)
		JOB_l_QualitySubList:=0
		JOB_LoadInformationGroupLinks
		Job_t_DataName:=""
		JOB_t_DataType:=""
		ARRAY TEXT:C222(JOB_at_JobDataTypes; 4)
		JOB_at_JobDataTypes{1}:="Textual Information only"
		JOB_at_JobDataTypes{2}:="Textual Information with list of selectable information"
		JOB_at_JobDataTypes{3}:="List of selectable information"
		JOB_at_JobDataTypes{4}:="Short text only(255 chars max)"
		ARRAY TEXT:C222(QV_at_QualityGroupsNM; 0)
		ARRAY LONGINT:C221(QV_al_QualityGroupsIDs; 0)
		ARRAY TEXT:C222(QV_at_QualityGroups; 0)
		ARRAY TEXT:C222(QV_at_QualityProperties; 0; 0)
		ARRAY LONGINT:C221(QV_al_QualityPropertiesNUM; 0; 0)
		ARRAY TEXT:C222(QV_at_QualityPropertiesNAM; 0; 0)
		$_l_ListID:=AA_LoadList(->[INFORMATION:55]QualityID:14; ->QV_at_QualityGroupsNM; ->QV_al_QualityGroupsIDs; False:C215; ->QV_at_QualityGroups; ->QV_at_QualityProperties; ->QV_al_QualityPropertiesNUM; ->QV_at_QualityPropertiesNAM)
		SORT ARRAY:C229(QV_at_QualityGroupsNM; QV_al_QualityGroupsIDs; QV_at_QualityGroups; QV_at_QualityProperties; QV_al_QualityPropertiesNUM; QV_at_QualityPropertiesNAM)
		
		OBJECT SET VISIBLE:C603(QV_lb_QualityNames; False:C215)
		OBJECT SET VISIBLE:C603(*; "oInfoLabel"; False:C215)
		OBJECT SET VISIBLE:C603(bdelQual; False:C215)
		OBJECT SET VISIBLE:C603(bAddQual; False:C215)
		//QV_at_QualitySubGroupsNM
		
		
		LB_SetupListbox(->QV_lb_QualityNames; "oQuals"; "pJoba_L"; 1; ->QV_at_QualitySubGroupsNM; ->QV_al_QualitySubGroupsIDs; ->QV_at_QualitySubGroups)
		
		//SET ENTERABLE(QV_at_QualitySubGroupsNM;False)
		OBJECT SET ENTERABLE:C238(QV_al_QualitySubGroupsIDs; False:C215)
		LB_SetColumnHeaders(->QV_lb_QualityNames; "pJoba_L"; 1; "Quality"; ""; "")
		LB_SetColumnWidths(->QV_lb_QualityNames; "oInfos"; 1; 250; 0; 0)
		LB_SetScroll(->QV_lb_QualityNames; -3; -2)
		LB_StyleSettings(->QV_lb_QualityNames; "Black"; 9; "oInfos"; ->[JOBS:26])
		
	: ($_l_event=On Outside Call:K2:11)
		Case of 
			: (((DB_l_ButtonClickedFunction#0)) | (iOK=1) | (iCancel=1))
				$_l_ButtonPressed:=DB_l_ButtonClickedFunction
				Case of 
					: ($_l_ButtonPressed=DB_GetButtonFunction("OK")) | (iOK=1)
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
						JOB_LoadInformationGroupLinks(False:C215)
						JOB_LoadInformationGroupLinks(True:C214)  //reload them
						ACCEPT:C269
					: ($_l_ButtonPressed=DB_GetButtonFunction("Cancel")) | (iCancel=1)
						CANCEL:C270
					: ($_l_ButtonPressed=DB_GetButtonFunction("PLUS"))  //add a quality if Page_2 or 3
						
				End case 
				DB_l_ButtonClickedFunction:=0
		End case 
		
End case 
ERR_MethodTrackerReturn("FM [USER].JOB_PermConfig"; $_t_oldMethodName)
