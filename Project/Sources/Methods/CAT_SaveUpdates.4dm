//%attributes = {}
If (False:C215)
	//Project Method Name:      CAT_SaveUpdates
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 28/11/2010 12:51
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(CAT_abo_PriceChange;0)
	//ARRAY INTEGER(CAT_ai_PricePlus;0)
	//ARRAY LONGINT(CAT_al_CatLinkFamilyID2;0)
	//ARRAY LONGINT(CAT_al_CatLinkFamilyID3;0)
	//ARRAY LONGINT(CAT_al_CatLinkFamilyID4;0)
	//ARRAY LONGINT(CAT_al_CatLinkFamilyID5;0)
	//ARRAY LONGINT(CAT_al_CatLinkID;0)
	//ARRAY LONGINT(CAT_al_PriceDiscounts;0)
	//ARRAY LONGINT(WS_al_ALLfamilies;0)
	//ARRAY REAL(CAT_ar_PriceDiscount;0)
	//ARRAY TEXT(CAT_ar_PriceChange;0)
	//ARRAY TEXT(CAT_at_aPriceCurrency;0)
	//ARRAY TEXT(CAT_at_PriceChange;0)
	//ARRAY TEXT(CAT_at_PriceCurrencyCode;0)
	//ARRAY TEXT(CAT_at_PriceProduct;0)
	C_LONGINT:C283($_l_Index; INV_isUnique)
	C_TEXT:C284($_t_oldMethodName; $_t_TableCode)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("CAT_SaveUpdates"; Form event code:C388)

//run when  saving a catalogue
//first save
//any default pricing structure


For ($_l_Index; 1; Size of array:C274(CAT_abo_PriceChange))
	If (CAT_abo_PriceChange{$_l_Index}) | (CAT_al_PriceDiscounts{$_l_Index}<=0)
		//not saved
		READ WRITE:C146([PRICE_TABLE:28])
		If (CAT_al_PriceDiscounts{$_l_Index}>0)
			QUERY:C277([PRICE_TABLE:28]; [PRICE_TABLE:28]x_ID:15=CAT_al_PriceDiscounts{$_l_Index})
		Else 
			CREATE RECORD:C68([PRICE_TABLE:28])
			[PRICE_TABLE:28]x_ID:15:=Abs:C99(CAT_al_PriceDiscounts{$_l_Index})
			//[PRICE TABLE]Table Code:=Gen_CodePref (21;->[PRICE TABLE]Table Code)
			Repeat 
				$_t_TableCode:=Gen_CodePref(21; ->[PRICE_TABLE:28]Table_Code:12)
				SET QUERY DESTINATION:C396(3; INV_isUnique)
				QUERY:C277([PRICE_TABLE:28]; [PRICE_TABLE:28]Table_Code:12=$_t_TableCode)
				If (INV_isUnique=0)
					[PRICE_TABLE:28]Table_Code:12:=$_t_TableCode
				End if 
				SET QUERY DESTINATION:C396(0)
			Until (INV_isUnique=0)
			
		End if 
		[PRICE_TABLE:28]x_CatalogueID:14:=[CATALOGUE:108]x_ID:1
		[PRICE_TABLE:28]x_TableClassID:16:=Catalogue sales Discount
		
		[PRICE_TABLE:28]Currency_Code:13:=CAT_at_PriceCurrencyCode{$_l_Index}
		If (CAT_ai_PricePlus{$_l_Index}=1)  //negative discount
			[PRICE_TABLE:28]Price_Discount:3:=-(CAT_ar_PriceDiscount{$_l_Index})
		Else 
			[PRICE_TABLE:28]Price_Discount:3:=(CAT_ar_PriceDiscount{$_l_Index})
		End if 
		DB_SaveRecord(->[PRICE_TABLE:28])
		UNLOAD RECORD:C212([PRICE_TABLE:28])
		READ ONLY:C145([PRICE_TABLE:28])
	End if 
	
End for 
//and save special prices
//these(any changes rather)
//are stored in arrays

//(See CAT_pvexit)
For ($_l_Index; 1; Size of array:C274(CAT_at_PriceChange))
	READ WRITE:C146([PRICE_TABLE:28])
	QUERY:C277([PRICE_TABLE:28]; [PRICE_TABLE:28]Product_Code:1=CAT_at_PriceProduct{$_l_Index}; *)
	QUERY:C277([PRICE_TABLE:28];  & ; [PRICE_TABLE:28]Currency_Code:13=CAT_at_aPriceCurrency{$_l_Index}; *)
	QUERY:C277([PRICE_TABLE:28];  & ; [PRICE_TABLE:28]x_CatalogueID:14=[CATALOGUE:108]x_ID:1)
	If (Records in selection:C76([PRICE_TABLE:28])=0)
		CREATE RECORD:C68([PRICE_TABLE:28])
		[PRICE_TABLE:28]Product_Code:1:=CAT_at_PriceProduct{$_l_Index}
		[PRICE_TABLE:28]Currency_Code:13:=CAT_at_aPriceCurrency{$_l_Index}
		[PRICE_TABLE:28]x_CatalogueID:14:=[CATALOGUE:108]x_ID:1
		//[PRICE TABLE]Table Code:=Gen_CodePref (21;->[PRICE TABLE]Table Code)
		Repeat 
			$_t_TableCode:=Gen_CodePref(21; ->[PRICE_TABLE:28]Table_Code:12)
			SET QUERY DESTINATION:C396(3; INV_isUnique)
			QUERY:C277([PRICE_TABLE:28]; [PRICE_TABLE:28]Table_Code:12=$_t_TableCode)
			If (INV_isUnique=0)
				[PRICE_TABLE:28]Table_Code:12:=$_t_TableCode
			End if 
			SET QUERY DESTINATION:C396(0)
		Until (INV_isUnique=0)
		
		[PRICE_TABLE:28]x_TableClassID:16:=Catalogue sales Pricing
	End if 
	[PRICE_TABLE:28]Price_Discount:3:=CAT_ar_PriceChange{$_l_Index}
	DB_SaveRecord(->[PRICE_TABLE:28])
End for 
READ WRITE:C146([Catalogue_ProductLink:109])
/*
If (False)
For ($_l_Index;1;Size of array(CAT_al_CatLinkID))
QUERY([Catalogue_ProductLink];[Catalogue_ProductLink]x_ID=CAT_al_CatLinkID{$_l_Index})
ARRAY LONGINT(WS_al_ALLfamilies;4)
WS_al_ALLfamilies{1}:=CAT_al_CatLinkFamilyID2{$_l_Index}
WS_al_ALLfamilies{2}:=CAT_al_CatLinkFamilyID3{$_l_Index}
WS_al_ALLfamilies{3}:=CAT_al_CatLinkFamilyID4{$_l_Index}
WS_al_ALLfamilies{4}:=CAT_al_CatLinkFamilyID5{$_l_Index}
SET BLOB SIZE([Catalogue_ProductLink]EW_Families;0)
VARIABLE TO BLOB(WS_al_ALLfamilies;[Catalogue_ProductLink]EW_Families)
DB_SaveRecord (->[Catalogue_ProductLink])
AA_CheckFileUnlocked (->[Catalogue_ProductLink]x_ID)
End for 

End if 
*/
UNLOAD RECORD:C212([Catalogue_ProductLink:109])
READ ONLY:C145([Catalogue_ProductLink:109])
ERR_MethodTrackerReturn("CAT_SaveUpdates"; $_t_oldMethodName)