If (False:C215)
	//Table Form Method Name: [SALES_PROJECTION]SalesProjectionEntry
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
	//ARRAY LONGINT(QV_al_TableRestrictionIDs;0)
	//ARRAY LONGINT(SP_al_CurrencyIDs;0)
	//ARRAY LONGINT(SP_al_GroupIDs;0)
	//ARRAY LONGINT(SP_al_ListPipelineStatus;0)
	//ARRAY LONGINT(SP_al_ProjectionProbability;0)
	//ARRAY LONGINT(SP_al_SalesProjectionTYPEID;0)
	//ARRAY TEXT(QV_at_TableRestrictionNMs;0)
	//ARRAY TEXT(SP_at_CurrencyCode;0)
	//ARRAY TEXT(SP_at_CurrencyNames;0)
	//ARRAY TEXT(SP_at_GroupCodes;0)
	//ARRAY TEXT(SP_at_GroupNames;0)
	//ARRAY TEXT(SP_at_ListPipelineStatus;0)
	//ARRAY TEXT(SP_at_SalesProjectionTYPE;0)
	C_BOOLEAN:C305(DB_bo_NoLoad)
	C_LONGINT:C283(<>PER_l_CurrentUserID; $_l_Element; $_l_event; $_l_Index; $_l_ProjectionTypeRow; $_l_RequiredSize; $_l_RestrictionListID; $_l_StatusRow; SP_l_UsersnGroups)
	C_TEXT:C284(<>SYS_t_BaseCurrency; $_t_oldMethodName; SD_t_SalesProjectionGROUP; SP_t_SalesCurrency; SP_t_SalesOrderNUM; SP_t_SalesOrderTitle; SP_t_SalesProjectionCompany; SP_t_SalesProjectionContact; SP_t_SalesProjectionPerson; SP_t_SalesProjectionState; SP_t_SalesProjectionType)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("FM [SALES_PROJECTION].SalesProjectionEntry"; Form event code:C388)
