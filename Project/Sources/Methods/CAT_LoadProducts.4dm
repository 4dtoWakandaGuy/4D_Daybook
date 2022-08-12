//%attributes = {}
If (False:C215)
	//Project Method Name:      CAT_LoadProducts
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 03/12/2010 12:10
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(CAT_lb_Products;0)
	//ARRAY INTEGER(CAT_ai_PricePlus;0)
	ARRAY LONGINT:C221($_al_ProductIDS; 0)
	//ARRAY LONGINT(CAT_al_CatLinkID;0)
	//ARRAY LONGINT(CAT_al_CatLinkProdID;0)
	//ARRAY LONGINT(CAT_al_CatProductIDS;0)
	//ARRAY LONGINT(CAT_al_FamilyName2;0)
	//ARRAY LONGINT(CAT_al_FamilyName3;0)
	//ARRAY LONGINT(CAT_al_FamilyName4;0)
	//ARRAY LONGINT(CAT_al_FamilyName5;0)
	//ARRAY LONGINT(WS_al_ALLfamilies;0)
	//ARRAY REAL(CAT_ar_PriceDiscount;0)
	//ARRAY REAL(CAT_ar_ProductPrice;0)
	//ARRAY TEXT(CAT_at_CatProdDesc;0)
	//ARRAY TEXT(CAT_at_CatProductCode;0)
	//ARRAY TEXT(CAT_at_CatProductCodeShort;0)
	//ARRAY TEXT(CAT_at_CatProductName;0)
	//ARRAY TEXT(CAT_at_FAMILYNAME2;0)
	//ARRAY TEXT(CAT_at_FAMILYNAME3;0)
	//ARRAY TEXT(CAT_at_FAMILYNAME4;0)
	//ARRAY TEXT(CAT_at_FAMILYNAME5;0)
	//ARRAY TEXT(CAT_at_PriceCurrencyCode;0)
	C_BOOLEAN:C305(<>DB_bo_NewStockActive; <>EcommerceInstalled; $_bo_DoListbox; $_bo_LoadSelection; $3; PRD_bo_FilterLoaded)
	C_LONGINT:C283($_l_CatalogueClass; $_l_CurrencyCodeRow; $_l_FamiliesIndex; $_l_FamilyRow; $_l_Index; $_l_ListID; $_l_ProductIDRow; $_l_RecordsinSelection; $1; $4; $Function)
	C_LONGINT:C283(CAT_l_BUT1; CAT_l_BUT10; CAT_l_BUT11; CAT_l_BUT12; CAT_l_BUT13; CAT_l_BUT14; CAT_l_BUT15; CAT_l_BUT16; CAT_l_BUT2; CAT_l_BUT3; CAT_l_BUT4)
	C_LONGINT:C283(CAT_l_BUT5; CAT_l_BUT6; CAT_l_BUT7; CAT_l_BUT8; CAT_l_BUT9; CAT_L1; CAT_L10; CAT_L11; CAT_L12; CAT_L13; CAT_L14)
	C_LONGINT:C283(CAT_L15; CAT_L16; CAT_L2; CAT_L3; CAT_L4; CAT_L5; CAT_L6; CAT_L7; CAT_L8; CAT_L9; PRD_l_FilterNLA)
	C_POINTER:C301($_Ptr_CatFamilyName; $_Ptr_FamilyID; $_Ptr_FamilyName; $_Ptr_LongintFamilyID)
	C_REAL:C285($_r_Discount)
	C_TEXT:C284(<>SYS_t_BaseCurrency; $_t_oldMethodName; $_t_ScriptName; $2; $5; CAT_t_CatViewCurrency; oACAT_COL2; oCAT_COL1; oCAT_COL10; oCAT_COL11; oCAT_COL12)
	C_TEXT:C284(oCAT_COL13; oCAT_COL14; oCAT_COL15; oCAT_COL16; oCAT_COL3; oCAT_COL4; oCAT_COL5; oCAT_COL6; oCAT_COL7; oCAT_COL8; oCAT_COL9)
	C_TEXT:C284(oCAT_HED1; oCAT_HED10; oCAT_HED11; oCAT_HED12; oCAT_HED13; oCAT_HED14; oCAT_HED15; oCAT_HED16; oCAT_HED2; oCAT_HED3; oCAT_HED4)
	C_TEXT:C284(oCAT_HED5; oCAT_HED6; oCAT_HED7; oCAT_HED8; oCAT_HED9)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("CAT_LoadProducts")
