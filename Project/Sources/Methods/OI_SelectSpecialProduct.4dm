//%attributes = {}

If (False:C215)
	//Project Method Name:      OI_SelectSpecialProduct
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
	//ARRAY BOOLEAN(OI_abo_IncludeInProduct;0)
	ARRAY DATE:C224($_ad_DiaryDates; 0)
	//ARRAY LONGINT(OI_al_ChargingPriceClass;0)
	//ARRAY LONGINT(OI_al_ComponentSectionID;0)
	//ARRAY LONGINT(OI_al_MultiplesIndex;0)
	//ARRAY LONGINT(OI_al_SectionIDS;0)
	//ARRAY LONGINT(OI_al_SectionLength;0)
	//ARRAY LONGINT(ORD_al_SubAreaTables;0)
	//ARRAY POINTER(ORD_aptr_SubAreaPointers;0)
	//ARRAY REAL(OI_ar_AdditionalItemQTY;0)
	//ARRAY REAL(OI_ar_BuildCodeSALESPrice;0)
	//ARRAY REAL(OI_ar_BuildProductComponentsQTY;0)
	//ARRAY REAL(OK_ar_AdditionalItemCOSTPrice;0)
	//ARRAY REAL(OK_ar_AdditionalItemPrice;0)
	ARRAY TEXT:C222($_at_DiaryCodes; 0)
	ARRAY TEXT:C222($_at_MultipleCodes; 0)
	//ARRAY TEXT(OI_at_AdditionOrderItems;0)
	//ARRAY TEXT(OI_at_BuildCodeMatrix;0)
	//ARRAY TEXT(OI_at_BuildProductComponents;0)
	//ARRAY TEXT(OI_at_MultipleCodes;0)
	//ARRAY TEXT(ORD_at_ModeOrders;0)
	C_BOOLEAN:C305(<>DB_bo_NewStockActive; $_bo_Filled; $_bo_FirstLine; $_bo_OK; $_bo_ReadOnlyState; $_bo_ResetMenu; $_bo_Set; DB_bo_NewRecord; DB_bo_RecordModified; OI_bo_ProductEnter; PRD_bo_OneLinePerDate)
	C_LONGINT:C283($_l_AddedLineNumber; $_l_AreaType; $_l_CharacterNumber; $_l_Column; $_l_ColumnReturn; $_l_CUrrentOrderItemRecord; $_l_DeNormalised; $_l_ExtrasIndex; $_l_FirstRecordID; $_l_Index; $_l_Index2)
	C_LONGINT:C283($_l_NumberofRows; $_l_OrderItemsSetupRow; $_l_ProductNameField; $_l_ProductTable; $_l_QuantityofExtras; $_l_ReturnToRow; $_l_Row; $_l_SectionRow; $_l_TableNumber; $0; LB_l_ColumnNumber)
	C_LONGINT:C283(LB_l_RowNumber; PRD_l_ExtraDates; PRD_l_productCurrency)
	C_POINTER:C301($_ptr_areaTypeVariable; $_ptr_ArrayFieldPointers; $_ptr_ArrayofArrayPointers; $_ptr_ArrayReferences; $_ptr_EnterabilityArray; $_ptr_LBTable; $_ptr_ListboxArea; $_ptr_ListBoxSetup; $_Ptr_ThisColumnArray; $_Ptr_ThisColumnField)
	C_REAL:C285($_r_Discount; $_r_Price; $_r_TotalPrice; OI_R_BuiltPrice; OI_R_SalesPrice; PRD_R_Quantity)
	C_TEXT:C284($_t_BuildProductName; $_t_BuiltCode; $_t_oldMethodName; $_t_Section; OI_t_BuiltCode; OI_T_CurrencyCode; OI_t_InputProductCode; PRD_t_BuildBrandCode; PRD_t_BuildGroupCode; PROD_t_FunctionName; PT_t_DefaultTax)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OI_SelectSpecialProduct")

