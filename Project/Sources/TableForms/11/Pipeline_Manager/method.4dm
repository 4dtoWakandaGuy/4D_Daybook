If (False:C215)
	//Table Form Method Name: [PERSONNEL]Pipeline_Manager
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:09
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY DATE(SP_ad_ExpectedDate;0)
	//ARRAY LONGINT(SP_al_atCompanyID;0)
	//ARRAY LONGINT(SP_al_atCurrencyID;0)
	//ARRAY LONGINT(SP_al_CompanyID;0)
	//ARRAY LONGINT(SP_al_CurrencyID;0)
	//ARRAY LONGINT(SP_al_FilterProbability;0)
	//ARRAY LONGINT(SP_al_PipelineStatus;0)
	//ARRAY LONGINT(SP_al_Probability;0)
	//ARRAY LONGINT(SP_al_RecordModified;0)
	//ARRAY LONGINT(SP_al_RelatedSaleTypeID;0)
	//ARRAY LONGINT(SP_al_SalesContactID;0)
	//ARRAY LONGINT(SP_al_SalesPipelineStatus;0)
	//ARRAY LONGINT(SP_al_SalesProjectionID;0)
	//ARRAY LONGINT(SP_al_SalesRecordModified;0)
	//ARRAY LONGINT(SP_al_SalesRelatedRecordID;0)
	//ARRAY LONGINT(SP_al_SalesRelatedTableID;0)
	//ARRAY LONGINT(SP_al_TargetOGroupID;0)
	//ARRAY LONGINT(SP_al_TargetOPersonID;0)
	//ARRAY LONGINT(SP_al_TargetPeriod;0)
	//ARRAY LONGINT(SP_al_TargetType;0)
	//ARRAY LONGINT(SP_l_aRecordModified;0)
	ARRAY REAL:C219($_ar_TargetProjection; 0)
	//ARRAY REAL(SP_ar_atSalesValue;0)
	//ARRAY REAL(SP_ar_FilterProbability2;0)
	//ARRAY REAL(SP_ar_PipelineResult;0)
	//ARRAY REAL(SP_ar_Probability;0)
	//ARRAY REAL(SP_ar_SalesActual;0)
	//ARRAY REAL(SP_ar_SalesActualCosts;0)
	//ARRAY REAL(SP_ar_SalesCosts;0)
	//ARRAY REAL(SP_ar_SalesMargin;0)
	//ARRAY REAL(SP_ar_SalesValue;0)
	//ARRAY TEXT(<>LB_at_EditModes;0)
	//ARRAY TEXT(SP_at_atCurrencyCode;0)
	//ARRAY TEXT(SP_at_atSalesCustomerName;0)
	//ARRAY TEXT(SP_at_atSalesTitle;0)
	//ARRAY TEXT(SP_at_CurrencyCode;0)
	//ARRAY TEXT(SP_at_CurrencyNames;0)
	//ARRAY TEXT(SP_at_ListboxEditMode;0)
	//ARRAY TEXT(SP_at_PipelineStatus;0)
	//ARRAY TEXT(SP_at_RelatedRecordCode;0)
	//ARRAY TEXT(SP_at_RelatedSaleTypeNM;0)
	//ARRAY TEXT(SP_at_SalesCustomerName;0)
	//ARRAY TEXT(SP_at_SalesPipelineTabs;0)
	//ARRAY TEXT(SP_at_SalesProjectionContact;0)
	//ARRAY TEXT(SP_at_SalesTitle;0)
	//ARRAY TEXT(SP_at_TargetOGroupID;0)
	//ARRAY TEXT(SP_at_TargetOPersonID;0)
	//ARRAY TEXT(SP_at_TargetOwner;0)
	//ARRAY TEXT(SP_at_TargetPeriod;0)
	C_BOOLEAN:C305(<>noupdate; DB_bo_NoLoad)
	C_DATE:C307(SP_D_FilterFromDate; SP_D_FilterToDate; SP_D_tFilterFromDate; SP_D_tFilterToDate)
	C_LONGINT:C283(<>SP_l_UsersnGroup; <>SP_l_UsersNGroups; $_l_CurrentElement; $_l_event; $_l_FormBottom; $_l_FormLeft; $_l_FormRight; $_l_FormTop; $_l_Index; $_l_LoadPersonProcess; $_l_MaxSize)
	C_LONGINT:C283($_l_MinSize; $_l_RequiredSize; SP_l_GroupID; SP_l_PersonelID; SP_l_RelatedCompanyID; SP_l_SalesProjectionStateID; SP_l_tFilterType; SP_l_tGroupID; SP_l_tPersonelID; SP_l_tSalesProjectionStateID)
	C_PICTURE:C286(SP_pic_LbEditModePicture)
	C_REAL:C285(SP_R_FilterProbability)
	C_TEXT:C284($_t_oldMethodName; SP_t_AdHocName; SP_t_FilterStatus; SP_t_FilterType; SP_t_tFilterStatus)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("FM [PERSONNEL].Pipeline_Manager"; Form event code:C388)