If (Not:C34(PRD_bo_FilterLoaded))
	PRD_l_FilterNLA:=ProductDeletionPreferences
	PRD_bo_FilterLoaded:=True:C214
End if 
If (Count parameters:C259>=2)
	CAT_t_CatViewCurrency:=$2
Else 
	CAT_t_CatViewCurrency:=<>SYS_t_BaseCurrency
End if 

ARRAY LONGINT:C221(CAT_al_CatLinkID; 0)
ARRAY LONGINT:C221(CAT_al_CatLinkProdID; 0)
ARRAY LONGINT:C221(CAT_al_CatProductIDS; 0)
ARRAY TEXT:C222(CAT_at_CatProductCode; 0)
ARRAY TEXT:C222(CAT_at_CatProductCodeShort; 0)
ARRAY TEXT:C222(CAT_at_CatProductName; 0)

ARRAY TEXT:C222(CAT_at_CatProdDesc; 0)
//READ ONLY(0)
READ ONLY:C145([PRODUCTS:9])
ARRAY TEXT:C222(CAT_at_FAMILYNAME2; 0)
ARRAY LONGINT:C221(CAT_al_FamilyName2; 0)
ARRAY TEXT:C222(CAT_at_FAMILYNAME3; 0)
ARRAY LONGINT:C221(CAT_al_FamilyName3; 0)
ARRAY TEXT:C222(CAT_at_FAMILYNAME4; 0)
ARRAY LONGINT:C221(CAT_al_FamilyName4; 0)
ARRAY TEXT:C222(CAT_at_FAMILYNAME5; 0)
ARRAY LONGINT:C221(CAT_al_FamilyName5; 0)
ARRAY REAL:C219(CAT_ar_ProductPrice; 0)
//CAT_t_FamilyName:="" ` NO! 17/10/03 pb
If (<>EcommerceInstalled)
	
	$_l_ListID:=AA_LoadListByName("E commerce Family 2"; ->CAT_at_FAMILYNAME2; ->CAT_al_FamilyName2; True:C214)
	SORT ARRAY:C229(CAT_at_FAMILYNAME2; CAT_al_FamilyName2)  // sorts added 18/11/03 pb
	AA_Loadlistinsertnew(->CAT_al_FamilyName2; ->CAT_at_FAMILYNAME2)  // 01/12/03    pb
	$_l_ListID:=AA_LoadListByName("E commerce Family 3"; ->CAT_at_FamilyName3; ->CAT_al_FamilyName3; True:C214)
	SORT ARRAY:C229(CAT_at_FamilyName3; CAT_al_FamilyName3)  // sorts added 18/11/03 pb
	AA_Loadlistinsertnew(->CAT_al_FamilyName3; ->CAT_at_FamilyName3)  // 01/12/03    pb
	$_l_ListID:=AA_LoadListByName("E commerce Family 4"; ->CAT_at_FamilyName4; ->CAT_al_FamilyName4; True:C214)
	SORT ARRAY:C229(CAT_at_FamilyName4; CAT_al_FamilyName4)  // sorts added 18/11/03 pb
	AA_Loadlistinsertnew(->CAT_al_FamilyName4; ->CAT_at_FamilyName4)  // 01/12/03    pb
	$_l_ListID:=AA_LoadListByName("E commerce Family 5"; ->CAT_at_FAMILYNAME5; ->CAT_al_FamilyName5; True:C214)
	SORT ARRAY:C229(CAT_at_FAMILYNAME5; CAT_al_FamilyName5)  // sorts added 18/11/03 pb
	AA_Loadlistinsertnew(->CAT_al_FamilyName5; ->CAT_at_FAMILYNAME5)  // 01/12/03    pb
	
	
End if 
If (Count parameters:C259>=5)
	$_l_CatalogueClass:=$4
	$_t_ScriptName:=$5
Else 
	$_l_CatalogueClass:=-1
End if 

