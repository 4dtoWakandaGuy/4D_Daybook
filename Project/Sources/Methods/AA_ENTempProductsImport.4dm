//%attributes = {}
If (False:C215)
	//Project Method Name: 
	//------------------ Method Notes ------------------
	//------------------ Revision Control ----------------
	//Date Created: 
	//Created BY: 
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY TEXT:C222($_at_FieldData; 0; 0)
	ARRAY TEXT:C222($_at_FieldNames; 0)
	ARRAY TEXT:C222($_at_Records; 0)
	C_LONGINT:C283($_l_CommaPosition; $_l_FieldNumber; $_l_HasTypeCode; $_l_Index; $_l_Index2; $_l_Replace; $_l_RowNumber)
	C_TEXT:C284($_t_AdvertProduct; $_t_ColourCode; $_t_ColourName; $_t_Field; $_t_FieldName; $_t_ModelCode; $_t_Name; $_t_oldMethodName; $_t_PositionCode; $_t_PositionName; $_t_ProductShortCode)
	C_TEXT:C284($_t_PublicationBrand; $_t_PublicationCode; $_t_PublicationGroup; $_t_PublicationName; $_t_Record; $_t_SectionCode; $_t_SectionName; $_t_SizeCode; $_t_SizeName; $_t_Type; $_t_TypeCode)
	C_TIME:C306($_ti_DocumentReference)
End if 