$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		OpenHelp(Table:C252(->[PERSONNEL:11]); "Pipeline_Manager")
		ARRAY TEXT:C222(SP_at_ListboxEditMode; 0)
		ARRAY TEXT:C222(SP_at_CurrencyNames; 0)
		COPY ARRAY:C226(<>LB_at_EditModes; SP_at_ListboxEditMode)
		ARRAY TEXT:C222(SP_at_ListboxEditMode; 2)
		SP_t_FilterType:=""
		SP_al_TargetType:=0
		SP_at_ListboxEditMode:=2
		//GET PICTURE FROM LIBRARY(20260; SP_pic_LbEditModePicture)
		SP_pic_LbEditModePicture:=Get_Picture(20260)
		
		SP_LoadLinkTypes(False:C215)
		SP_LoadTableNames
		
		If (<>SP_l_UsersnGroup>0)
			CLEAR LIST:C377(<>SP_l_UsersnGroup; *)
		End if 
		SP_l_PersonelID:=[PERSONNEL:11]Personnel_ID:48
		SP_l_tPersonelID:=SP_l_PersonelID
		If (User in group:C338(Current user:C182; "Administrator")) | (User in group:C338(Current user:C182; "Administrator"))
			$_l_LoadPersonProcess:=New process:C317("SP_GetUsersAndGroups"; 32000; "LoadUsersNGroups"; 1)
		Else 
			OBJECT SET VISIBLE:C603(*; "PCT_UG1"; False:C215)
			OBJECT SET VISIBLE:C603(<>SP_l_UsersNGroups; False:C215)
			
		End if 
		
		ARRAY TEXT:C222(SP_at_SalesPipelineTabs; 2)
		SP_at_SalesPipelineTabs{1}:="Sales Pipeline"
		SP_at_SalesPipelineTabs{2}:="Target/Results"
		ARRAY LONGINT:C221(SP_al_FilterProbability; 10)
		ARRAY REAL:C219(SP_ar_FilterProbability2; 10)
		$_l_CurrentElement:=0
		For ($_l_Index; 10; 100; 10)
			$_l_CurrentElement:=$_l_CurrentElement+1
			SP_al_FilterProbability{$_l_CurrentElement}:=$_l_Index
			SP_ar_FilterProbability2{$_l_CurrentElement}:=$_l_Index
		End for 
		WS_AutoscreenSize(3; 280; 725)
		SET WINDOW TITLE:C213("Pipeline Sales: "+[PERSONNEL:11]Name:2)
		
		ARRAY LONGINT:C221(SP_al_SalesProjectionID; 0)
		ARRAY TEXT:C222(SP_at_SalesTitle; 0)
		ARRAY LONGINT:C221(SP_al_CompanyID; 0)
		ARRAY TEXT:C222(SP_at_SalesCustomerName; 0)
		ARRAY LONGINT:C221(SP_al_CurrencyID; 0)
		ARRAY TEXT:C222(SP_at_CurrencyCode; 0)
		ARRAY REAL:C219(SP_ar_SalesValue; 0)
		ARRAY REAL:C219(SP_ar_SalesCosts; 0)
		ARRAY REAL:C219(SP_ar_SalesMargin; 0)
		ARRAY DATE:C224(SP_ad_ExpectedDate; 0)
		ARRAY REAL:C219(SP_ar_Probability; 0)
		ARRAY LONGINT:C221(SP_al_SalesPipelineStatus; 0)
		ARRAY TEXT:C222(SP_at_PipelineStatus; 0)
		ARRAY LONGINT:C221(SP_al_RelatedSaleTypeID; 0)
		ARRAY TEXT:C222(SP_at_RelatedSaleTypeNM; 0)
		ARRAY REAL:C219(SP_ar_SalesActual; 0)
		ARRAY REAL:C219(SP_ar_SalesActualCosts; 0)
		ARRAY TEXT:C222(SP_at_SalesProjectionContact; 0)
		ARRAY LONGINT:C221(SP_al_SalesContactID; 0)
		ARRAY LONGINT:C221(SP_al_SalesRelatedTableID; 0)
		ARRAY LONGINT:C221(SP_al_SalesRelatedRecordID; 0)
		ARRAY LONGINT:C221(SP_al_SalesRecordModified; 0)
		ARRAY TEXT:C222(SP_at_RelatedRecordCode; 0)
		SP_FindPipeline(SP_l_PersonelID; SP_D_FilterFromDate; SP_D_FilterToDate; SP_R_FilterProbability; ->SP_l_SalesProjectionStateID; SP_l_RelatedCompanyID; SP_l_GroupID)
		ARRAY LONGINT:C221(SP_al_RecordModified; 0)
		
		ARRAY LONGINT:C221(SP_al_SalesProjectionID; 0)
		ARRAY TEXT:C222(SP_at_atSalesTitle; 0)
		ARRAY LONGINT:C221(SP_al_atCompanyID; 0)
		ARRAY TEXT:C222(SP_at_atSalesCustomerName; 0)
		ARRAY LONGINT:C221(SP_al_atCurrencyID; 0)
		ARRAY TEXT:C222(SP_at_atCurrencyCode; 0)
		ARRAY REAL:C219(SP_ar_atSalesValue; 0)
		ARRAY REAL:C219(SP_ar_SalesCosts; 0)
		ARRAY REAL:C219(SP_ar_SalesMargin; 0)
		ARRAY DATE:C224(SP_ad_ExpectedDate; 0)
		ARRAY LONGINT:C221(SP_al_Probability; 0)
		ARRAY LONGINT:C221(SP_al_PipelineStatus; 0)
		ARRAY TEXT:C222(SP_at_PipelineStatus; 0)
		ARRAY REAL:C219(SP_ar_PipelineResult; 0)
		ARRAY LONGINT:C221(SP_al_TargetPeriod; 0)
		ARRAY TEXT:C222(SP_at_TargetPeriod; 0)
		ARRAY LONGINT:C221(SP_al_TargetOPersonID; 0)
		ARRAY LONGINT:C221(SP_al_TargetOGroupID; 0)
		ARRAY TEXT:C222(SP_at_TargetOPersonID; 0)
		ARRAY TEXT:C222(SP_at_TargetOGroupID; 0)
		ARRAY TEXT:C222(SP_at_TargetOwner; 0)
		ARRAY REAL:C219($_ar_TargetProjection; 0)
		$_l_MinSize:=280
		$_l_MaxSize:=500
		$_l_RequiredSize:=(250-100)+(24*Records in selection:C76([SALES_PROJECTION:113]))+24
		If ($_l_RequiredSize<$_l_MinSize)
			$_l_RequiredSize:=$_l_MinSize
		End if 
		If ($_l_RequiredSize>$_l_MaxSize)
			$_l_RequiredSize:=$_l_MaxSize
		End if 
		WS_AutoscreenSize(3; $_l_RequiredSize; 725)
		INT_SetDialog
		
		
	: ($_l_event=On Timer:K2:25)
		If (Not:C34(<>NoUpdate))
			Case of 
				: (FORM Get current page:C276=1)
					SP_FindPipeline(SP_l_PersonelID; SP_D_FilterFromDate; SP_D_FilterToDate; SP_R_FilterProbability; ->SP_l_SalesProjectionStateID; SP_l_RelatedCompanyID; SP_l_GroupID)
					
					
				: (FORM Get current page:C276=2)
					SP_FindTargets(SP_l_tPersonelID; SP_l_tGroupID; SP_t_AdHocName; SP_D_TFilterFromDate; SP_D_TFilterToDate; ->SP_l_tSalesProjectionStateID; SP_l_tFilterType)
					
					
			End case 
			
			
		End if 
	: ($_l_event=On Plug in Area:K2:16)
		
	: ($_l_event=On Outside Call:K2:11)
		//need to move the window to force a redraw!
		If (Not:C34(<>NoUpdate))
			GET WINDOW RECT:C443($_l_FormLeft; $_l_FormTop; $_l_FormRight; $_l_FormBottom)
			SET WINDOW RECT:C444($_l_FormLeft; $_l_FormTop; $_l_FormRight; $_l_FormBottom-1)
			SET WINDOW RECT:C444($_l_FormLeft; $_l_FormTop; $_l_FormRight; $_l_FormBottom)
			Case of 
				: (FORM Get current page:C276=1)
					SP_FindPipeline(SP_l_PersonelID; SP_D_FilterFromDate; SP_D_FilterToDate; SP_R_FilterProbability; ->SP_l_SalesProjectionStateID; SP_l_RelatedCompanyID; SP_l_GroupID)
					
				: (FORM Get current page:C276=2)
					SP_FindTargets(SP_l_tPersonelID; SP_l_tGroupID; SP_t_AdHocName; SP_D_TFilterFromDate; SP_D_TFilterToDate; ->SP_l_tSalesProjectionStateID; SP_l_tFilterType)
					
			End case 
		End if 
		
		
End case 
ERR_MethodTrackerReturn("FM [PERSONNEL].Pipeline_Manager"; $_t_oldMethodName)