If ($1>0)
	If ($_l_CatalogueClass=1)
		Macro_AccType($5; True:C214)
		$_l_RecordsinSelection:=Records in selection:C76([PRODUCTS:9])
		ARRAY REAL:C219(CAT_ar_ProductPrice; $_l_RecordsinSelection)
		ARRAY LONGINT:C221(CAT_al_CatLinkID; $_l_RecordsinSelection)
		ARRAY LONGINT:C221(CAT_al_CatLinkProdID; $_l_RecordsinSelection)
		SELECTION TO ARRAY:C260([PRODUCTS:9]X_ID:43; CAT_al_CatLinkProdID)
		For ($_l_Index; 1; Size of array:C274(CAT_al_CatLinkID))
			CAT_al_CatLinkID{$_l_Index}:=-9999  //Use this to NOT save the static list
		End for 
		$_bo_LoadSelection:=True:C214
	Else 
		$_bo_LoadSelection:=True:C214
		QUERY:C277([Catalogue_ProductLink:109]; [Catalogue_ProductLink:109]X_CatalogueID:2=$1; *)
		QUERY:C277([Catalogue_ProductLink:109];  & ; [Catalogue_ProductLink:109]Status:6=1)
		SELECTION TO ARRAY:C260([Catalogue_ProductLink:109]x_ID:1; CAT_al_CatLinkID; [Catalogue_ProductLink:109]x_ProductID:3; CAT_al_CatLinkProdID)
		ARRAY REAL:C219(CAT_ar_ProductPrice; Size of array:C274(CAT_al_CatLinkID))
		
		If (<>EcommerceInstalled)
			If (False:C215)
				FIRST RECORD:C50([Catalogue_ProductLink:109])
				For ($_l_Index; 1; Records in selection:C76([Catalogue_ProductLink:109]))
					ARRAY LONGINT:C221(WS_al_ALLfamilies; 0)
					BLOB TO VARIABLE:C533([Catalogue_ProductLink:109]EW_Families:7; WS_al_ALLfamilies)
					//this will give us the IDs of the families
					//take this array and put into the relevant
					For ($_l_FamiliesIndex; 1; Size of array:C274(WS_al_ALLfamilies))
						If ($_l_FamiliesIndex<=4)
							$_Ptr_FamilyID:=Get pointer:C304("CAT_al_CatLinkFamilyID"+String:C10($_l_FamiliesIndex+1))
							$_Ptr_FamilyName:=Get pointer:C304("CAT_at_CatLinkFamilyName"+String:C10($_l_FamiliesIndex+1))
							$_Ptr_LongintFamilyID:=Get pointer:C304("CAT_al_FamilyName"+String:C10($_l_FamiliesIndex+1))
							$_Ptr_CatFamilyName:=Get pointer:C304("CAT_t_FamilyName"+String:C10($_l_FamiliesIndex+1))
							$_Ptr_FamilyID->{$_l_Index}:=WS_al_ALLfamilies{$_l_FamiliesIndex}
							If ($_Ptr_FamilyID->{$_l_Index}>0)
								$_l_FamilyRow:=Find in array:C230($_Ptr_LongintFamilyID->; $_Ptr_FamilyID->{$_l_Index})
								If ($_l_FamilyRow>0)
									$_Ptr_FamilyName->{$_l_Index}:=$_Ptr_CatFamilyName->{$_l_FamilyRow}
									
								Else 
									$_Ptr_FamilyID->{$_l_Index}:=0
									$_Ptr_FamilyName->{$_l_Index}:=""
								End if 
							Else 
								$_Ptr_FamilyID->{$_l_Index}:=0
								$_Ptr_FamilyName->{$_l_Index}:=""
							End if 
							
						End if 
					End for 
					NEXT RECORD:C51([Catalogue_ProductLink:109])
				End for 
			End if 
		End if 
		
		
		If (Size of array:C274(CAT_al_CatLinkID)>0)
			SORT ARRAY:C229(CAT_al_CatLinkProdID; CAT_al_CatLinkID)
			QUERY WITH ARRAY:C644([PRODUCTS:9]X_ID:43; CAT_al_CatLinkProdID)
			
			//RELATE ONE SELECTION([Catalogue_ProductLink];[PRODUCTS])
			ORDER BY:C49([PRODUCTS:9]; [PRODUCTS:9]X_ID:43)
			
		Else 
			REDUCE SELECTION:C351([PRODUCTS:9]; 0)
		End if 
	End if 
