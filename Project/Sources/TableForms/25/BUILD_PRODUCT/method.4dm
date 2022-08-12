If (False:C215)
	//Table Form Method Name: [ORDER_ITEMS]BUILD_PRODUCT
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 25/04/2011 13:05
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(OI_abo_ComponentAdditional;0)
	//ARRAY BOOLEAN(OI_abo_IncludeByDefault;0)
	//ARRAY BOOLEAN(OI_abo_IncludeInProduct;0)
	//ARRAY BOOLEAN(OI_abo_OptionalComponent;0)
	//ARRAY BOOLEAN(OI_abo_UserSetInclude;0)
	//ARRAY BOOLEAN(OI_abo_HasRestrictions;0)
	//ARRAY BOOLEAN(PRD_abo_BLBInclude;0)
	ARRAY LONGINT:C221($_al_Preferred; 0)
	ARRAY LONGINT:C221($_al_RestrictSection; 0)
	//ARRAY LONGINT(MOD_al_ModuleBarNum;0)
	//ARRAY LONGINT(MOD_al_ModuleBarOffsets;0)
	//ARRAY LONGINT(OI_al_BuidCodeLength;0)
	//ARRAY LONGINT(OI_al_BuildPriceClass;0)
	//ARRAY LONGINT(OI_al_ChargingPriceClass;0)
	//ARRAY LONGINT(OI_al_ComponentID;0)
	//ARRAY LONGINT(OI_al_ComponentSectionID;0)
	//ARRAY LONGINT(OI_al_ComponentType;0)
	//ARRAY LONGINT(OI_al_MultiplesIndex;0)
	//ARRAY LONGINT(OI_al_MultiSubIndex;0)
	//ARRAY LONGINT(OI_al_SectionIDS;0)
	//ARRAY LONGINT(OI_al_SectionLength;0)
	ARRAY REAL:C219($_ar_SupplierCost; 0)
	ARRAY REAL:C219($_ar_SupplierStdCost; 0)
	//ARRAY REAL(OI_ar_AdditionalItemQTY;0)
	//ARRAY REAL(OI_ar_BuildCodeBASEPrice;0)
	//ARRAY REAL(OI_ar_BuildCodeCOSTPrice;0)
	//ARRAY REAL(OI_ar_BuildCodeCostStd;0)
	//ARRAY REAL(OI_ar_BuildCodePrice;0)
	//ARRAY REAL(OI_ar_BuildCodeSALESPrice;0)
	//ARRAY REAL(OI_ar_BuildProductComponentsQTY;0)
	//ARRAY REAL(OI_ar_DefaultQuantity;0)
	//ARRAY REAL(OI_ar_AdditionalItemPriceBase;0)
	//ARRAY REAL(OK_ar_AdditionalItemCOSTPrice;0)
	//ARRAY REAL(OK_ar_AdditionalItemPrice;0)
	ARRAY TEXT:C222($_At_FilterName; 0)
	ARRAY TEXT:C222($_at_SupplierCode; 0)
	ARRAY TEXT:C222($_at_SupplierCostCurrency; 0)
	//ARRAY TEXT(OI_at_AdditionOrderItems;0)
	//ARRAY TEXT(OI_at_BuildCodeMatrix;0)
	//ARRAY TEXT(OI_at_BuildCodeSupplier;0)
	//ARRAY TEXT(OI_at_BuildProductComponents;0)
	//ARRAY TEXT(OI_at_FillChar;0)
	//ARRAY TEXT(OI_at_FillStyle;0)
	//ARRAY TEXT(OI_at_MultipleCodes;0;0)
	//ARRAY TEXT(OI_at_MultiSubCodes;0;0)
	//ARRAY TEXT(OI_at_MultiSubParentCode;0)
	//ARRAY TEXT(OI_at_OutputCodeMacro;0)
	//ARRAY TEXT(OI_at_ProductSections;0)
	//ARRAY TEXT(OI_at_SectionName;0)
	//ARRAY TEXT(OK_at_MultiSubProduct;0)
	//ARRAY TEXT(PRD_at_BLDprdNames;0)
	//ARRAY TEXT(PRD_at_Outputcode;0)
	C_BOOLEAN:C305($_bo_Continue; $_bo_Exit; DB_bo_NoLoad; OI_bo_AlloptionsSelected; OI_bo_CustomerPriceSet; OI_bo_ProductEnter; OI_bo_UseDiscount; PAL_bo_ButtonSubFunction)
	C_LONGINT:C283($_l_ButtonNumber; $_l_ButtonPressed; $_l_ComponentID; $_l_ComponentIndex; $_l_Difference; $_l_event; $_l_Index2; $_l_ModuleRow; $_l_NextPrefferred; $_l_offset; $_l_ProductBuildFormatID)
	C_LONGINT:C283($_l_RestrictionsSet; $_l_Row; $_l_SizeofArray; DB_l_ButtonClickedFunction; DB_l_WindowCurrentModule; iCancel; iOK; ModuleNumber; OI_l_AndTab; PAL_but_LastRecord; PAL_but_PreviousRecord)
	C_LONGINT:C283(PAL_but_NextRecord; PAL_but_FirstRecord; PRD_l_ExtraDates; PRD_l_productCurrency)
	C_REAL:C285($_r_ComponentCostPrice; $_r_ComponentPrice; $_r_UseStandardCost; $_r_useSupplierCost; OI_R_BuiltPrice; OI_R_SalesPrice; SRCH_r_Timer; SRCH_r_TimerOLD)
	C_TEXT:C284(<>SYS_t_BaseCurrency; $_t_FillChars; $_t_FillString; $_t_oldMethodName; $_t_OutputComponentCode; $_t_PalletButtonName; $_t_UseSupplierCode; $_t_UseSupplierCurrency; BAR_t_Button; DB_t_CUrrentInputMenuRef; OI_t_BuiltCode)
	C_TEXT:C284(OI_T_CurrencyCode; OI_t_InputProductCode; OI_t_LookupValue; OI_t_ProductBuiltCode; OI_t_ProductCode; OI_t_ProductName; PAL_BUTTON; PRD_t_BuildBrandCode; PRD_t_BuildGroupCode; PRD_t_BuildProductName; PRD_t_productCurrency)
	C_TEXT:C284(PT_t_DefaultTax; SRCH_t_SearchValue; SRCH_t_SearchValueOLD; vButtDisOI; WIN_t_CurrentInputForm)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FM [ORDER_ITEMS].BUILD_PRODUCT"; Form event code:C388)