$_bo_ResetMenu:=False:C215
$0:=1
$_l_OrderItemsSetupRow:=Find in array:C230(ORD_al_SubAreaTables; Table:C252(->[ORDER_ITEMS:25]))
If ($_l_OrderItemsSetupRow>0)
	$_ptr_ListBoxSetup:=ORD_aptr_SubAreaPointers{$_l_OrderItemsSetupRow}
	
	$_ptr_ArrayofArrayPointers:=$_ptr_ListBoxSetup->{3}
	$_Ptr_ThisColumnArray:=$_ptr_ArrayofArrayPointers->{1}
	$_l_ColumnReturn:=LB_l_ColumnNumber
	$_l_ReturnToRow:=Size of array:C274($_Ptr_ThisColumnArray->)  //have to return to this row at the end
	$_l_FirstRecordID:=0
	$_t_oldMethodName:=ERR_MethodTracker("OI_SelectSpecialProduct")
	Case of 
		: ([PRODUCTS:9]x_Product_Entry_Class:55=2)
			//Build a product
			$_l_CUrrentOrderItemRecord:=Record number:C243([ORDER_ITEMS:25])  //Needed so we know if th<--have to return to this item before we exit wierd stuff happens!
			OI_T_CurrencyCode:=[ORDERS:24]Currency_Code:32
			OI_t_InputProductCode:=[PRODUCTS:9]Product_Code:1
			//$BUttons:=◊ButtDis
			OI_bo_ProductEnter:=True:C214
			Macro("OIBeforeHandling")  //This macro will apply any special conditions required for the order creation..such as setting vars used in  macros or the order items
			If (OI_bo_ProductEnter)
				Open window:C153((Screen width:C187/2); (Screen height:C188/2); (Screen width:C187/2); (Screen height:C188/2); 8)
				DIALOG:C40([ORDER_ITEMS:25]; "BUILD_PRODUCT")
				//◊ButtDis:=$BUttons
				//First we check if the
				CLOSE WINDOW:C154
			End if 
			If (OI_bo_ProductEnter)
				$0:=2
				//TRACE
				If (OI_t_BuiltCode#"")
					$_t_BuildProductName:=""
					QUERY:C277([PRODUCTS:9]; [PRODUCTS:9]Product_Code:1=OI_t_BuiltCode)
					If (Records in selection:C76([PRODUCTS:9])=0)
						$_t_BuiltCode:=""
						$_r_TotalPrice:=0
						For ($_l_Index; 1; Size of array:C274(OI_al_SectionIDS))
							$_t_Section:=""
							$_r_Price:=0
							$_r_Discount:=0
							If (OI_at_BuildCodeMatrix{$_l_Index}#"")
								If (OI_abo_IncludeInProduct{$_l_Index})
									QUERY:C277([PRODUCTS:9]; [PRODUCTS:9]Product_Code:1=OI_at_BuildProductComponents{$_l_Index})
									If ($_t_BuildProductName="")
										$_t_BuildProductName:=[PRODUCTS:9]Product_Name:2
									Else 
										If (Position:C15([PRODUCTS:9]Product_Name:2; $_t_BuildProductName)=0)
											$_t_BuildProductName:=$_t_BuildProductName+" "+[PRODUCTS:9]Product_Name:2
										End if 
									End if 
									$_t_Section:=OI_at_BuildCodeMatrix{$_l_Index}
									If (OI_al_ChargingPriceClass{$_l_Index}=0)
										$_r_Price:=OI_ar_BuildCodeSALESPrice{$_l_Index}
									Else 
										$_r_Discount:=OI_ar_BuildCodeSALESPrice{$_l_Index}
									End if 
								Else 
									$_t_Section:=" "*OI_al_SectionLength{$_l_Index}
								End if 
							Else 
								$_t_Section:=" "*OI_al_SectionLength{$_l_Index}
								
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
							$_t_BuiltCode:=$_t_BuiltCode+$_t_Section
						End for 
						//Copy the template product and change stuff
						READ WRITE:C146([PRODUCTS:9])
						QUERY:C277([PRODUCTS:9]; [PRODUCTS:9]Product_Code:1=OI_t_InputProductCode)
						DUPLICATE RECORD:C225([PRODUCTS:9])
						//we will create the product
						[PRODUCTS:9]Modified_Date:10:=Current date:C33(*)
						[PRODUCTS:9]Available_From_Date:21:=Current date:C33(*)
						[PRODUCTS:9]Brand_Code:4:=PRD_t_BuildBrandCode
						[PRODUCTS:9]Group_Code:3:=PRD_t_BuildGroupCode
						[PRODUCTS:9]Model_Code:5:=$_t_BuiltCode
						//[PRODUCTS]Product Code:=PRD_t_BuildGroupCode+PRD_t_BuildBrandCode+$_t_BuiltCode
						//if( Not(override pricing)
						
						[PRODUCTS:9]Short_Code:19:=""
						[PRODUCTS:9]Sales_Price:9:=OI_R_BuiltPrice
						[PRODUCTS:9]Standard_Price:16:=OI_R_BuiltPrice  //Note that these are the STANDARD price. Not discounted to the customer
						[PRODUCTS:9]Product_Code:1:=OI_t_BuiltCode
						If (Position:C15([PRODUCTS:9]Product_Name:2; $_t_BuildProductName)=0)
							$_t_BuildProductName:=$_t_BuildProductName+" "+[PRODUCTS:9]Product_Name:2
						Else 
							
						End if 
						If (Length:C16($_t_BuildProductName)<=61) | (True:C214)
							[PRODUCTS:9]Product_Name:2:=$_t_BuildProductName
						Else 
							$_l_CharacterNumber:=61
							$_bo_Filled:=False:C215
							Repeat 
								If ($_t_BuildProductName[[$_l_CharacterNumber]]=" ")
									$_bo_Filled:=True:C214
									[PRODUCTS:9]Product_Name:2:=Substring:C12($_t_BuildProductName; 1; $_l_CharacterNumber-1)
									[PRODUCTS:9]Description:6:=Substring:C12($_t_BuildProductName; $_l_CharacterNumber+1)+" "+[PRODUCTS:9]Description:6
									$_l_CharacterNumber:=0
								Else 
									$_l_CharacterNumber:=$_l_CharacterNumber-1
								End if 
							Until ($_l_CharacterNumber=0)
							If (Not:C34($_bo_Filled))  //Unlikely
								[PRODUCTS:9]Product_Name:2:=Substring:C12($_t_BuildProductName; 1; 61)
							End if 
						End if 
						
						$_l_ProductTable:=Table:C252(->[PRODUCTS:9])
						$_l_ProductNameField:=Field:C253(->[PRODUCTS:9]Product_Name:2)
						Macro_AccType("Build "+String:C10($_l_ProductTable)+"/"+String:C10($_l_ProductNameField))
						
						[PRODUCTS:9]Default_Price_Currency_ID:45:=PRD_l_productCurrency
						[PRODUCTS:9]Default_Tax:23:=PT_t_DefaultTax
						[PRODUCTS:9]X_ID:43:=AA_GetNextID(->[PRODUCTS:9]X_ID:43)
						
						DB_SaveRecord(->[PRODUCTS:9])
						//here add in the prouct components
						//```
						//``
						//The following array is used for the above OR for the  component being included.
						
						//The next group is for components of the built product. see below for the handling of multiples
						
						
						For ($_l_Index; 1; Size of array:C274(OI_abo_IncludeInProduct))
							If (OI_abo_IncludeInProduct{$_l_Index})
								If (OI_at_BuildProductComponents{$_l_Index}#"")
									CREATE RECORD:C68([COMPONENTS:86])
									[COMPONENTS:86]Component_Code:2:=OI_at_BuildProductComponents{$_l_Index}
									[COMPONENTS:86]Product_Code:1:=OI_t_BuiltCode
									[COMPONENTS:86]Quantity:3:=OI_ar_BuildProductComponentsQTY{$_l_Index}
									DB_SaveRecord(->[COMPONENTS:86])
									
								Else 
									//This must be a multiples selected so we add multiple components
									
								End if 
							End if 
						End for 
					Else 
						//Check the components for the product are created
						
						For ($_l_Index; 1; Size of array:C274(OI_abo_IncludeInProduct))
							If (OI_abo_IncludeInProduct{$_l_Index})
								If (OI_at_BuildProductComponents{$_l_Index}#"")
									QUERY:C277([COMPONENTS:86]; [COMPONENTS:86]Component_Code:2=OI_at_BuildProductComponents{$_l_Index}; *)
									QUERY:C277([COMPONENTS:86];  & ; [COMPONENTS:86]Product_Code:1=OI_t_BuiltCode)
									If (Records in selection:C76([COMPONENTS:86])=0)
										CREATE RECORD:C68([COMPONENTS:86])
										[COMPONENTS:86]Component_Code:2:=OI_at_BuildProductComponents{$_l_Index}
										[COMPONENTS:86]Product_Code:1:=OI_t_BuiltCode
										[COMPONENTS:86]Quantity:3:=OI_ar_BuildProductComponentsQTY{$_l_Index}
										DB_SaveRecord(->[COMPONENTS:86])
									End if 
									
								Else 
									//This must be a multiples selected so we add multiple components
									
								End if 
							End if 
						End for 
					End if 
					
					//We have now created the product for this order item
					//next we need to see if there are multiple order items to create
					Case of 
						: (PRD_bo_OneLinePerDate)  //This is only set if there is a date related part of the build
							
							For ($_l_Index; 1; Size of array:C274(OI_al_ComponentSectionID))
								$_l_SectionRow:=Find in array:C230(OI_al_MultiplesIndex; OI_al_ComponentSectionID{$_l_Index})
								If ($_l_SectionRow>0)  //even if there were multiple pages setting dates i am not supporting that at the moment..it would be a nightmare..we support ONE date related section
									ARRAY TEXT:C222($_at_MultipleCodes; 0)
									For ($_l_Index2; 1; Size of array:C274(OI_at_MultipleCodes{$_l_SectionRow}))  //this array may not be in date order and the orders should be in date order
										If (OI_at_MultipleCodes{$_l_SectionRow}{$_l_Index2}#"")
											APPEND TO ARRAY:C911($_at_MultipleCodes; OI_at_MultipleCodes{$_l_SectionRow}{$_l_Index2})
										End if 
									End for 
									QUERY WITH ARRAY:C644([DIARY:12]Diary_Code:3; $_at_MultipleCodes)
									SELECTION TO ARRAY:C260([DIARY:12]Diary_Code:3; $_at_DiaryCodes; [DIARY:12]Date_Do_From:4; $_ad_DiaryDates)
									SORT ARRAY:C229($_ad_DiaryDates; $_at_DiaryCodes)
									$_bo_FirstLine:=True:C214
									For ($_l_Index2; 1; Size of array:C274($_ad_DiaryDates))
										If ($_at_DiaryCodes{$_l_Index2}#"")
											If ($_l_CUrrentOrderItemRecord=-3) | ($_bo_FirstLine)  //We are in an unsaved order item
												$_l_CUrrentOrderItemRecord:=0
												$_bo_FirstLine:=False:C215
											Else 
												
												CREATE RECORD:C68([ORDER_ITEMS:25])
												[ORDER_ITEMS:25]Order_Code:1:=[ORDERS:24]Order_Code:3
												OrderI_SubLPB
												DB_SaveRecord(->[ORDER_ITEMS:25])
												$_ptr_ListboxArea:=$_ptr_ListBoxSetup->{1}
												
												LISTBOX GET CELL POSITION:C971($_ptr_ListboxArea->; $_l_Column; $_l_Row)
												If (Size of array:C274($_ptr_ListBoxSetup->)>=19)
													$_ptr_areaTypeVariable:=$_ptr_ListBoxSetup->{19}  //3 is table based 2 is array based view of fields and -1 is array based array of arrays.
													$_l_AreaType:=$_ptr_areaTypeVariable->
												Else 
													$_l_AreaType:=1
												End if 
												
												$_l_AddedLineNumber:=LBi_xPlus($_ptr_ListBoxSetup; ->ORD_at_ModeOrders; LB_l_RowNumber; LB_l_ColumnNumber)
												//put the cursor in the correct place
												$_ptr_ListboxArea:=$_ptr_ListBoxSetup->{1}
												$_ptr_ArrayofArrayPointers:=$_ptr_ListBoxSetup->{3}
												$_ptr_ArrayReferences:=$_ptr_ListBoxSetup->{9}
												$_ptr_EnterabilityArray:=$_ptr_ListBoxSetup->{14}
												$_ptr_LBTable:=$_ptr_ListBoxSetup->{10}
												$_ptr_ArrayofArrayPointers:=$_ptr_ListBoxSetup->{3}
												$_Ptr_ThisColumnArray:=$_ptr_ArrayofArrayPointers->{1}
												If ($_l_AreaType<3)
													$_l_NumberofRows:=Size of array:C274($_Ptr_ThisColumnArray->)
													If ($_l_AddedLineNumber>0)
														$_l_NumberofRows:=$_l_AddedLineNumber
													End if 
													$_bo_ReadOnlyState:=((Read only state:C362($_ptr_LBTable->)) | (Locked:C147($_ptr_LBTable->)))
													For ($_l_Index2; 1; Size of array:C274($_ptr_EnterabilityArray->))
														If (($_bo_ReadOnlyState=False:C215) & ($_ptr_EnterabilityArray->{$_l_Index}))
															LB_GoToCell($_ptr_ListboxArea; $_l_Index2; $_l_NumberofRows)
															$_l_Index2:=Size of array:C274($_ptr_EnterabilityArray->)
														End if 
													End for 
												Else 
													$_ptr_ArrayFieldPointers:=$_ptr_ListBoxSetup->{2}
													$_bo_ReadOnlyState:=((Read only state:C362($_ptr_LBTable->)) | (Locked:C147($_ptr_LBTable->)))
													For ($_l_Index; 1; Size of array:C274($_ptr_EnterabilityArray->))
														If (($_bo_ReadOnlyState=False:C215) & ($_ptr_EnterabilityArray->{$_l_Index}))
															$_Ptr_ThisColumnField:=$_ptr_ArrayFieldPointers->{$_l_Index}
															
															EDIT ITEM:C870($_Ptr_ThisColumnField->)
															$_bo_Set:=True:C214
															$_l_Index:=Size of array:C274($_ptr_EnterabilityArray->)
														End if 
														
													End for 
													
												End if 
												If (<>DB_bo_NewStockActive)
													STK_SOSetInfo($_ptr_ListBoxSetup)
												End if 
											End if 
											[ORDER_ITEMS:25]Quantity:3:=1
											[ORDER_ITEMS:25]Product_Code:2:=OI_t_BuiltCode
											If ([PRODUCTS:9]Product_Code:1#OI_t_BuiltCode)
												QUERY:C277([PRODUCTS:9]; [PRODUCTS:9]Product_Code:1=OI_t_BuiltCode)
											End if 
											//[ORDER ITEMS]Description:=[PRODUCTS]Description
											If (OI_R_SalesPrice>0)
												[ORDER_ITEMS:25]Sales_Price:4:=OI_R_SalesPrice
											End if 
											If (OI_R_BuiltPrice=0)
												[ORDER_ITEMS:25]Retail_Price:38:=OI_R_SalesPrice
											End if 
											[ORDER_ITEMS:25]x_ID:58:=AA_GetNextID(->[ORDER_ITEMS:25]x_ID:58)
											
											//make sure discounts get applied
											PROD_t_FunctionName:=""
											OrderI_SubLPPC
											If ([ORDER_ITEMS:25]Supplier_Code:20#"") & ([ORDER_ITEMS:25]Product_Code:2#"")
												$_bo_OK:=OrderI_SubLPSup
												If (Not:C34($_bo_OK))
													[ORDER_ITEMS:25]Supplier_Code:20:=""
												End if 
											End if 
											DB_bo_RecordModified:=True:C214
											
											$_l_TableNumber:=Table:C252(->[ORDER_ITEMS:25])
											
											
											//$_l_Row:=LB_l_RowNumber
											//$_ptr_ArrayFieldPointers:=ORD_aPtr_OrderItemsSetup{2}
											//$_Ptr_ThisColumnField:=$_ptr_ArrayFieldPointers->{LB_l_ColumnNumber}
											//$Null:=(UTI_varisnull ($_Ptr_ThisColumnField))
											//TRACE
											//LBi_ModUpdate (->ORD_aPtr_OrderItemsSetup;$Null;$_Ptr_ThisColumnField;$_l_Column;$_l_Row)
											CREATE RECORD:C68([xDiaryRelations:137])
											QUERY:C277([DIARY:12]; [DIARY:12]Diary_Code:3=$_at_DiaryCodes{$_l_Index2})
											[xDiaryRelations:137]xDiaryID:1:=[DIARY:12]x_ID:50
											[xDiaryRelations:137]XRecord_Code:5:=[ORDER_ITEMS:25]Order_Code:1  //note this is naughty of me-this is not unique-make sure the display uses the ID!!
											[xDiaryRelations:137]xRecordID:4:=[ORDER_ITEMS:25]x_ID:58
											[xDiaryRelations:137]xTableNUM:3:=Table:C252(->[ORDER_ITEMS:25])
											$_l_DeNormalised:=Num:C11("1"+String:C10([xDiaryRelations:137]xTableNUM:3; "0000")+(String:C10([xDiaryRelations:137]xRecordID:4; "000000000")))
											[xDiaryRelations:137]XRelationNUM:2:=$_l_DeNormalised
											DB_SaveRecord(->[xDiaryRelations:137])
											DB_bo_NewRecord:=True:C214
											//TRACE
											Macro_AccType("Accept "+String:C10($_l_TableNumber))
											//Run any macro code
											DB_SaveRecord(->[ORDER_ITEMS:25])
											If ($_l_FirstRecordID=0)
												$_l_FirstRecordID:=[ORDER_ITEMS:25]x_ID:58
											End if 
											//$_ptr_ArrayFieldPointers:=$_ptr_ListBoxSetup->{2}
											
											
											
											
										End if 
										$_l_Index:=Size of array:C274(OI_al_ComponentSectionID)
									End for 
									If (($_l_Index2-1)<PRD_R_Quantity)
										//Although we have created all the dates there are more quantity
										If (PRD_l_ExtraDates>0)
											//Create the order lines
											$_l_QuantityofExtras:=PRD_l_ExtraDates
											For ($_l_ExtrasIndex; 1; $_l_QuantityofExtras)
												If ($_l_CUrrentOrderItemRecord=-3) | ($_bo_FirstLine)  //We are in an unsaved order item
													$_l_CUrrentOrderItemRecord:=0
													$_bo_FirstLine:=False:C215
												Else 
													
													CREATE RECORD:C68([ORDER_ITEMS:25])
													[ORDER_ITEMS:25]Order_Code:1:=[ORDERS:24]Order_Code:3
													OrderI_SubLPB
													DB_SaveRecord(->[ORDER_ITEMS:25])
													$_ptr_ListboxArea:=$_ptr_ListBoxSetup->{1}
													LISTBOX GET CELL POSITION:C971($_ptr_ListboxArea->; $_l_Column; $_l_Row)
													If (Size of array:C274($_ptr_ListBoxSetup->)>=19)
														$_ptr_areaTypeVariable:=$_ptr_ListBoxSetup->{19}  //3 is table based 2 is array based view of fields and -1 is array based array of arrays.
														$_l_AreaType:=$_ptr_areaTypeVariable->
													Else 
														$_l_AreaType:=1
													End if 
													
													$_l_AddedLineNumber:=LBi_xPlus($_ptr_ListBoxSetup; ->ORD_at_ModeOrders; LB_l_RowNumber; LB_l_ColumnNumber)
													//put the cursor in the correct place
													$_ptr_ListboxArea:=$_ptr_ListBoxSetup->{1}
													$_ptr_ArrayofArrayPointers:=$_ptr_ListBoxSetup->{3}
													$_ptr_ArrayReferences:=$_ptr_ListBoxSetup->{9}
													$_ptr_EnterabilityArray:=$_ptr_ListBoxSetup->{14}
													$_ptr_LBTable:=$_ptr_ListBoxSetup->{10}
													$_ptr_ArrayofArrayPointers:=$_ptr_ListBoxSetup->{3}
													$_Ptr_ThisColumnArray:=$_ptr_ArrayofArrayPointers->{1}
													If ($_l_AreaType<3)
														$_l_NumberofRows:=Size of array:C274($_Ptr_ThisColumnArray->)
														If ($_l_AddedLineNumber>0)
															$_l_NumberofRows:=$_l_AddedLineNumber
														End if 
														$_bo_ReadOnlyState:=((Read only state:C362($_ptr_LBTable->)) | (Locked:C147($_ptr_LBTable->)))
														For ($_l_Index2; 1; Size of array:C274($_ptr_EnterabilityArray->))
															If (($_bo_ReadOnlyState=False:C215) & ($_ptr_EnterabilityArray->{$_l_Index}))
																LB_GoToCell($_ptr_ListboxArea; $_l_Index2; $_l_NumberofRows)
																$_l_Index2:=Size of array:C274($_ptr_EnterabilityArray->)
															End if 
														End for 
													Else 
														$_ptr_ArrayFieldPointers:=$_ptr_ListBoxSetup->{2}
														$_bo_ReadOnlyState:=((Read only state:C362($_ptr_LBTable->)) | (Locked:C147($_ptr_LBTable->)))
														For ($_l_Index; 1; Size of array:C274($_ptr_EnterabilityArray->))
															If (($_bo_ReadOnlyState=False:C215) & ($_ptr_EnterabilityArray->{$_l_Index}))
																$_Ptr_ThisColumnField:=$_ptr_ArrayFieldPointers->{$_l_Index}
																
																EDIT ITEM:C870($_Ptr_ThisColumnField->)
																$_bo_Set:=True:C214
																$_l_Index:=Size of array:C274($_ptr_EnterabilityArray->)
															End if 
															
														End for 
														
													End if 
													If (<>DB_bo_NewStockActive)
														STK_SOSetInfo($_ptr_ListBoxSetup)
													End if 
												End if 
												[ORDER_ITEMS:25]Quantity:3:=1
												[ORDER_ITEMS:25]Product_Code:2:=OI_t_BuiltCode
												If ([PRODUCTS:9]Product_Code:1#OI_t_BuiltCode)
													QUERY:C277([PRODUCTS:9]; [PRODUCTS:9]Product_Code:1=OI_t_BuiltCode)
												End if 
												//[ORDER ITEMS]Description:=[PRODUCTS]Description
												If (OI_R_SalesPrice>0)
													[ORDER_ITEMS:25]Sales_Price:4:=OI_R_SalesPrice
												End if 
												If (OI_R_BuiltPrice=0)
													[ORDER_ITEMS:25]Retail_Price:38:=OI_R_SalesPrice
												End if 
												[ORDER_ITEMS:25]x_ID:58:=AA_GetNextID(->[ORDER_ITEMS:25]x_ID:58)
												[ORDER_ITEMS:25]Required_Date:10:=!00-00-00!
												//make sure discounts get applied
												PROD_t_FunctionName:=""
												OrderI_SubLPPC
												If ([ORDER_ITEMS:25]Supplier_Code:20#"") & ([ORDER_ITEMS:25]Product_Code:2#"")
													$_bo_OK:=OrderI_SubLPSup
													If (Not:C34($_bo_OK))
														[ORDER_ITEMS:25]Supplier_Code:20:=""
													End if 
												End if 
												DB_bo_RecordModified:=True:C214
												CREATE RECORD:C68([xDiaryRelations:137])
												
												[xDiaryRelations:137]xDiaryID:1:=0
												[xDiaryRelations:137]XRecord_Code:5:=[ORDER_ITEMS:25]Order_Code:1  //note this is naughty of me-this is not unique-make sure the display uses the ID!!
												[xDiaryRelations:137]xRecordID:4:=[ORDER_ITEMS:25]x_ID:58
												[xDiaryRelations:137]xTableNUM:3:=Table:C252(->[ORDER_ITEMS:25])
												$_l_DeNormalised:=Num:C11("1"+String:C10([xDiaryRelations:137]xTableNUM:3; "0000")+(String:C10([xDiaryRelations:137]xRecordID:4; "000000000")))
												[xDiaryRelations:137]XRelationNUM:2:=$_l_DeNormalised
												DB_SaveRecord(->[xDiaryRelations:137])
												
												DB_bo_NewRecord:=True:C214
												
												Macro_AccType("Accept "+String:C10($_l_TableNumber))
												//Run any macro code
												DB_SaveRecord(->[ORDER_ITEMS:25])
												If ($_l_FirstRecordID=0)
													$_l_FirstRecordID:=[ORDER_ITEMS:25]x_ID:58
												End if 
												
											End for 
											
										End if 
									End if 
								End if 
								
							End for 
						Else 
							//just one line
							//if there are multiple dates create multiple dates
							[ORDER_ITEMS:25]Quantity:3:=PRD_R_Quantity
							[ORDER_ITEMS:25]Product_Code:2:=OI_t_BuiltCode
							If (OI_R_SalesPrice>0)
								[ORDER_ITEMS:25]Sales_Price:4:=OI_R_SalesPrice
							End if 
							PROD_t_FunctionName:=""
							OrderI_SubLPPC
							If ([ORDER_ITEMS:25]Supplier_Code:20#"") & ([ORDER_ITEMS:25]Product_Code:2#"")
								$_bo_OK:=OrderI_SubLPSup
								If (Not:C34($_bo_OK))
									[ORDER_ITEMS:25]Supplier_Code:20:=""
								End if 
							End if 
							DB_bo_RecordModified:=True:C214
							For ($_l_Index; 1; Size of array:C274(OI_al_ComponentSectionID))
								$_l_SectionRow:=Find in array:C230(OI_al_MultiplesIndex; OI_al_ComponentSectionID{$_l_Index})
								If ($_l_SectionRow>0)
									
									For ($_l_Index2; 1; Size of array:C274(OI_at_MultipleCodes{$_l_SectionRow}))
										If (OI_at_MultipleCodes{$_l_SectionRow}{$_l_Index2}#"")
											CREATE RECORD:C68([xDiaryRelations:137])
											QUERY:C277([DIARY:12]; [DIARY:12]Diary_Code:3=OI_at_MultipleCodes{$_l_SectionRow}{$_l_Index2})
											[xDiaryRelations:137]xDiaryID:1:=[DIARY:12]x_ID:50
											[xDiaryRelations:137]XRecord_Code:5:=[ORDER_ITEMS:25]Order_Code:1  //note this is naughty of me-this is not unique-make sure the display uses the ID!!
											[xDiaryRelations:137]xRecordID:4:=[ORDER_ITEMS:25]x_ID:58
											[xDiaryRelations:137]xTableNUM:3:=Table:C252(->[ORDER_ITEMS:25])
											$_l_DeNormalised:=Num:C11("1"+String:C10([xDiaryRelations:137]xTableNUM:3; "0000")+(String:C10([xDiaryRelations:137]xRecordID:4; "000000000")))
											[xDiaryRelations:137]XRelationNUM:2:=$_l_DeNormalised
											
											DB_SaveRecord(->[xDiaryRelations:137])
											
										End if 
									End for 
									
								End if 
								
							End for 
							Macro_AccType("Accept "+String:C10(Table:C252(->[ORDER_ITEMS:25])))
							//Run any macro code
							
							DB_SaveRecord(->[ORDER_ITEMS:25])
							If ($_l_FirstRecordID=0)
								$_l_FirstRecordID:=[ORDER_ITEMS:25]x_ID:58
							End if 
							
					End case 
					//TRACE
					
					For ($_l_Index; 1; Size of array:C274(OI_at_AdditionOrderItems))
						If (OI_at_AdditionOrderItems{$_l_Index}#"") & (OI_abo_IncludeInProduct{$_l_Index})
							CREATE RECORD:C68([ORDER_ITEMS:25])
							OrderI_SubLPB
							QUERY:C277([PRODUCTS:9]; [PRODUCTS:9]Product_Code:1=OI_at_AdditionOrderItems{$_l_Index})
							[ORDER_ITEMS:25]Order_Code:1:=[ORDERS:24]Order_Code:3
							QUERY:C277([PRODUCTS:9]; [PRODUCTS:9]Product_Code:1=OI_at_AdditionOrderItems{$_l_Index})
							[ORDER_ITEMS:25]Order_Code:1:=[ORDERS:24]Order_Code:3
							$_ptr_ListboxArea:=$_ptr_ListBoxSetup->{1}
							LB_l_RowNumber:=Records in selection:C76([ORDER_ITEMS:25])
							LB_l_ColumnNumber:=1
							$_l_AddedLineNumber:=LBi_xPlus($_ptr_ListBoxSetup; ->ORD_at_ModeOrders; LB_l_RowNumber; LB_l_ColumnNumber)
							//put the cursor in the correct place
							$_ptr_ListboxArea:=$_ptr_ListBoxSetup->{1}
							$_ptr_ArrayofArrayPointers:=$_ptr_ListBoxSetup->{3}
							$_ptr_ArrayReferences:=$_ptr_ListBoxSetup->{9}
							$_ptr_EnterabilityArray:=$_ptr_ListBoxSetup->{14}
							$_ptr_LBTable:=$_ptr_ListBoxSetup->{10}
							$_Ptr_ThisColumnArray:=$_ptr_ArrayofArrayPointers->{1}
							
							$_l_NumberofRows:=Size of array:C274($_Ptr_ThisColumnArray->)
							If ($_l_AddedLineNumber>0)
								$_l_NumberofRows:=$_l_AddedLineNumber
							End if 
							$_bo_ReadOnlyState:=((Read only state:C362($_ptr_LBTable->)) | (Locked:C147($_ptr_LBTable->)))
							For ($_l_Index2; 1; Size of array:C274($_ptr_EnterabilityArray->))
								If (($_bo_ReadOnlyState=False:C215) & ($_ptr_EnterabilityArray->{$_l_Index2}))
									LB_GoToCell($_ptr_ListboxArea; $_l_Index2; $_l_NumberofRows)
									$_l_Index2:=Size of array:C274($_ptr_EnterabilityArray->)
								End if 
							End for 
							If (<>DB_bo_NewStockActive)
								STK_SOSetInfo($_ptr_ListBoxSetup)
							End if 
							[ORDER_ITEMS:25]Product_Code:2:=[PRODUCTS:9]Product_Code:1
							//  `[ORDER ITEMS]Description:=[PRODUCTS]Description
							//[ORDER ITEMS]Required Date:=!00/00/00!
							[ORDER_ITEMS:25]Quantity:3:=OI_ar_AdditionalItemQTY{$_l_Index}
							If ([ORDER_ITEMS:25]Quantity:3=0)
								[ORDER_ITEMS:25]Quantity:3:=1
							End if 
							If (OK_ar_AdditionalItemPrice{$_l_Index}>0)
								[ORDER_ITEMS:25]Sales_Price:4:=OK_ar_AdditionalItemPrice{$_l_Index}
							End if 
							If (OK_ar_AdditionalItemCOSTPrice{$_l_Index}>0)
								[ORDER_ITEMS:25]Cost_Price:5:=OK_ar_AdditionalItemCOSTPrice{$_l_Index}
							End if 
							OrderI_SubLPPC
							If ([ORDER_ITEMS:25]Supplier_Code:20#"") & ([ORDER_ITEMS:25]Product_Code:2#"")
								$_bo_OK:=OrderI_SubLPSup
								If (Not:C34($_bo_OK))
									[ORDER_ITEMS:25]Supplier_Code:20:=""
								End if 
							End if 
							DB_bo_RecordModified:=True:C214
							Macro_AccType("Accept "+String:C10(Table:C252(->[ORDER_ITEMS:25])))  //Run any macro code
							DB_SaveRecord(->[ORDER_ITEMS:25])
							If ($_l_FirstRecordID=0)
								$_l_FirstRecordID:=[ORDER_ITEMS:25]x_ID:58
							End if 
							
						End if 
					End for 
					//Reload the order items
					//GOTO AREA([ORDERS]Source)
					
					//vCT:=0
					//LBi_RemoveAll (->ORD_aPtr_OrderItemsSetup)
					//ARRAY POINTER(ORD_aPtr_OrderItemsSetup;0)
					//Orders_InLPß ("P1")
					
					//CALL PROCESS(Current process)
					
					QUERY:C277([SCRIPTS:80]; [SCRIPTS:80]Script_Code:1="OIAfterHandling")
					If (Records in selection:C76([SCRIPTS:80])>0)
						//we do this query because if we do ths we must do some other things
						COPY NAMED SELECTION:C331([ORDER_ITEMS:25]; "$CURRENT")
						//TRACE
						Macro("OIAfterHandling")  //This macro will apply any special conditions required for the order creation..such as setting vars used in  macros or the order items
						//Now make sure the rows are updated
						USE NAMED SELECTION:C332("$CURRENT")
						//$_l_Column:=LB_GetColumnNumFromField (->[ORDER ITEMS]Item Number;$_ptr_ListBoxSetup)
						//FIRST RECORD([ORDER ITEMS])
						
						QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Order_Code:1=[ORDERS:24]Order_Code:3)
					End if 
				End if 
			Else 
				$0:=-1
			End if 
			$_bo_ResetMenu:=True:C214
		: ([PRODUCTS:9]x_Product_Entry_Class:55=1)
			//Date related
	End case 
	If ($_bo_ResetMenu)
		DB_SetInputFormMenu(Table:C252(->[ORDERS:24]); "Order_In")
		If ($_l_FirstRecordID>0)
			$_ptr_LBTable:=$_ptr_ListBoxSetup->{10}
			QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]x_ID:58=$_l_FirstRecordID)
			$_bo_ReadOnlyState:=((Read only state:C362($_ptr_LBTable->)) | (Locked:C147($_ptr_LBTable->)))
			$_ptr_ListboxArea:=$_ptr_ListBoxSetup->{1}
			LB_GoToCell($_ptr_ListboxArea; $_l_ColumnReturn; 1)
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("OI_SelectSpecialProduct"; $_t_oldMethodName)