Else 
	Case of 
		: ($1=-9998)  //all products
			ALL RECORDS:C47([PRODUCTS:9])
			CREATE SET:C116([PRODUCTS:9]; "$All")
			QUERY:C277([PRODUCTS:9]; [PRODUCTS:9]Actual_End_Date:49>=Current date:C33(*))
			QUERY:C277([PRODUCTS:9];  | ; [PRODUCTS:9]Actual_End_Date:49=!00-00-00!)
			CREATE SET:C116([PRODUCTS:9]; "$_l_IndexnDate")
			USE SET:C118("$all")
			QUERY SELECTION:C341([PRODUCTS:9]; [PRODUCTS:9]Actual_End_Date:49=!00-00-00!)
			CREATE SET:C116([PRODUCTS:9]; "$_l_IndexnDate2")
			UNION:C120("$_l_IndexnDate"; "$_l_IndexnDate2"; "$_l_IndexnDate")
			USE SET:C118("$_l_IndexnDate")
			If (<>DB_bo_NewStockActive)
				STK_LoadStockFunctions
				//$Function:=STK_GetMovementTypes ("Use For Allocation")
				//We want ACTIVE allocations..that is allocations that have not been delivered....
				STK_GetCopyFromThreads(0; ""; 0; "ANY"; "ANY"; "ANY"; 0; 0; ""; 0; 0; ""; "ANY"; "ANY"; $Function)
				//That is all allocatobale stock -threads loaded
				ARRAY LONGINT:C221($_al_ProductIDS; 0)
				//NG November 2009 Commented out until stock is in DISTINCT VALUES([STOCK_THREAD]xProductID;$_al_ProductIDS)
				QUERY WITH ARRAY:C644([PRODUCTS:9]X_ID:43; $_al_ProductIDS)
				CREATE SET:C116([PRODUCTS:9]; "$_l_IndexnStock")
				UNION:C120("$_l_IndexnDate"; "$_l_IndexnStock"; "$_l_IndexnDate")
				USE SET:C118("$_l_IndexnDate")
			End if 
			// that is all products that are still valid OR there is stock(so dead products still remain in the list till there is no stock
			
		: ($1=-9999)  //Maintain in price
			
			QUERY:C277([PRODUCTS:9]; [PRODUCTS:9]Price_List:8=True:C214)
			CREATE SET:C116([PRODUCTS:9]; "$All")
			QUERY:C277([PRODUCTS:9]; [PRODUCTS:9]Actual_End_Date:49>=Current date:C33(*); *)
			QUERY:C277([PRODUCTS:9];  | ; [PRODUCTS:9]Actual_End_Date:49=!00-00-00!)
			CREATE SET:C116([PRODUCTS:9]; "$_l_IndexnDate")
			If (<>DB_bo_NewStockActive)
				
				STK_LoadStockFunctions
				//$Function:=STK_GetMovementTypes ("Use For Allocation")
				//We want ACTIVE allocations..that is allocations that have not been delivered....
				
				STK_GetCopyFromThreads(0; ""; 0; "ANY"; "ANY"; "ANY"; 0; 0; ""; 0; 0; ""; "ANY"; "ANY"; $Function)
				//That is all allocatobale stock -threads loaded
				ARRAY LONGINT:C221($_al_ProductIDS; 0)
				//DISTINCT VALUES([STOCK_THREAD]xProductID;$_al_ProductIDS)
				
				QUERY WITH ARRAY:C644([PRODUCTS:9]X_ID:43; $_al_ProductIDS)
			End if 
			CREATE SET:C116([PRODUCTS:9]; "$_l_IndexnStock")
			UNION:C120("$_l_IndexnDate"; "$_l_IndexnStock"; "$_l_IndexnDate")
			INTERSECTION:C121("$_l_IndexnDate"; "$all"; "$_l_IndexnDate")
			USE SET:C118("$_l_IndexnDate")
			
			//thas is all maintain in price products that are still in date OR have stock
	End case 