$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		DB_SetnewToolBar
		vButtDisOI:="A"
		In_ButtChkDis(->vButtDisOI)
		If (OI_T_CurrencyCode="")
			OI_T_CurrencyCode:=<>SYS_t_BaseCurrency
		End if 
		OI_R_SalesPrice:=0
		OI_R_BuiltPrice:=0
		//The following arrays relate to the build code format itself
		ARRAY LONGINT:C221(OI_al_SectionIDS; 0)
		ARRAY TEXT:C222(OI_at_SectionName; 0)
		ARRAY LONGINT:C221(OI_al_SectionLength; 0)
		ARRAY TEXT:C222(OI_at_FillChar; 0)
		ARRAY TEXT:C222(OI_at_FillStyle; 0)
		
		
		//Note that the CREATED output product will be in the BASE currency. The Price table entries relating to it though will be in the converted currency..
		//The Follow arrays correspond to the build code format.
		//The first group is for products that wil be added as additional products to the order. note that the rows in these arrays correspond to the sections so there will be blank rows
		ARRAY TEXT:C222(OI_at_AdditionOrderItems; 0)  //The product code
		ARRAY REAL:C219(OI_ar_AdditionalItemQTY; 0)  //The Quantity
		ARRAY REAL:C219(OK_ar_AdditionalItemPrice; 0)  //the price in sales currency
		ARRAY REAL:C219(OI_ar_AdditionalItemPriceBase; 0)  //The price in base currency
		ARRAY REAL:C219(OK_ar_AdditionalItemCOSTPrice; 0)
		//``
		//The following array is used for the above OR for the  component being included.
		ARRAY BOOLEAN:C223(OI_abo_IncludeInProduct; 0)
		ARRAY BOOLEAN:C223(OI_abo_UserSetInclude; 0)
		
		//The next group is for components of the built product. see below for the handling of multiples
		ARRAY TEXT:C222(OI_at_BuildCodeMatrix; 0)  //The build code section value
		ARRAY TEXT:C222(OI_at_BuildProductComponents; 0)  //The product code of the component used
		ARRAY REAL:C219(OI_ar_BuildProductComponentsQTY; 0)  //The quantity to include(this is normally a fixed value
		
		ARRAY LONGINT:C221(OI_al_MultiplesIndex; 0)  //This array is populated with the section ID(Not component ID) of any areas set that have multiple values.
		//this could be a list of product codes or a list of diary codes
		ARRAY TEXT:C222(OI_at_MultipleCodes; 0; 0)
		//The following bit is only used if there are sub components that are date related(if there are sub components that are product based then they will build the product to include)..see array below for that
		ARRAY LONGINT:C221(OI_al_MultiSubIndex; 0)  //the section ID of this component(not the component ID..there can be multiple entries here for this component
		ARRAY TEXT:C222(OK_at_MultiSubProduct; 0)  //The product CODE within the component. there should be one instance of any product code(this is done just in case the same product is in two sections)
		ARRAY TEXT:C222(OI_at_MultiSubCodes; 0; 0)  //This will contain the diary codes selected(none if not selected)
		//The following bit is used for Products_Included that are built products.
		ARRAY TEXT:C222(OI_at_MultiSubParentCode; 0)  //When this is populate the sub component has been built and this will be the code displayed on screen rather than the template code. This has to be looked up when the Product_List is build if we return to a page and when we exit the window to test that it is set up.
		
		
		
		
		ARRAY REAL:C219(OI_ar_BuildCodeSALESPrice; 0)  //This will be the product SALES price(=order item retail price)-in sales currency
		ARRAY LONGINT:C221(OI_al_ChargingPriceClass; 0)  //this is set to 2 if the above is a discount rather than a price
		ARRAY REAL:C219(OI_ar_BuildCodeBASEPrice; 0)  //This will be the product SALES price(=order item retail price)-in Product currency
		ARRAY LONGINT:C221(OI_al_BuildPriceClass; 0)  //This is set to 2 if the above is a discount rather than a price
		
		//the order items SALES price is the price after discount
		//The product STANDARD Price will be set the same
		ARRAY REAL:C219(OI_ar_BuildCodeCOSTPrice; 0)  //The calculated cost price(in the currency of the product)
		ARRAY REAL:C219(OI_ar_BuildCodeCostStd; 0)  //The calculated cost price
		ARRAY TEXT:C222(OI_at_BuildCodeSupplier; 0)  //The supplier code if there is one!
		
		//The following arrays relate to the range of components
		ARRAY TEXT:C222(OI_at_ProductSections; 0)
		ARRAY BOOLEAN:C223(OI_abo_HasRestrictions; 0)
		ARRAY LONGINT:C221(OI_al_ComponentID; 0)
		ARRAY LONGINT:C221(OI_al_ComponentSectionID; 0)
		ARRAY TEXT:C222(OI_at_OutputCodeMacro; 0)
		ARRAY REAL:C219(OI_ar_DefaultQuantity; 0)
		ARRAY BOOLEAN:C223(OI_abo_ComponentAdditional; 0)
		ARRAY BOOLEAN:C223(OI_abo_OptionalComponent; 0)
		ARRAY BOOLEAN:C223(OI_abo_IncludeByDefault; 0)
		ARRAY LONGINT:C221(OI_al_ComponentType; 0)
		
		
		OI_t_BuiltCode:=""
		OI_t_ProductCode:=""
		OI_t_ProductBuiltCode:=""
		OI_t_ProductName:=""
		OI_R_BuiltPrice:=0
		OI_R_SalesPrice:=0
		PRD_l_ExtraDates:=0
		OBJECT SET VISIBLE:C603(*; "oCustomerPrice@"; False:C215)  //This will be set to visible and enterable on completion of all the items.
		//Note that if if the customer price has not been set when you save the record the price confirm window will be displayed so you can set the price..it will be calculated.
		//and by set i mean edited by the user..and it can be edited till the options are selected.
		OI_bo_AlloptionsSelected:=False:C215
		OI_bo_CustomerPriceSet:=False:C215
		If (OI_t_InputProductCode#"")
			
			If ([PRODUCTS:9]Product_Code:1#OI_t_InputProductCode)
				QUERY:C277([PRODUCTS:9]; [PRODUCTS:9]Product_Code:1=OI_t_InputProductCode)
			End if 
			
			If ([PRODUCTS:9]Default_Price_Currency_ID:45>0)
				PRD_l_productCurrency:=[PRODUCTS:9]Default_Price_Currency_ID:45
				QUERY:C277([CURRENCIES:71]; [CURRENCIES:71]X_ID:3=PRD_t_productCurrency)
				PRD_t_productCurrency:=[CURRENCIES:71]Currency_Code:1
			Else 
				PRD_l_productCurrency:=0
				PRD_t_productCurrency:=<>SYS_t_BaseCurrency
				QUERY:C277([CURRENCIES:71]; [CURRENCIES:71]X_ID:3=<>SYS_t_BaseCurrency)
				PRD_l_productCurrency:=[CURRENCIES:71]X_ID:3
			End if 
			If ([PRODUCTS:9]x_Product_Entry_Class:55=2)
				PT_t_DefaultTax:=[PRODUCTS:9]Default_Tax:23
				PRD_t_BuildBrandCode:=[PRODUCTS:9]Brand_Code:4
				PRD_t_BuildGroupCode:=[PRODUCTS:9]Group_Code:3
				$_l_ProductBuildFormatID:=[PRODUCTS:9]Product_Build_Format_ID:57
				PRD_t_BuildProductName:=[PRODUCTS:9]Product_Name:2
				If ($_l_ProductBuildFormatID>0)
					QUERY:C277([PRODUCT_BUILT_CODE_FORMAT:189]; [PRODUCT_BUILT_CODE_FORMAT:189]FORMAT_ID:1=$_l_ProductBuildFormatID)
					QUERY:C277([BUILT_CODE_FORMAT_SECTION:188]; [BUILT_CODE_FORMAT_SECTION:188]FORMAT_ID:2=$_l_ProductBuildFormatID)
					
					ORDER BY:C49([BUILT_CODE_FORMAT_SECTION:188]; [BUILT_CODE_FORMAT_SECTION:188]SECTION_NUMBER:3)
					SELECTION TO ARRAY:C260([BUILT_CODE_FORMAT_SECTION:188]SECTION_ID:1; OI_al_SectionIDS; [BUILT_CODE_FORMAT_SECTION:188]SECTION_NAME:4; OI_at_SectionName; [BUILT_CODE_FORMAT_SECTION:188]SECTION_LENGTH:5; OI_al_SectionLength; [BUILT_CODE_FORMAT_SECTION:188]SECTION_FILL_CHARACTER:6; OI_at_FillChar; [BUILT_CODE_FORMAT_SECTION:188]SECTION_FILL_STYLE:7; OI_at_FillStyle)
					$_l_SizeofArray:=Size of array:C274(OI_al_SectionIDS)
					
					ARRAY BOOLEAN:C223(OI_abo_IncludeInProduct; $_l_SizeofArray)  //Easier to handle switching on and off than looking everything up again
					ARRAY BOOLEAN:C223(OI_abo_UserSetInclude; $_l_SizeofArray)  //remember if user set the value for the above
					ARRAY TEXT:C222(OI_at_AdditionOrderItems; $_l_SizeofArray)
					ARRAY REAL:C219(OI_ar_AdditionalItemQTY; $_l_SizeofArray)
					ARRAY REAL:C219(OK_ar_AdditionalItemPrice; $_l_SizeofArray)  //the price in sales currency
					ARRAY REAL:C219(OI_ar_AdditionalItemPriceBase; $_l_SizeofArray)  //The price in base currency
					ARRAY REAL:C219(OK_ar_AdditionalItemCOSTPrice; $_l_SizeofArray)
					
					ARRAY TEXT:C222(OI_at_BuildCodeMatrix; $_l_SizeofArray)
					ARRAY LONGINT:C221(OI_al_BuidCodeLength; $_l_SizeofArray)
					ARRAY REAL:C219(OI_ar_BuildCodePrice; $_l_SizeofArray)
					//Note that when using the price matrix here we DO NOT take into account the company or Order (item) price group..that gets applied to the constructed product.. here pricing is based on the quantity/date/etc price table entry
					
					ARRAY TEXT:C222(OI_at_BuildProductComponents; $_l_SizeofArray)  //The product code to add as a component to the constructed product
					ARRAY REAL:C219(OI_ar_BuildProductComponentsQTY; $_l_SizeofArray)  //The product quantity to add as a component to the constructed product
					ARRAY REAL:C219(OI_ar_BuildCodeSALESPrice; $_l_SizeofArray)  //This will be the product SALES price(=order item retail price)-in sales currency
					ARRAY REAL:C219(OI_ar_BuildCodeBASEPrice; $_l_SizeofArray)  //This will be the product SALES price(=order item retail price)-in Product currency
					
					ARRAY REAL:C219(OI_ar_BuildCodeCOSTPrice; $_l_SizeofArray)
					ARRAY TEXT:C222(OI_at_BuildCodeSupplier; $_l_SizeofArray)  //The supplier code if there is one!
					ARRAY REAL:C219(OI_ar_BuildCodeCostStd; $_l_SizeofArray)
					ARRAY LONGINT:C221(OI_al_BuildPriceClass; $_l_SizeofArray)
					ARRAY LONGINT:C221(OI_al_ChargingPriceClass; $_l_SizeofArray)
					QUERY:C277([COMPONENTS:86]; [COMPONENTS:86]Product_Code:1=[PRODUCTS:9]Product_Code:1)
					ORDER BY:C49([COMPONENTS:86]; [COMPONENTS:86]ComponentSelectionOrderSequence:19; >)
					CREATE SET:C116([COMPONENTS:86]; "OIComponents")
					For ($_l_ComponentIndex; 1; Records in selection:C76([COMPONENTS:86]))
						APPEND TO ARRAY:C911(OI_at_ProductSections; [COMPONENTS:86]Component_Name:17)
						APPEND TO ARRAY:C911(OI_abo_HasRestrictions; False:C215)
						APPEND TO ARRAY:C911(OI_ar_DefaultQuantity; [COMPONENTS:86]Quantity:3)
						APPEND TO ARRAY:C911(OI_at_OutputCodeMacro; [COMPONENTS:86]Build_Code_Macro:14)
						APPEND TO ARRAY:C911(OI_abo_ComponentAdditional; [COMPONENTS:86]Additional_Order_Item:12)
						APPEND TO ARRAY:C911(OI_abo_OptionalComponent; [COMPONENTS:86]Optional_Component:11)
						APPEND TO ARRAY:C911(OI_abo_IncludeByDefault; [COMPONENTS:86]IncludeOptionalByDefault:22)
						
						APPEND TO ARRAY:C911(OI_al_ComponentType; [COMPONENTS:86]Component_Type:6)
						
						If (BLOB size:C605([COMPONENTS:86]X_RestrictionPreferences:20)>0)
							OI_abo_HasRestrictions{Size of array:C274(OI_abo_HasRestrictions)}:=True:C214
						End if 
						APPEND TO ARRAY:C911(OI_al_ComponentID; [COMPONENTS:86]X_ComponentID:21)
						APPEND TO ARRAY:C911(OI_al_ComponentSectionID; [COMPONENTS:86]X_Build_Code_Section_ID:18)
						
						Case of 
							: ([COMPONENTS:86]Component_Code:2#"") & ([COMPONENTS:86]Optional_Component:11=False:C215) & ([COMPONENTS:86]Additional_Order_Item:12=False:C215)
								//This is a non optional item so we can pop the output product code section into the matrix now.
								$_l_ModuleRow:=Find in array:C230(OI_al_SectionIDS; OI_al_ComponentSectionID{$_l_ComponentIndex})
								If ($_l_ModuleRow>0)  // it should be always
									//OI_al_SectionLength
									//OI_at_FillChar
									//OI_at_FillStyle)
									QUERY:C277([PRODUCTS:9]; [PRODUCTS:9]Product_Code:1=[COMPONENTS:86]Component_Code:2)
									$_t_OutputComponentCode:=[PRODUCTS:9]x_Product_Build_Section_Code:56
									If ([COMPONENTS:86]Build_Code_Macro:14#"")  //DONT EXECUTE THE MACRO HERE..IT WILL GET EXECUTED WHEN WE GO TO THE PAGE
										//Macro ([COMPONENTS]BuildCodeMacro)
										$_t_OutputComponentCode:=[PRODUCTS:9]x_Product_Build_Section_Code:56
									End if 
									Case of 
										: (Length:C16($_t_OutputComponentCode)>OI_al_SectionLength{$_l_ModuleRow})  //This SHOULD never be happening if it is the setup is wrong
											//Truncate it
											//$_t_OutputComponentCode:=Substring($_t_OutputComponentCode;1;OI_al_SectionLength{$_l_ModuleRow})
										: (Length:C16($_t_OutputComponentCode)<OI_al_SectionLength{$_l_ModuleRow})
											If (False:C215)  //have to define this
												$_l_Difference:=OI_al_SectionLength{$_l_ModuleRow}-(Length:C16($_t_OutputComponentCode))
												
												If (OI_at_FillChar{$_l_ModuleRow}#"")
													$_t_FillChars:=OI_at_FillChar{$_l_ModuleRow}
												Else 
													$_t_FillChars:=" "
												End if 
												$_t_FillString:=$_t_FillChars*$_l_Difference
												If (OI_at_FillStyle{$_l_ModuleRow}="Left")
													$_t_OutputComponentCode:=$_t_FillString+$_t_OutputComponentCode
												Else 
													$_t_OutputComponentCode:=$_t_OutputComponentCode+$_t_FillString
												End if 
											End if 
											//pad it
									End case 
									OI_at_BuildCodeMatrix{$_l_ModuleRow}:=$_t_OutputComponentCode
									OI_ar_BuildProductComponentsQTY{$_l_ModuleRow}:=[COMPONENTS:86]Quantity:3
									OI_abo_IncludeInProduct{$_l_ModuleRow}:=True:C214
									$_r_ComponentPrice:=[PRODUCTS:9]Sales_Price:9
									//If the sales price =0 and a price table entry is found that is a discount then the PRICING class = discount
									//this will be a discount used in the calculation of the product price.
									//note also that we are calculation the base price of the product..the number of inserts may affect the price charged
									$_r_ComponentCostPrice:=0
									QUERY:C277([PRODUCTS_SUPPLIERS:148]; [PRODUCTS_SUPPLIERS:148]Product_Code:8=[PRODUCTS:9]Product_Code:1; *)
									QUERY:C277([PRODUCTS_SUPPLIERS:148];  & [PRODUCTS_SUPPLIERS:148]Company_Code:1#"")
									ARRAY TEXT:C222($_at_SupplierCostCurrency; 0)
									ARRAY REAL:C219($_ar_SupplierStdCost; 0)
									ARRAY REAL:C219($_ar_SupplierCost; 0)
									ARRAY LONGINT:C221($_al_Preferred; 0)
									ARRAY TEXT:C222($_at_SupplierCode; 0)
									$_t_UseSupplierCode:=""
									If (Records in selection:C76([PRODUCTS_SUPPLIERS:148])>0)
										$_l_NextPrefferred:=Records in selection:C76([PRODUCTS_SUPPLIERS:148])+1
										SELECTION TO ARRAY:C260([PRODUCTS_SUPPLIERS:148]Company_Code:1; $_at_SupplierCode; [PRODUCTS_SUPPLIERS:148]Cost_Price:2; $_ar_SupplierCost; [PRODUCTS_SUPPLIERS:148]Standard_Cost:5; $_ar_SupplierStdCost; [PRODUCTS_SUPPLIERS:148]Cost_Price_Currency_Code:9; $_at_SupplierCostCurrency; [PRODUCTS_SUPPLIERS:148]Preferred_Supplier:10; $_al_Preferred)
										For ($_l_Index2; 1; Size of array:C274($_at_SupplierCode))
											If ($_at_SupplierCostCurrency{$_l_Index2}="")
												$_at_SupplierCostCurrency{$_l_Index2}:=<>SYS_t_BaseCurrency
											End if 
											If ($_al_Preferred{$_l_Index2}=0)
												$_al_Preferred{$_l_Index2}:=$_l_NextPrefferred
											End if 
										End for 
										SORT ARRAY:C229($_al_Preferred; $_at_SupplierCode; $_at_SupplierCostCurrency; $_ar_SupplierCost)
										$_t_UseSupplierCode:=$_at_SupplierCode{1}
										$_t_UseSupplierCurrency:=$_at_SupplierCostCurrency{1}
										$_r_UseStandardCost:=$_ar_SupplierStdCost{1}
										$_r_useSupplierCost:=$_ar_SupplierCost{1}
									End if 
									OI_bo_UseDiscount:=False:C215
									//calculate the product price
									PRD_BuildGetComponentPrice([COMPONENTS:86]Component_Code:2; [COMPONENTS:86]Quantity:3; PRD_t_productCurrency; !00-00-00!; ->OI_bo_UseDiscount; ->OI_ar_BuildCodeBASEPrice{$_l_ModuleRow})
									If (OI_bo_UseDiscount)
										OI_al_BuildPriceClass{$_l_ModuleRow}:=2
									End if 
									OI_bo_UseDiscount:=False:C215
									//calculate the SALES price
									PRD_BuildGetComponentPrice([COMPONENTS:86]Component_Code:2; [COMPONENTS:86]Quantity:3; OI_T_CurrencyCode; !00-00-00!; ->OI_bo_UseDiscount; ->OI_ar_BuildCodeSALESPrice{$_l_ModuleRow})
									If (OI_bo_UseDiscount)
										OI_al_ChargingPriceClass{$_l_ModuleRow}:=2
									End if 
									If ($_t_UseSupplierCode#"")
										PRD_BuildGetComponentCost($_t_UseSupplierCode; $_t_UseSupplierCurrency; $_r_UseStandardCost; PRD_t_productCurrency; [PRODUCTS:9]Product_Code:1; ->OI_ar_BuildCodeCOSTPrice{$_l_ModuleRow})
										OI_ar_BuildCodeCostStd{$_l_ModuleRow}:=OI_ar_BuildCodeCOSTPrice{$_l_ModuleRow}
										OI_at_BuildCodeSupplier{$_l_ModuleRow}:=$_t_UseSupplierCode
									Else 
										PRD_BuildGetComponentCost(""; ""; 0; PRD_t_productCurrency; [PRODUCTS:9]Product_Code:1; ->OI_ar_BuildCodeCOSTPrice{$_l_ModuleRow})
										OI_ar_BuildCodeCostStd{$_l_ModuleRow}:=OI_ar_BuildCodeCOSTPrice{$_l_ModuleRow}
										OI_at_BuildCodeSupplier{$_l_ModuleRow}:=$_t_UseSupplierCode
									End if 
									
								End if 
							: ([COMPONENTS:86]Component_Code:2#"") & ([COMPONENTS:86]Optional_Component:11=False:C215) & ([COMPONENTS:86]Additional_Order_Item:12=True:C214)
								$_l_ModuleRow:=Find in array:C230(OI_al_SectionIDS; OI_al_ComponentSectionID{$_l_ComponentIndex})
								
								
						End case 
						NEXT RECORD:C51([COMPONENTS:86])
					End for 
					OBJECT SET VISIBLE:C603(*; "oProductCode@"; False:C215)
					OBJECT SET VISIBLE:C603(*; "oSelection@"; False:C215)
					
					OI_at_ProductSections:=1
					Repeat 
						$_l_ComponentID:=OI_al_ComponentID{OI_at_ProductSections}
						If (OI_abo_HasRestrictions{OI_at_ProductSections})
							ARRAY LONGINT:C221($_al_RestrictSection; 0)
							ARRAY TEXT:C222($_At_FilterName; 0)
							QUERY:C277([COMPONENTS:86]; [COMPONENTS:86]X_ComponentID:21=$_l_ComponentID)
							If (BLOB size:C605([COMPONENTS:86]X_RestrictionPreferences:20)>0)  //This is a precaution..if the section is restricted til another section is set then we must set that section first..as this bit is on load the section CANT be set unless its just one record..
								$_l_offset:=0
								BLOB TO VARIABLE:C533([COMPONENTS:86]X_RestrictionPreferences:20; $_al_RestrictSection; $_l_offset)
								BLOB TO VARIABLE:C533([COMPONENTS:86]X_RestrictionPreferences:20; $_At_FilterName; $_l_offset)
								$_l_RestrictionsSet:=0
								For ($_l_ComponentIndex; 1; Size of array:C274($_al_RestrictSection))
									$_l_ModuleRow:=Find in array:C230(OI_al_SectionIDS; $_al_RestrictSection{$_l_ComponentIndex})
									If (OI_at_AdditionOrderItems{$_l_ModuleRow}#"") | (OI_at_AdditionOrderItems{$_l_ModuleRow}#"")
										$_l_RestrictionsSet:=$_l_RestrictionsSet+1
									End if 
								End for 
								If ($_l_RestrictionsSet=Size of array:C274($_al_RestrictSection))
									$_bo_Exit:=True:C214
								End if 
								If ($_bo_Exit=False:C215)
									//Goto the 1St restriction and start there
									$_l_ModuleRow:=Find in array:C230(OI_al_ComponentSectionID; $_al_RestrictSection{1})
									If ($_l_ModuleRow>0)
										OI_at_ProductSections:=$_l_ModuleRow
									Else 
										OI_at_ProductSections:=$_l_ModuleRow+1
									End if 
								End if 
								
							Else 
								$_bo_Exit:=True:C214
							End if 
						Else 
							$_bo_Exit:=True:C214
						End if 
					Until ($_bo_Exit)
					PRD_BuildFormSetPage
				Else 
					Gen_Alert("sorry you cannot enter this type of product till it is set up correcty")
				End if 
				WS_AutoscreenSize(3; 726; 840)
				INT_SetInput(Table:C252(->[ORDERS:24]); WIN_t_CurrentInputForm)
			Else 
				CANCEL:C270
			End if 
			
		Else 
			CANCEL:C270
		End if 
		
		
		DB_SetInputFormMenu(Table:C252(->[ORDER_ITEMS:25]); "BUILD_PRODUCT")
		
		OBJECT SET VISIBLE:C603(*; "oInputButtonNextRecord"; False:C215)
		OBJECT SET VISIBLE:C603(*; "oInputButtonPreviousRecord"; False:C215)
		OBJECT SET VISIBLE:C603(*; "oInputButtonFirstRecord"; False:C215)
		OBJECT SET VISIBLE:C603(*; "oInputButtonLastRecord"; False:C215)
		
	: ($_l_event=On Activate:K2:9)
		DB_SetInputFormMenu(Table:C252(->[ORDER_ITEMS:25]); "BUILD_PRODUCT")
		
		OBJECT SET VISIBLE:C603(*; "oInputButtonNextRecord"; False:C215)
		OBJECT SET VISIBLE:C603(*; "oInputButtonPreviousRecord"; False:C215)
		OBJECT SET VISIBLE:C603(*; "oInputButtonFirstRecord"; False:C215)
		OBJECT SET VISIBLE:C603(*; "oInputButtonLastRecord"; False:C215)
		DB_MenuAction("File"; "Next Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
		
	: ($_l_event=On Menu Selected:K2:14)
		DB_SetInputFormMenu(Table:C252(->[ORDER_ITEMS:25]); "BUILD_PRODUCT")
		
		OBJECT SET VISIBLE:C603(*; "oInputButtonNextRecord"; False:C215)
		OBJECT SET VISIBLE:C603(*; "oInputButtonPreviousRecord"; False:C215)
		OBJECT SET VISIBLE:C603(*; "oInputButtonFirstRecord"; False:C215)
		OBJECT SET VISIBLE:C603(*; "oInputButtonLastRecord"; False:C215)
		
	: ($_l_event=On Timer:K2:25)
		SRCH_r_Timer:=((Current time:C178*1)*60)
		//BEEP
		
		If (SRCH_r_TimerOLD>0)
			If (SRCH_r_Timer>(SRCH_r_TimerOLD+30)) & (SRCH_t_SearchValue=SRCH_t_SearchValueOLD)
				SET TIMER:C645(0)
				
				If (SRCH_t_SearchValue#"")
					//LB_SetupListbox (->OI_lb_SelectProduct;"oPID";"PID_L";1;->;->PRD_at_Outputcode;->PRD_at_BLDprdNames;->PRD_at_BLDDescription;->PRD_at_BLDprdShrtCodes;->PRD_at_BLDprdCodes)
					
					$_l_ModuleRow:=Find in array:C230(PRD_at_Outputcode; SRCH_t_SearchValue)
					If ($_l_ModuleRow<0)
						$_l_ModuleRow:=Find in array:C230(PRD_at_BLDprdNames; SRCH_t_SearchValue)
					End if 
					If ($_l_ModuleRow>0)
						$_l_Row:=$_l_ModuleRow
						PRD_abo_BLBInclude{$_l_ModuleRow}:=True:C214
						PRD_BuildFormSelectProduct($_l_Row; 1)
						//Select it
						SRCH_t_SearchValue:=""
						OI_t_LookupValue:=""
						Case of 
							: (OI_l_AndTab=1)
								OI_at_ProductSections:=OI_at_ProductSections+1
								PRD_BuildFormSetPage
							: (OI_l_AndTab=-1)
								OI_at_ProductSections:=OI_at_ProductSections+1
								PRD_BuildFormSetPage
						End case 
						OI_l_AndTab:=0
					End if 
				End if 
				
			Else 
				
				
				If (SRCH_t_SearchValueOLD#SRCH_t_SearchValue)
					
					SRCH_r_TimerOLD:=SRCH_r_Timer
				End if 
			End if 
			SRCH_t_SearchValueOLD:=SRCH_t_SearchValue
		Else 
			SRCH_r_TimerOLD:=SRCH_r_Timer
			SRCH_t_SearchValueOLD:=SRCH_t_SearchValue
		End if 
	: ($_l_event=On Outside Call:K2:11)
		If (((DB_l_ButtonClickedFunction#0)) | (iOK=1) | (iCancel=1))
			$_l_ButtonPressed:=DB_l_ButtonClickedFunction
			
			Case of 
				: (DB_l_ButtonClickedFunction=902)
					DB_l_ButtonClickedFunction:=0
					DB_SubFunctionHandler
				: (($_l_ButtonPressed=DB_GetButtonFunction("OK")) | (iOK=1))
					//First validate it is ready to save...
					If (OI_bo_AlloptionsSelected)
						$_bo_Continue:=True:C214
						If (Not:C34(OI_bo_CustomerPriceSet))
							If (OI_R_SalesPrice=0)
								OI_R_SalesPrice:=Gen_RequestAmount("Please confirm the customer price for this"; Is real:K8:4; OI_R_BuiltPrice; "Continue"; "Stop")
								$_bo_Continue:=(OK=1)
							Else 
								OI_R_SalesPrice:=Gen_RequestAmount("Please confirm the customer price for this"; Is real:K8:4; OI_R_SalesPrice; "Continue"; "Stop")
								$_bo_Continue:=(OK=1)
							End if 
						End if 
						If ($_bo_Continue)
							Gen_Confirm("Are you sure you are ready to create this entry"; "Yes"; "No")
							If (OK=1)
								OI_bo_ProductEnter:=True:C214
								CANCEL:C270
							End if 
							OK:=1
						End if 
					Else 
						Gen_Alert("Sorry you cannot  save this until all parts are set!")
					End if 
					DB_l_ButtonClickedFunction:=0
				: (($_l_ButtonPressed=DB_GetButtonFunction("Cancel")) | (iCancel=1))
					Gen_Confirm("Are you sure you wish to cancel entering this product?"; "No"; "Yes")
					If (OK=0)
						OI_bo_ProductEnter:=False:C215
						CANCEL:C270
					End if 
					OK:=1
					DB_l_ButtonClickedFunction:=0
			End case 
			
		End if 
		iOK:=0
		iCancel:=0
		
	: ($_l_event=On Clicked:K2:4)
		Case of 
			: (BAR_t_Button#"")
				$_l_ButtonNumber:=Num:C11(BAR_t_Button)
				If ($_l_ButtonNumber>1)
					ModuleNumber:=MOD_al_ModuleBarOffsets{$_l_ButtonNumber-1}
					$_l_ModuleRow:=Find in array:C230(MOD_al_ModuleBarNum; ModuleNumber)
					DB_SetBrowserBarSelection($_l_ModuleRow; ->MOD_al_ModuleBarNum; DB_l_WindowCurrentModule; ->DB_l_WindowCurrentModule)
					DB_SetInputFormMenu(Table:C252(->[ORDER_ITEMS:25]); "BUILD_PRODUCT")
				End if 
				BAR_t_Button:=""
			: (PAL_BUTTON#"")
				$_t_PalletButtonName:=PAL_BUTTON
				PAL_BUTTON:=""
				DB_HandleInputFormButtons($_t_PalletButtonName)
				PAL_bo_ButtonSubFunction:=False:C215
				
				
				
		End case 
		
End case 
ERR_MethodTrackerReturn("FM [ORDER_ITEMS].BUILD_PRODUCT"; $_t_oldMethodName)
