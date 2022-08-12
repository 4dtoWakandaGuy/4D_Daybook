//%attributes = {}
If (False:C215)
	//Project Method Name:      CTypes_InLPB
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 03/06/2010 18:53
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//C_UNKNOWN(CONT_4DWriteText)
	//C_UNKNOWN(SVS_iRB_ChargoutBilling)
	//C_UNKNOWN(SVS2_iRB_ChargePartPeriodnil)
	//C_UNKNOWN(SVS2_iRB_ChargeProRata)
	//C_UNKNOWN(vPriceName)
	//C_UNKNOWN(WR DELETE OFFSCREEN AREA)
	//C_UNKNOWN(WR INSERT TEXT)
	//C_UNKNOWN(WR PICTURE TO AREA)
	//ARRAY BOOLEAN(CONT_abo_IsDefault;0)
	//ARRAY BOOLEAN(QV_abo_Exclude;0)
	//ARRAY BOOLEAN(QV_abo_include;0)
	//ARRAY BOOLEAN(SVS_abo_IsChargable;0)
	//ARRAY BOOLEAN(SVS_lb_ChargeActions;0)
	//ARRAY BOOLEAN(SVS_lb_ChargingProducts;0)
	//ARRAY BOOLEAN(SVS_lb_RestrictCharging;0)
	ARRAY TEXT:C222($_at_ProductCodes; 0)
	ARRAY TEXT:C222($_at_ProductNames; 0)
	//ARRAY TEXT(CNT_at_ProductNames;0)
	//ARRAY TEXT(CONT_at_OpenEndedStatus;0)
	//ARRAY TEXT(CONT_at_ProductCodes;0)
	//ARRAY TEXT(QV_at_Values;0)
	//ARRAY TEXT(SVS_at_ActionCodes;0)
	//ARRAY TEXT(SVS_at_ActionName;0)
	//ARRAY TEXT(SVS_at_ChargableActions;0)
	//ARRAY TEXT(SVS_at_ChargePeriods;0)
	//ARRAY TEXT(SVS_at_ContractOptions;0)
	C_BOOLEAN:C305($_bo_4DWriteFound; $_bo_4DWriteInstalled; SVS_bo_Chargable; SVS_bo_LoansBilling; SVS_bo_PartsBilling; SVS_bo_TimeOption; $_bo_4DWriteFound; $_bo_4DWriteInstalled; SVS_bo_Chargable; SVS_bo_LoansBilling; SVS_bo_PartsBilling)
	C_BOOLEAN:C305(SVS_bo_TimeOption)
	C_LONGINT:C283($_l_Index; $_l_Offscreen; $_l_ProductRow; CONT_4DWriteText; CONT_l_BUT1; CONT_l_BUT2; CONT_l_BUT3; CONT_l_BUT4; CONT_l_BUT5; CONT_l_BUT6; CONT_l_BUT7)
	C_LONGINT:C283(CONT_l_BUT9; CONTpp_l_BUT1; CONTpp_l_BUT2; CONTpp_l_BUT3; CONTpp_l_BUT4; CONTpp_l_BUT5; CONTpp_l_BUT6; CONTpp_l_BUT7; CONTpp_l_BUT8; CONTpp_l_BUT9; SVS_iRB_ChargoutBilling)
	C_LONGINT:C283(SVS_l_ChargeLoanOption; SVS_l_ChargePeriodType; SVS_l_LoansPricePeriod; SVS_l_LoansPricePeriodOLD; SVS_l_TimeBilling; SVS_l_TimeMinimum; SVS_l_TimeMinimumOLD; SVS_l_TimePerUnit; SVS_l_TimePerUnitOLD; SVS_lb_RestrictCharging; SVS2_iRB_ChargePartPeriodnil)
	C_LONGINT:C283(SVS2_iRB_ChargeProRata; $_l_Index; $_l_Offscreen; $_l_ProductRow; CONT_l_BUT8; SVS_iRB_TimeBilling; SVS_l_ChargeLoanOption; SVS_l_ChargePeriodType; SVS_l_LoansPricePeriod; SVS_l_LoansPricePeriodOLD; SVS_l_TimeBilling)
	C_LONGINT:C283(SVS_l_TimeMinimum; SVS_l_TimeMinimumOLD; SVS_l_TimePerUnit; SVS_l_TimePerUnitOLD; SVS2_iRB_ChargePartPeriod)
	C_OBJECT:C1216($_obj_Currencies; $_obj_Document; $_obj_Documents; $_obj_Licence; $_obj_PriceGroups; $_obj_ThisLicence; CONT_Obj_4DwriteText; $_obj_Currencies; $_obj_Document; $_obj_Documents; $_obj_PriceGroups)
	C_OBJECT:C1216(CONT_Obj_4DwriteText)
	C_REAL:C285(CNT_l_SHowChargeActions)
	C_TEXT:C284(CONT_t_OpenEndedStatus; oContractpp_COL1; oContractpp_COL2; oContractpp_COL3; oContractpp_COL4; oContractpp_COL5; oContractpp_COL6; oContractpp_COL7; oContractpp_COL8; oContractpp_COL9)
	C_TEXT:C284(oContractpp_HED1; oContractpp_HED3; oContractpp_HED4; oContractpp_HED5; oContractpp_HED6; oContractpp_HED7; oContractpp_HED8; oContractpp_HED9; oContracttp_COL1; oContracttp_COL2; oContracttp_COL3)
	C_TEXT:C284(oContracttp_COL4; oContracttp_COL6; oContracttp_COL7; oContracttp_COL8; oContracttp_COL9; oContracttp_HED1; oContracttp_HED2; oContracttp_HED3; oContracttp_HED4; oContracttp_HED5; oContracttp_HED6)
	C_TEXT:C284(oContracttp_HED7; oContracttp_HED9; SVS_t_CurrencyCode; SVS_t_CurrencyCodeOLD; SVS_t_CurrencyName; SVS_t_LoansPriceGroup; SVS_t_LoansPriceGroupNames; SVS_t_PartsPriceGroup; SVS_t_PartsPriceGroupName; SVS_t_PartsPriceGroupOLD; vPriceName)
	C_TEXT:C284($_t_oldMethodName; $_t_WriteType; CONT_t_OpenEndedStatus; oContractpp_HED2; oContracttp_COL5; oContracttp_HED8; SVS_t_CurrencyCode; SVS_t_CurrencyCodeOLD; SVS_t_CurrencyName; SVS_t_LoansPriceGroup; SVS_t_LoansPriceGroupNames)
	C_TEXT:C284(SVS_t_LoansPriceGroupOLD; SVS_t_PartsPriceGroup; SVS_t_PartsPriceGroupName; SVS_t_PartsPriceGroupOLD)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("CTypes_InLPB")
