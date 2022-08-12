//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Products Imp
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 01/04/2010 22:07
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(WIN_al_CalledFromReference;0)
	//ARRAY LONGINT(WIN_al_ThisWIndowReference;0)
	ARRAY TEXT:C222($_at_ProductCodes; 0)
	C_BOOLEAN:C305($_bo_BrandPref; WIN_bo_TrackerInited)
	C_DATE:C307(<>DB_d_CurrentDate)
	C_LONGINT:C283(<>SYS_l_CancelProcess; $_l_Create; $_l_New; $_l_WindowReferenceRow; $_l_Write; vAdd; vNo; WIN_l_CurrentWinRef)
	C_TEXT:C284($_t_AnalysisCode; $_t_Bundle; $_t_Commodity; $_t_CompanyCode; $_t_CostOffer; $_t_CostPrice; $_t_DefaultTax; $_t_Description; $_t_FieldDelimiter; $_t_ImportName; $_t_Margin)
	C_TEXT:C284($_t_Maximum; $_t_Minumum; $_t_ModifiedDate; $_t_OfferPrice; $_t_oldMethodName; $_t_PriceList; $_t_PriceUpdate; $_t_ProductBrand; $_t_ProductCode; $_t_ProductGroup; $_t_ProductModel)
	C_TEXT:C284($_t_ProductName; $_t_PurchaseAccount; $_t_RecordDelimiter; $_t_SalesAccount; $_t_SalesPrice; $_t_SerialNumber; $_t_ShortCode; $_t_Show; $_t_SIze; $_t_Stock; $_t_Superior)
	C_TEXT:C284($_t_SupplierProductCode; $_t_Weight; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; vT; vText; WIN_t_CurrentOutputform)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Products Imp")
