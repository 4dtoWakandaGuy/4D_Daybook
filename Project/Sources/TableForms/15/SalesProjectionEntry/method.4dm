If (False:C215)
	//Table Form Method Name: [USER]SalesProjectionEntry
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/10/2012 09:17
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(PRO_LB_Projections;0)
	ARRAY LONGINT:C221($_al_TempArray; 0)
	//ARRAY LONGINT(QV_al_TableRestrictionIDs;0)
	//ARRAY LONGINT(SP_al_CurrencyIDs;0)
	//ARRAY LONGINT(SP_al_LinkedTable;0)
	//ARRAY LONGINT(SP_al_ListPipelineStatus;0)
	//ARRAY LONGINT(SP_al_SalesProjectionTYPEID;0)
	//ARRAY REAL(SP_ar_Probability;0)
	//ARRAY TEXT(QV_at_TableRestrictionNMs;0)
	//ARRAY TEXT(SP_at_CurrencyCode;0)
	//ARRAY TEXT(SP_at_CurrencyNames;0)
	//ARRAY TEXT(SP_at_ListPipelineStatus;0)
	//ARRAY TEXT(SP_at_RelatedProjectionAct;0)
	//ARRAY TEXT(SP_at_RelatedProjectionOwner;0)
	//ARRAY TEXT(SP_at_RelatedProjectionprob;0)
	//ARRAY TEXT(SP_at_RelatedProjectionStatus;0)
	//ARRAY TEXT(SP_at_RelatedProjectionTitles;0)
	//ARRAY TEXT(SP_at_RelatedProjectionValue;0)
	//ARRAY TEXT(SP_at_RelationProjectionCurCode;0)
	//ARRAY TEXT(SP_at_SalesProjectionPROPS;0)
	//ARRAY TEXT(SP_at_SalesProjectionTYPE;0)
	C_BOOLEAN:C305(DB_bo_NoLoad)
	C_DATE:C307(SP_D_SalesEnteredDate; SP_D_SalesProjectionDate)
	C_LONGINT:C283($_l_CurrentElement; $_l_event; $_l_Index; $_l_MonitorCall; $_l_PipeLineStatusRow; $_l_RestrictedTableRow; $_l_RestrictionListID; $_l_SalesProjectionTypeRow; $_l_TypeIndex; PRO_l_BUT1; PRO_l_But2)
	C_LONGINT:C283(PRO_l_BUT3; PRO_l_BUT4; PRO_l_BUT5; PRO_l_BUT6; PRO_l_BUT7; PRO_l_BUT8; PRO_l_BUT9; SM_l_MonitorCall; SP_l_CurrencyID; SP_l_LoadSalesProjectionID; SP_l_ProjectionClassID)
	C_LONGINT:C283(SP_l_ProjectionGroupID; SP_l_ProjectionLevelID; SP_l_ProjectionPersonID; SP_l_RelatedCompanyID; SP_l_RelatedContactID; SP_l_RelatedRecordID; SP_l_relatedTableNUM; SP_l_SalesProjectionStateID; SP_l_Save; SP_l_Type)
	C_PICTURE:C286(SP_PIC_ProjectionType)
	C_POINTER:C301($_Ptr_Table)
	C_REAL:C285(SP_R_SalesProjectionACTUAL; SP_R_SalesProjectionCosts; SP_R_SalesProjectionPCT; SP_R_SalesProjectionValue)
	C_TEXT:C284(<>GPSalesManager; <>PER_t_CurrentUserInitials; <>PER_t_UserGroup; <>SYS_t_BaseCurrency; $_t_oldMethodName; $_t_TableName; $_t_TableName2; PRO_t_COL1; PRO_t_COL2; PRO_t_COL3; PRO_t_COL4)
	C_TEXT:C284(PRO_t_COL5; PRO_t_COL6; PRO_t_COL7; PRO_t_COL8; PRO_t_COL9; PRO_t_HED1; PRO_t_HED2; PRO_t_HED3; PRO_t_HED4; PRO_t_HED5; PRO_t_HED6)
	C_TEXT:C284(PRO_t_HED7; PRO_t_HED8; PRO_t_HED9; SD_t_SalesProjectionGROUP; SM_t_UseSetName; SP_t_SalesCurrency; SP_t_SalesOrderNUM; SP_t_SalesOrderState; SP_t_SalesOrderTitle; SP_t_SalesProjectionCompany; SP_t_SalesProjectionContact)
	C_TEXT:C284(SP_T_SalesProjectionDesc; SP_t_SalesProjectionPerson; SP_t_SalesProjectionState; SP_t_SalesProjectionTitle; SP_t_SalesProjectionType; SP_t_SalesStatus)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("FM [USER].SalesProjectionEntry"; Form event code:C388)
