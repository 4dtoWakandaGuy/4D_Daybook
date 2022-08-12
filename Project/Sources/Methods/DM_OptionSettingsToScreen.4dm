//%attributes = {}

If (False:C215)
	//Project Method Name:      DM_OptionSettingsToScreen
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  26/02/2020
	//Created BY:  Unknown
	
	//Date Modified: 
	//Modified By: Nigel Greenlee
	//Modification notes
End if 
//Variable Declarations
If (True:C214)
	//Array INTEGER(DM_ai_DefaultState;0)
	//Array LONGINT(DM_al_OrderDelMethod;0)
	//Array LONGINT(DM_al_OrderDelTerms;0)
	//Array LONGINT(DM_al_OrderTerms;0)
	//Array REAL(DM_ar_ContactTaxRate;0)
	//Array TEXT(DM_at_ALLstates;0)
	//Array TEXT(DM_at_CompanyStatusCode;0)
	//Array TEXT(DM_at_CompanyStatusName;0)
	//Array TEXT(DM_at_ContactRoleCode;0)
	//Array TEXT(DM_at_ContactRoleName;0)
	//Array TEXT(DM_at_ContactStageCode;0)
	//Array TEXT(DM_at_ContactStageName;0)
	//Array TEXT(DM_at_ContactStatusCode;0)
	//Array TEXT(DM_at_ContactStatusName;0)
	//Array TEXT(DM_at_ContactTaxCode;0)
	//Array TEXT(DM_at_ContactTaxName;0)
	//Array TEXT(DM_at_ContactTYPE_PPG;0)
	//Array TEXT(DM_at_ContactTYPE_SPG;0)
	//Array TEXT(DM_at_ContactTypeCode;0)
	//Array TEXT(DM_at_ContactTypeName;0)
	//Array TEXT(DM_at_OrderAnalysisCode;0)
	//Array TEXT(DM_at_OrderAreaCode;0)
	//Array TEXT(DM_at_OrderAreaName;0)
	//Array TEXT(DM_at_OrderCurCode;0)
	//Array TEXT(DM_at_OrderCurName;0)
	//Array TEXT(DM_at_OrderDelMethod;0)
	//Array TEXT(DM_at_OrderDelTerms;0)
	//Array TEXT(DM_at_OrderLayerCode;0)
	//Array TEXT(DM_at_OrderPersonName;0)
	//Array TEXT(DM_at_OrderSourceCode;0)
	//Array TEXT(DM_at_OrderSourceName;0)
	//Array TEXT(DM_at_OrderTBINIT;0)
	//Array TEXT(DM_at_OrderTBName;0)
	//Array TEXT(DM_at_OrderTerms;0)
	//Array TEXT(DM_at_OrderTypeCode;0)
	//Array TEXT(DM_at_OrderTypeName;0)
	//Array TEXT(DM_at_POPriceGroupCodes;0)
	//Array TEXT(DM_at_POPriceGroups;0)
	//Array TEXT(DM_at_SOPriceGroupNames;0)
	//Array TEXT(DM_at_SOPriceGroups;0)
	//ARRAY TEXT(DM_at_OrderPersonInitials;0)
	//ARRAY TEXT(DM_at_StateFunction;0)
	//ARRAY TEXT(DM_at_StateNames;0)
	C_BOOLEAN:C305(DM_Bo_Modified)
	C_LONGINT:C283($_l_AreaCodePosition; $_l_AreaPosition; $_l_ArraySize; $_l_ContactTypePosition; $_l_CurrencyPosition; $_l_index; $_l_ListID; $_l_offset; $_l_OrderPersonPositon; $_l_OrderSourcePosition; $_l_OrderTypePosition)
	C_LONGINT:C283($_l_PriceGroupPosition; $_l_PriceGroupPositon; $_l_rolePosition; $_l_SalePersonPosition; $_l_SalesPersonPosition; $_l_SourcePosition; $_l_StageCodePositon; $_l_StatePositon; $_l_StatusPosition; $_l_TabkenByPosition; $_l_TaxCodePosition)
	C_LONGINT:C283($1; $2; DM_cb_ORDERallocate; DM_cb_ORDERInvoice; DM_cb_PrintComments; DM_l_CurrentOptions)
	C_REAL:C285(DM_R_ContactTaxRate)
	C_TEXT:C284($_t_oldMethodName; DM_t_CompanyStatusCode; DM_t_ContactAreaCode; DM_t_ContactAreaName; DM_t_ContactPOPriceGroupCode; DM_t_ContactPOPriceGroupNM; DM_t_ContactRoleCode; DM_t_ContactRoleName; DM_t_ContactSOPriceGroupCode; DM_t_ContactSOPriceGroupName; DM_t_ContactSourceCode)
	C_TEXT:C284(DM_t_ContactSourceName; DM_t_ContactSPInitials; DM_t_ContactSPName; DM_t_ContactStageCode; DM_t_ContactStageName; DM_t_ContactStatusCode; DM_t_ContactStatusName; DM_t_ContactTAXCode; DM_t_ContactTAXName; DM_t_ContactTBinitials; DM_t_ContactTBname)
	C_TEXT:C284(DM_t_ContactTypeCode; DM_t_ContactTypeName; DM_t_OrderAnalysisCode; DM_t_OrderAREACode; DM_t_OrderAREAName; DM_t_OrderCurrencyCode; DM_t_OrderCurrencyName; DM_t_OrderDelMethod; DM_t_OrderDelterms; DM_t_OrderIPriceCode; DM_t_OrderlayerCode)
	C_TEXT:C284(DM_t_OrderPersonInitials; DM_t_OrderPersonName; DM_t_OrderSourceCode; DM_t_OrderSourceName; DM_t_OrderTBinitials; DM_t_OrderTBName; DM_t_OrderTerms; DM_t_OrderTypeCode; DM_t_OrderTypeName; DM_t_SettingsName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DM_OptionSettingsToScreen")

//this method will load options setting
$_t_oldMethodName:=ERR_MethodTracker("DM_OptionSettingsToScreen")
DM_Bo_Modified:=False:C215  //tracks if it is changed
Case of 
	: ($1=25)  //orders
		If (Size of array:C274(DM_at_OrderTypeName)=0)
			//Load the order types to array
			//the array is declared in the form on load
			
			
			//this should only happen once
			ALL RECORDS:C47([JOB_TYPES:65])
			SELECTION TO ARRAY:C260([JOB_TYPES:65]Type_Code:1; DM_at_OrderTypeCode; [JOB_TYPES:65]Type_Name:2; DM_at_OrderTypeName)
			SORT ARRAY:C229(DM_at_OrderTypeName; DM_at_OrderTypeCode)
			
		End if 
		If (Size of array:C274(DM_at_OrderPersonName)=0)
			QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Active:7=True:C214; *)
			QUERY:C277([PERSONNEL:11];  & ; [PERSONNEL:11]PersonDeleted:38=0)
			SELECTION TO ARRAY:C260([PERSONNEL:11]Initials:1; DM_at_OrderPersonInitials; [PERSONNEL:11]Name:2; DM_at_OrderPersonName)
			SORT ARRAY:C229(DM_at_OrderPersonName; DM_at_OrderPersonInitials)
			COPY ARRAY:C226(DM_at_OrderPersonName; DM_at_OrderTBName)
			COPY ARRAY:C226(DM_at_OrderPersonInitials; DM_at_OrderTBINIT)
			
		End if 
		If (Size of array:C274(DM_at_OrderSourceName)=0)
			ALL RECORDS:C47([SOURCES:6])
			SELECTION TO ARRAY:C260([SOURCES:6]Source_Code:1; DM_at_OrderSourceCode; [SOURCES:6]Source_Name:2; DM_at_OrderSourceName)
			SORT ARRAY:C229(DM_at_OrderSourceName; DM_at_OrderSourceCode)
		End if 
		If (Size of array:C274(DM_at_OrderAreaName)=0)
			ALL RECORDS:C47([AREAS:3])
			SELECTION TO ARRAY:C260([AREAS:3]Area_Code:1; DM_at_OrderAreaCode; [AREAS:3]Area_Name:2; DM_at_OrderAreaName)
			SORT ARRAY:C229(DM_at_OrderAreaName; DM_at_OrderAreaCode)
		End if 
		If (Size of array:C274(DM_at_OrderDelMethod)=0)
			$_l_ListID:=AA_LoadListByName("Del Methods"; ->DM_at_OrderDelMethod; ->DM_al_OrderDelMethod; False:C215)
			
		End if 
		If (Size of array:C274(DM_at_OrderDelTerms)=0)
			$_l_ListID:=AA_LoadListByName("Del Terms"; ->DM_at_OrderDelTerms; ->DM_al_OrderDelTerms; False:C215)
		End if 
		If (Size of array:C274(DM_at_OrderCurName)=0)
			ALL RECORDS:C47([CURRENCIES:71])
			SELECTION TO ARRAY:C260([CURRENCIES:71]Currency_Code:1; DM_at_OrderCurCode; [CURRENCIES:71]Currency_Name:2; DM_at_OrderCurName)
			SORT ARRAY:C229(DM_at_OrderCurName; DM_at_OrderCurCode)
		End if 
		If (Size of array:C274(DM_at_OrderAnalysisCode)=0)
			ALL RECORDS:C47([ANALYSES:36])
			SELECTION TO ARRAY:C260([ANALYSES:36]Analysis_Code:1; DM_at_OrderAnalysisCode)
			SORT ARRAY:C229(DM_at_OrderAnalysisCode)
			
		End if 
		If (Size of array:C274(DM_at_OrderLayerCode)=0)
			ALL RECORDS:C47([LAYERS:76])
			SELECTION TO ARRAY:C260([LAYERS:76]Layer_Code:1; DM_at_OrderLayerCode)
			SORT ARRAY:C229(DM_at_OrderLayerCode)
			
		End if 
		If (Size of array:C274(DM_at_OrderTerms)=0)
			$_l_ListID:=AA_LoadListByName("Terms"; ->DM_at_OrderTerms; ->DM_al_OrderTerms; False:C215)
		End if 
		If (Size of array:C274(DM_at_ALLstates)=0)
			QUERY:C277([TABLE_RECORD_STATES:90]; [TABLE_RECORD_STATES:90]Table_number:3=24)
			
			SELECTION TO ARRAY:C260([TABLE_RECORD_STATES:90]Listing_Name:2; DM_at_ALLstates)
			SORT ARRAY:C229(DM_at_ALLstates)
		End if 
		
		
		
		If ($2>0)
			If ([PREFERENCES:116]IDNumber:1#$2)
				QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=$2)
			End if 
			
			DM_l_CurrentOptions:=$2
			DM_OrderDefBlobtoVariables
			
			//`````````
			$_l_ArraySize:=Size of array:C274(DM_ai_DefaultState)
			ARRAY INTEGER:C220(DM_ai_DefaultState; $_l_ArraySize)
			ARRAY TEXT:C222(DM_at_StateNames; $_l_ArraySize)
			ARRAY TEXT:C222(DM_at_StateFunction; $_l_ArraySize)
			$_l_ArraySize:=Size of array:C274(DM_at_ALLstates)
			
			For ($_l_index; 1; $_l_ArraySize)
				$_l_StatePositon:=Find in array:C230(DM_at_StateNames; DM_at_ALLstates{$_l_index})
				If ($_l_StatePositon<0)
					INSERT IN ARRAY:C227(DM_ai_DefaultState; Size of array:C274(DM_ai_DefaultState)+1; 1)
					INSERT IN ARRAY:C227(DM_at_StateNames; Size of array:C274(DM_at_StateNames)+1; 1)
					INSERT IN ARRAY:C227(DM_at_StateFunction; Size of array:C274(DM_at_StateFunction)+1; 1)
					DM_at_StateNames{Size of array:C274(DM_at_StateNames)}:=DM_at_ALLstates{$_l_index}
				End if 
			End for 
			$_l_ArraySize:=Size of array:C274(DM_at_StateNames)
			For ($_l_index; $_l_ArraySize; 1; -1)
				$_l_StatePositon:=Find in array:C230(DM_at_ALLstates; DM_at_StateNames{$_l_index})
				If ($_l_StatePositon<0)
					//state does not exist remove it from the array
					DELETE FROM ARRAY:C228(DM_ai_DefaultState; $_l_index)
					DELETE FROM ARRAY:C228(DM_at_StateNames; $_l_index)
					DELETE FROM ARRAY:C228(DM_at_StateFunction; $_l_index)
				End if 
			End for 
			
			
			$_l_OrderTypePosition:=Find in array:C230(DM_at_OrderTypeCode; DM_t_OrderTypeCode)
			If ($_l_OrderTypePosition>0)
				DM_t_OrderTypeName:=DM_at_OrderTypeName{$_l_OrderTypePosition}
			Else 
				DM_t_OrderTypeCode:=""
				DM_t_OrderTypeName:=""
			End if 
			$_l_SalesPersonPosition:=Find in array:C230(DM_at_OrderPersonInitials; DM_t_OrderPersonInitials)
			If ($_l_SalesPersonPosition>0)
				DM_t_OrderPersonName:=DM_at_OrderPersonName{$_l_SalesPersonPosition}
			Else 
				DM_t_OrderPersonName:=""
				DM_t_OrderPersonInitials:=""
			End if 
			$_l_OrderPersonPositon:=Find in array:C230(DM_at_OrderPersonInitials; DM_t_OrderTBinitials)
			If ($_l_OrderPersonPositon>0)
				DM_t_OrderTBName:=DM_at_OrderPersonName{$_l_OrderPersonPositon}
			Else 
				DM_t_OrderTBName:=""
				DM_t_OrderTBinitials:=""
			End if 
			$_l_OrderSourcePosition:=Find in array:C230(DM_at_OrderSourceCode; DM_t_OrderSourceCode)
			If ($_l_OrderSourcePosition>0)
				DM_t_OrderSourceName:=DM_at_OrderSourceName{$_l_OrderSourcePosition}
			Else 
				DM_t_OrderSourceName:=""
				DM_t_OrderSourceCode:=""
			End if 
			$_l_AreaPosition:=Find in array:C230(DM_at_OrderAreaCode; DM_t_OrderAREACode)
			If ($_l_AreaPosition>0)
				DM_t_OrderAREAName:=DM_at_OrderAreaName{$_l_AreaPosition}
			Else 
				DM_t_OrderAREAName:=""
				DM_t_OrderAREACode:=""
			End if 
			$_l_CurrencyPosition:=Find in array:C230(DM_at_OrderCurCode; DM_t_OrderCurrencyCode)
			If ($_l_CurrencyPosition>0)
				DM_t_OrderCurrencyName:=DM_at_OrderCurName{$_l_CurrencyPosition}
			Else 
				DM_t_OrderCurrencyName:=""
				DM_t_OrderCurrencyCode:=""
			End if 
			
		Else 
			ARRAY INTEGER:C220(DM_ai_DefaultState; 0)
			ARRAY TEXT:C222(DM_at_StateNames; 0)
			ARRAY TEXT:C222(DM_at_StateFunction; 0)
			DM_t_SettingsName:=""
			DM_t_OrderTypeCode:=""
			DM_t_OrderPersonInitials:=""
			DM_t_OrderSourceCode:=""
			DM_t_OrderTBinitials:=""
			DM_t_OrderAREACode:=""
			DM_t_OrderCurrencyCode:=""
			DM_t_OrderAnalysisCode:=""
			DM_t_OrderlayerCode:=""
			DM_t_OrderTypeName:=""
			DM_t_OrderPersonName:=""
			DM_t_OrderSourceName:=""
			DM_t_OrderTBName:=""
			DM_t_OrderAREAName:=""
			DM_t_OrderCurrencyName:=""
			DM_t_OrderDelMethod:=""
			DM_t_OrderDelterms:=""
			DM_t_OrderTerms:=""
			DM_l_CurrentOptions:=0
			DM_t_OrderIPriceCode:=""
			DM_cb_PrintComments:=0
			DM_cb_ORDERInvoice:=0
			DM_cb_ORDERallocate:=0
			$_l_ArraySize:=Size of array:C274(DM_at_ALLstates)
			ARRAY INTEGER:C220(DM_ai_DefaultState; $_l_ArraySize)
			ARRAY TEXT:C222(DM_at_StateNames; $_l_ArraySize)
			ARRAY TEXT:C222(DM_at_StateFunction; $_l_ArraySize)
			For ($_l_index; 1; $_l_ArraySize)
				DM_at_StateNames{$_l_index}:=DM_at_ALLstates{$_l_index}
			End for 
			
		End if 
	: ($1=2)  //contacts/companies
		//a lot of these arrays are the same as for orders
		// so not declaring new array declarations for them.
		//[CONTACTS]Role
		If (Size of array:C274(DM_at_ContactRoleName)=0)
			ALL RECORDS:C47([ROLES:87])
			SELECTION TO ARRAY:C260([ROLES:87]Role_Code:1; DM_at_ContactRoleCode; [ROLES:87]Role_Name:2; DM_at_ContactRoleName)
			SORT ARRAY:C229(DM_at_ContactRoleName; DM_at_ContactRoleCode)
			
		End if 
		
		//[CONTACTS]Contact_Type`    [COMPANIES]Company_Type
		If (Size of array:C274(DM_at_ContactTypeName)=0)
			ALL RECORDS:C47([TYPES:5])
			SELECTION TO ARRAY:C260([TYPES:5]Type_Code:1; DM_at_ContactTypeCode; [TYPES:5]Type_Name:2; DM_at_ContactTypeName; [TYPES:5]SO_Price_Group:4; DM_at_ContactTYPE_SPG; [TYPES:5]PO_Price_Group:6; DM_at_ContactTYPE_PPG)
			SORT ARRAY:C229(DM_at_ContactTypeName; DM_at_ContactTypeCode; DM_at_ContactTYPE_SPG; DM_at_ContactTYPE_PPG)
		End if 
		//[CONTACTS]Source`    [COMPANIES]Source
		If (Size of array:C274(DM_at_OrderSourceName)=0)
			ALL RECORDS:C47([SOURCES:6])
			SELECTION TO ARRAY:C260([SOURCES:6]Source_Code:1; DM_at_OrderSourceCode; [SOURCES:6]Source_Name:2; DM_at_OrderSourceName)
			SORT ARRAY:C229(DM_at_OrderSourceName; DM_at_OrderSourceCode)
		End if 
		
		//[CONTACTS]Sales Person   ``[CONTACTS]Taken by`
		//[COMPANIES]Taken By  `[COMPANIES]Sales Person
		If (Size of array:C274(DM_at_OrderPersonName)=0)
			QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Active:7=True:C214; *)
			QUERY:C277([PERSONNEL:11];  & ; [PERSONNEL:11]PersonDeleted:38=0)
			SELECTION TO ARRAY:C260([PERSONNEL:11]Initials:1; DM_at_OrderPersonInitials; [PERSONNEL:11]Name:2; DM_at_OrderPersonName)
			SORT ARRAY:C229(DM_at_OrderPersonName; DM_at_OrderPersonInitials)
			COPY ARRAY:C226(DM_at_OrderPersonName; DM_at_OrderTBName)
			COPY ARRAY:C226(DM_at_OrderPersonInitials; DM_at_OrderTBINIT)
			
		End if 
		//`````
		//company stuff
		//[COMPANIES]Area
		If (Size of array:C274(DM_at_OrderAreaName)=0)
			ALL RECORDS:C47([AREAS:3])
			SELECTION TO ARRAY:C260([AREAS:3]Area_Code:1; DM_at_OrderAreaCode; [AREAS:3]Area_Name:2; DM_at_OrderAreaName)
			SORT ARRAY:C229(DM_at_OrderAreaName; DM_at_OrderAreaCode)
		End if 
		
		//[COMPANIES]Status  `[CONTACTS]Status
		
		If (Size of array:C274(DM_at_ContactStatusName)=0)
			ALL RECORDS:C47([STATUS:4])
			SELECTION TO ARRAY:C260([STATUS:4]Status_Code:1; DM_at_ContactStatusCode; [STATUS:4]Status_Name:2; DM_at_ContactStatusName)
			SORT ARRAY:C229(DM_at_ContactStatusName; DM_at_ContactStatusCode)
		End if 
		
		
		
		//[COMPANIES]SL Terms ` [COMPANIES]PL Terms
		If (Size of array:C274(DM_at_OrderTerms)=0)
			$_l_ListID:=AA_LoadListByName("Terms"; ->DM_at_OrderTerms; ->DM_al_OrderTerms; False:C215)
		End if 
		
		//[COMPANIES]Default VAT
		If (Size of array:C274(DM_at_ContactTaxName)=0)
			ALL RECORDS:C47([TAX_CODES:35])
			SELECTION TO ARRAY:C260([TAX_CODES:35]Tax_Code:1; DM_at_ContactTaxCode; [TAX_CODES:35]Tax_Name:2; DM_at_ContactTaxName; [TAX_CODES:35]Tax_Rate:3; DM_ar_ContactTaxRate)
			SORT ARRAY:C229(DM_at_ContactTaxName; DM_ar_ContactTaxRate; DM_at_ContactTaxCode)
		End if 
		
		//[COMPANIES]Default Stage
		If (Size of array:C274(DM_at_ContactStageName)=0)
			ALL RECORDS:C47([CREDIT_STAGES:54])
			SELECTION TO ARRAY:C260([CREDIT_STAGES:54]Stage_Code:1; DM_at_ContactStageCode; [CREDIT_STAGES:54]Stage_Name:2; DM_at_ContactStageName)
			SORT ARRAY:C229(DM_at_ContactStageName; DM_at_ContactStageCode)
			
		End if 
		//[COMPANIES]SO Price Group
		
		If (Size of array:C274(DM_at_SOPriceGroupNames)=0)
			QUERY:C277([PRICE_GROUPS:18]; [PRICE_GROUPS:18]Cost_Prices:4=False:C215)
			SELECTION TO ARRAY:C260([PRICE_GROUPS:18]Price_Code:1; DM_at_SOPriceGroups; [PRICE_GROUPS:18]Price_Name:2; DM_at_SOPriceGroupNames)
			SORT ARRAY:C229(DM_at_SOPriceGroupNames; DM_at_SOPriceGroups)
		End if 
		
		//[COMPANIES]Default Layer
		If (Size of array:C274(DM_at_OrderLayerCode)=0)
			ALL RECORDS:C47([LAYERS:76])
			SELECTION TO ARRAY:C260([LAYERS:76]Layer_Code:1; DM_at_OrderLayerCode)
			SORT ARRAY:C229(DM_at_OrderLayerCode)
			
		End if 
		
		//[COMPANIES]PO Price Group
		If (Size of array:C274(DM_at_POPriceGroupCodes)=0)
			QUERY:C277([PRICE_GROUPS:18]; [PRICE_GROUPS:18]Cost_Prices:4=True:C214)
			SELECTION TO ARRAY:C260([PRICE_GROUPS:18]Price_Code:1; DM_at_POPriceGroups; [PRICE_GROUPS:18]Price_Name:2; DM_at_POPriceGroupCodes)
			SORT ARRAY:C229(DM_at_SOPriceGroupNames; DM_at_SOPriceGroups)
		End if 
		
		If ($2>0)
			If ([PREFERENCES:116]IDNumber:1#$2)
				QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]IDNumber:1=$2)
			End if 
			
			DM_l_CurrentOptions:=$2
			$_l_offset:=0
			DM_ContactDefBlobtoVariables
			
			//set variables in here
			$_l_rolePosition:=Find in array:C230(DM_at_ContactRoleCode; DM_t_ContactRoleCode)
			If ($_l_rolePosition>0)
				DM_t_ContactRoleName:=DM_at_ContactRoleName{$_l_rolePosition}
			Else 
				DM_t_ContactRoleCode:=""
				DM_t_ContactRoleName:=""
			End if 
			$_l_SourcePosition:=Find in array:C230(DM_at_OrderSourceCode; DM_t_ContactSourceCode)
			If ($_l_SourcePosition>0)
				DM_t_ContactSourceName:=DM_at_OrderSourceName{$_l_SourcePosition}
			Else 
				DM_t_ContactSourceCode:=""
				DM_t_ContactSourceName:=""
			End if 
			$_l_ContactTypePosition:=Find in array:C230(DM_at_ContactTypeCode; DM_t_ContactTypeCode)
			If ($_l_ContactTypePosition>0)
				DM_t_ContactTypeName:=DM_at_OrderTypeName{$_l_ContactTypePosition}
			Else 
				DM_t_ContactTypeCode:=""
				DM_t_ContactTypeName:=""
			End if 
			$_l_SalePersonPosition:=Find in array:C230(DM_at_OrderPersonInitials; DM_t_ContactSPInitials)
			If ($_l_SalePersonPosition>0)
				DM_t_ContactSPName:=DM_at_OrderPersonName{$_l_SalePersonPosition}
			Else 
				DM_t_ContactSPInitials:=""
				DM_t_ContactSPName:=""
			End if 
			$_l_TabkenByPosition:=Find in array:C230(DM_at_OrderPersonInitials; DM_t_ContactTBinitials)
			If ($_l_TabkenByPosition>0)
				DM_t_ContactTBname:=DM_at_OrderPersonName{$_l_TabkenByPosition}
			Else 
				DM_t_ContactTBinitials:=""
				DM_t_ContactTBname:=""
			End if 
			$_l_AreaCodePosition:=Find in array:C230(DM_at_OrderAreaCode; DM_t_ContactAreaCode)
			If ($_l_AreaCodePosition>0)
				DM_t_ContactAreaName:=DM_at_OrderAreaName{$_l_AreaCodePosition}
			Else 
				DM_t_ContactAreaName:=""
				DM_t_ContactAreaCode:=""
			End if 
			$_l_StatusPosition:=Find in array:C230(DM_at_CompanyStatusCode; DM_t_ContactStatusCode)
			If ($_l_StatusPosition>0)
				DM_t_ContactStatusName:=DM_at_CompanyStatusName{$_l_StatusPosition}
			Else 
				DM_t_ContactStatusName:=""
				DM_t_CompanyStatusCode:=""
			End if 
			$_l_TaxCodePosition:=Find in array:C230(DM_at_ContactTaxCode; DM_t_ContactTAXCode)
			If ($_l_TaxCodePosition>0)
				DM_t_ContactTAXName:=DM_at_ContactTaxName{$_l_TaxCodePosition}
				DM_R_ContactTaxRate:=DM_ar_ContactTaxRate{$_l_TaxCodePosition}
			Else 
				DM_t_ContactTAXName:=""
				DM_t_ContactTAXCode:=""
				DM_R_ContactTaxRate:=0
				
			End if 
			$_l_StageCodePositon:=Find in array:C230(DM_at_ContactStageCode; DM_t_ContactStageCode)
			If ($_l_StageCodePositon>0)
				DM_t_ContactStageName:=DM_at_ContactStageName{$_l_StageCodePositon}
			Else 
				DM_t_ContactStageName:=""
				DM_t_ContactStageCode:=""
				
			End if 
			$_l_PriceGroupPosition:=Find in array:C230(DM_at_SOPriceGroups; DM_t_ContactSOPriceGroupCode)
			If ($_l_PriceGroupPosition>0)
				DM_t_ContactSOPriceGroupName:=DM_at_SOPriceGroupNames{$_l_PriceGroupPosition}
			Else 
				DM_t_ContactSOPriceGroupName:=""
				DM_t_ContactSOPriceGroupCode:=""
			End if 
			$_l_PriceGroupPositon:=Find in array:C230(DM_at_POPriceGroups; DM_t_ContactPOPriceGroupCode)
			If ($_l_PriceGroupPositon>0)
				DM_t_ContactPOPriceGroupNM:=DM_at_POPriceGroupCodes{$_l_PriceGroupPositon}
			Else 
				DM_t_ContactPOPriceGroupNM:=""
				DM_t_ContactPOPriceGroupCode:=""
			End if 
			
		Else 
			DM_t_ContactRoleCode:=""
			DM_t_ContactRoleName:=""
			DM_t_ContactSourceCode:=""
			DM_t_ContactSourceName:=""
			DM_t_ContactTypeCode:=""
			DM_t_ContactTypeName:=""
			DM_t_ContactSPInitials:=""
			DM_t_ContactSPName:=""
			DM_t_ContactTBinitials:=""
			DM_t_ContactTBname:=""
			DM_t_ContactAreaName:=""
			DM_t_ContactAreaCode:=""
			DM_t_ContactStatusName:=""
			DM_t_CompanyStatusCode:=""
			DM_t_ContactTAXName:=""
			DM_t_ContactTAXCode:=""
			DM_R_ContactTaxRate:=0
			DM_t_ContactStageName:=""
			DM_t_ContactStageCode:=""
			DM_t_ContactSOPriceGroupName:=""
			DM_t_ContactSOPriceGroupCode:=""
			
			
		End if 
		
		
		
End case 
ERR_MethodTrackerReturn("DM_OptionSettingsToScreen"; $_t_oldMethodName)