//Products General Import
$_t_ImportName:="Import Products"
Start_Process
Products_File
vAdd:=1
Gen_Confirm("Have you created an Products_File in the correct Text format?"; "Yes"; "No")
If (OK=1)
	Gen_Confirm("Do you want to create new Products if no match is found?"; "Yes"; "No")
	If (OK=1)
		$_l_New:=1
	Else 
		$_l_New:=0
	End if 
	Gen_Confirm("Do you want to prefix imported Product Names with the Brand Name?"; "Yes"; "No")
	If (OK=1)
		$_bo_BrandPref:=True:C214
	Else 
		$_bo_BrandPref:=False:C215
	End if 
	SET CHANNEL:C77(10; "")
	If (OK=1)
		CREATE EMPTY SET:C140([PRODUCTS:9]; "Master")
		$_t_RecordDelimiter:=Char:C90(13)
		$_t_FieldDelimiter:=Char:C90(9)
		vText:="sdfsdf"
		Open_PrD_Window($_t_ImportName+": Command-. to Cancel")
		While ((Length:C16(vText)>3) & (<>SYS_l_CancelProcess#Current process:C322))
			RECEIVE PACKET:C104(vText; $_t_RecordDelimiter)
			Gen_ImpStrip
			$_t_ProductGroup:=First_Field(->vT; $_t_FieldDelimiter)
			$_t_ProductBrand:=First_Field(->vT; $_t_FieldDelimiter)
			$_t_ProductModel:=First_Field(->vT; $_t_FieldDelimiter)
			$_t_ProductCode:=First_Field(->vT; $_t_FieldDelimiter)
			$_t_Superior:=First_Field(->vT; $_t_FieldDelimiter)
			$_t_ProductName:=First_Field(->vT; $_t_FieldDelimiter)
			$_t_Description:=First_Field(->vT; $_t_FieldDelimiter)
			$_t_SalesAccount:=First_Field(->vT; $_t_FieldDelimiter)
			$_t_PurchaseAccount:=First_Field(->vT; $_t_FieldDelimiter)
			$_t_AnalysisCode:=First_Field(->vT; $_t_FieldDelimiter)
			$_t_SalesPrice:=First_Field(->vT; $_t_FieldDelimiter)
			$_t_OfferPrice:=First_Field(->vT; $_t_FieldDelimiter)
			$_t_PriceList:=First_Field(->vT; $_t_FieldDelimiter)
			$_t_Stock:=First_Field(->vT; $_t_FieldDelimiter)
			$_t_SerialNumber:=First_Field(->vT; $_t_FieldDelimiter)
			$_t_Minumum:=First_Field(->vT; $_t_FieldDelimiter)
			$_t_Maximum:=First_Field(->vT; $_t_FieldDelimiter)
			$_t_ModifiedDate:=First_Field(->vT; $_t_FieldDelimiter)
			$_t_CompanyCode:=First_Field(->vT; $_t_FieldDelimiter)
			$_t_SupplierProductCode:=First_Field(->vT; $_t_FieldDelimiter)
			$_t_CostPrice:=First_Field(->vT; $_t_FieldDelimiter)
			$_t_CostOffer:=First_Field(->vT; $_t_FieldDelimiter)
			$_t_Margin:=First_Field(->vT; $_t_FieldDelimiter)
			$_t_ShortCode:=First_Field(->vT; $_t_FieldDelimiter)
			$_t_DefaultTax:=First_Field(->vT; $_t_FieldDelimiter)
			$_t_PriceUpdate:=First_Field(->vT; $_t_FieldDelimiter)
			$_t_Weight:=First_Field(->vT; $_t_FieldDelimiter)
			$_t_SIze:=First_Field(->vT; $_t_FieldDelimiter)
			$_t_Commodity:=First_Field(->vT; $_t_FieldDelimiter)
			$_t_Bundle:=First_Field(->vT; $_t_FieldDelimiter)
			$_t_Show:=First_Field(->vT; $_t_FieldDelimiter)
			
			$_l_Create:=0
			//   If ($_t_ProductCode="")
			//   $_t_ProductCode:=$_t_ProductGroup+$_t_ProductBrand+$_t_ProductModel
			//   End if
			$_l_Write:=0
			
			If ($_t_ProductModel="*Component")
				If (($_t_ProductCode#"") & ([PRODUCTS:9]Product_Code:1#""))
					CREATE RECORD:C68([COMPONENTS:86])
					[COMPONENTS:86]Product_Code:1:=[PRODUCTS:9]Product_Code:1
					[COMPONENTS:86]Component_Code:2:=$_t_ProductCode
					If (Num:C11($_t_Superior)#0)
						[COMPONENTS:86]Quantity:3:=Num:C11($_t_Superior)
					Else 
						[COMPONENTS:86]Quantity:3:=1
					End if 
					DB_SaveRecord(->[COMPONENTS:86])
				End if 
			Else 
				If ((((Length:C16($_t_ProductCode)>1) | ($_t_ProductModel#"")) & ($_t_ProductGroup#"Group@") & ($_t_ProductGroup#"Prod@")) | (($_t_CompanyCode#"") & ($_t_SupplierProductCode#"") & ($_t_CompanyCode#"Supplier@")))
					If (($_t_CompanyCode#"") & ($_t_SupplierProductCode#"") & ($_t_ProductModel="") & ($_t_ProductCode=""))
						
						QUERY:C277([PRODUCTS_SUPPLIERS:148]; [PRODUCTS_SUPPLIERS:148]Company_Code:1=$_t_CompanyCode; *)
						QUERY:C277([PRODUCTS_SUPPLIERS:148];  & ; [PRODUCTS_SUPPLIERS:148]Supplier_Product_Code:4=$_t_SupplierProductCode)
						SELECTION TO ARRAY:C260([PRODUCTS_SUPPLIERS:148]Product_Code:8; $_at_ProductCodes)
						QUERY WITH ARRAY:C644([PRODUCTS:9]Product_Code:1; $_at_ProductCodes)
						If ($_t_ProductGroup="")
							$_t_ProductGroup:="UNK"
						End if 
						If ($_t_ProductBrand="")
							$_t_ProductBrand:=Substring:C12($_t_CompanyCode; 1; 3)
						End if 
						$_t_ProductModel:=Substring:C12($_t_SupplierProductCode; 1; 19)
						Case of 
							: (DB_GetProductGroupBrand)
								$_t_ProductCode:=$_t_ProductGroup+$_t_ProductBrand+$_t_ProductModel
							: (DB_Get_ProductBrandPref)
								$_t_ProductCode:=$_t_ProductBrand+$_t_ProductModel
							Else 
								$_t_ProductCode:=$_t_ProductModel
						End case 
					Else 
						If ($_t_ProductCode="")
							Case of 
								: (DB_GetProductGroupBrand)
									$_t_ProductCode:=$_t_ProductGroup+$_t_ProductBrand+$_t_ProductModel
								: (DB_Get_ProductBrandPref)
									$_t_ProductCode:=$_t_ProductBrand+$_t_ProductModel
								Else 
									$_t_ProductCode:=$_t_ProductModel
							End case 
						End if 
						QUERY:C277([PRODUCTS:9]; [PRODUCTS:9]Product_Code:1=$_t_ProductCode)
					End if 
					If (Records in selection:C76([PRODUCTS:9])>0)
						MESSAGE:C88("Updating Product "+$_t_ProductCode+" "+$_t_ProductName+Char:C90(13))
						$_l_Write:=1
					Else 
						If ($_l_New=0)
							MESSAGE:C88("Ignoring Product "+$_t_ProductCode+" "+$_t_ProductName+Char:C90(13))
						Else 
							MESSAGE:C88("Creating Product "+$_t_ProductCode+" "+$_t_ProductName+Char:C90(13))
							$_l_Write:=1
							CREATE RECORD:C68([PRODUCTS:9])
							[PRODUCTS:9]Product_Code:1:=$_t_ProductCode
							If ($_t_ProductGroup="")
								[PRODUCTS:9]Group_Code:3:=Substring:C12([PRODUCTS:9]Product_Code:1; 1; 3)
								[PRODUCTS:9]Brand_Code:4:=Substring:C12([PRODUCTS:9]Product_Code:1; 4; 3)
								[PRODUCTS:9]Model_Code:5:=Substring:C12([PRODUCTS:9]Product_Code:1; 7; 19)
							Else 
								[PRODUCTS:9]Group_Code:3:=$_t_ProductGroup
								[PRODUCTS:9]Brand_Code:4:=$_t_ProductBrand
								[PRODUCTS:9]Model_Code:5:=$_t_ProductModel
							End if 
						End if 
					End if 
					
					If ($_l_Write=1)
						If ($_t_ShortCode#"")
							[PRODUCTS:9]Short_Code:19:=$_t_ShortCode
						End if 
						If ($_t_Superior#"")
							[PRODUCTS:9]Superior:15:=$_t_Superior
						End if 
						If ($_t_ProductName#"")
							RELATE ONE:C42([PRODUCTS:9]Brand_Code:4)
							If (($_bo_BrandPref) & ([PRODUCT_BRANDS:8]Brand_Name:2#"") & ($_t_ProductName#([PRODUCT_BRANDS:8]Brand_Name:2+"@")))
								[PRODUCTS:9]Product_Name:2:=[PRODUCT_BRANDS:8]Brand_Name:2+" "+$_t_ProductName
							Else 
								[PRODUCTS:9]Product_Name:2:=$_t_ProductName
							End if 
						End if 
						If ($_t_Description#"")
							[PRODUCTS:9]Description:6:=$_t_Description
						End if 
						If ($_t_SalesAccount#"")
							[PRODUCTS:9]Sales_Account:7:=$_t_SalesAccount
							RELATE ONE:C42([PRODUCTS:9]Sales_Account:7)
							If (Records in selection:C76([ACCOUNTS:32])=0)
								[PRODUCTS:9]Sales_Account:7:=""
							End if 
						End if 
						If ($_t_PurchaseAccount#"")
							[PRODUCTS:9]Purchase_Account:13:=$_t_PurchaseAccount
							RELATE ONE:C42([PRODUCTS:9]Sales_Account:7)
							If (Records in selection:C76([ACCOUNTS:32])=0)
								[PRODUCTS:9]Purchase_Account:13:=""
							End if 
						End if 
						If ($_t_AnalysisCode#"")
							[PRODUCTS:9]Analysis_Code:18:=$_t_AnalysisCode
							RELATE ONE:C42([PRODUCTS:9]Analysis_Code:18)
							If (Records in selection:C76([ANALYSES:36])=0)
								[PRODUCTS:9]Analysis_Code:18:=""
							End if 
						End if 
						If (Num:C11($_t_SalesPrice)>0)
							[PRODUCTS:9]Sales_Price:9:=Num:C11($_t_SalesPrice)
						End if 
						If (Num:C11($_t_OfferPrice)>0)
							[PRODUCTS:9]Standard_Price:16:=Num:C11($_t_OfferPrice)
						End if 
						If ($_t_PriceList#"")
							[PRODUCTS:9]Price_List:8:=(($_t_PriceList="true") | ($_t_PriceList="Y@") | ($_t_PriceList="1"))
						End if 
						If ($_t_Stock#"")
							[PRODUCTS:9]Maintain_Stock:14:=(($_t_Stock="true") | ($_t_Stock="Y@") | ($_t_Stock="1"))
						End if 
						If ($_t_SerialNumber#"")
							[PRODUCTS:9]Serial_Numbered:17:=(($_t_SerialNumber="true") | ($_t_SerialNumber="Y@") | ($_t_SerialNumber="1"))
						End if 
						If (Num:C11($_t_Minumum)>0)
							[PRODUCTS:9]Minimum:11:=Num:C11($_t_Minumum)
						End if 
						If (Num:C11($_t_Maximum)>0)
							[PRODUCTS:9]Maximum:12:=Num:C11($_t_Maximum)
						End if 
						If (Date:C102($_t_ModifiedDate)>!00-00-00!)
							[PRODUCTS:9]Modified_Date:10:=Date:C102($_t_ModifiedDate)
						Else 
							[PRODUCTS:9]Modified_Date:10:=<>DB_d_CurrentDate
						End if 
						If ($_t_DefaultTax#"")
							[PRODUCTS:9]Default_Tax:23:=$_t_DefaultTax
						End if 
						If ($_t_PriceUpdate#"")
							[PRODUCTS:9]Price_Updates:25:=(($_t_PriceUpdate="true") | ($_t_PriceUpdate="Y@") | ($_t_PriceUpdate="1"))
						End if 
						If ($_t_Weight#"")
							[PRODUCTS:9]Weight:26:=Num:C11($_t_Weight)
						End if 
						If ($_t_SIze#"")
							[PRODUCTS:9]Size:39:=$_t_SIze
						End if 
						If ($_t_Commodity#"")
							[PRODUCTS:9]Commodity_Code:38:=$_t_Commodity
						End if 
						If ($_t_Bundle#"")
							[PRODUCTS:9]Bundle_Assembly:36:=(($_t_Bundle="true") | ($_t_Bundle="Y@") | ($_t_Bundle="1"))
						End if 
						If ($_t_Show#"")
							[PRODUCTS:9]Bundle_Show:37:=Num:C11($_t_Show)
						End if 
						
						If ($_t_CompanyCode#"")
							QUERY:C277([PRODUCTS_SUPPLIERS:148]; [PRODUCTS_SUPPLIERS:148]Product_Code:8=[PRODUCTS:9]Product_Code:1)
							
							QUERY SELECTION:C341([PRODUCTS_SUPPLIERS:148]; [PRODUCTS_SUPPLIERS:148]Company_Code:1=$_t_CompanyCode)
							If (Records in selection:C76([PRODUCTS_SUPPLIERS:148])=0)
								CREATE RECORD:C68([PRODUCTS_SUPPLIERS:148])
								[PRODUCTS_SUPPLIERS:148]Product_Code:8:=[PRODUCTS:9]Product_Code:1
								[PRODUCTS_SUPPLIERS:148]ID:7:=AA_GetNextID(->[PRODUCTS_SUPPLIERS:148]ID:7)
								
								[PRODUCTS_SUPPLIERS:148]Company_Code:1:=$_t_CompanyCode
							End if 
							If ($_t_SupplierProductCode#"")
								[PRODUCTS_SUPPLIERS:148]Supplier_Product_Code:4:=$_t_SupplierProductCode
							End if 
							If (Num:C11($_t_CostPrice)>0)
								[PRODUCTS_SUPPLIERS:148]Cost_Price:2:=Num:C11($_t_CostPrice)
							End if 
							If (Num:C11($_t_CostOffer)>0)
								[PRODUCTS_SUPPLIERS:148]Standard_Cost:5:=Num:C11($_t_CostOffer)
							End if 
							If (Num:C11($_t_Margin)>0)
								[PRODUCTS_SUPPLIERS:148]Margin:3:=Num:C11($_t_Margin)
							Else 
								If ((Num:C11($_t_SalesPrice)>0) | (Num:C11($_t_CostPrice)>0))
									[PRODUCTS_SUPPLIERS:148]Margin:3:=DivideBy(([PRODUCTS:9]Sales_Price:9-[PRODUCTS_SUPPLIERS:148]Cost_Price:2); [PRODUCTS:9]Sales_Price:9)*100  // 17/02/04 pb
								End if 
							End if 
						End if 
						DB_SaveRecord(->[PRODUCTS_SUPPLIERS:148])
						DB_SaveRecord(->[PRODUCTS:9])
						AA_CheckFileUnlocked(->[PRODUCTS:9]X_ID:43)
						ADD TO SET:C119([PRODUCTS:9]; "Master")
					End if 
					
				Else 
					MESSAGE:C88("Line without Product Code"+Char:C90(13))
				End if 
			End if 
			
		End while 
		CLOSE WINDOW:C154
		If (WIN_bo_TrackerInited)
			$_l_WindowReferenceRow:=Find in array:C230(WIN_al_ThisWIndowReference; WIN_l_CurrentWinRef)
			If ($_l_WindowReferenceRow>0)
				WIN_l_CurrentWinRef:=WIN_al_CalledFromReference{$_l_WindowReferenceRow}
			End if 
		End if 
		SET CHANNEL:C77(11)
		
		//Checking, Printing & Processing
		USE SET:C118("Master")
		
		APPLY TO SELECTION:C70([PRODUCTS:9]; [PRODUCTS:9]x_Product_No_longer_Available:54:=0)
		USE SET:C118("Master")
		APPLY TO SELECTION:C70([PRODUCTS:9]; [PRODUCTS:9]x_Product_Stock_is_Setup:59:=True:C214)
		If (Records in selection:C76([PRODUCTS:9])>0)
			Gen_Confirm("Check the Products imported?"; "Yes"; "No")
			If (OK=1)
				DB_t_CurrentFormUsage:=""
				vAdd:=0
				vNo:=Records in selection:C76([PRODUCTS:9])
				Open_Pro_Window($_t_ImportName; 0; 1; ->[PRODUCTS:9]; WIN_t_CurrentOutputform)
				FS_SetFormSort(WIN_t_CurrentOutputform)
				WIn_SetFormSize(1; ->[PRODUCTS:9]; WIN_t_CurrentOutputform)
				MODIFY SELECTION:C204([PRODUCTS:9]; *)
				Close_ProWin
			End if 
		Else 
			Gen_Alert("No Products created"; "Cancel")
		End if 
		
	End if 
End if 
Process_End
ERR_MethodTrackerReturn("Products Imp"; $_t_oldMethodName)