End if 
COPY NAMED SELECTION:C331([PRODUCTS:9]; "UnfilteredSelection")
If (PRD_l_FilterNLA=1)
	QUERY SELECTION:C341([PRODUCTS:9]; [PRODUCTS:9]x_Product_No_longer_Available:54>=0)
Else 
	QUERY SELECTION:C341([PRODUCTS:9]; [PRODUCTS:9]x_Product_No_longer_Available:54>=-1)
End if 


If (Count parameters:C259>=3)
	$_bo_DoListbox:=$3
Else 
	$_bo_DoListbox:=True:C214
End if 

If ($_bo_DoListbox)
	SELECTION TO ARRAY:C260([PRODUCTS:9]X_ID:43; CAT_al_CatProductIDS; [PRODUCTS:9]Product_Code:1; CAT_at_CatProductCode; [PRODUCTS:9]Short_Code:19; CAT_at_CatProductCodeShort; [PRODUCTS:9]Product_Name:2; CAT_at_CatProductName; [PRODUCTS:9]Description:6; CAT_at_CatProdDesc)
	SORT ARRAY:C229(CAT_al_CatProductIDS; CAT_at_CatProductName; CAT_at_CatProductCode; CAT_at_CatProductCodeShort; CAT_at_CatProdDesc; CAT_al_CatProductIDS)
	For ($_l_Index; Size of array:C274(CAT_al_CatLinkProdID); 1; -1)
		$_l_ProductIDRow:=Find in array:C230(CAT_al_CatProductIDS; CAT_al_CatLinkProdID{$_l_Index})
		$_l_CurrencyCodeRow:=Find in array:C230(CAT_at_PriceCurrencyCode; CAT_t_CatViewCurrency)  //loaded in the form method
		If ($_l_CurrencyCodeRow>0)
			If (CAT_ai_PricePlus{$_l_CurrencyCodeRow}=1)
				//inverse discount
				$_r_Discount:=-(CAT_ar_PriceDiscount{$_l_CurrencyCodeRow})
			Else 
				$_r_Discount:=(CAT_ar_PriceDiscount{$_l_CurrencyCodeRow})
			End if 
			
		Else 
			$_r_Discount:=0
		End if 
		
		CAT_ar_ProductPrice{$_l_ProductIDRow}:=CAT_GetProductPrice(CAT_t_CatViewCurrency; CAT_al_CatProductIDS{$_l_ProductIDRow}; [CATALOGUE:108]x_ID:1; $_r_Discount)
		
		If ($_l_ProductIDRow<0)
			//the product was not found
			DELETE FROM ARRAY:C228(CAT_al_CatLinkProdID; $_l_Index)
			DELETE FROM ARRAY:C228(CAT_al_CatLinkID; $_l_Index)
			
		End if 
	End for 
	
	
	
	//the arrays match so
	
	
	
	CAT_al_CatProductIDS:=0
	CAT_at_CatProductCode:=0
	CAT_at_CatProductCodeShort:=0
	CAT_at_CatProductName:=0
	CAT_at_CatProdDesc:=0
	//``now put those into a powerview(area list!) area
	
	
	If (<>EcommerceInstalled) & (False:C215)
		
		SORT ARRAY:C229(CAT_at_CatProductName; CAT_at_CatProductCode; CAT_at_CatProductCodeShort; CAT_at_CatProdDesc; CAT_ar_ProductPrice; CAT_al_CatProductIDS; CAT_al_CatLinkProdID; CAT_al_CatLinkID)
		
		If ($_bo_DoListbox)
			LB_SetupListbox(->CAT_lb_Products; "oCAT"; "CAT_L"; 1; ->CAT_at_CatProductCode; ->CAT_at_CatProductCodeShort; ->CAT_at_CatProductName; ->CAT_at_CatProdDesc; ->CAT_ar_ProductPrice; ->CAT_al_CatProductIDS; ->CAT_al_CatLinkProdID; ->CAT_al_CatLinkID)
			OBJECT SET VISIBLE:C603(CAT_al_CatProductIDS; False:C215)
			OBJECT SET VISIBLE:C603(CAT_al_CatLinkProdID; False:C215)
			OBJECT SET VISIBLE:C603(CAT_al_CatLinkID; False:C215)
			LB_SetColumnHeaders(->CAT_lb_Products; "CAT_L"; 1; "Product Code"; "Short Code"; "Product Name"; "Description"; "Price"; ""; ""; "")
			
			LB_SetColumnWidths(->CAT_lb_Products; "oCAT"; 1; 151; 100; 140; 150; 50; 0; 0; 0)  // dont need to worry about the invisible ones
			LB_SetScroll(->CAT_lb_Products; -2; -2)
			//AL_SetEntryOpts (CAT_PowerviewPRODS;4;1;0;0;1)
			//AL_SetEntryOpts (CAT_PowerviewPRODS;2;0;0;1;2;".";1)
			LB_StyleSettings(->CAT_lb_Products; "BLUE"; 9; "ocat"; ->[CATALOGUE:108])
			//LB_SetChoiceList ("CAT_LB_FAm2";->CAT_at_FAMILYNAME2;->CAT_at_CatLinkFamilyName2)
			//LB_SetChoiceList ("CAT_LB_FAm3";->CAT_at_FamilyName3;->CAT_at_CatLinkFamilyName3)
			//LB_SetChoiceList ("CAT_LB_FAm4";->CAT_at_FamilyName4;->CAT_at_CatLinkFamilyName4)
			//LB_SetChoiceList ("CAT_LB_FAm5";->CAT_at_FAMILYNAME5;->CAT_at_CatLinkFamilyName5)
			
			//`AL_SetEnterable (CAT_PowerviewPRODS;7;2;CAT_at_FamilyName3)
			//AL_SetEnterable (CAT_PowerviewPRODS;8;2;CAT_at_FamilyName4)
			//AL_SetEnterable (CAT_PowerviewPRODS;9;2;CAT_at_FAMILYNAME5)
			//AL_UpdateArrays (CAT_PowerviewPRODS;-2)
		End if 
		
	Else 
		SORT ARRAY:C229(CAT_at_CatProductName; CAT_at_CatProductCode; CAT_at_CatProductCodeShort; CAT_at_CatProdDesc; CAT_ar_ProductPrice; CAT_al_CatProductIDS; CAT_al_CatLinkProdID; CAT_al_CatLinkID)
		
		If ($_bo_DoListbox)
			
			LB_SetupListbox(->CAT_lb_Products; "oCAT"; "CAT_L"; 1; ->CAT_at_CatProductCode; ->CAT_at_CatProductCodeShort; ->CAT_at_CatProductName; ->CAT_at_CatProdDesc; ->CAT_ar_ProductPrice; ->CAT_al_CatProductIDS; ->CAT_al_CatLinkProdID; ->CAT_al_CatLinkID)
			OBJECT SET VISIBLE:C603(CAT_al_CatProductIDS; False:C215)
			OBJECT SET VISIBLE:C603(CAT_al_CatLinkProdID; False:C215)
			OBJECT SET VISIBLE:C603(CAT_al_CatLinkID; False:C215)
			LB_SetColumnHeaders(->CAT_lb_Products; "CAT_L"; 1; "Product Code"; "Short Code"; "Product Name"; "Description"; "Price"; ""; ""; "")  // 7 INVISIBLE COILUMNS
			LB_SetColumnWidths(->CAT_lb_Products; "oCAT"; 1; 151; 100; 140; 150; 100; 0; 0; 0)  // dont need to worry about the invisible ones
			LB_SetScroll(->CAT_lb_Products; -2; -2)
			
			LB_StyleSettings(->CAT_lb_Products; "BLUE"; 9; "ocat"; ->[CATALOGUE:108])
		End if 
		//AL_SetFormat (CAT_PowerviewPRODS;5;CAT_t_CatViewCurrency+"#,###,##0.00";2;2;2;0)
		OBJECT SET FORMAT:C236(CAT_ar_ProductPrice; CAT_t_CatViewCurrency+"#,###,##0.00")
		OBJECT SET ENTERABLE:C238(CAT_lb_Products; False:C215)
		
	End if 
	
	
	
	
	
	
	
End if 
ERR_MethodTrackerReturn("CAT_LoadProducts"; $_t_oldMethodName)