$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		OpenHelp(Table:C252(->[SALES_PROJECTION:113]); "SalesProjectionEntry")
		$_l_RestrictionListID:=AA_GetListbyName("Table Restriction"; True:C214)
		ARRAY LONGINT:C221(QV_al_TableRestrictionIDs; 0)
		ARRAY TEXT:C222(QV_at_TableRestrictionNMs; 0)
		AA_LoadListbyID($_l_RestrictionListID; ->QV_at_TableRestrictionNMs; ->QV_al_TableRestrictionIDs)
		//--------------
		SP_LoadStates
		SP_LoadLevels
		SP_LoadLinkTypes
		If ([SALES_PROJECTION:113]x_ID:1>0)  //existing record
			SET WINDOW TITLE:C213("Edit Pipeline Order")
			$_l_RequiredSize:=(Length:C16([SALES_PROJECTION:113]Description:11)/80)
			If ($_l_RequiredSize<5)
				WS_AutoscreenSize(3; 249; 559)
			Else 
				WS_AutoscreenSize(3; 251+(12*($_l_RequiredSize-5)); 559)
			End if 
			
			If ([SALES_PROJECTION:113]PersonnelOwnerID:4>0) | ([SALES_PROJECTION:113]PersonnelGroupID:5>0)
				//this belongs to a person it cannot be changed
				OBJECT SET VISIBLE:C603(*; "SP_pic_UGPopUP"; False:C215)
				OBJECT SET VISIBLE:C603(SP_l_UsersnGroups; False:C215)
				SP_t_SalesProjectionPerson:=SP_loadPersonnel([SALES_PROJECTION:113]PersonnelOwnerID:4)
				SD_t_SalesProjectionGROUP:=SP_LoadPersonelGroup([SALES_PROJECTION:113]PersonnelGroupID:5)
			Else 
				If (User in group:C338(Current user:C182; "Administrator")) | (User in group:C338(Current user:C182; "Manager"))
					SP_GetUsersAndGroups
					
					[SALES_PROJECTION:113]PersonnelOwnerID:4:=<>PER_l_CurrentUserID
					QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Personnel_ID:48=<>PER_l_CurrentUserID)
					SP_t_SalesProjectionPerson:=[PERSONNEL:11]Name:2
					UNLOAD RECORD:C212([PERSONNEL:11])
				Else 
					[SALES_PROJECTION:113]PersonnelOwnerID:4:=<>PER_l_CurrentUserID
					QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Personnel_ID:48=<>PER_l_CurrentUserID)
					SP_t_SalesProjectionPerson:=[PERSONNEL:11]Name:2
					UNLOAD RECORD:C212([PERSONNEL:11])
					OBJECT SET VISIBLE:C603(*; "SP_pic_UGPopUP"; False:C215)
					OBJECT SET VISIBLE:C603(SP_l_UsersnGroups; False:C215)
				End if 
			End if 
			
		Else   //new record
			[SALES_PROJECTION:113]Date_Entered:10:=Current date:C33(*)
			SET WINDOW TITLE:C213("Enter Pipeline Order")
			WS_AutoscreenSize(3; 249; 559)
			ARRAY TEXT:C222(SP_at_GroupCodes; 0)
			ARRAY TEXT:C222(SP_at_GroupNames; 0)
			ARRAY LONGINT:C221(SP_al_GroupIDs; 0)
			
			If (User in group:C338(Current user:C182; "Administrator")) | (User in group:C338(Current user:C182; "Manager"))
				SP_GetUsersAndGroups
				
				[SALES_PROJECTION:113]PersonnelOwnerID:4:=<>PER_l_CurrentUserID
				QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Personnel_ID:48=<>PER_l_CurrentUserID)
				SP_t_SalesProjectionPerson:=[PERSONNEL:11]Name:2
				UNLOAD RECORD:C212([PERSONNEL:11])
			Else 
				
				[SALES_PROJECTION:113]PersonnelOwnerID:4:=<>PER_l_CurrentUserID
				QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Personnel_ID:48=<>PER_l_CurrentUserID)
				SP_t_SalesProjectionPerson:=[PERSONNEL:11]Name:2
				UNLOAD RECORD:C212([PERSONNEL:11])
				OBJECT SET VISIBLE:C603(*; "SP_pic_UGPopUP"; False:C215)
				OBJECT SET VISIBLE:C603(SP_l_UsersnGroups; False:C215)
			End if 
			SP_SetValues
		End if 
		SP_t_SalesProjectionCompany:=SP_LoadCompany([SALES_PROJECTION:113]CompanyID:6)
		SP_t_SalesProjectionContact:=SP_loadContact([SALES_PROJECTION:113]ContactID:7)
		If ([SALES_PROJECTION:113]CurrencyID:12>0)
			SP_t_SalesCurrency:=SP_LoadCurrencyName([SALES_PROJECTION:113]CurrencyID:12)
		Else 
			READ ONLY:C145([CURRENCIES:71])
			ALL RECORDS:C47([CURRENCIES:71])
			SELECTION TO ARRAY:C260([CURRENCIES:71]Currency_Code:1; SP_at_CurrencyCode; [CURRENCIES:71]Currency_Name:2; SP_at_CurrencyNames; [CURRENCIES:71]X_ID:3; SP_al_CurrencyIDs)
			OBJECT SET VISIBLE:C603(SP_at_CurrencyNames; True:C214)
			OBJECT SET VISIBLE:C603(*; "PICT_CurrencyCode"; True:C214)
			If (<>SYS_t_BaseCurrency#"")
				READ ONLY:C145([CURRENCIES:71])
				QUERY:C277([CURRENCIES:71]; [CURRENCIES:71]Currency_Code:1=<>SYS_t_BaseCurrency)
				[SALES_PROJECTION:113]CurrencyID:12:=[CURRENCIES:71]X_ID:3
				SP_t_SalesCurrency:=<>SYS_t_BaseCurrency
			End if 
		End if 
		
		If ([SALES_PROJECTION:113]RelatedSaleRecordID:9>0)
			If ([SALES_PROJECTION:113]Class_ID:2=0)
				Repeat 
					[SALES_PROJECTION:113]Class_ID:2:=SP_GetSaleType([SALES_PROJECTION:113]RelatedSaleTableID:8; [SALES_PROJECTION:113]RelatedSaleRecordID:9)
				Until ([SALES_PROJECTION:113]Class_ID:2>0)  //must select one
			End if 
			
			SP_t_SalesOrderTitle:="Related "+SP_at_SalesProjectionTYPE{Find in array:C230(SP_al_SalesProjectionTYPEID; [SALES_PROJECTION:113]Class_ID:2)}
			OBJECT SET VISIBLE:C603(SP_t_SalesProjectionType; False:C215)
			OBJECT SET VISIBLE:C603(SP_t_SalesOrderNUM; True:C214)
			OBJECT SET VISIBLE:C603(SP_t_SalesOrderTitle; True:C214)
			OBJECT SET VISIBLE:C603(*; "Text_ProjectionType"; False:C215)
			SP_LoadRelated(->[SALES_PROJECTION:113]RelatedSaleTableID:8; ->[SALES_PROJECTION:113]RelatedSaleRecordID:9; ->SP_t_SalesOrderNUM)
			SP_GetOtherrelated(->[SALES_PROJECTION:113]RelatedSaleTableID:8; ->[SALES_PROJECTION:113]RelatedSaleRecordID:9; ->[SALES_PROJECTION:113]CurrencyID:12; ->[SALES_PROJECTION:113]CompanyID:6; ->[SALES_PROJECTION:113]ContactID:7)
			If ([SALES_PROJECTION:113]Class_ID:2>0)
				$_l_ProjectionTypeRow:=Find in array:C230(SP_al_SalesProjectionTYPEID; [SALES_PROJECTION:113]Class_ID:2)
				OBJECT SET VISIBLE:C603(*; "PICT_CurrencyCode"; False:C215)
				OBJECT SET VISIBLE:C603(SP_at_CurrencyNames; True:C214)
				
				If ($_l_ProjectionTypeRow>0)
					SP_t_SalesProjectionType:=SP_at_SalesProjectionTYPE{$_l_ProjectionTypeRow}
				End if 
			Else 
				[SALES_PROJECTION:113]Class_ID:2:=SP_GetSaleType([SALES_PROJECTION:113]RelatedSaleTableID:8; [SALES_PROJECTION:113]RelatedSaleRecordID:9)
				If ([SALES_PROJECTION:113]Class_ID:2>0)
					$_l_ProjectionTypeRow:=Find in array:C230(SP_al_SalesProjectionTYPEID; [SALES_PROJECTION:113]Class_ID:2)
					If ($_l_ProjectionTypeRow>0)
						SP_t_SalesProjectionType:=SP_at_SalesProjectionTYPE{$_l_ProjectionTypeRow}
					End if 
				End if 
			End if 
			[SALES_PROJECTION:113]Status:20:=SP_GetSalesOrderState([SALES_PROJECTION:113]RelatedSaleTableID:8; SP_t_SalesOrderNUM; [SALES_PROJECTION:113]Status:20)
			If ([SALES_PROJECTION:113]Status:20>0)
				$_l_StatusRow:=Find in array:C230(SP_al_ListPipelineStatus; [SALES_PROJECTION:113]Status:20)
				If ($_l_StatusRow>0)
					SP_t_SalesProjectionState:=SP_at_ListPipelineStatus{$_l_StatusRow}
					
				Else 
					SP_t_SalesProjectionState:=SP_at_ListPipelineStatus{1}
					[SALES_PROJECTION:113]Status:20:=SP_al_ListPipelineStatus{1}
				End if 
			End if 
			If ([SALES_PROJECTION:113]GrossValue:13=0)
				[SALES_PROJECTION:113]ConvertedSaleValue:19:=SP_GetSalesOrderValue([SALES_PROJECTION:113]RelatedSaleTableID:8; SP_t_SalesOrderNUM; ->[SALES_PROJECTION:113]ConvertedSaleValue:19; ->[SALES_PROJECTION:113]Probability:17; ->[SALES_PROJECTION:113]Expected_date:16; ->[SALES_PROJECTION:113]ConvertedSaleCosts:28)
				
				If ([SALES_PROJECTION:113]ConvertedSaleValue:19>0)
					OBJECT SET VISIBLE:C603([SALES_PROJECTION:113]ConvertedSaleValue:19; True:C214)
					OBJECT SET VISIBLE:C603([SALES_PROJECTION:113]ConvertedSaleCosts:28; True:C214)
					OBJECT SET VISIBLE:C603(*; "Text_actual"; True:C214)
				Else 
					OBJECT SET ENTERABLE:C238([SALES_PROJECTION:113]ConvertedSaleValue:19; False:C215)
					OBJECT SET ENTERABLE:C238([SALES_PROJECTION:113]ConvertedSaleCosts:28; False:C215)
				End if 
				
			End if 
			[SALES_PROJECTION:113]Expected_date:16:=SP_GetSalesOrderDate([SALES_PROJECTION:113]RelatedSaleTableID:8; SP_t_SalesOrderNUM; [SALES_PROJECTION:113]ConvertedSaleValue:19)
		Else 
			If ([SALES_PROJECTION:113]Status:20>0)
				$_l_StatusRow:=Find in array:C230(SP_al_ListPipelineStatus; [SALES_PROJECTION:113]Status:20)
				If ($_l_StatusRow>0)
					SP_t_SalesProjectionState:=SP_at_ListPipelineStatus{$_l_StatusRow}
					
				Else 
					SP_t_SalesProjectionState:=SP_at_ListPipelineStatus{1}
					[SALES_PROJECTION:113]Status:20:=SP_al_ListPipelineStatus{1}
				End if 
			End if 
			//not related to a record
			//but it could be related to a table already
			
			
			If ([SALES_PROJECTION:113]RelatedSaleTableID:8>0)
				If ([SALES_PROJECTION:113]Class_ID:2=0)
					[SALES_PROJECTION:113]Class_ID:2:=SP_GetSaleType([SALES_PROJECTION:113]RelatedSaleTableID:8; [SALES_PROJECTION:113]RelatedSaleRecordID:9)
				End if 
				OBJECT SET ENTERABLE:C238(SP_t_SalesOrderNUM; True:C214)
				
				SP_t_SalesOrderTitle:="Related "+SP_at_SalesProjectionTYPE{Find in array:C230(SP_al_SalesProjectionTYPEID; [SALES_PROJECTION:113]Class_ID:2)}
				OBJECT SET VISIBLE:C603(SP_t_SalesProjectionType; False:C215)
				OBJECT SET VISIBLE:C603(SP_t_SalesOrderNUM; True:C214)
				OBJECT SET VISIBLE:C603(SP_t_SalesOrderTitle; True:C214)
				OBJECT SET VISIBLE:C603(*; "Text_ProjectionType"; False:C215)
			Else 
				OBJECT SET VISIBLE:C603(SP_t_SalesProjectionType; True:C214)
				OBJECT SET VISIBLE:C603(SP_t_SalesOrderNUM; False:C215)
				OBJECT SET VISIBLE:C603(SP_t_SalesOrderTitle; False:C215)
				OBJECT SET VISIBLE:C603(*; "Text_ProjectionType"; True:C214)
			End if 
			
			
		End if 
		If ([SALES_PROJECTION:113]ConvertedSaleValue:19=0)
			OBJECT SET ENTERABLE:C238([SALES_PROJECTION:113]ConvertedSaleValue:19; False:C215)
			OBJECT SET ENTERABLE:C238([SALES_PROJECTION:113]ConvertedSaleCosts:28; False:C215)
			
			ARRAY LONGINT:C221(SP_al_ProjectionProbability; 10)
			$_l_Element:=0
			For ($_l_Index; 10; 100; 10)
				$_l_Element:=$_l_Element+1
				SP_al_ProjectionProbability{$_l_Element}:=$_l_Index
			End for 
		Else 
			ARRAY LONGINT:C221(SP_al_ProjectionProbability; 0)
			OBJECT SET ENTERABLE:C238([SALES_PROJECTION:113]Probability:17; False:C215)
			OBJECT SET ENTERABLE:C238([SALES_PROJECTION:113]GrossValue:13; False:C215)
			OBJECT SET VISIBLE:C603(SP_al_ProjectionProbability; False:C215)
			OBJECT SET VISIBLE:C603(*; "Pict_Property"; False:C215)
		End if 
		
		INT_SetDialog
		
End case 
ERR_MethodTrackerReturn("FM [SALES_PROJECTION].SalesProjectionEntry"; $_t_oldMethodName)