RELATE ONE:C42([CONTRACT_TYPES:19]Price_Group:7)
vPriceName:=[PRICE_GROUPS:18]Price_Name:2
ARRAY TEXT:C222(CONT_at_OpenEndedStatus; 3)
CONT_at_OpenEndedStatus{1}:="Cannot be open ended"
CONT_at_OpenEndedStatus{2}:="Can be open ended"
CONT_at_OpenEndedStatus{3}:="Is always open ended"
CONT_t_OpenEndedStatus:=CONT_at_OpenEndedStatus{[CONTRACT_TYPES:19]xOpenEndedStatus:12+1}

SVS_ContractTypeLoadRules
OBJECT SET ENTERABLE:C238(SVS_t_CurrencyCode; SVS_bo_Chargable)
OBJECT SET ENABLED:C1123(SVS_iRB_TimeBilling; SVS_bo_Chargable)
OBJECT SET ENABLED:C1123(SVS_iRB_ChargoutBilling; SVS_bo_Chargable)
OBJECT SET VISIBLE:C603(SVS_t_CurrencyName; (SVS_t_CurrencyCode#""))
If (SVS_bo_Chargable)
	If (SVS_t_CurrencyCode#"")
		$_obj_Currencies:=ds:C1482.currencies.query("Currency_Code =:1"; SVS_t_CurrencyCode)
		If ($_obj_Currencies.length=1)
			SVS_t_CurrencyName:=$_obj_Currencies[0].Currency_Name
			OBJECT SET VISIBLE:C603(SVS_t_CurrencyName; True:C214)
		End if 
	End if 
	Case of 
		: (SVS_l_TimeBilling=1)
			SVS_iRB_TimeBilling:=1
			OBJECT SET ENTERABLE:C238(SVS_l_TimePerUnit; True:C214)
			OBJECT SET ENTERABLE:C238(SVS_l_TimeMinimum; True:C214)
			OBJECT SET ENABLED:C1123(SVS_bo_TimeOption; True:C214)
			SVS_iRB_ChargoutBilling:=0
		Else 
			SVS_iRB_TimeBilling:=0
			OBJECT SET ENTERABLE:C238(SVS_l_TimePerUnit; False:C215)
			OBJECT SET ENTERABLE:C238(SVS_l_TimeMinimum; False:C215)
			SVS_iRB_ChargoutBilling:=1
	End case 
	
	
Else 
	OBJECT SET ENTERABLE:C238(SVS_l_TimePerUnit; SVS_bo_Chargable)
	OBJECT SET ENTERABLE:C238(SVS_l_TimeMinimum; SVS_bo_Chargable)
	OBJECT SET ENABLED:C1123(SVS_bo_TimeOption; SVS_bo_Chargable)
	OBJECT SET ENTERABLE:C238(SVS_t_CurrencyCode; SVS_bo_Chargable)
	OBJECT SET ENABLED:C1123(SVS_bo_TimeOption; SVS_bo_Chargable)
	OBJECT SET ENABLED:C1123(SVS_iRB_TimeBilling; SVS_bo_Chargable)
	OBJECT SET ENABLED:C1123(SVS_iRB_ChargoutBilling; SVS_bo_Chargable)
	OBJECT SET ENABLED:C1123(SVS_lb_RestrictCharging; SVS_bo_Chargable)
	
End if 
OBJECT SET ENTERABLE:C238(SVS_t_PartsPriceGroup; SVS_bo_PartsBilling)
OBJECT SET VISIBLE:C603(SVS_t_PartsPriceGroupName; SVS_bo_PartsBilling)
SVS_t_PartsPriceGroupName:=""
If (SVS_bo_PartsBilling)
	$_obj_PriceGroups:=ds:C1482.PRICE_GROUPS.query("Price_Code =:1"; SVS_t_PartsPriceGroup)
	If ($_obj_PriceGroups.length=1)
		
		//QUERY([PRICE_GROUPS]; [PRICE_GROUPS]Price_Code=SVS_t_PartsPriceGroup)
		SVS_t_PartsPriceGroupName:=$_obj_PriceGroups[0].Price_Name
	End if 
End if 
OBJECT SET ENTERABLE:C238(SVS_t_LoansPriceGroup; SVS_bo_LoansBilling)
OBJECT SET ENTERABLE:C238(SVS_l_LoansPricePeriod; SVS_bo_LoansBilling)
OBJECT SET VISIBLE:C603(SVS_t_LoansPriceGroupNames; SVS_bo_LoansBilling)
OBJECT SET VISIBLE:C603(SVS_at_ChargePeriods; SVS_bo_LoansBilling)
OBJECT SET ENABLED:C1123(SVS2_iRB_ChargeProRata; SVS_bo_LoansBilling)
OBJECT SET ENABLED:C1123(SVS2_iRB_ChargePartPeriod; SVS_bo_LoansBilling)
OBJECT SET ENABLED:C1123(SVS2_iRB_ChargePartPeriodnil; SVS_bo_LoansBilling)
SVS_t_LoansPriceGroupNames:=""
If (SVS_bo_LoansBilling)
	$_obj_PriceGroups:=ds:C1482.PRICE_GROUPS.query("Price_Code =:1"; SVS_t_LoansPriceGroup)
	If ($_obj_PriceGroups.length=1)
		//QUERY([PRICE_GROUPS]; [PRICE_GROUPS]Price_Code=SVS_t_LoansPriceGroup)
		SVS_t_LoansPriceGroupNames:=$_obj_PriceGroups[0].Price_Name
	End if 
	SVS_at_ChargePeriods:=SVS_l_ChargePeriodType
	Case of 
		: (SVS_l_ChargeLoanOption=2)
			SVS2_iRB_ChargeProRata:=1
			SVS2_iRB_ChargePartPeriod:=0
			SVS2_iRB_ChargePartPeriodnil:=0
		: (SVS_l_ChargeLoanOption=1)
			SVS2_iRB_ChargeProRata:=0
			SVS2_iRB_ChargePartPeriod:=1
			SVS2_iRB_ChargePartPeriodnil:=0
		: (SVS_l_ChargeLoanOption=0)
			SVS2_iRB_ChargeProRata:=0
			SVS2_iRB_ChargePartPeriod:=0
			SVS2_iRB_ChargePartPeriodnil:=1
	End case 
	
Else 
	SVS_at_ChargePeriods:=0
	
End if 
// Set up the list box area for  showing the charge-able options
ALL RECORDS:C47([ACTIONS:13])
//Do all actions belong here
//Yep
ARRAY TEXT:C222(SVS_at_ActionCodes; 0)
ARRAY TEXT:C222(SVS_at_ActionName; 0)
ARRAY BOOLEAN:C223(SVS_abo_IsChargable; 0)

SELECTION TO ARRAY:C260([ACTIONS:13]Action_Code:1; SVS_at_ActionCodes; [ACTIONS:13]Action_Name:2; SVS_at_ActionName)
ARRAY BOOLEAN:C223(SVS_abo_IsChargable; Size of array:C274(SVS_at_ActionCodes))

//Now check the items in
If (Size of array:C274(SVS_at_ChargableActions)>0)
	For ($_l_Index; 1; Size of array:C274(SVS_at_ChargableActions))
		$_l_ProductRow:=Find in array:C230(SVS_at_ActionCodes; SVS_at_ChargableActions{$_l_Index})
		If ($_l_ProductRow>0)
			SVS_abo_IsChargable{$_l_ProductRow}:=True:C214
		End if 
	End for 
Else 
	//all charge-able
	For ($_l_Index; 1; Size of array:C274(SVS_abo_IsChargable))
		SVS_abo_IsChargable{$_l_Index}:=True:C214
	End for 
	
	
	
End if 
//```

LB_SetupListbox(->SVS_lb_ChargeActions; "oContracttp"; "CONT_L"; 1; ->SVS_abo_IsChargable; ->SVS_at_ActionCodes; ->SVS_at_ActionName)
LB_SetColumnHeaders(->SVS_lb_ChargeActions; "CONT_L"; 1; "Charge"; "Action Code"; "Action Name")

LB_SetColumnWidths(->SVS_lb_ChargeActions; "oContracttp"; 1; 35; 90; 90)


LB_SETENTRYOPTIONS  // doesn't actually do anything ...
ARRAY TEXT:C222(QV_at_Values; 6)
LB_StyleSettings(->SVS_lb_ChargeActions; "blue"; 9; "oContracttp"; ->[CONTRACTS:17])
LB_SetScroll(->SVS_lb_ChargeActions; -3; -2)
LB_SetEnterable(->SVS_lb_ChargeActions; False:C215; 0)
LB_SetEnterable(->SVS_lb_ChargeActions; True:C214; 1)
LB_SetSortOptions(->SVS_lb_ChargeActions; 0)
OBJECT SET FORMAT:C236(QV_abo_include; " ")  // display as checkboxes
OBJECT SET FORMAT:C236(QV_abo_Exclude; " ")
CNT_l_SHowChargeActions:=0
ARRAY TEXT:C222(SVS_at_ContractOptions; 3)
SVS_at_ContractOptions{1}:="Contract Text"
SVS_at_ContractOptions{2}:="Contract Billing products"
SVS_at_ContractOptions{3}:="Contract Work Charging Options"
$_bo_4DWriteInstalled:=False:C215
If (UTIL_4DwriteEnabled) & (User in group:C338(Current user:C182; "4D Write Group"))
	$_bo_4DWriteInstalled:=True:C214
End if 

If ([CONTRACT_TYPES:19]Contract_Type_Code:1#"")
	QUERY:C277([Contract_Type_Products:191]; [Contract_Type_Products:191]xContractTypeCode:1=[CONTRACT_TYPES:19]Contract_Type_Code:1)
Else 
	REDUCE SELECTION:C351([Contract_Type_Products:191]; 0)
End if 
SELECTION TO ARRAY:C260([Contract_Type_Products:191]xProductCodes:2; CONT_at_ProductCodes; [Contract_Type_Products:191]xDefaultProduct:3; CONT_abo_IsDefault)
If (Size of array:C274(CONT_at_ProductCodes)>0)
	READ ONLY:C145([PRODUCTS:9])
	If (Size of array:C274(CONT_at_ProductCodes)>1)
		QUERY WITH ARRAY:C644([PRODUCTS:9]Product_Code:1; CONT_at_ProductCodes)
	Else 
		QUERY:C277([PRODUCTS:9]; [PRODUCTS:9]Product_Code:1=CONT_at_ProductCodes{1})
	End if 
	ARRAY TEXT:C222(CNT_at_ProductNames; Size of array:C274(CONT_at_ProductCodes))
	SELECTION TO ARRAY:C260([PRODUCTS:9]Product_Code:1; $_at_ProductCodes; [PRODUCTS:9]Product_Name:2; $_at_ProductNames)
	For ($_l_Index; 1; Size of array:C274($_at_ProductCodes))
		$_l_ProductRow:=Find in array:C230(CONT_at_ProductCodes; $_at_ProductCodes{$_l_Index})
		If ($_l_ProductRow>0)
			CNT_at_ProductNames{$_l_ProductRow}:=$_at_ProductNames{$_l_Index}
			
		End if 
	End for 
Else 
	ARRAY TEXT:C222(CNT_at_ProductNames; 0)
End if 


LB_SetupListbox(->SVS_lb_ChargingProducts; "oContractpp"; "CONTpp_L"; 1; ->CONT_abo_IsDefault; ->CONT_at_ProductCodes; ->CNT_at_ProductNames)
LB_SetColumnHeaders(->SVS_lb_ChargingProducts; "CONTpp_L"; 1; "Default"; "Product Code"; "Product Name")
LB_SetColumnWidths(->SVS_lb_ChargingProducts; "oContractpp"; 1; 35; 90; 90)
LB_SETENTRYOPTIONS  // doesn't actually do anything ...
ARRAY TEXT:C222(QV_at_Values; 6)
LB_StyleSettings(->SVS_lb_ChargingProducts; "blue"; 9; "oContractpp"; ->[CONTRACTS:17])
LB_SetScroll(->SVS_lb_ChargingProducts; -3; -2)
LB_SetEnterable(->SVS_lb_ChargingProducts; False:C215; 0)
LB_SetEnterable(->SVS_lb_ChargingProducts; True:C214; 1)
LB_SetSortOptions(->SVS_lb_ChargingProducts; 0)
$_t_WriteType:=Documents_4DWriteAccessType(True:C214)
If ($_t_WriteType="WS") | (($_t_WriteType="W") & (DB_UserHas4DWriteAccess))
	//The document created here is a template..
	//on a contract the document will be a copy of that template
	OBJECT SET VISIBLE:C603([CONTRACT_TYPES:19]Contract_Text:6; False:C215)
	OBJECT SET VISIBLE:C603(CONT_4DWriteText; True:C214)
	
	If ([CONTRACT_TYPES:19]Contract_DOCRef:10#"")
		$_obj_Documents:=ds:C1482.DOCUMENTS.query("Document_Code =:1"; [CONTRACT_TYPES:19]Contract_DOCRef:10)
		If ($_obj_Documents.length=1)
			$_obj_Document:=$_obj_Documents[0]
			CONT_Obj_4DwriteText:=$_obj_Document.DocumentWPPro
			//QUERY([DOCUMENTS]; [DOCUMENTS]Document_Code=[CONTRACT_TYPES]Contract_DOCRef)
			//WR PICTURE TO AREA(CONT_4DWriteText; [DOCUMENTS]Write_)
			DOC_SetWriteModifiable(CONT_4DWriteText; 2; True:C214; CONT_Obj_4DwriteText)
		Else 
			//No document currently exists
			If ([CONTRACT_TYPES:19]Contract_Text:6#"")  // put this text into and create the document
				CREATE RECORD:C68([DOCUMENTS:7])
				[DOCUMENTS:7]Document_Class:14:=4D Write Letter Template
				[DOCUMENTS:7]Document_Status:15:=0
				[DOCUMENTS:7]Table_Number:11:=Table:C252(->[CONTRACT_TYPES:19])
				[DOCUMENTS:7]Heading:2:=[CONTRACT_TYPES:19]Contract_Type_Name:2
				Set_DocumentCode(1)
				CONT_Obj_4DwriteText:=WP New:C1317
				
				
				$_l_Offscreen:=WR New offscreen area:P12000:47  //wr new offscreen area
				WR INSERT TEXT:P12000:19($_l_Offscreen; [CONTRACT_TYPES:19]Contract_Text:6)
				[DOCUMENTS:7]Write_:5:=WR Area to picture:P12000:139($_l_Offscreen; 1; 1)
				WR DELETE OFFSCREEN AREA:P12000:38($_l_Offscreen)
				DB_SaveRecord(->[DOCUMENTS:7])
				WR PICTURE TO AREA:P12000:141(CONT_4DWriteText; [DOCUMENTS:7]Write_:5)
				DOC_SetWriteModifiable(CONT_4DWriteText; 2; True:C214)
			Else 
				//jUst set the 4D write area to editable
				DOC_SetWriteModifiable(CONT_4DWriteText; 2; True:C214)
			End if 
		End if 
		
	Else 
		OBJECT SET VISIBLE:C603([CONTRACT_TYPES:19]Contract_Text:6; True:C214)
		OBJECT SET VISIBLE:C603(CONT_4DWriteText; False:C215)
	End if 
	SVS_t_CurrencyCodeOLD:=SVS_t_CurrencyCode  // to track user changing
	SVS_l_TimePerUnitOLD:=SVS_l_TimePerUnit
	SVS_l_TimeMinimumOLD:=SVS_l_TimeMinimum
	SVS_t_PartsPriceGroupOLD:=SVS_t_PartsPriceGroup
	SVS_t_LoansPriceGroupOLD:=SVS_t_LoansPriceGroup
	SVS_l_LoansPricePeriodOLD:=SVS_l_LoansPricePeriod
	
	
End if 
//```
ERR_MethodTrackerReturn("CTypes_InLPB"; $_t_oldMethodName)
