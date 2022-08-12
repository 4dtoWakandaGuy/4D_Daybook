If (False:C215)
	//object Name: [PERSONNEL]Pipeline_Manager.Variable6
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
	//ARRAY LONGINT(QV_al_TableRestrictionIDs;0)
	//ARRAY LONGINT(SP_al_CompanyID;0)
	//ARRAY LONGINT(SP_al_CurrencyID;0)
	//ARRAY LONGINT(SP_al_LinkedTable;0)
	//ARRAY LONGINT(SP_al_POPCurrencyIDs;0)
	//ARRAY LONGINT(SP_al_RealTableNums;0)
	//ARRAY LONGINT(SP_al_RelatedSaleTypeID;0)
	//ARRAY LONGINT(SP_al_SalesContactID;0)
	//ARRAY LONGINT(SP_al_SalesPipelineStatus;0)
	//ARRAY LONGINT(SP_al_SalesProjectionID;0)
	//ARRAY LONGINT(SP_al_SalesProjectionTYPEID;0)
	//ARRAY LONGINT(SP_al_SalesRecordModified;0)
	//ARRAY LONGINT(SP_al_SalesRelatedRecordID;0)
	//ARRAY LONGINT(SP_al_SalesRelatedTableID;0)
	//ARRAY REAL(SP_ar_Probability;0)
	//ARRAY REAL(SP_ar_SalesActual;0)
	//ARRAY REAL(SP_ar_SalesActualCosts;0)
	//ARRAY REAL(SP_ar_SalesCosts;0)
	//ARRAY REAL(SP_ar_SalesMargin;0)
	//ARRAY REAL(SP_ar_SalesValue;0)
	//ARRAY TEXT(QV_at_TableRestrictionNMs;0)
	//ARRAY TEXT(SP_at_CurrencyCode;0)
	//ARRAY TEXT(SP_at_ListboxEditMode;0)
	//ARRAY TEXT(SP_at_PipelineStatus;0)
	//ARRAY TEXT(SP_at_RealTableNames;0)
	//ARRAY TEXT(SP_at_RelatedRecordCode;0)
	//ARRAY TEXT(SP_at_RelatedSaleTypeNM;0)
	//ARRAY TEXT(SP_at_SalesCustomerName;0)
	//ARRAY TEXT(SP_at_SalesProjectionContact;0)
	//ARRAY TEXT(SP_at_SalesProjectionTYPE;0)
	//ARRAY TEXT(SP_at_SalesTitle;0)
	C_BOOLEAN:C305(<>NoUpdate)
	C_DATE:C307(SP_D_FilterFromDate; SP_D_FilterToDate)
	C_LONGINT:C283(<>PER_l_CurrentUserID; $_l_CurrencyRow; $_l_Index; $_l_NewList; $_l_RelatedCompanyID; $_l_SalesProjectionStateID; $_l_SizeofArray; SP_l_GroupID; SP_l_PersonelID; SP_l_RelatedCompanyID; SP_l_SalesProjectionStateID)
	C_LONGINT:C283(SP_NextPipeline)
	C_REAL:C285(SP_R_FilterProbability)
	C_TEXT:C284(<>PER_t_CurrentUserInitials; <>SYS_t_BaseCurrency; $_t_ListName; $_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [PERSONNEL].Pipeline_Manager.Variable6"; Form event code:C388)
Case of 
	: (SP_at_ListboxEditMode=1)
		If (Size of array:C274(SP_al_SalesProjectionID)>0)
			For ($_l_Index; 1; Size of array:C274(SP_al_SalesRecordModified))
				If (SP_al_SalesRecordModified{$_l_Index}>0)
					SP_UpdateProjectionfromPV($_l_Index)
				End if 
			End for 
		End if 
		<>NoUpdate:=True:C214
		HIDE WINDOW:C436
		$_l_SalesProjectionStateID:=SP_l_SalesProjectionStateID
		$_l_RelatedCompanyID:=SP_l_RelatedCompanyID
		SP_NewPipeline(False:C215; <>PER_l_CurrentUserID)
		SP_l_SalesProjectionStateID:=$_l_SalesProjectionStateID
		SP_l_RelatedCompanyID:=$_l_RelatedCompanyID
		SP_FindPipeline(SP_l_PersonelID; SP_D_FilterFromDate; SP_D_FilterToDate; SP_R_FilterProbability; ->SP_l_SalesProjectionStateID; SP_l_RelatedCompanyID; SP_l_GroupID)
		<>NoUpdate:=False:C215
		If (SP_l_PersonelID>0)
			QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Personnel_ID:48=SP_l_PersonelID)
		Else 
			UNLOAD RECORD:C212([PERSONNEL:11])
			If (SP_l_GroupID>0)
				CREATE RECORD:C68([PERSONNEL:11])
				QUERY:C277([PERSONNEL_GROUPS:92]; [PERSONNEL_GROUPS:92]x_ID:12=SP_l_GroupID)
				[PERSONNEL:11]Name:2:=[PERSONNEL_GROUPS:92]Group_Name:2
			Else 
				CREATE RECORD:C68([PERSONNEL:11])
				[PERSONNEL:11]Name:2:="Everyone"
			End if 
			//be sure to NEVER save the record
		End if 
		SHOW WINDOW:C435
	: (SP_at_ListboxEditMode=2)
		<>NoUpdate:=True:C214
		$_l_SizeofArray:=Size of array:C274(SP_al_SalesProjectionID)
		INSERT IN ARRAY:C227(SP_al_SalesProjectionID; 1; 1)
		INSERT IN ARRAY:C227(SP_at_SalesTitle; 1; 1)
		INSERT IN ARRAY:C227(SP_al_CompanyID; 1; 1)
		INSERT IN ARRAY:C227(SP_at_SalesCustomerName; 1; 1)
		INSERT IN ARRAY:C227(SP_al_CurrencyID; 1; 1)
		INSERT IN ARRAY:C227(SP_at_CurrencyCode; 1; 1)
		INSERT IN ARRAY:C227(SP_ar_SalesValue; 1; 1)
		INSERT IN ARRAY:C227(SP_ar_SalesCosts; 1; 1)
		INSERT IN ARRAY:C227(SP_ar_SalesMargin; 1; 1)
		INSERT IN ARRAY:C227(SP_ad_ExpectedDate; 1; 1)
		INSERT IN ARRAY:C227(SP_ar_Probability; 1; 1)
		INSERT IN ARRAY:C227(SP_al_SalesPipelineStatus; 1; 1)
		INSERT IN ARRAY:C227(SP_at_PipelineStatus; 1; 1)
		INSERT IN ARRAY:C227(SP_al_RelatedSaleTypeID; 1; 1)
		INSERT IN ARRAY:C227(SP_at_RelatedSaleTypeNM; 1; 1)
		INSERT IN ARRAY:C227(SP_ar_SalesActual; 1; 1)
		INSERT IN ARRAY:C227(SP_ar_SalesActualCosts; 1; 1)
		INSERT IN ARRAY:C227(SP_at_SalesProjectionContact; 1; 1)
		INSERT IN ARRAY:C227(SP_al_SalesContactID; 1; 1)
		INSERT IN ARRAY:C227(SP_al_SalesRelatedTableID; 1; 1)
		INSERT IN ARRAY:C227(SP_at_RelatedRecordCode; 1; 1)
		INSERT IN ARRAY:C227(SP_al_SalesRelatedRecordID; 1; 1)
		INSERT IN ARRAY:C227(SP_al_SalesRecordModified; 1; 1)
		SP_al_SalesProjectionID{1}:=-(SP_NextPipeline)
		SP_NextPipeline:=SP_NextPipeline+1
		//note if the users switches out of this row
		//and has not entered proper data we dont save it and we delete the row
		//set the TYPES pop-up
		If (Size of array:C274(SP_at_SalesProjectionTYPE)>1)
			//set column 9 to include a pop-up
			//AL_SetEnterable (SP_PowerviewPIPE;9;2;SP_at_SalesProjectionTYPE)
			$_t_ListName:="SPType"+<>PER_t_CurrentUserInitials
			$_l_NewList:=New list:C375
			For ($_l_Index; 1; Size of array:C274(SP_at_SalesProjectionTYPE))
				APPEND TO LIST:C376($_l_NewList; SP_at_SalesProjectionTYPE{$_l_Index}; $_l_Index)
			End for 
			SAVE LIST:C384($_l_NewList; $_t_ListName)
			OBJECT SET LIST BY NAME:C237(SP_at_RelatedSaleTypeNM; $_t_ListName)
			
		Else 
			//AL_SetEnterable (SP_PowerviewPIPE;9;0)
			OBJECT SET ENTERABLE:C238(SP_at_RelatedSaleTypeNM; False:C215)
			SP_LoadTableNames
			SP_at_SalesProjectionTYPE:=1
			SP_al_SalesRelatedTableID{1}:=SP_al_RealTableNums{Find in array:C230(SP_at_RealTableNames; QV_at_TableRestrictionNMs{Find in array:C230(QV_al_TableRestrictionIDs; SP_al_LinkedTable{SP_at_SalesProjectionTYPE})})}
			SP_al_RelatedSaleTypeID{1}:=SP_al_SalesProjectionTYPEID{SP_at_SalesProjectionTYPE}
			SP_at_RelatedSaleTypeNM{1}:=SP_at_SalesProjectionTYPE{SP_at_SalesProjectionTYPE}
		End if 
		SP_at_CurrencyCode{1}:=<>SYS_t_BaseCurrency
		$_l_CurrencyRow:=Find in array:C230(SP_at_PopCurrencyCodes; <>SYS_t_BaseCurrency)
		If ($_l_CurrencyRow>0)
			SP_al_CurrencyID{1}:=SP_al_POPCurrencyIDs{$_l_CurrencyRow}
		End if 
		//ARRAY INTEGER($2darray;0;0)
		Case of 
			: (SP_at_ListboxEditMode=1)
				//AL_SetEntryOpts (SP_PowerviewPIPE;4;1;0;0;0;".";1)
			: (SP_at_ListboxEditMode=2)
				//AL_SetEntryOpts (SP_PowerviewPIPE;2;1;0;0;0;".";1)
		End case 
		//AL_SetCellEnter (SP_PowerviewPIPE;1;1;0;0;$2darray;1)
		OBJECT SET ENTERABLE:C238(SP_at_SalesTitle; True:C214)
		//AL_SetCellEnter (SP_PowerviewPIPE;2;1;0;0;$2darray;1)
		OBJECT SET ENTERABLE:C238(SP_at_SalesCustomerName; True:C214)
		//AL_SetCellEnter (SP_PowerviewPIPE;4;1;0;0;$2darray;1)
		OBJECT SET ENTERABLE:C238(SP_ar_SalesValue; True:C214)
		//AL_SetCellEnter (SP_PowerviewPIPE;5;1;0;0;$2darray;1)
		OBJECT SET ENTERABLE:C238(SP_ar_SalesCosts; True:C214)
		//AL_SetCellEnter (SP_PowerviewPIPE;7;1;0;0;$2darray;1)
		OBJECT SET ENTERABLE:C238(SP_ar_SalesActual; True:C214)
		//AL_SetCellEnter (SP_PowerviewPIPE;8;1;0;0;$2darray;1)
		OBJECT SET ENTERABLE:C238(SP_ad_ExpectedDate; True:C214)
		//AL_SetCellEnter (SP_PowerviewPIPE;10;1;0;0;$2darray;1)
		OBJECT SET ENTERABLE:C238(SP_at_RelatedRecordCode; True:C214)
		For ($_l_Index; 1; Size of array:C274(SP_ar_SalesActual))
			If (SP_ar_SalesActual{$_l_Index}>0)
				// Todo: check this out - not sure what it is supposed to be doing pb
				//AL_SetCellEnter (SP_PowerviewPIPE;1;$_l_Index;12;$_l_Index;$2darray;-1)  ` -1 = remove any cell-specific enterability
				//AL_SetCellEnter (SP_PowerviewPIPE;1;$_l_Index;12;$_l_Index;$2darray;0)  ` sets all columns non-enterable? Why when they have mostly just been set as enterable?
			End if 
		End for 
		//AL_UpdateArrays (SP_PowerviewPIPE;-2)
		
End case 
ERR_MethodTrackerReturn("OBJ [PERSONNEL].Pipeline_Manager.Variable6"; $_t_oldMethodName)