$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		OpenHelp(Table:C252(->[USER:15]); "SalesProjectionEntry")
		ARRAY TEXT:C222(SP_at_RelatedProjectionStatus; 0)
		ARRAY TEXT:C222(SP_at_RelationProjectionCurCode; 0)
		ARRAY TEXT:C222(SP_at_RelatedProjectionOwner; 0)
		ARRAY TEXT:C222(SP_at_RelatedProjectionTitles; 0)
		ARRAY TEXT:C222(SP_at_RelatedProjectionValue; 0)
		ARRAY TEXT:C222(SP_at_RelatedProjectionprob; 0)
		ARRAY TEXT:C222(SP_at_RelatedProjectionAct; 0)
		
		ARRAY REAL:C219(SP_ar_Probability; 0)
		SP_LoadStates
		SP_LoadLevels
		SP_LoadLinkTypes
		If (SP_l_LoadSalesProjectionID>0)  //1
			If (SP_l_Type=0)
				SP_l_Type:=1
			End if 
			Case of 
				: (SP_l_Type=1)  //this is set by the calling method
					SP_l_ProjectionLevelID:=[SALES_PROJECTION:113]Forcast_LevelID:3
					//existing pipeline order
					SET WINDOW TITLE:C213("Edit Pipeline Order")
					WS_AutoscreenSize(3; 201; 589)
					//load an exisiting Sales projection
					READ ONLY:C145([SALES_PROJECTION:113])
					QUERY:C277([SALES_PROJECTION:113]; [SALES_PROJECTION:113]x_ID:1=SP_l_LoadSalesProjectionID)
					SP_l_RelatedCompanyID:=[SALES_PROJECTION:113]CompanyID:6
					SP_t_SalesProjectionCompany:=SP_LoadCompany(SP_l_RelatedCompanyID)
					SP_l_RelatedContactID:=[SALES_PROJECTION:113]ContactID:7
					SP_t_SalesProjectionContact:=SP_loadContact(SP_l_RelatedContactID)
					SP_l_ProjectionPersonID:=[SALES_PROJECTION:113]PersonnelOwnerID:4
					SP_t_SalesProjectionPerson:=SP_loadPersonnel(SP_l_ProjectionPersonID)
					SP_l_ProjectionGroupID:=[SALES_PROJECTION:113]PersonnelGroupID:5
					SD_t_SalesProjectionGROUP:=SP_LoadPersonelGroup(SP_l_ProjectionGroupID)
					//`````````
					SP_t_SalesProjectionTitle:=[SALES_PROJECTION:113]Title:21
					SP_T_SalesProjectionDesc:=[SALES_PROJECTION:113]Description:11
					//````````````
					SP_R_SalesProjectionValue:=[SALES_PROJECTION:113]GrossValue:13
					SP_R_SalesProjectionCosts:=[SALES_PROJECTION:113]GrossCosts:14
					SP_R_SalesProjectionPCT:=[SALES_PROJECTION:113]Probability:17
					SP_R_SalesProjectionACTUAL:=[SALES_PROJECTION:113]ConvertedSaleValue:19
					//``````````````````
					SP_l_CurrencyID:=[SALES_PROJECTION:113]CurrencyID:12
					SP_t_SalesCurrency:=SP_LoadCurrencyName(SP_l_CurrencyID)
					//``````````````
					SP_D_SalesEnteredDate:=[SALES_PROJECTION:113]Date_Entered:10
					SP_D_SalesProjectionDate:=[SALES_PROJECTION:113]Expected_date:16
					//`````````````````````````
					SP_SetReadWrite(2; False:C215; False:C215)
					SP_l_Save:=0
					//is this updatable?
					//```````````````
					SP_l_relatedTableNUM:=[SALES_PROJECTION:113]RelatedSaleTableID:8
					
					SP_l_RelatedRecordID:=[SALES_PROJECTION:113]RelatedSaleRecordID:9
					SP_l_ProjectionClassID:=[SALES_PROJECTION:113]Class_ID:2
					If (SP_l_relatedTableNUM>0)
						$_l_RestrictionListID:=AA_GetListbyName("Table Restriction"; True:C214)
						ARRAY LONGINT:C221(QV_al_TableRestrictionIDs; 0)
						ARRAY TEXT:C222(QV_at_TableRestrictionNMs; 0)
						AA_LoadListbyID($_l_RestrictionListID; ->QV_at_TableRestrictionNMs; ->QV_al_TableRestrictionIDs)
						$_l_RestrictedTableRow:=Find in array:C230(QV_al_TableRestrictionIDs; SP_l_relatedTableNUM)
						SP_t_SalesOrderTitle:="Related "+Substring:C12(QV_at_TableRestrictionNMs{$_l_RestrictedTableRow}; 1; Length:C16(QV_at_TableRestrictionNMs{$_l_RestrictedTableRow})-1)[[1]]+Lowercase:C14(Substring:C12(Substring:C12(QV_at_TableRestrictionNMs{$_l_RestrictedTableRow}; 1; Length:C16(QV_at_TableRestrictionNMs{$_l_RestrictedTableRow})-1); 2; Length:C16(Substring:C12(QV_at_TableRestrictionNMs{$_l_RestrictedTableRow}; 1; Length:C16(QV_at_TableRestrictionNMs{$_l_RestrictedTableRow})-1))))
						If (SP_l_RelatedRecordID>0)
							SP_LoadRelated(->SP_l_relatedTableNUM; ->SP_l_RelatedRecordID; ->SP_t_SalesOrderNUM)
						Else 
							//do something here???
							//make the fields visible etc
						End if 
					End if 
					//````````````
					//the class of the projection for level 1 is based on the TYPE of the order/bookin
					If (SP_l_ProjectionClassID>0)
						$_l_SalesProjectionTypeRow:=Find in array:C230(SP_al_SalesProjectionTYPEID; SP_l_ProjectionClassID)
						If ($_l_SalesProjectionTypeRow>0)
							SP_t_SalesProjectionType:=SP_at_SalesProjectionTYPE{$_l_SalesProjectionTypeRow}
						End if 
					Else 
						SP_l_ProjectionClassID:=SP_GetSaleType(SP_l_relatedTableNUM; SP_l_RelatedRecordID)  //<------------------
						If (SP_l_ProjectionClassID>0)
							$_l_SalesProjectionTypeRow:=Find in array:C230(SP_al_SalesProjectionTYPEID; SP_l_ProjectionClassID)
							If ($_l_SalesProjectionTypeRow>0)
								SP_t_SalesProjectionType:=SP_at_SalesProjectionTYPE{$_l_SalesProjectionTypeRow}
							End if 
						End if 
					End if 
					//``````````````````````````````````````````
					SP_l_SalesProjectionStateID:=SP_GetSalesOrderState(SP_l_relatedTableNUM; SP_t_SalesOrderNUM; [SALES_PROJECTION:113]Status:20)
					If (SP_l_SalesProjectionStateID>0)
						$_l_PipeLineStatusRow:=Find in array:C230(SP_al_ListPipelineStatus; SP_l_SalesProjectionStateID)
						If ($_l_PipeLineStatusRow>0)
							SP_t_SalesProjectionState:=SP_at_ListPipelineStatus{$_l_PipeLineStatusRow}
							//if this is a converted sale we can calculate the actual values.
						Else 
							SP_t_SalesProjectionState:=SP_at_ListPipelineStatus{1}
							SP_l_SalesProjectionStateID:=SP_al_ListPipelineStatus{1}
						End if 
					End if 
				Else 
					
					
			End case 
			
		Else 
			//creating a new one
			SP_t_SalesProjectionType:=""
			//SP_l_Type=1=Sales pipeline
			//SP_l_Type=2=Projection
			If (SP_l_Type=0)
				SP_l_Type:=1
			End if 
			If (SP_l_Type=1)  //Sales Pipeline
				SP_l_Save:=0
				SET WINDOW TITLE:C213("Create Pipeline Order")
				WS_AutoscreenSize(3; 201; 589)
				SP_t_SalesProjectionPerson:=SP_loadPersonnel(SP_l_ProjectionPersonID)
				SD_t_SalesProjectionGROUP:=SP_LoadPersonelGroup(SP_l_ProjectionGroupID)
				If (SP_l_ProjectionPersonID=0)  //we know who it is for
					READ ONLY:C145([PERSONNEL:11])
					QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Initials:1=<>PER_t_CurrentUserInitials)
					SP_l_ProjectionPersonID:=[PERSONNEL:11]Personnel_ID:48
					SP_t_SalesProjectionPerson:=SP_loadPersonnel(SP_l_ProjectionPersonID)
					SD_t_SalesProjectionGROUP:=""
					If (SP_l_ProjectionGroupID=0)
						If (<>PER_t_UserGroup#"")
							QUERY:C277([PERSONNEL_GROUPS:92]; [PERSONNEL_GROUPS:92]Group_Code:1=<>PER_t_UserGroup)
							SP_l_ProjectionGroupID:=[PERSONNEL_GROUPS:92]x_ID:12
							SD_t_SalesProjectionGROUP:=SP_LoadPersonelGroup(SP_l_ProjectionGroupID)
						Else 
							SP_l_ProjectionGroupID:=0
							SD_t_SalesProjectionGROUP:=""
						End if 
					Else 
						SD_t_SalesProjectionGROUP:=SP_LoadPersonelGroup(SP_l_ProjectionGroupID)
					End if 
				End if 
				//Do we have a related order
				SP_R_SalesProjectionValue:=0
				SP_R_SalesProjectionValue:=0
				SP_t_SalesProjectionCompany:=""
				SP_t_SalesProjectionContact:=""
				SP_SetReadWrite(1; True:C214; True:C214)
				SP_D_SalesEnteredDate:=Current date:C33(*)
				If (SP_D_SalesProjectionDate=!00-00-00!)
					OBJECT SET ENTERABLE:C238(SP_D_SalesProjectionDate; True:C214)
				End if 
				ARRAY REAL:C219(SP_ar_Probability; 10)
				$_l_CurrentElement:=0
				For ($_l_Index; 10; 100; 10)
					$_l_CurrentElement:=$_l_CurrentElement+1
					SP_ar_Probability{$_l_CurrentElement}:=$_l_Index
				End for 
				
				
				If (SP_l_relatedTableNUM>0)
					If (SP_t_SalesOrderNUM#"")
						SP_LoadRelated(->SP_l_relatedTableNUM; ->SP_l_RelatedRecordID; ->SP_t_SalesOrderNUM)
						SP_GetOtherrelated(->SP_l_relatedTableNUM; ->SP_l_RelatedRecordID; ->SP_l_CurrencyID; ->SP_l_relatedCOmpanyID; ->SP_l_relatedCOntactID)
						$_l_RestrictedTableRow:=Find in array:C230(QV_al_TableRestrictionIDs; SP_l_relatedTableNUM)
						SP_t_SalesOrderTitle:="Related "+Substring:C12(QV_at_TableRestrictionNMs{$_l_RestrictedTableRow}; 1; Length:C16(QV_at_TableRestrictionNMs{$_l_RestrictedTableRow})-1)[[1]]+Lowercase:C14(Substring:C12(Substring:C12(QV_at_TableRestrictionNMs{$_l_RestrictedTableRow}; 1; Length:C16(QV_at_TableRestrictionNMs{$_l_RestrictedTableRow})-1); 2; Length:C16(Substring:C12(QV_at_TableRestrictionNMs{$_l_RestrictedTableRow}; 1; Length:C16(QV_at_TableRestrictionNMs{$_l_RestrictedTableRow})-1))))
						OBJECT SET VISIBLE:C603(*; "Text_ProjectionType"; False:C215)
						OBJECT SET VISIBLE:C603(SP_t_SalesOrderTitle; True:C214)
						OBJECT SET ENTERABLE:C238(SP_T_SalesProjectionDesc; True:C214)
						OBJECT SET ENTERABLE:C238(SP_t_SalesProjectionTitle; True:C214)
						OBJECT SET VISIBLE:C603(SP_t_SalesProjectionType; False:C215)
						OBJECT SET VISIBLE:C603(SP_at_SalesProjectionTYPE; False:C215)
						OBJECT SET VISIBLE:C603(SP_PIC_ProjectionType; False:C215)
						OBJECT SET VISIBLE:C603(SP_t_SalesOrderState; True:C214)
						SP_l_SalesProjectionStateID:=SP_GetSalesOrderState(SP_l_relatedTableNUM; SP_t_SalesOrderNUM; SP_l_SalesProjectionStateID)
						If (SP_l_SalesProjectionStateID>0)
							$_l_PipeLineStatusRow:=Find in array:C230(SP_al_ListPipelineStatus; SP_l_SalesProjectionStateID)
							If ($_l_PipeLineStatusRow>0)
								SP_t_SalesProjectionState:=SP_at_ListPipelineStatus{1}
							End if 
						End if 
						//``
						If ([SALES_PROJECTION:113]GrossValue:13=0)
							SP_R_SalesProjectionValue:=SP_GetSalesOrderValue(SP_l_relatedTableNUM; SP_t_SalesOrderNUM)
						End if 
						SP_D_SalesProjectionDate:=SP_GetSalesOrderDate(SP_l_relatedTableNUM; SP_t_SalesOrderNUM)
					Else 
						//not yet related to any records
						//but is related to a table
						$_l_RestrictedTableRow:=Find in array:C230(QV_al_TableRestrictionIDs; SP_l_relatedTableNUM)
						$_t_TableName:=QV_at_TableRestrictionNMs{$_l_RestrictedTableRow}
						OBJECT SET VISIBLE:C603(*; "Text_ProjectionType"; True:C214)
						OBJECT SET VISIBLE:C603(SP_t_SalesOrderTitle; False:C215)
						OBJECT SET ENTERABLE:C238(SP_T_SalesProjectionDesc; False:C215)
						OBJECT SET ENTERABLE:C238(SP_t_SalesProjectionTitle; False:C215)
						OBJECT SET VISIBLE:C603(SP_t_SalesProjectionType; True:C214)
						SP_t_SalesProjectionType:=$_t_TableName
						OBJECT SET VISIBLE:C603(SP_at_SalesProjectionTYPE; False:C215)
						OBJECT SET VISIBLE:C603(SP_PIC_ProjectionType; False:C215)
						OBJECT SET VISIBLE:C603(SP_t_SalesOrderState; False:C215)
						OBJECT SET VISIBLE:C603(SP_t_SalesStatus; False:C215)
						OBJECT SET VISIBLE:C603(SP_al_SalesProjectionTYPEID; False:C215)
						OBJECT SET VISIBLE:C603(SP_t_SalesProjectionType; False:C215)
						OBJECT SET VISIBLE:C603(*; "SP_PIC_ProjectionType"; False:C215)
						OBJECT SET VISIBLE:C603(SP_t_SalesOrderNUM; True:C214)
						OBJECT SET VISIBLE:C603(*; "Text_ProjectionType"; False:C215)
						OBJECT SET VISIBLE:C603(SP_t_SalesOrderTitle; True:C214)
						OBJECT SET ENTERABLE:C238(SP_t_SalesOrderNUM; True:C214)
						
					End if 
				Else 
					//not related to a table or record yet
					OBJECT SET VISIBLE:C603(*; "Text_ProjectionType"; True:C214)
					OBJECT SET VISIBLE:C603(SP_t_SalesOrderTitle; False:C215)
					OBJECT SET ENTERABLE:C238(SP_T_SalesProjectionDesc; False:C215)
					OBJECT SET ENTERABLE:C238(SP_t_SalesProjectionTitle; False:C215)
					OBJECT SET VISIBLE:C603(SP_t_SalesProjectionType; True:C214)
					
					OBJECT SET VISIBLE:C603(SP_at_SalesProjectionTYPE; True:C214)
					OBJECT SET VISIBLE:C603(SP_PIC_ProjectionType; True:C214)
					OBJECT SET VISIBLE:C603(SP_t_SalesOrderState; False:C215)
					OBJECT SET VISIBLE:C603(SP_t_SalesStatus; False:C215)
				End if 
				If (SP_l_ProjectionClassID>0)
					$_l_SalesProjectionTypeRow:=Find in array:C230(SP_al_SalesProjectionTYPEID; SP_l_ProjectionClassID)
					If ($_l_SalesProjectionTypeRow>0)
						$_t_TableName:=SP_at_SalesProjectionTYPE{$_l_SalesProjectionTypeRow}
						SP_t_SalesOrderTitle:="Related "+$_t_TableName
					End if 
				Else 
					ARRAY LONGINT:C221($_al_TempArray; 0)
					ARRAY LONGINT:C221($_al_TempArray; Size of array:C274(SP_al_SalesProjectionTYPEID))
					If (SP_l_relatedTableNUM>0)
						For ($_l_TypeIndex; 1; Size of array:C274(SP_al_SalesProjectionTYPEID))
							If (SP_al_LinkedTable{$_l_TypeIndex}=SP_l_relatedTableNUM)
								$_al_TempArray{$_l_TypeIndex}:=1
							End if 
						End for 
						For ($_l_TypeIndex; Size of array:C274(SP_al_SalesProjectionTYPEID); 1; -1)
							If ($_al_TempArray{$_l_TypeIndex}=0)
								DELETE FROM ARRAY:C228(SP_at_SalesProjectionTYPE; $_l_TypeIndex; 1)
								DELETE FROM ARRAY:C228(SP_al_SalesProjectionTYPEID; $_l_TypeIndex; 1)
								DELETE FROM ARRAY:C228(SP_at_SalesProjectionPROPS; $_l_TypeIndex; 1)
								DELETE FROM ARRAY:C228(SP_al_LinkedTable; $_l_TypeIndex; 1)
							End if 
						End for 
						If (Size of array:C274(SP_al_LinkedTable)=1)
							SP_l_relatedTableNUM:=SP_al_LinkedTable{1}
							SP_l_ProjectionClassID:=SP_al_SalesProjectionTYPEID{1}
							OBJECT SET VISIBLE:C603(*; "Text_ProjectionType"; True:C214)
							OBJECT SET VISIBLE:C603(SP_t_SalesProjectionType; True:C214)
							SP_t_SalesProjectionType:=SP_at_SalesProjectionTYPE{1}
							OBJECT SET VISIBLE:C603(SP_at_SalesProjectionTYPE; False:C215)
							OBJECT SET VISIBLE:C603(SP_PIC_ProjectionType; False:C215)
							OBJECT SET VISIBLE:C603(SP_t_SalesOrderState; False:C215)
							OBJECT SET VISIBLE:C603(SP_t_SalesStatus; False:C215)
						End if 
						
					End if 
					
					
					
					
				End if 
				//``````````
				READ ONLY:C145([CURRENCIES:71])
				
				If (SP_l_CurrencyID>0)
					READ ONLY:C145([CURRENCIES:71])
					QUERY:C277([CURRENCIES:71]; [CURRENCIES:71]X_ID:3=SP_l_CurrencyID)
					SP_t_SalesCurrency:=[CURRENCIES:71]Currency_Code:1
					OBJECT SET VISIBLE:C603(SP_at_CurrencyNames; False:C215)
					OBJECT SET VISIBLE:C603(*; "PICT_CurrencyCode"; False:C215)
				Else 
					READ ONLY:C145([CURRENCIES:71])
					ALL RECORDS:C47([CURRENCIES:71])
					SELECTION TO ARRAY:C260([CURRENCIES:71]Currency_Code:1; SP_at_CurrencyCode; [CURRENCIES:71]Currency_Name:2; SP_at_CurrencyNames; [CURRENCIES:71]X_ID:3; SP_al_CurrencyIDs)
					OBJECT SET VISIBLE:C603(SP_at_CurrencyNames; True:C214)
					OBJECT SET VISIBLE:C603(*; "PICT_CurrencyCode"; True:C214)
					If (<>SYS_t_BaseCurrency#"")
						READ ONLY:C145([CURRENCIES:71])
						QUERY:C277([CURRENCIES:71]; [CURRENCIES:71]Currency_Code:1=<>SYS_t_BaseCurrency)
						SP_l_CurrencyID:=[CURRENCIES:71]X_ID:3
						SP_t_SalesCurrency:=<>SYS_t_BaseCurrency
						OBJECT SET VISIBLE:C603(SP_R_SalesProjectionValue; True:C214)
						OBJECT SET ENTERABLE:C238(SP_R_SalesProjectionValue; True:C214)
						OBJECT SET VISIBLE:C603(SP_R_SalesProjectionCosts; True:C214)
						OBJECT SET ENTERABLE:C238(SP_R_SalesProjectionCosts; True:C214)
					End if 
				End if 
				If (SP_l_relatedCOmpanyID>0)
					If ([COMPANIES:2]x_ID:63#SP_l_relatedCOmpanyID)
						READ ONLY:C145([COMPANIES:2])
						QUERY:C277([COMPANIES:2]; [COMPANIES:2]x_ID:63=SP_l_relatedCOmpanyID)
					End if 
					
					SP_t_SalesProjectionCompany:=[COMPANIES:2]Company_Name:2
					OBJECT SET ENTERABLE:C238(SP_t_SalesProjectionCompany; False:C215)
				Else 
					OBJECT SET ENTERABLE:C238(SP_t_SalesProjectionCompany; True:C214)
				End if 
				If (SP_l_RelatedContactID>0)
					If ([CONTACTS:1]x_ID:33#SP_l_RelatedContactID)
						READ ONLY:C145([CONTACTS:1])
						QUERY:C277([CONTACTS:1]; [CONTACTS:1]x_ID:33=SP_l_RelatedContactID)
					End if 
					SP_t_SalesProjectionContact:=[CONTACTS:1]Contact_Name:31
					OBJECT SET ENTERABLE:C238(SP_t_SalesProjectionContact; False:C215)
					
				Else 
					OBJECT SET ENTERABLE:C238(SP_t_SalesProjectionContact; True:C214)
				End if 
				
				
				SP_t_SalesProjectionTitle:=""
				SP_T_SalesProjectionDesc:=""
				OBJECT SET ENTERABLE:C238(SP_t_SalesProjectionTitle; True:C214)
				OBJECT SET ENTERABLE:C238(SP_T_SalesProjectionDesc; True:C214)
				OBJECT SET ENTERABLE:C238(SP_R_SalesProjectionValue; True:C214)
				
				OBJECT SET ENTERABLE:C238(SP_R_SalesProjectionCosts; True:C214)
				GOTO OBJECT:C206(SP_t_SalesProjectionTitle)
				
			Else 
				
				
				If (False:C215)
					//
					If (<>PER_t_CurrentUserInitials=<>GPSalesManager)
						
						//user can enter personal projection OR a projection for the group
						If (SP_l_RelatedCompanyID=0) & (SP_l_RelatedContactID=0)
							//this is not in relation to a specific company
							//so set up the pop up
						Else 
							//this is in relation to a specific company so must be personal projection
							
						End if 
						
					Else 
						//user can only enter their own projections
						
					End if 
				End if 
				
				//```end setting up 'Sales projection for'
				//now set up Sales projection type
				//here we need to check what modules are installed-the values depend on that
				//`````
				
				SP_LoadLinkTypes
				
				//```````` now
				//  load up the projection levels
				
				
				//we have now loaded the levels etc
				//if we have been passed a contact or company this is a level one entry
				//so hide the pop-up and
				//set the type
				//   if we know the projected sale type
				//if this is not a level one projection
				//hide the company and contact name fields
				//set up the array (empty) for the Sales projections
				//
				Case of 
					: (SP_l_RelatedCompanyID>0)
						READ ONLY:C145([COMPANIES:2])
						QUERY:C277([COMPANIES:2]; [COMPANIES:2]x_ID:63=SP_l_RelatedCompanyID)
						SP_t_SalesProjectionCompany:=[COMPANIES:2]Company_Name:2
						
						If (SP_l_relatedTableNUM>0)
						End if 
						
					: (SP_l_RelatedContactID>0)
						READ ONLY:C145([CONTACTS:1])
						QUERY:C277([CONTACTS:1]; [CONTACTS:1]x_ID:33=SP_l_RelatedContactID)
						SP_t_SalesProjectionContact:=[CONTACTS:1]Contact_Name:31
				End case 
			End if 
		End if 
		//PRO_LB_Projections
		
		LB_SetupListbox(->PRO_LB_Projections; "PRO_t"; "PRO_L"; 1; ->SP_at_RelatedProjectionTitles; ->SP_at_RelatedProjectionOwner; ->SP_at_RelationProjectionCurCode; ->SP_at_RelatedProjectionValue; ->SP_at_RelatedProjectionprob; ->SP_at_RelatedProjectionAct; ->SP_at_RelatedProjectionStatus)
		
		LB_SetColumnHeaders(->PRO_LB_Projections; "PRO_L"; 1; "Title"; "Owner"; "Currency"; "Value"; "Probability"; "Action"; "Status")
		
		LB_SetColumnWidths(->PRO_LB_Projections; "PRO_t"; 1; 162; 122; 32; 48; 32; 32; 98)
		LB_SetScroll(->PRO_LB_Projections; -3; -2)
		LB_StyleSettings(->PRO_LB_Projections; "Black"; 9; "PRO_t"; ->[ACCOUNTS:32])
		LB_SetEnterable(->PRO_LB_Projections; False:C215; 0)
		
	: ($_l_event=On Outside Call:K2:11)
		If (SM_l_MonitorCall>0)
			$_l_MonitorCall:=SM_l_MonitorCall
			SM_l_MonitorCall:=0
			USE SET:C118(SM_t_UseSetName)
			//need to know what table
			$_l_RestrictedTableRow:=Find in array:C230(QV_al_TableRestrictionIDs; SP_l_relatedTableNUM)
			$_t_TableName2:=QV_at_TableRestrictionNMs{$_l_RestrictedTableRow}
			//NG March 2004 does the following line work????
			$_Ptr_Table:=Get pointer:C304("["+$_t_TableName2+"]")
			If (Records in selection:C76($_Ptr_Table->)=1)
				Case of 
					: ($_t_TableName2="ORDERS")
						SP_t_SalesOrderNUM:=[ORDERS:24]Order_Code:3
						
				End case 
				//````````
				SP_l_RelatedRecordID:=0
				$_l_RestrictionListID:=AA_GetListbyName("Table Restriction"; True:C214)
				ARRAY LONGINT:C221(QV_al_TableRestrictionIDs; 0)
				ARRAY TEXT:C222(QV_at_TableRestrictionNMs; 0)
				AA_LoadListbyID($_l_RestrictionListID; ->QV_at_TableRestrictionNMs; ->QV_al_TableRestrictionIDs)
				SP_LoadRelated(->SP_l_relatedTableNUM; ->SP_l_RelatedRecordID; ->SP_t_SalesOrderNUM)
				SP_GetOtherrelated(->SP_l_relatedTableNUM; ->SP_l_RelatedRecordID; ->SP_l_CurrencyID; ->SP_l_relatedCOmpanyID; ->SP_l_relatedCOntactID)
				//now the screen values can be set
				SP_t_SalesProjectionCompany:=SP_LoadCompany(SP_l_RelatedCompanyID)
				SP_t_SalesProjectionContact:=SP_loadContact(SP_l_RelatedContactID)
				SP_t_SalesCurrency:=SP_LoadCurrencyName(SP_l_CurrencyID)
				
				If (SP_l_ProjectionClassID=0)
					SP_l_ProjectionClassID:=SP_GetSaleType(SP_l_relatedTableNUM; SP_l_RelatedRecordID)  //<------------------
					If (SP_l_ProjectionClassID>0)
						$_l_SalesProjectionTypeRow:=Find in array:C230(SP_al_SalesProjectionTYPEID; SP_l_ProjectionClassID)
						If ($_l_SalesProjectionTypeRow>0)
							SP_t_SalesProjectionType:=SP_at_SalesProjectionTYPE{$_l_SalesProjectionTypeRow}
						End if 
					End if 
				End if 
				//Get the related contacts etc
				
				
				
				SP_l_SalesProjectionStateID:=SP_GetSalesOrderState(SP_l_relatedTableNUM; SP_t_SalesOrderNUM; [SALES_PROJECTION:113]Status:20)
				If (SP_l_SalesProjectionStateID>0)
					$_l_PipeLineStatusRow:=Find in array:C230(SP_al_ListPipelineStatus; SP_l_SalesProjectionStateID)
					If ($_l_PipeLineStatusRow>0)
						SP_t_SalesProjectionState:=SP_at_ListPipelineStatus{$_l_PipeLineStatusRow}
						//if this is a converted sale we can calculate the actual values.
					Else 
						SP_t_SalesProjectionState:=SP_at_ListPipelineStatus{1}
						SP_l_SalesProjectionStateID:=SP_al_ListPipelineStatus{1}
					End if 
				End if 
				SP_R_SalesProjectionValue:=SP_GetSalesOrderValue(SP_l_relatedTableNUM; SP_t_SalesOrderNUM; ->SP_R_SalesProjectionACTUAL)
				If (SP_R_SalesProjectionACTUAL>0)
					OBJECT SET VISIBLE:C603(SP_R_SalesProjectionACTUAL; True:C214)
					OBJECT SET VISIBLE:C603(*; "Text_actual"; True:C214)
					
					OBJECT SET ENTERABLE:C238(SP_R_SalesProjectionACTUAL; False:C215)
					SP_R_SalesProjectionPCT:=100
					OBJECT SET ENTERABLE:C238(SP_R_SalesProjectionPCT; False:C215)
					
				End if 
				
				SP_D_SalesProjectionDate:=SP_GetSalesOrderDate(SP_l_relatedTableNUM; SP_t_SalesOrderNUM)
				
				//``
			End if 
			
		Else 
		End if 
		
End case 
ERR_MethodTrackerReturn("FM [USER].SalesProjectionEntry"; $_t_oldMethodName)
