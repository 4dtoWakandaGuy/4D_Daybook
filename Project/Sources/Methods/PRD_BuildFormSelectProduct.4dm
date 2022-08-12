//%attributes = {}
If (False:C215)
	//Project Method Name:      PRD_BuildFormSelectProduct
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 08/07/2010 15:40
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(OI_abo_ComponentAdditional;0)
	//ARRAY BOOLEAN(OI_abo_IncludeInProduct;0)
	//ARRAY BOOLEAN(OI_abo_OptionalComponent;0)
	//ARRAY BOOLEAN(OI_abo_UserSetInclude;0)
	//ARRAY BOOLEAN(PRD_abo_BLBInclude;0)
	ARRAY LONGINT:C221($_al_Preferred; 0)
	//ARRAY LONGINT(OI_al_BuildPriceClass;0)
	//ARRAY LONGINT(OI_al_ChargingPriceClass;0)
	//ARRAY LONGINT(OI_al_ComponentID;0)
	//ARRAY LONGINT(OI_al_ComponentSectionID;0)
	//ARRAY LONGINT(OI_al_ComponentType;0)
	//ARRAY LONGINT(OI_al_MultiplesIndex;0)
	//ARRAY LONGINT(OI_al_SectionIDS;0)
	//ARRAY LONGINT(OI_al_SectionLength;0)
	ARRAY REAL:C219($_ar_SupplierCosts; 0)
	ARRAY REAL:C219($_ar_SupplierStdCosts; 0)
	//ARRAY REAL(OI_ar_AdditionalItemQTY;0)
	//ARRAY REAL(OI_ar_BuildCodeBASEPrice;0)
	//ARRAY REAL(OI_ar_BuildCodeCOSTPrice;0)
	//ARRAY REAL(OI_ar_BuildCodeCostStd;0)
	//ARRAY REAL(OI_ar_BuildCodeSALESPrice;0)
	//ARRAY REAL(OI_ar_BuildProductComponentsQTY;0)
	//ARRAY REAL(OI_ar_DefaultQuantity;0)
	//ARRAY REAL(OI_ar_AdditionalItemPriceBase;0)
	//ARRAY REAL(OK_ar_AdditionalItemPrice;0)
	ARRAY TEXT:C222($_at_SupplierCodes; 0)
	ARRAY TEXT:C222($_at_SupplierCostsCurrencies; 0)
	//ARRAY TEXT(OI_at_AdditionOrderItems;0)
	//ARRAY TEXT(OI_at_BuildCodeMatrix;0)
	//ARRAY TEXT(OI_at_BuildCodeSupplier;0)
	//ARRAY TEXT(OI_at_BuildProductComponents;0)
	//ARRAY TEXT(OI_at_OutputCodeMacro;0)
	//ARRAY TEXT(OI_at_ProductSections;0)
	//ARRAY TEXT(PRD_at_BLDprdCodes;0)
	//ARRAY TEXT(PRD_at_Outputcode;0)
	C_BOOLEAN:C305($_bo_AllSectionsSet; OI_bo_AlloptionsSelected; OI_bo_CustomerPriceSet; OI_bo_UseDiscount; PRD_bo_SelectMultiple)
	C_LONGINT:C283($_l_Column; $_l_Index; $_l_NextPreferred; $_l_Row; $_l_SectionID; $_l_SectionRow; $_l_SupplierIndex; $1; $2)
	C_REAL:C285($_r_Discount; $_r_Price; $_r_TotalPrice; $_r_TotalPriceOLD; $_r_UseStandardCost; $_r_UseSupplierCost; OI_R_BuiltPrice; OI_R_SalesPrice)
	C_TEXT:C284(<>SYS_t_BaseCurrency; $_t_ComponentOutputCode; $_t_oldMethodName; $_t_SectionCode; $_t_UseSupplierCode; $_t_UseSupplierCurrency; OI_t_BuiltCode; OI_T_CurrencyCode; OI_t_ProductCode; PRD_t_BuildBrandCode; PRD_t_BuildGroupCode)
	C_TEXT:C284(PRD_t_productCurrency)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("PRD_BuildFormSelectProduct")