//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("AA_ENTempProductsImport")
$_ti_DocumentReference:=Open document:C264(""; "")
If ($_ti_DocumentReference#?00:00:00?)
	$_t_Record:=""
	ARRAY TEXT:C222($_at_Records; 0)
	Repeat 
		RECEIVE PACKET:C104($_ti_DocumentReference; $_t_Record; Char:C90(13))
		If ($_t_Record#"")
			APPEND TO ARRAY:C911($_at_Records; $_t_Record)
		End if 
		
	Until (OK=0)
	CLOSE DOCUMENT:C267($_ti_DocumentReference)
	
	ARRAY TEXT:C222($_at_FieldData; 0; 0)
	ARRAY TEXT:C222($_at_FieldNames; 0)
	For ($_l_Index; 1; 1)
		$_t_Record:=$_at_Records{$_l_Index}
		$_l_FieldNumber:=0
		Repeat 
			$_l_CommaPosition:=Position:C15(","; $_t_Record)
			If ($_l_CommaPosition>0)
				$_t_Field:=Substring:C12($_t_Record; 1; $_l_CommaPosition-1)
				$_t_Record:=Substring:C12($_t_Record; $_l_CommaPosition+1; Length:C16($_t_Record))
				
				APPEND TO ARRAY:C911($_at_FieldNames; $_t_Field)
			End if 
		Until ($_l_CommaPosition=0)
		If ($_t_Record#"")
			APPEND TO ARRAY:C911($_at_FieldNames; $_t_Record)
			
		End if 
		
	End for 
	
	For ($_l_Index; 2; Size of array:C274($_at_Records))
		INSERT IN ARRAY:C227($_at_FieldData; Size of array:C274($_at_FieldData)+1; 1)
		$_l_RowNumber:=Size of array:C274($_at_FieldData)
		$_t_Record:=$_at_Records{$_l_Index}
		$_l_FieldNumber:=0
		Repeat 
			$_l_CommaPosition:=Position:C15(","; $_t_Record)
			If ($_l_CommaPosition>0)
				$_l_FieldNumber:=$_l_FieldNumber+1
				$_t_Field:=Substring:C12($_t_Record; 1; $_l_CommaPosition-1)
				$_t_Record:=Substring:C12($_t_Record; $_l_CommaPosition+1; Length:C16($_t_Record))
				If (Size of array:C274($_at_FieldData{$_l_RowNumber})<$_l_FieldNumber)
					APPEND TO ARRAY:C911($_at_FieldData{$_l_RowNumber}; $_t_Field)
				Else 
					$_at_FieldData{$_l_RowNumber}{$_l_FieldNumber}:=$_t_Field
				End if 
				
			End if 
		Until ($_l_CommaPosition=0)
		If ($_t_Record#"")
			//RACE
			$_l_FieldNumber:=$_l_FieldNumber+1
			If (Size of array:C274($_at_FieldData{$_l_RowNumber})<$_l_FieldNumber)
				APPEND TO ARRAY:C911($_at_FieldData{$_l_RowNumber}; $_t_Record)
			Else 
				$_at_FieldData{$_l_RowNumber}{$_l_FieldNumber}:=$_t_Record
			End if 
			
		End if 
		
	End for 
	
	//So now we have a number of records
	For ($_l_Index; 1; Size of array:C274($_at_FieldData))
		$_t_PublicationName:=""
		$_t_PublicationCode:=""
		$_t_Type:=""
		$_t_SectionCode:=""
		$_t_SectionName:=""
		$_t_PositionCode:=""
		$_t_PositionName:=""
		$_t_SizeCode:=""
		$_t_SizeName:=""
		$_t_ColourCode:=""
		$_t_ColourName:=""
		$_l_HasTypeCode:=Find in array:C230($_at_FieldNames; "TYPE CODE")
		For ($_l_Index2; 1; Size of array:C274($_at_FieldData{$_l_Index}))
			If ($_l_Index2<=Size of array:C274($_at_FieldNames))
				$_t_FieldName:=$_at_FieldNames{$_l_Index2}
				Case of 
					: ($_t_FieldName="Publication")
						$_t_PublicationName:=$_at_FieldData{$_l_Index}{$_l_Index2}
					: ($_t_FieldName="Publication Code") | ($_t_FieldName="PUBLICATION CLODE")
						$_t_PublicationCode:=$_at_FieldData{$_l_Index}{$_l_Index2}
					: ($_t_FieldName="Type")
						$_t_Type:=$_at_FieldData{$_l_Index}{$_l_Index2}
					: ($_t_FieldName="Type Code")
						$_t_TypeCode:=$_at_FieldData{$_l_Index}{$_l_Index2}
					: ($_t_FieldName="Section") | ($_t_FieldName="Section ")
						$_t_SectionName:=$_at_FieldData{$_l_Index}{$_l_Index2}
					: ($_t_FieldName="Section Code")
						$_t_SectionCode:=$_at_FieldData{$_l_Index}{$_l_Index2}
					: ($_t_FieldName="Position Code")
						$_t_PositionCode:=$_at_FieldData{$_l_Index}{$_l_Index2}
					: ($_t_FieldName="Position")
						$_t_PositionName:=$_at_FieldData{$_l_Index}{$_l_Index2}
					: ($_t_FieldName="SIze")
						
						$_t_SizeName:=$_at_FieldData{$_l_Index}{$_l_Index2}
					: ($_t_FieldName="SIze Code")
						$_t_SizeCode:=$_at_FieldData{$_l_Index}{$_l_Index2}
					: ($_t_FieldName="Colour")
						$_t_ColourCode:=$_at_FieldData{$_l_Index}{$_l_Index2}
					Else 
						
				End case 
			End if 
		End for 
		If ($_t_PublicationCode#"")
			Case of 
				: (Length:C16($_t_PublicationCode)=4)
					$_t_PublicationGroup:=Substring:C12($_t_PublicationCode; 1; 2)
					$_t_PublicationBrand:=Substring:C12($_t_PublicationCode; 3; 2)
					$_t_Name:="ADVERT"
					$_t_ProductShortCode:="WEBADVERT"
				Else 
					$_t_PublicationGroup:=$_t_PublicationCode
					If (($_l_HasTypeCode<0))
						Case of 
							: ($_t_Type="A(advert)") | ($_t_Type="A")
								$_t_PublicationBrand:="ADV"
								$_t_Name:="ADVERT"
								$_t_ProductShortCode:="ADVERT"
							: ($_t_Type="I(insert)") | ($_t_Type="I")
								$_t_PublicationBrand:="INS"
								$_t_Name:="INSERT"
								$_t_ProductShortCode:="INSERT"
							: ($_t_Type="W(Wrapper)") | ($_t_Type="W")
								$_t_PublicationBrand:="WRA"
								$_t_Name:="WRAPPER"
								$_t_ProductShortCode:="WRAPPER"
							: ($_t_Type="C(Classified)") | ($_t_Type="C")
								$_t_PublicationBrand:="CLF"
								$_t_Name:="CLASSIFIED"
								$_t_ProductShortCode:="CLASSIFIED"
								//: ($_t_Type="F(Feature") | ($_t_Type="F")
								//$_t_PublicationBrand:="FTR"
								//$_t_Name:="FEATURE"
							Else 
								
						End case 
					Else 
						
						$_t_PublicationBrand:=$_t_TypeCode
						$_t_Name:=$_t_Type
						
						Case of 
							: ($_t_Type="advert")
								$_t_ProductShortCode:="ADVERT"
							: ($_t_Type="insert")
								$_t_ProductShortCode:="INSERT"
							: ($_t_Type="Wrapper") | ($_t_Type="Wraparound")
								$_t_ProductShortCode:="WRAPPER"
							: ($_t_Type="Classified")
								$_t_ProductShortCode:="CLASSIFIED"
							Else 
								
						End case 
					End if 
			End case 
			If ($_t_PublicationGroup#"")
				QUERY:C277([PRODUCT_GROUPS:10]; [PRODUCT_GROUPS:10]Group_Code:1=$_t_PublicationGroup)
				If (Records in selection:C76([PRODUCT_GROUPS:10])=0)
					CREATE RECORD:C68([PRODUCT_GROUPS:10])
					[PRODUCT_GROUPS:10]Group_Code:1:=$_t_PublicationGroup
					[PRODUCT_GROUPS:10]Group_Name:2:=$_t_PublicationName
					DB_SaveRecord(->[PRODUCT_GROUPS:10])
				End if 
				If ($_t_PublicationBrand#"")
					QUERY:C277([PRODUCT_BRANDS:8]; [PRODUCT_BRANDS:8]Brand_Code:1=$_t_PublicationBrand)
					If (Records in selection:C76([PRODUCT_BRANDS:8])=0)
						CREATE RECORD:C68([PRODUCT_BRANDS:8])
						[PRODUCT_BRANDS:8]Brand_Code:1:=$_t_PublicationBrand
						[PRODUCT_BRANDS:8]Brand_Name:2:=$_t_Name
						DB_SaveRecord(->[PRODUCT_BRANDS:8])
					End if 
				End if 
				$_t_ModelCode:=Replace string:C233($_t_Name; " "; "")
				$_t_ModelCode:=Replace string:C233($_t_ModelCode; "/"; "")
				$_t_ModelCode:=Replace string:C233($_t_ModelCode; "-"; "")
				$_t_ModelCode:=Replace string:C233($_t_ModelCode; "&"; "")
				$_t_ModelCode:=Replace string:C233($_t_ModelCode; "~"; "")
				For ($_l_Replace; 1; 47)
					$_t_ModelCode:=Replace string:C233($_t_ModelCode; Char:C90($_l_Replace); "")
				End for 
				For ($_l_Replace; 58; 64)
					$_t_ModelCode:=Replace string:C233($_t_ModelCode; Char:C90($_l_Replace); "")
				End for 
				For ($_l_Replace; 91; 96)
					$_t_ModelCode:=Replace string:C233($_t_ModelCode; Char:C90($_l_Replace); "")
				End for 
				
				$_t_AdvertProduct:=$_t_PublicationGroup+$_t_PublicationBrand+$_t_ModelCode
				QUERY:C277([PRODUCTS:9]; [PRODUCTS:9]Product_Code:1=$_t_AdvertProduct)
				If (Records in selection:C76([PRODUCTS:9])=0)
					CREATE RECORD:C68([PRODUCTS:9])
					[PRODUCTS:9]Group_Code:3:=$_t_PublicationGroup
					[PRODUCTS:9]Brand_Code:4:=$_t_PublicationBrand
					
					[PRODUCTS:9]Model_Code:5:=Uppercase:C13($_t_ModelCode)
					[PRODUCTS:9]Product_Code:1:=[PRODUCTS:9]Group_Code:3+[PRODUCTS:9]Brand_Code:4+[PRODUCTS:9]Model_Code:5
					$_t_Name:=Replace string:C233($_t_Name; "~"; ",")
					[PRODUCTS:9]Product_Code:1:=$_t_AdvertProduct
					[PRODUCTS:9]Product_Name:2:=$_t_Name+" in "+$_t_PublicationName
					[PRODUCTS:9]Analysis_Code:18:=$_t_PublicationGroup
					
					DB_SaveRecord(->[PRODUCTS:9])
					//note that this product will then need setting up for its components
				End if 
				
				QUERY:C277([PRODUCT_BRANDS:8]; [PRODUCT_BRANDS:8]Brand_Code:1="SEC")
				If (Records in selection:C76([PRODUCT_BRANDS:8])=0)
					CREATE RECORD:C68([PRODUCT_BRANDS:8])
					[PRODUCT_BRANDS:8]Brand_Code:1:="SEC"
					[PRODUCT_BRANDS:8]Brand_Name:2:="Sections"
					DB_SaveRecord(->[PRODUCT_BRANDS:8])
				End if 
				If ($_t_SectionCode#"")
					
					QUERY:C277([PRODUCTS:9]; [PRODUCTS:9]Brand_Code:4="SEC"; *)
					QUERY:C277([PRODUCTS:9];  & ; [PRODUCTS:9]Group_Code:3=$_t_PublicationGroup; *)
					QUERY:C277([PRODUCTS:9];  & ; [PRODUCTS:9]x_Product_Build_Section_Code:56=$_t_SectionCode)
					If (Records in selection:C76([PRODUCTS:9])=0)
						CREATE RECORD:C68([PRODUCTS:9])
						[PRODUCTS:9]Group_Code:3:=$_t_PublicationGroup
						[PRODUCTS:9]Brand_Code:4:="SEC"
						
						
						[PRODUCTS:9]Model_Code:5:=Uppercase:C13($_t_ModelCode)
						[PRODUCTS:9]Product_Code:1:=[PRODUCTS:9]Group_Code:3+[PRODUCTS:9]Brand_Code:4+[PRODUCTS:9]Model_Code:5
						$_t_SectionName:=Replace string:C233($_t_SectionName; "~"; ",")
						
						[PRODUCTS:9]Product_Name:2:=$_t_SectionName
						[PRODUCTS:9]Short_Code:19:="Section"
						[PRODUCTS:9]Analysis_Code:18:=$_t_PublicationGroup
						[PRODUCTS:9]x_Product_Build_Section_Code:56:=$_t_SectionCode
						DB_SaveRecord(->[PRODUCTS:9])
						
					End if 
				End if 
				QUERY:C277([PRODUCT_BRANDS:8]; [PRODUCT_BRANDS:8]Brand_Code:1="POS")
				If (Records in selection:C76([PRODUCT_BRANDS:8])=0)
					CREATE RECORD:C68([PRODUCT_BRANDS:8])
					[PRODUCT_BRANDS:8]Brand_Code:1:="POS"
					[PRODUCT_BRANDS:8]Brand_Name:2:="Positions"
					DB_SaveRecord(->[PRODUCT_BRANDS:8])
				End if 
				If ($_t_PositionCode#"")
					QUERY:C277([PRODUCTS:9]; [PRODUCTS:9]Brand_Code:4="POS"; *)
					QUERY:C277([PRODUCTS:9];  & ; [PRODUCTS:9]Group_Code:3=$_t_PublicationGroup; *)
					QUERY:C277([PRODUCTS:9];  & ; [PRODUCTS:9]x_Product_Build_Section_Code:56=$_t_PositionCode)
					If (Records in selection:C76([PRODUCTS:9])=0)
						CREATE RECORD:C68([PRODUCTS:9])
						[PRODUCTS:9]Group_Code:3:=$_t_PublicationGroup
						[PRODUCTS:9]Brand_Code:4:="POS"
						$_t_ModelCode:=Replace string:C233($_t_PositionName; " "; "")
						$_t_ModelCode:=Replace string:C233($_t_ModelCode; "/"; "")
						$_t_ModelCode:=Replace string:C233($_t_ModelCode; "-"; "")
						$_t_ModelCode:=Replace string:C233($_t_ModelCode; "&"; "")
						$_t_ModelCode:=Replace string:C233($_t_ModelCode; "~"; "")
						For ($_l_Replace; 1; 47)
							$_t_ModelCode:=Replace string:C233($_t_ModelCode; Char:C90($_l_Replace); "")
						End for 
						For ($_l_Replace; 58; 64)
							$_t_ModelCode:=Replace string:C233($_t_ModelCode; Char:C90($_l_Replace); "")
						End for 
						For ($_l_Replace; 91; 96)
							$_t_ModelCode:=Replace string:C233($_t_ModelCode; Char:C90($_l_Replace); "")
						End for 
						
						[PRODUCTS:9]Model_Code:5:=Uppercase:C13($_t_ModelCode)
						[PRODUCTS:9]Product_Code:1:=[PRODUCTS:9]Group_Code:3+[PRODUCTS:9]Brand_Code:4+[PRODUCTS:9]Model_Code:5
						$_t_PositionName:=Replace string:C233($_t_PositionName; "~"; ",")
						
						[PRODUCTS:9]Product_Name:2:=$_t_PositionName
						[PRODUCTS:9]Short_Code:19:="Positions"
						[PRODUCTS:9]Analysis_Code:18:=$_t_PublicationGroup
						[PRODUCTS:9]x_Product_Build_Section_Code:56:=$_t_PositionCode
						DB_SaveRecord(->[PRODUCTS:9])
					End if 
					If ($_t_SectionCode#"")
						QUERY:C277([ADDITIONAL_RECORD_ANALYSIS:53]; [ADDITIONAL_RECORD_ANALYSIS:53]Additional_Analysis_Code:1=$_t_PublicationGroup+$_t_SectionCode)
						If (Records in selection:C76([ADDITIONAL_RECORD_ANALYSIS:53])=0)
							CREATE RECORD:C68([ADDITIONAL_RECORD_ANALYSIS:53])
							[ADDITIONAL_RECORD_ANALYSIS:53]Additional_Analysis_Code:1:=$_t_PublicationGroup+$_t_SectionCode
							[ADDITIONAL_RECORD_ANALYSIS:53]Additional_Analysis_Name:2:=$_t_PublicationName+$_t_SectionName
							DB_SaveRecord(->[ADDITIONAL_RECORD_ANALYSIS:53])
						End if 
						
						QUERY:C277([CONTRACT_RECORD_ANALYSIS:88]; [CONTRACT_RECORD_ANALYSIS:88]Unique_code:1="09"+[PRODUCTS:9]Product_Code:1; *)
						QUERY:C277([CONTRACT_RECORD_ANALYSIS:88];  & [CONTRACT_RECORD_ANALYSIS:88]Analysis_Code:2=$_t_PublicationGroup+$_t_SectionCode)
						If (Records in selection:C76([CONTRACT_RECORD_ANALYSIS:88])=0)
							CREATE RECORD:C68([CONTRACT_RECORD_ANALYSIS:88])
							[CONTRACT_RECORD_ANALYSIS:88]Analysis_Code:2:=$_t_PublicationGroup+$_t_SectionCode
							[CONTRACT_RECORD_ANALYSIS:88]Unique_code:1:="09"+[PRODUCTS:9]Product_Code:1
							DB_SaveRecord(->[CONTRACT_RECORD_ANALYSIS:88])
							
						End if 
						QUERY:C277([PRODUCT_BRANDS:8]; [PRODUCT_BRANDS:8]Brand_Code:1="ADS")
						If (Records in selection:C76([PRODUCT_BRANDS:8])=0)
							CREATE RECORD:C68([PRODUCT_BRANDS:8])
							[PRODUCT_BRANDS:8]Brand_Code:1:="ADS"
							[PRODUCT_BRANDS:8]Brand_Name:2:="Advert Sizes"
							DB_SaveRecord(->[PRODUCT_BRANDS:8])
						End if 
					End if 
				End if 
				If ($_t_SizeCode#"")
					QUERY:C277([PRODUCTS:9]; [PRODUCTS:9]Brand_Code:4="ADS"; *)
					QUERY:C277([PRODUCTS:9];  & ; [PRODUCTS:9]Group_Code:3=$_t_PublicationGroup; *)
					QUERY:C277([PRODUCTS:9];  & ; [PRODUCTS:9]x_Product_Build_Section_Code:56=$_t_SizeCode)
					If (Records in selection:C76([PRODUCTS:9])=0)
						CREATE RECORD:C68([PRODUCTS:9])
						[PRODUCTS:9]Group_Code:3:=$_t_PublicationGroup
						[PRODUCTS:9]Brand_Code:4:="ADS"
						$_t_ModelCode:=Replace string:C233($_t_SizeName; " "; "")
						$_t_ModelCode:=Replace string:C233($_t_ModelCode; "/"; "")
						$_t_ModelCode:=Replace string:C233($_t_ModelCode; "-"; "")
						$_t_ModelCode:=Replace string:C233($_t_ModelCode; "&"; "")
						$_t_ModelCode:=Replace string:C233($_t_ModelCode; "~"; "")
						For ($_l_Replace; 1; 47)
							$_t_ModelCode:=Replace string:C233($_t_ModelCode; Char:C90($_l_Replace); "")
						End for 
						For ($_l_Replace; 58; 64)
							$_t_ModelCode:=Replace string:C233($_t_ModelCode; Char:C90($_l_Replace); "")
						End for 
						For ($_l_Replace; 91; 96)
							$_t_ModelCode:=Replace string:C233($_t_ModelCode; Char:C90($_l_Replace); "")
						End for 
						
						[PRODUCTS:9]Model_Code:5:=Uppercase:C13($_t_ModelCode)
						[PRODUCTS:9]Product_Code:1:=[PRODUCTS:9]Group_Code:3+[PRODUCTS:9]Brand_Code:4+[PRODUCTS:9]Model_Code:5
						$_t_SizeName:=Replace string:C233($_t_SizeName; "~"; ",")
						
						[PRODUCTS:9]Product_Name:2:=$_t_SizeName
						[PRODUCTS:9]Short_Code:19:="AdSizes"
						[PRODUCTS:9]Analysis_Code:18:=$_t_PublicationGroup
						[PRODUCTS:9]x_Product_Build_Section_Code:56:=$_t_SizeCode
						DB_SaveRecord(->[PRODUCTS:9])
					End if 
					
					If ($_t_PositionCode#"")
						QUERY:C277([ADDITIONAL_RECORD_ANALYSIS:53]; [ADDITIONAL_RECORD_ANALYSIS:53]Additional_Analysis_Code:1=$_t_PublicationGroup+$_t_PositionCode)
						If (Records in selection:C76([ADDITIONAL_RECORD_ANALYSIS:53])=0)
							CREATE RECORD:C68([ADDITIONAL_RECORD_ANALYSIS:53])
							[ADDITIONAL_RECORD_ANALYSIS:53]Additional_Analysis_Code:1:=$_t_PublicationGroup+$_t_PositionCode
							[ADDITIONAL_RECORD_ANALYSIS:53]Additional_Analysis_Name:2:=$_t_PublicationName+$_t_PositionName
							DB_SaveRecord(->[ADDITIONAL_RECORD_ANALYSIS:53])
						End if 
						QUERY:C277([CONTRACT_RECORD_ANALYSIS:88]; [CONTRACT_RECORD_ANALYSIS:88]Unique_code:1="09"+[PRODUCTS:9]Product_Code:1; *)
						QUERY:C277([CONTRACT_RECORD_ANALYSIS:88];  & [CONTRACT_RECORD_ANALYSIS:88]Analysis_Code:2=$_t_PublicationGroup+$_t_PositionCode)
						If (Records in selection:C76([CONTRACT_RECORD_ANALYSIS:88])=0)
							CREATE RECORD:C68([CONTRACT_RECORD_ANALYSIS:88])
							[CONTRACT_RECORD_ANALYSIS:88]Analysis_Code:2:=$_t_PublicationName+$_t_PositionCode
							[CONTRACT_RECORD_ANALYSIS:88]Unique_code:1:="09"+[PRODUCTS:9]Product_Code:1
							DB_SaveRecord(->[CONTRACT_RECORD_ANALYSIS:88])
							
						End if 
					End if 
				End if 
				QUERY:C277([PRODUCT_BRANDS:8]; [PRODUCT_BRANDS:8]Brand_Code:1="ADS")
				If (Records in selection:C76([PRODUCT_BRANDS:8])=0)
					CREATE RECORD:C68([PRODUCT_BRANDS:8])
					[PRODUCT_BRANDS:8]Brand_Code:1:="CLS"
					[PRODUCT_BRANDS:8]Brand_Name:2:="Colour Settings"
					DB_SaveRecord(->[PRODUCT_BRANDS:8])
				End if 
				If ($_t_ColourCode#"")
					Case of 
						: ($_t_ColourCode="FUL")
							$_t_ColourName:="Colour"
						: ($_t_ColourCode="SPL")
							$_t_ColourName:="Special Spot"
						: ($_t_ColourCode="STD")
							$_t_ColourName:="Standard Spot"
						: ($_t_ColourCode="B&W")
							$_t_ColourName:="Black & White"
						: ($_t_ColourCode="TBA")
							
						Else 
							
					End case 
					
					If ($_t_ColourCode#"")
						QUERY:C277([PRODUCTS:9]; [PRODUCTS:9]Brand_Code:4="CLS"; *)
						QUERY:C277([PRODUCTS:9];  & ; [PRODUCTS:9]Group_Code:3=$_t_PublicationGroup; *)
						QUERY:C277([PRODUCTS:9];  & ; [PRODUCTS:9]x_Product_Build_Section_Code:56=$_t_ColourCode)
						If (Records in selection:C76([PRODUCTS:9])=0)
							CREATE RECORD:C68([PRODUCTS:9])
							[PRODUCTS:9]Group_Code:3:=$_t_PublicationGroup
							[PRODUCTS:9]Brand_Code:4:="CLS"
							$_t_ModelCode:=Replace string:C233($_t_ColourName; " "; "")
							$_t_ModelCode:=Replace string:C233($_t_ModelCode; "/"; "")
							$_t_ModelCode:=Replace string:C233($_t_ModelCode; "-"; "")
							$_t_ModelCode:=Replace string:C233($_t_ModelCode; "&"; "")
							$_t_ModelCode:=Replace string:C233($_t_ModelCode; "~"; "")
							For ($_l_Replace; 1; 47)
								$_t_ModelCode:=Replace string:C233($_t_ModelCode; Char:C90($_l_Replace); "")
							End for 
							For ($_l_Replace; 58; 64)
								$_t_ModelCode:=Replace string:C233($_t_ModelCode; Char:C90($_l_Replace); "")
							End for 
							For ($_l_Replace; 91; 96)
								$_t_ModelCode:=Replace string:C233($_t_ModelCode; Char:C90($_l_Replace); "")
							End for 
							
							[PRODUCTS:9]Model_Code:5:=Uppercase:C13($_t_ModelCode)
							[PRODUCTS:9]Product_Code:1:=[PRODUCTS:9]Group_Code:3+[PRODUCTS:9]Brand_Code:4+[PRODUCTS:9]Model_Code:5
							[PRODUCTS:9]Product_Name:2:=$_t_ColourName
							[PRODUCTS:9]Short_Code:19:="Colour"
							[PRODUCTS:9]Analysis_Code:18:=$_t_PublicationGroup
							[PRODUCTS:9]x_Product_Build_Section_Code:56:=$_t_ColourCode
							
							DB_SaveRecord(->[PRODUCTS:9])
						End if 
					End if 
				End if 
				
				
				
				
				
				
				
				
			End if 
		End if 
		
		
		
	End for 
	
	
End if 

BEEP:C151
ERR_MethodTrackerReturn("AA_ENTempProductsImport"; $_t_oldMethodName)