If (Count parameters:C259>=2)
	$_l_Row:=$1
	$_l_Column:=$2
	
	$_l_SectionID:=OI_al_ComponentSectionID{OI_at_ProductSections}
	$_l_SectionRow:=Find in array:C230(OI_al_SectionIDS; $_l_SectionID)
	Case of 
		: ($_l_Column=1)
			If (PRD_bo_SelectMultiple)
				
			Else 
				//This is the normal setting
				
				If (PRD_abo_BLBInclude{$_l_Row})  //We have set this one to true
					If (OI_abo_ComponentAdditional{OI_at_ProductSections}=False:C215)
						If (OI_at_BuildProductComponents{$_l_SectionRow}#PRD_at_BLDprdCodes{$_l_Row})
							//The selected one is different so change it
							QUERY:C277([PRODUCTS:9]; [PRODUCTS:9]Product_Code:1=PRD_at_BLDprdCodes{$_l_Row})
							Case of 
								: ([PRODUCTS:9]x_Product_Entry_Class:55=2)  //This is going to open another form
									Gen_Confirm("The selected product is a built product. Are you ready to select the options for this product now?"; "Yes"; "No")
									If (OK=1)
										//The new window will open and the created product code will be the one selected here..note that the selected product code in this window needs to modify the row of the array on here for ease
									Else 
									End if 
									OK:=1
								: ([PRODUCTS:9]x_Product_Entry_Class:55=1)  //Date entry=needs to be in seperate window here
									Gen_Confirm("The selected product is a date related product. Are you ready to select the Dates for this product now?"; "Yes"; "No")
									If (OK=1)
									Else 
										//we can still include the product but when we test the dates at the end then they would not be filled in. There is an array created for storing sub element diary arrays
									End if 
									OK:=1
								Else 
									For ($_l_Index; 1; Size of array:C274(PRD_abo_BLBInclude))
										
										If ($_l_Index#$_l_Row)
											PRD_abo_BLBInclude{$_l_Index}:=False:C215
										End if 
									End for 
									OI_at_BuildProductComponents{$_l_SectionRow}:=PRD_at_BLDprdCodes{$_l_Row}
									//Note on the following line. I need to mod components so this quantity can be locked within the build or flexible
									//at the moment it is locked for everything except the iterations.
									OI_ar_BuildProductComponentsQTY{$_l_SectionRow}:=OI_ar_DefaultQuantity{OI_at_ProductSections}
									If (OI_abo_IncludeInProduct{$_l_SectionRow}=False:C215)
										OI_abo_UserSetInclude{$_l_SectionRow}:=True:C214
									End if 
									OI_abo_IncludeInProduct{$_l_SectionRow}:=True:C214
									$_t_ComponentOutputCode:=PRD_at_Outputcode{$_l_Row}
									If (OI_at_OutputCodeMacro{OI_at_ProductSections}#"")
										QUERY:C277([COMPONENTS:86]; [COMPONENTS:86]X_ComponentID:21=OI_al_ComponentID{OI_at_ProductSections})
										Macro([COMPONENTS:86]Build_Code_Macro:14)
										$_t_ComponentOutputCode:=[PRODUCTS:9]x_Product_Build_Section_Code:56
										//use a macro
									End if 
									OI_at_BuildCodeMatrix{$_l_SectionRow}:=$_t_ComponentOutputCode
									
									OI_at_BuildProductComponents{$_l_SectionRow}:=PRD_at_BLDprdCodes{$_l_Row}
									OI_t_ProductCode:=OI_at_BuildProductComponents{$_l_SectionRow}  //This is the selected product
									
									OI_bo_UseDiscount:=False:C215
									//calculate the product price
									PRD_BuildGetComponentPrice([COMPONENTS:86]Component_Code:2; [COMPONENTS:86]Quantity:3; PRD_t_productCurrency; !00-00-00!; ->OI_bo_UseDiscount; ->OI_ar_BuildCodeBASEPrice{$_l_SectionRow})
									If (OI_bo_UseDiscount)
										OI_al_BuildPriceClass{$_l_SectionRow}:=2
									End if 
									OI_bo_UseDiscount:=False:C215
									//calculate the SALES price
									PRD_BuildGetComponentPrice([COMPONENTS:86]Component_Code:2; [COMPONENTS:86]Quantity:3; OI_T_CurrencyCode; !00-00-00!; ->OI_bo_UseDiscount; ->OI_ar_BuildCodeSALESPrice{$_l_SectionRow})
									If (OI_bo_UseDiscount)
										OI_al_ChargingPriceClass{$_l_SectionRow}:=2
									End if 
									//``
									QUERY:C277([PRODUCTS_SUPPLIERS:148]; [PRODUCTS_SUPPLIERS:148]Product_Code:8=[PRODUCTS:9]Product_Code:1; *)
									QUERY:C277([PRODUCTS_SUPPLIERS:148];  & [PRODUCTS_SUPPLIERS:148]Company_Code:1#"")
									ARRAY TEXT:C222($_at_SupplierCostsCurrencies; 0)
									ARRAY REAL:C219($_ar_SupplierStdCosts; 0)
									ARRAY REAL:C219($_ar_SupplierCosts; 0)
									ARRAY LONGINT:C221($_al_Preferred; 0)
									ARRAY TEXT:C222($_at_SupplierCodes; 0)
									$_t_UseSupplierCode:=""
									If (Records in selection:C76([PRODUCTS_SUPPLIERS:148])>0)
										$_l_NextPreferred:=Records in selection:C76([PRODUCTS_SUPPLIERS:148])+1
										SELECTION TO ARRAY:C260([PRODUCTS_SUPPLIERS:148]Company_Code:1; $_at_SupplierCodes; [PRODUCTS_SUPPLIERS:148]Cost_Price:2; $_ar_SupplierCosts; [PRODUCTS_SUPPLIERS:148]Standard_Cost:5; $_ar_SupplierStdCosts; [PRODUCTS_SUPPLIERS:148]Cost_Price_Currency_Code:9; $_at_SupplierCostsCurrencies; [PRODUCTS_SUPPLIERS:148]Preferred_Supplier:10; $_al_Preferred)
										For ($_l_SupplierIndex; 1; Size of array:C274($_at_SupplierCodes))
											If ($_at_SupplierCostsCurrencies{$_l_SupplierIndex}="")
												$_at_SupplierCostsCurrencies{$_l_SupplierIndex}:=<>SYS_t_BaseCurrency
											End if 
											If ($_al_Preferred{$_l_SupplierIndex}=0)
												$_al_Preferred{$_l_SupplierIndex}:=$_l_NextPreferred
											End if 
										End for 
										SORT ARRAY:C229($_al_Preferred; $_at_SupplierCodes; $_at_SupplierCostsCurrencies; $_ar_SupplierCosts)
										$_t_UseSupplierCode:=$_at_SupplierCodes{1}
										$_t_UseSupplierCurrency:=$_at_SupplierCostsCurrencies{1}
										$_r_UseStandardCost:=$_ar_SupplierStdCosts{1}
										$_r_UseSupplierCost:=$_ar_SupplierCosts{1}
									End if 
									If ($_t_UseSupplierCode#"")
										PRD_BuildGetComponentCost($_t_UseSupplierCode; $_t_UseSupplierCurrency; $_r_UseStandardCost; PRD_t_productCurrency; [PRODUCTS:9]Product_Code:1; ->OI_ar_BuildCodeCOSTPrice{$_l_SectionRow})
										OI_ar_BuildCodeCostStd{$_l_SectionRow}:=OI_ar_BuildCodeCOSTPrice{$_l_SectionRow}
										OI_at_BuildCodeSupplier{$_l_SectionRow}:=$_t_UseSupplierCode
									Else 
										PRD_BuildGetComponentCost(""; ""; 0; PRD_t_productCurrency; [PRODUCTS:9]Product_Code:1; ->OI_ar_BuildCodeCOSTPrice{$_l_SectionRow})
										OI_ar_BuildCodeCostStd{$_l_SectionRow}:=OI_ar_BuildCodeCOSTPrice{$_l_SectionRow}
										OI_at_BuildCodeSupplier{$_l_SectionRow}:=""
									End if 
									
									
							End case 
						Else 
							//we are reselecting one we deselected
							If (OI_abo_IncludeInProduct{$_l_SectionRow}=False:C215)
								OI_abo_UserSetInclude{$_l_SectionRow}:=True:C214
							End if 
							OI_abo_IncludeInProduct{$_l_SectionRow}:=True:C214
							
							For ($_l_Index; 1; Size of array:C274(PRD_abo_BLBInclude))
								If ($_l_Index#$_l_Row)
									PRD_abo_BLBInclude{$_l_Index}:=False:C215
								End if 
							End for 
						End if 
					Else 
						
						If (OI_at_AdditionOrderItems{$_l_SectionRow}#PRD_at_BLDprdCodes{$_l_Row})
							QUERY:C277([PRODUCTS:9]; [PRODUCTS:9]Product_Code:1=PRD_at_BLDprdCodes{$_l_Row})
							Case of 
								: ([PRODUCTS:9]x_Product_Entry_Class:55=2)  //This is going to open another form
									Gen_Confirm("The selected product is a built product. Are you ready to select the options for this product now?"; "Yes"; "No")
									If (OK=1)
										//The new window will open and the created product code will be the one selected here..note that the selected product code in this window needs to modify the row of the array on here for ease
									Else 
									End if 
									OK:=1
								: ([PRODUCTS:9]x_Product_Entry_Class:55=1)  //Date entry=needs to be in seperate window here
									Gen_Confirm("The selected product is a date related product. Are you ready to select the Dates for this product now?"; "Yes"; "No")
									If (OK=1)
									Else 
										//we can still include the product but when we test the dates at the end then they would not be filled in. There is an array created for storing sub element diary arrays
									End if 
									OK:=1
								Else 
									For ($_l_Index; 1; Size of array:C274(PRD_abo_BLBInclude))
										If ($_l_Index#$_l_Row)
											PRD_abo_BLBInclude{$_l_Index}:=False:C215
										End if 
									End for 
									//TRACE
									OI_at_AdditionOrderItems{$_l_SectionRow}:=PRD_at_BLDprdCodes{$_l_Row}
									//Note on the following line. I need to mod components so this quantity can be locked within the build or flexible
									//at the moment it is locked for everything except the iterations.
									OI_ar_AdditionalItemQTY{$_l_SectionRow}:=OI_ar_DefaultQuantity{OI_at_ProductSections}
									If (OI_abo_IncludeInProduct{$_l_SectionRow}=False:C215)
										OI_abo_UserSetInclude{$_l_SectionRow}:=True:C214
									End if 
									OI_abo_IncludeInProduct{$_l_SectionRow}:=True:C214
									OI_t_ProductCode:=OI_at_AdditionOrderItems{$_l_SectionRow}  //This is the selected product
									
									If (PRD_t_productCurrency=OI_T_CurrencyCode)
										OK_ar_AdditionalItemPrice{$_l_SectionRow}:=[PRODUCTS:9]Sales_Price:9
									Else 
										OK_ar_AdditionalItemPrice{$_l_SectionRow}:=Cat_ConvertValue([PRODUCTS:9]Sales_Price:9; PRD_t_productCurrency; OI_T_CurrencyCode; Current date:C33(*))
									End if 
									OI_ar_AdditionalItemPriceBase{$_l_SectionRow}:=[PRODUCTS:9]Sales_Price:9
									
									
									
							End case 
						Else 
							
						End if 
					End if 
				Else 
					//`Here we  clear the include value, that way its easy to test if a product is included
					OI_abo_IncludeInProduct{$_l_SectionRow}:=False:C215
					
				End if 
			End if 
			
	End case 
	
	OI_t_BuiltCode:=""
	$_r_TotalPriceOLD:=$_r_TotalPrice
	$_r_TotalPrice:=0
	$_bo_AllSectionsSet:=True:C214
	For ($_l_Index; 1; Size of array:C274(OI_al_SectionIDS))
		$_t_SectionCode:=""
		$_r_Price:=0
		$_r_Discount:=0
		If (OI_at_BuildCodeMatrix{$_l_Index}#"")
			If (OI_abo_IncludeInProduct{$_l_Index})
				$_t_SectionCode:=OI_at_BuildCodeMatrix{$_l_Index}  //even in a multiple this is one value
				If (OI_al_ChargingPriceClass{$_l_Index}=0)
					$_r_Price:=OI_ar_BuildCodeSALESPrice{$_l_Index}
				Else 
					$_r_Discount:=OI_ar_BuildCodeSALESPrice{$_l_Index}
				End if 
			Else 
				$_t_SectionCode:=" "*OI_al_SectionLength{$_l_Index}
				$_l_sectionRow:=Find in array:C230(OI_al_ComponentSectionID; OI_al_SectionIDS{$_l_Index})
				If ($_l_sectionRow>0)
					If (OI_abo_OptionalComponent{$_l_sectionRow}=False:C215)
						$_bo_AllSectionsSet:=False:C215
					End if 
				End if 
			End if 
		Else 
			//Build code matrix is not set this may be an additional product
			$_t_SectionCode:=" "*OI_al_SectionLength{$_l_Index}
			$_l_sectionRow:=Find in array:C230(OI_al_ComponentSectionID; OI_al_SectionIDS{$_l_Index})
			
			//``
			If ($_l_sectionRow>0)
				If (OI_abo_OptionalComponent{$_l_sectionRow}=False:C215)  //its not optional
					If (OI_abo_ComponentAdditional{$_l_sectionRow}=True:C214)
						Case of 
							: (OI_at_AdditionOrderItems{$_l_Index}="") | (Not:C34(OI_abo_IncludeInProduct{$_l_Index}))
								If (OI_al_ComponentType{$_l_sectionRow}=0)
									$_bo_AllSectionsSet:=False:C215
								Else 
									//this is a non optional additional order item where you can select more than one so there must be at least one instance in the
									//mutliples array
									$_l_SectionRow:=Find in array:C230(OI_al_MultiplesIndex; OI_al_SectionIDS{$_l_Index})
									If ($_l_SectionRow<0)
										If (OI_al_SectionLength{$_l_Index}>0)
											$_bo_AllSectionsSet:=False:C215
										End if 
										
									End if 
								End if 
							Else 
								
						End case 
					Else 
						$_l_SectionRow:=Find in array:C230(OI_al_MultiplesIndex; OI_al_SectionIDS{$_l_Index})
						If ($_l_SectionRow<0)
							If (OI_al_SectionLength{$_l_Index}>0)
								$_bo_AllSectionsSet:=False:C215
							End if 
						End if 
						
					End if 
					//``
					//$_bo_AllSectionsSet:=False
				End if 
			End if 
		End if 
		If ($_r_Price#0)
			$_r_TotalPrice:=$_r_TotalPrice+$_r_Price
		Else 
			If ($_r_Discount#0)
				If ($_r_TotalPrice#0)
					$_r_TotalPrice:=Gen_Round(($_r_TotalPrice*((100-($_r_Discount))/100)); 2; 1)
				End if 
			End if 
		End if 
		OI_t_BuiltCode:=OI_t_BuiltCode+$_t_SectionCode
	End for 
	OI_t_BuiltCode:=PRD_t_BuildGroupCode+PRD_t_BuildBrandCode+OI_t_BuiltCode
	OI_R_BuiltPrice:=$_r_TotalPrice
	
	If ($_bo_AllSectionsSet)
		OBJECT SET VISIBLE:C603(*; "oCustomerPrice@"; True:C214)  //This will be set to visible and enterable on completion of all the items.
		OBJECT SET ENTERABLE:C238(OI_R_SalesPrice; True:C214)
		If (OI_R_SalesPrice=0)
			
			OI_R_SalesPrice:=OI_R_BuiltPrice
		End if 
		OI_bo_AlloptionsSelected:=True:C214
		If ($_r_TotalPriceOLD#$_r_TotalPrice)  //product price has changed user will have to confirm selling price
			OI_bo_CustomerPriceSet:=False:C215
		End if 
	Else 
		OBJECT SET VISIBLE:C603(*; "oCustomerPrice@"; False:C215)  //This will be set to visible and enterable on completion of all the items.
		//Note that if if the customer price has not been set when you save the record the price confirm window will be displayed so you can set the price..it will be calculated.
		//and by set i mean edited by the user..and it can be edited till the options are selected.
		OI_bo_AlloptionsSelected:=False:C215
		OI_bo_CustomerPriceSet:=False:C215
		
	End if 
	
End if 
ERR_MethodTrackerReturn("PRD_BuildFormSelectProduct"; $_t_oldMethodName)
