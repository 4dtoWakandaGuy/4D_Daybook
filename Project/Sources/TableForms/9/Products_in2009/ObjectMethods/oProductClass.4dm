If (False:C215)
	//object Name: [PRODUCTS]Products_in2009.oProductClass
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:08
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(PRD_lb_PublicationDates2;0)
	//ARRAY BOOLEAN(PROD_lb_SubsBillings;0)
	//ARRAY BOOLEAN(PROD_lb_SubsMailings;0)
	ARRAY DATE:C224($_ad_DateForFilter; 0)
	//ARRAY INTEGER(PRD_ai_SubsRenwalStart;0)
	//ARRAY INTEGER(PRD_al_SubsBillingstart;0)
	//ARRAY INTEGER(PRD_at_SubsBillingFrequency;0)
	//ARRAY LONGINT(PRD_al_CodeFormatIDs;0)
	//ARRAY LONGINT(PRD_al_CodeFormatsSections;0)
	//ARRAY LONGINT(PRD_al_ProductsTabPage;0)
	//ARRAY LONGINT(PRD_al_ProductTypes;0)
	//ARRAY LONGINT(PRD_al_SubsBillingID;0)
	//ARRAY LONGINT(PRD_al_SubsRenewalID;0)
	//ARRAY LONGINT(PRD_al_SubsRenewalStart;0)
	//ARRAY REAL(PRD_ar_SubsBilingAmount;0)
	//ARRAY TEXT(PRD_at_CodeFormats;0)
	//ARRAY TEXT(PRD_at_FilterDates;0)
	//ARRAY TEXT(PRD_at_FiltersSubsCodes;0)
	//ARRAY TEXT(PRD_at_FilterSubs;0)
	//ARRAY TEXT(Prd_at_Note;0)
	//ARRAY TEXT(PRD_at_ProductsTab;0)
	//ARRAY TEXT(PRD_at_ProductTypes;0)
	//ARRAY TEXT(PRD_at_subsBillingFrType;0)
	//ARRAY TEXT(PRD_at_SubsBillingType;0)
	//ARRAY TEXT(PRD_at_SubsRenwalLetterCode;0)
	//ARRAY TEXT(PROD_at_ComponentsCode;0)
	//ARRAY TEXT(Prod_at_SupplierOption;0)
	C_LONGINT:C283($_l_DateIndex; $_l_event; $_l_PageRow; $_l_Year; $_l_Year2; PRD_l_BuildProductPrice; Prod_l_ListedOnly; SBB_l_BUT1; SBB_l_But2; SBB_l_BUT3; SBB_l_BUT4)
	C_LONGINT:C283(SBB_l_BUT5; SBB_l_BUT6; SBB_l_BUT7; SBB_l_BUT8; SBB_l_BUT9; SBR_l_BUT1; SBR_l_But2; SBR_l_BUT3; SBR_l_BUT4; SBR_l_BUT5; SBR_l_BUT6)
	C_LONGINT:C283(SBR_l_BUT7; SBR_l_BUT8; SBR_l_BUT9)
	C_TEXT:C284($_t_oldMethodName; PROD_t_Currency; PROD_t_SupplierOption; SBB_t_COL1; SBB_t_COL2; SBB_t_COL3; SBB_t_COL4; SBB_t_COL5; SBB_t_COL6; SBB_t_COL7; SBB_t_COL8)
	C_TEXT:C284(SBB_t_COL9; SBB_t_HED1; SBB_t_HED2; SBB_t_HED3; SBB_t_HED4; SBB_t_HED5; SBB_t_HED6; SBB_t_HED7; SBB_t_HED8; SBB_t_HED9; SBR_t_COL1)
	C_TEXT:C284(SBR_t_COL2; SBR_t_COL3; SBR_t_COL4; SBR_t_COL5; SBR_t_COL6; SBR_t_COL7; SBR_t_COL8; SBR_t_COL9; SBR_t_HED1; SBR_t_HED2; SBR_t_HED3)
	C_TEXT:C284(SBR_t_HED4; SBR_t_HED5; SBR_t_HED6; SBR_t_HED7; SBR_t_HED8; SBR_t_HED9)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [PRODUCTS].Products_in2009.oProductClass"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: (PRD_at_ProductTypes=1)
		//Standard class product
		If ([PRODUCTS:9]x_Product_Entry_Class:55>0)
			Gen_Alert("Sorry you many not change the class of a product")
			PRD_at_ProductTypes:=Find in array:C230(PRD_al_ProductTypes; [PRODUCTS:9]x_Product_Entry_Class:55)
		Else 
			[PRODUCTS:9]x_Product_Entry_Class:55:=0
			OBJECT SET VISIBLE:C603(PRD_l_BuildProductPrice; False:C215)
			OBJECT SET VISIBLE:C603(*; "oIterations@"; False:C215)
			
		End if 
	: (PRD_at_ProductTypes=3)
		If ([PRODUCTS:9]x_Product_Entry_Class:55>0) & ([PRODUCTS:9]x_Product_Entry_Class:55#2)
			Gen_Alert("Sorry you many not change the class of a product")
			PRD_at_ProductTypes:=Find in array:C230(PRD_al_ProductTypes; [PRODUCTS:9]x_Product_Entry_Class:55)
		Else 
			If ([PRODUCTS:9]x_Product_Entry_Class:55#2)
				If ([PRODUCTS:9]Sales_Price:9#0)
					Gen_Confirm("This product has pricing set. For this class of product prices are normally calculated from the components selected. Would you like to over-ride that"; "No"; "Yes")
					If (OK=1)
						[PRODUCTS:9]Sales_Price:9:=0
						[PRODUCTS:9]Standard_Price:16:=0
						//[PRODUCTS]Price Updates:=0
						PRD_l_BuildProductPrice:=1
					Else 
						PRD_l_BuildProductPrice:=0
					End if 
					If (PRD_l_BuildProductPrice=0)
						OBJECT SET ENTERABLE:C238(PROD_t_Currency; False:C215)
						OBJECT SET ENTERABLE:C238([PRODUCTS:9]Sales_Price:9; False:C215)
						OBJECT SET ENTERABLE:C238([PRODUCTS:9]Standard_Price:16; False:C215)
						//DISABLE BUTTON([PRODUCTS]Price Updates)
						OBJECT SET VISIBLE:C603(Prod_at_SupplierOption; False:C215)
						OBJECT SET VISIBLE:C603(PROD_t_SupplierOption; False:C215)
						OBJECT SET VISIBLE:C603(Prod_l_ListedOnly; False:C215)
						OBJECT SET VISIBLE:C603(PRD_l_BuildProductPrice; True:C214)
					End if 
				End if 
				Gen_Alert("With this class of product, the product is a template, the sold product will inherit accounts, and stock settings from the template")
				
				[PRODUCTS:9]x_Product_Entry_Class:55:=2
				PROD_LoadComponents(True:C214; [PRODUCTS:9]Product_Code:1)
			End if 
			
		End if 
		ALL RECORDS:C47([PRODUCT_BUILT_CODE_FORMAT:189])
		ARRAY LONGINT:C221(PRD_al_CodeFormatsSections; 0)
		ARRAY LONGINT:C221(PRD_al_CodeFormatIDs; 0)
		ARRAY TEXT:C222(PRD_at_CodeFormats; 0)
		SELECTION TO ARRAY:C260([PRODUCT_BUILT_CODE_FORMAT:189]FORMAT_NAME:2; PRD_at_CodeFormats; [PRODUCT_BUILT_CODE_FORMAT:189]FORMAT_ID:1; PRD_al_CodeFormatIDs; [PRODUCT_BUILT_CODE_FORMAT:189]NUMBER_OF_SECTIONS:3; PRD_al_CodeFormatsSections)
		SORT ARRAY:C229(PRD_at_CodeFormats; PRD_al_CodeFormatIDs; PRD_al_CodeFormatsSections)
		APPEND TO ARRAY:C911(PRD_at_CodeFormats; "-")
		APPEND TO ARRAY:C911(PRD_al_CodeFormatIDs; 0)
		APPEND TO ARRAY:C911(PRD_al_CodeFormatsSections; 0)
		APPEND TO ARRAY:C911(PRD_at_CodeFormats; "Create New Format")
		APPEND TO ARRAY:C911(PRD_al_CodeFormatIDs; -1)
		APPEND TO ARRAY:C911(PRD_al_CodeFormatsSections; 0)
	: (PRD_at_ProductTypes=2)
		
		If ([PRODUCTS:9]x_Product_Entry_Class:55>0) & ([PRODUCTS:9]x_Product_Entry_Class:55#1)
			Gen_Alert("Sorry you many not change the class of a product")
			PRD_at_ProductTypes:=Find in array:C230(PRD_al_ProductTypes; [PRODUCTS:9]x_Product_Entry_Class:55)
		Else 
			[PRODUCTS:9]x_Product_Entry_Class:55:=1
			$_l_PageRow:=Find in array:C230(PRD_at_ProductsTab; "Iterations")
			If ($_l_PageRow<0)
				APPEND TO ARRAY:C911(PRD_at_ProductsTab; "Iterations")
				APPEND TO ARRAY:C911(PRD_al_ProductsTabPage; 5)
			End if 
			OBJECT SET VISIBLE:C603(*; "oIterations@"; True:C214)
			ARRAY TEXT:C222(Prd_at_Note; 4)
			Prd_at_Note{1}:="Day"
			Prd_at_Note{2}:="Week"
			Prd_at_Note{3}:="Month"
			Prd_at_Note{4}:="Year"
			Case of 
				: ([PRODUCTS:9]Unit_Number:29=7)
					Prd_at_Note:=2
				: ([PRODUCTS:9]Unit_Number:29=1)
					Prd_at_Note:=1
				: ([PRODUCTS:9]Unit_Number:29=31)
					Prd_at_Note:=3
				: ([PRODUCTS:9]Unit_Number:29=365)
					Prd_at_Note:=4
			End case 
			SD2_CheckDefaultAction("PDT")
			QUERY:C277([DIARY:12]; [DIARY:12]Action_Code:9="PDT"; *)
			QUERY:C277([DIARY:12];  & [DIARY:12]Product_Code:13=[PRODUCTS:9]Product_Code:1)
			ORDER BY:C49([DIARY:12]; [DIARY:12]Date_Do_From:4; >)
			FORM GOTO PAGE:C247(5)
			PRD_at_ProductsTab:=$_l_PageRow
		End if 
		
	: (PRD_at_ProductTypes=4)
		If ([PRODUCTS:9]x_Product_Entry_Class:55>0) & ([PRODUCTS:9]x_Product_Entry_Class:55#1)
			Gen_Alert("Sorry you many not change the class of a product")
			PRD_at_ProductTypes:=Find in array:C230(PRD_al_ProductTypes; [PRODUCTS:9]x_Product_Entry_Class:55)
		Else 
			[PRODUCTS:9]x_Product_Entry_Class:55:=3
		End if 
	: (PRD_at_ProductTypes=5)
		If ([PRODUCTS:9]x_Product_Entry_Class:55>0)
			Gen_Alert("Sorry you many not change the class of a product")
			PRD_at_ProductTypes:=Find in array:C230(PRD_al_ProductTypes; [PRODUCTS:9]x_Product_Entry_Class:55)
		Else 
			//TRACE
			[PRODUCTS:9]x_Product_Entry_Class:55:=4
			OBJECT SET VISIBLE:C603(*; "oIterations@"; True:C214)
			$_l_PageRow:=Find in array:C230(PRD_at_ProductsTab; "Subscription Setup")
			If ($_l_PageRow<0)
				APPEND TO ARRAY:C911(PRD_at_ProductsTab; "Subscription Setup")
				APPEND TO ARRAY:C911(PRD_al_ProductsTabPage; 6)
				APPEND TO ARRAY:C911(PRD_at_ProductsTab; "Subscriptions")
				APPEND TO ARRAY:C911(PRD_al_ProductsTabPage; 8)
				ARRAY TEXT:C222(PRD_at_FilterSubs; 0)
				ARRAY TEXT:C222(PRD_at_FiltersSubsCodes; 0)
				APPEND TO ARRAY:C911(PRD_at_FilterSubs; "Issues")
				APPEND TO ARRAY:C911(PRD_at_FiltersSubsCodes; "ISS")
				APPEND TO ARRAY:C911(PRD_at_FilterSubs; "Billings")
				APPEND TO ARRAY:C911(PRD_at_FiltersSubsCodes; "B+")
				//APPEND TO ARRAY(PRD_at_FilterSubs;"Bill - Invoice but No Payment")
				//APPEND TO ARRAY(PRD_at_FiltersSubsCodes;"BIN")
				//APPEND TO ARRAY(PRD_at_FilterSubs;"Bill - No Invoice but Payment")
				//APPEND TO ARRAY(PRD_at_FiltersSubsCodes;"BNP")
				//APPEND TO ARRAY(PRD_at_FilterSubs;"Bill - No Invoice & No Payment"
				//APPEND TO ARRAY(PRD_at_FiltersSubsCodes;"BNN")
				
				APPEND TO ARRAY:C911(PRD_at_FilterSubs; "Renewal Letter")
				APPEND TO ARRAY:C911(PRD_at_FiltersSubsCodes; "REN")
				
				ARRAY INTEGER:C220(PRD_al_SubsBillingstart; 0)  //time after or before first issue to get bill
				ARRAY REAL:C219(PRD_ar_SubsBilingAmount; 0)  //amount of bill xtax
				ARRAY TEXT:C222(PRD_at_SubsBillingType; 0)  //billing type
				ARRAY INTEGER:C220(PRD_at_SubsBillingFrequency; 0)  // recurring billling
				ARRAY TEXT:C222(PRD_at_subsBillingFrType; 0)
				ARRAY LONGINT:C221(PRD_al_SubsBillingID; 0)
				
				ARRAY LONGINT:C221(PRD_al_SubsRenewalStart; 0)  // time after of before LAST issue to get renewal reminder
				ARRAY TEXT:C222(PRD_at_SubsRenwalLetterCode; 0)  //letter to send
				ARRAY LONGINT:C221(PRD_al_SubsRenewalID; 0)
			End if 
			//SUBS BILLING
			If ([PRODUCTS:9]Product_Code:1#"")
				QUERY:C277([SUBSCRIPTIONS:93]; [SUBSCRIPTIONS:93]Product_Code:1=[PRODUCTS:9]Product_Code:1; *)
				QUERY:C277([SUBSCRIPTIONS:93];  & ; [SUBSCRIPTIONS:93]Type:7="B@"; *)
				QUERY:C277([SUBSCRIPTIONS:93];  & ; [SUBSCRIPTIONS:93]Order_Item_Number:4=0)
				SELECTION TO ARRAY:C260([SUBSCRIPTIONS:93]x_ID:11; PRD_al_SubsBillingID)
				SELECTION TO ARRAY:C260([SUBSCRIPTIONS:93]Amount_Excluding_Tax:8; PRD_ar_SubsBilingAmount)
				SELECTION TO ARRAY:C260([SUBSCRIPTIONS:93]X_Subscription_Type:12; PRD_at_SubsBillingType)
				SELECTION TO ARRAY:C260([SUBSCRIPTIONS:93]After_Number:5; PRD_al_SubsBillingstart)
				SELECTION TO ARRAY:C260([SUBSCRIPTIONS:93]Unit_Number:6; PRD_at_SubsBillingFrequency)
				SELECTION TO ARRAY:C260([SUBSCRIPTIONS:93]X_Units_Type:13; PRD_at_subsBillingFrType)
				
			Else 
				REDUCE SELECTION:C351([SUBSCRIPTIONS:93]; 0)
			End if 
			//There are two 'Catalogues' that will be hidden--Reserved Names;'Price List' and 'All Products'
			LB_SetupListbox(->PROD_lb_SubsBillings; "SBB_t"; "SBB_L"; 1; ->PRD_at_SubsBillingType; ->PRD_al_SubsBillingstart; ->PRD_ar_SubsBilingAmount; ->PRD_at_SubsBillingFrequency; ->PRD_at_subsBillingFrType; ->PRD_al_SubsBillingID)
			
			LB_SetColumnHeaders(->PROD_lb_SubsBillings; "SBB_L"; 1; "Type"; "First Billing"; "Bill Amount"; "Rebill TImes"; "Rebill Frequency"; "ID")
			LB_SetColumnWidths(->PROD_lb_SubsBillings; "SBB_t"; 1; 90; 40; 60; 50; 60; 0)
			LB_SetEnterable(->PROD_lb_SubsBillings; False:C215; 0)
			LB_SetScroll(->PROD_lb_SubsBillings; -3; -2)
			LB_StyleSettings(->PROD_lb_SubsBillings; "Black"; 9; "SBB_t"; ->[PRODUCTS:9])
			
			//```
			ARRAY INTEGER:C220(PRD_ai_SubsRenwalStart; 0)  // time after of before LAST issue to get renewal reminder
			ARRAY TEXT:C222(PRD_at_SubsRenwalLetterCode; 0)  //letter to send
			ARRAY LONGINT:C221(PRD_al_SubsRenewalID; 0)
			//SUBS Renewals
			If ([PRODUCTS:9]Product_Code:1#"")
				QUERY:C277([SUBSCRIPTIONS:93]; [SUBSCRIPTIONS:93]Product_Code:1=[PRODUCTS:9]Product_Code:1; *)
				QUERY:C277([SUBSCRIPTIONS:93];  & ; [SUBSCRIPTIONS:93]Type:7="REN"; *)
				QUERY:C277([SUBSCRIPTIONS:93];  & ; [SUBSCRIPTIONS:93]Order_Item_Number:4=0)
				SELECTION TO ARRAY:C260([SUBSCRIPTIONS:93]x_ID:11; PRD_al_SubsRenewalID)
				SELECTION TO ARRAY:C260([SUBSCRIPTIONS:93]After_Number:5; PRD_ai_SubsRenwalStart)
				SELECTION TO ARRAY:C260([SUBSCRIPTIONS:93]Renewals_Document_Reference:15; PRD_at_SubsRenwalLetterCode)
				
				
				
			Else 
				REDUCE SELECTION:C351([SUBSCRIPTIONS:93]; 0)
			End if 
			SORT ARRAY:C229(PRD_ai_SubsRenwalStart; PRD_al_SubsRenewalID; PRD_at_SubsRenwalLetterCode)
			//There are two 'Catalogues' that will be hidden--Reserved Names;'Price List' and 'All Products'
			LB_SetupListbox(->PROD_lb_SubsMailings; "SBR_t"; "SBR_L"; 1; ->PRD_ai_SubsRenwalStart; ->PRD_at_SubsRenwalLetterCode; ->PRD_al_SubsRenewalID)
			LB_SetColumnHeaders(->PROD_lb_SubsMailings; "SBR_L"; 1; "After Issue"; "Document"; "Renewals ID")
			
			LB_SetColumnWidths(->PROD_lb_SubsMailings; "SBR_t"; 1; 90; 180; 0)
			
			LB_SetEnterable(->PROD_lb_SubsMailings; False:C215; 0)
			LB_SetScroll(->PROD_lb_SubsMailings; -3; -2)
			LB_StyleSettings(->PROD_lb_SubsMailings; "Black"; 9; "SBR_t"; ->[PRODUCTS:9])
			
			PROD_LoadComponents(True:C214; [PRODUCTS:9]Product_Code:1; True:C214)
			If (Size of array:C274(PROD_at_ComponentsCode)>0)
				ARRAY TEXT:C222(PRD_at_FilterDates; 0)
				
				QUERY WITH ARRAY:C644([DIARY:12]Product_Code:13; PROD_at_ComponentsCode)
				QUERY SELECTION:C341([DIARY:12]; [DIARY:12]Action_Code:9="PDT")
				ORDER BY:C49([DIARY:12]; [DIARY:12]Date_Do_From:4; >)
				SELECTION TO ARRAY:C260([DIARY:12]Date_Do_From:4; $_ad_DateForFilter)
				$_l_Year:=Year of:C25(!2001-01-01!)
				For ($_l_DateIndex; 1; Size of array:C274($_ad_DateForFilter))
					$_l_Year2:=Year of:C25($_ad_DateForFilter{$_l_DateIndex})
					If ($_l_Year2#$_l_Year)
						APPEND TO ARRAY:C911(PRD_at_FilterDates; "After "+String:C10($_l_Year2-1))
						$_l_Year:=$_l_Year2
					End if 
				End for 
				APPEND TO ARRAY:C911(PRD_at_FilterDates; "Future Dates")
				APPEND TO ARRAY:C911(PRD_at_FilterDates; "From Current Month")
				APPEND TO ARRAY:C911(PRD_at_FilterDates; "From Current Year")
				PRD_at_FilterDates:=0
			Else 
				ARRAY TEXT:C222(PRD_at_FilterDates; 0)
				REDUCE SELECTION:C351([DIARY:12]; 0)
				
			End if 
			LB_StyleSettings(->PRD_lb_PublicationDates2; "Black"; 9; "SBB_t"; ->[PRODUCTS:9])
			
			
			//``
			FORM GOTO PAGE:C247(6)
			$_l_PageRow:=Find in array:C230(PRD_al_ProductsTabPage; 6)
			If ($_l_PageRow>0)
				PRD_at_ProductsTab:=$_l_PageRow
			End if 
		End if 
	: (PRD_at_ProductTypes=6)
		If ([PRODUCTS:9]x_Product_Entry_Class:55>0)
			Gen_Alert("Sorry you many not change the class of a product")
			PRD_at_ProductTypes:=Find in array:C230(PRD_al_ProductTypes; [PRODUCTS:9]x_Product_Entry_Class:55)
		Else 
			[PRODUCTS:9]x_Product_Entry_Class:55:=5
			APPEND TO ARRAY:C911(PRD_at_ProductsTab; "Subscription Setup")
			APPEND TO ARRAY:C911(PRD_al_ProductsTabPage; 7)
			APPEND TO ARRAY:C911(PRD_at_ProductsTab; "Subscriptions")
			APPEND TO ARRAY:C911(PRD_al_ProductsTabPage; 8)
			ARRAY TEXT:C222(PRD_at_FilterSubs; 0)
			ARRAY TEXT:C222(PRD_at_FiltersSubsCodes; 0)
			
			APPEND TO ARRAY:C911(PRD_at_FilterSubs; "Issue")
			APPEND TO ARRAY:C911(PRD_at_FiltersSubsCodes; "ISS")
			APPEND TO ARRAY:C911(PRD_at_FilterSubs; "Bill - Invoice & Payment")
			APPEND TO ARRAY:C911(PRD_at_FiltersSubsCodes; "BIP")
			APPEND TO ARRAY:C911(PRD_at_FilterSubs; "Bill - Invoice but No Payment")
			APPEND TO ARRAY:C911(PRD_at_FiltersSubsCodes; "BIN")
			APPEND TO ARRAY:C911(PRD_at_FilterSubs; "Bill - No Invoice but Payment")
			APPEND TO ARRAY:C911(PRD_at_FiltersSubsCodes; "BNP")
			APPEND TO ARRAY:C911(PRD_at_FilterSubs; "Bill - No Invoice & No Payment")
			APPEND TO ARRAY:C911(PRD_at_FiltersSubsCodes; "BNN")
			APPEND TO ARRAY:C911(PRD_at_FilterSubs; "Renewal Letter")
			APPEND TO ARRAY:C911(PRD_at_FiltersSubsCodes; "REN")
			
			
			OBJECT SET VISIBLE:C603(*; "oIterations@"; True:C214)
			$_l_PageRow:=Find in array:C230(PRD_at_ProductsTab; "Subscription Setup")
			If ($_l_PageRow<0)
				APPEND TO ARRAY:C911(PRD_at_ProductsTab; "Subscription Setup")
				APPEND TO ARRAY:C911(PRD_al_ProductsTabPage; 7)
				APPEND TO ARRAY:C911(PRD_at_ProductsTab; "Subscriptions")
				APPEND TO ARRAY:C911(PRD_al_ProductsTabPage; 8)
				ARRAY TEXT:C222(PRD_at_FilterSubs; 0)
				ARRAY TEXT:C222(PRD_at_FiltersSubsCodes; 0)
				APPEND TO ARRAY:C911(PRD_at_FilterSubs; "Issues")
				APPEND TO ARRAY:C911(PRD_at_FiltersSubsCodes; "ISS")
				APPEND TO ARRAY:C911(PRD_at_FilterSubs; "Billings")
				APPEND TO ARRAY:C911(PRD_at_FiltersSubsCodes; "B+")
				//APPEND TO ARRAY(PRD_at_FilterSubs;"Bill - Invoice but No Payment")
				//APPEND TO ARRAY(PRD_at_FiltersSubsCodes;"BIN")
				//APPEND TO ARRAY(PRD_at_FilterSubs;"Bill - No Invoice but Payment")
				//APPEND TO ARRAY(PRD_at_FiltersSubsCodes;"BNP")
				//APPEND TO ARRAY(PRD_at_FilterSubs;"Bill - No Invoice & No Payment"
				//APPEND TO ARRAY(PRD_at_FiltersSubsCodes;"BNN")
				
				APPEND TO ARRAY:C911(PRD_at_FilterSubs; "Renewal Letter")
				APPEND TO ARRAY:C911(PRD_at_FiltersSubsCodes; "REN")
				
				ARRAY INTEGER:C220(PRD_al_SubsBillingstart; 0)  //time after or before first issue to get bill
				ARRAY REAL:C219(PRD_ar_SubsBilingAmount; 0)  //amount of bill xtax
				ARRAY TEXT:C222(PRD_at_SubsBillingType; 0)  //billing type
				ARRAY INTEGER:C220(PRD_at_SubsBillingFrequency; 0)  // recurring billling
				ARRAY TEXT:C222(PRD_at_subsBillingFrType; 0)
				ARRAY LONGINT:C221(PRD_al_SubsBillingID; 0)
				
				ARRAY LONGINT:C221(PRD_al_SubsRenewalStart; 0)  // time after of before LAST issue to get renewal reminder
				ARRAY TEXT:C222(PRD_at_SubsRenwalLetterCode; 0)  //letter to send
				ARRAY LONGINT:C221(PRD_al_SubsRenewalID; 0)
			End if 
			//SUBS BILLING
			If ([PRODUCTS:9]Product_Code:1#"")
				QUERY:C277([SUBSCRIPTIONS:93]; [SUBSCRIPTIONS:93]Product_Code:1=[PRODUCTS:9]Product_Code:1; *)
				QUERY:C277([SUBSCRIPTIONS:93];  & ; [SUBSCRIPTIONS:93]Type:7="B@"; *)
				QUERY:C277([SUBSCRIPTIONS:93];  & ; [SUBSCRIPTIONS:93]Order_Item_Number:4=0)
				SELECTION TO ARRAY:C260([SUBSCRIPTIONS:93]x_ID:11; PRD_al_SubsBillingID)
				SELECTION TO ARRAY:C260([SUBSCRIPTIONS:93]Amount_Excluding_Tax:8; PRD_ar_SubsBilingAmount)
				SELECTION TO ARRAY:C260([SUBSCRIPTIONS:93]X_Subscription_Type:12; PRD_at_SubsBillingType)
				SELECTION TO ARRAY:C260([SUBSCRIPTIONS:93]After_Number:5; PRD_al_SubsBillingstart)
				SELECTION TO ARRAY:C260([SUBSCRIPTIONS:93]Unit_Number:6; PRD_at_SubsBillingFrequency)
				SELECTION TO ARRAY:C260([SUBSCRIPTIONS:93]X_Units_Type:13; PRD_at_subsBillingFrType)
				
			Else 
				REDUCE SELECTION:C351([SUBSCRIPTIONS:93]; 0)
			End if 
			//There are two 'Catalogues' that will be hidden--Reserved Names;'Price List' and 'All Products'
			LB_SetupListbox(->PROD_lb_SubsBillings; "SBB_t"; "SBB_L"; 1; ->PRD_at_SubsBillingType; ->PRD_al_SubsBillingstart; ->PRD_ar_SubsBilingAmount; ->PRD_at_SubsBillingFrequency; ->PRD_at_subsBillingFrType; ->PRD_al_SubsBillingID)
			
			LB_SetColumnHeaders(->PROD_lb_SubsBillings; "SBB_L"; 1; "Type"; "First Billing"; "Bill Amount"; "Rebill TImes"; "Rebill Frequency"; "ID")
			LB_SetColumnWidths(->PROD_lb_SubsBillings; "SBB_t"; 1; 90; 40; 60; 50; 60; 0)
			LB_SetEnterable(->PROD_lb_SubsBillings; False:C215; 0)
			LB_SetScroll(->PROD_lb_SubsBillings; -3; -2)
			LB_StyleSettings(->PROD_lb_SubsBillings; "Black"; 9; "SBB_t"; ->[PRODUCTS:9])
			
			//```
			ARRAY INTEGER:C220(PRD_ai_SubsRenwalStart; 0)  // time after of before LAST issue to get renewal reminder
			ARRAY TEXT:C222(PRD_at_SubsRenwalLetterCode; 0)  //letter to send
			ARRAY LONGINT:C221(PRD_al_SubsRenewalID; 0)
			//SUBS Renewals
			If ([PRODUCTS:9]Product_Code:1#"")
				QUERY:C277([SUBSCRIPTIONS:93]; [SUBSCRIPTIONS:93]Product_Code:1=[PRODUCTS:9]Product_Code:1; *)
				QUERY:C277([SUBSCRIPTIONS:93];  & ; [SUBSCRIPTIONS:93]Type:7="REN"; *)
				QUERY:C277([SUBSCRIPTIONS:93];  & ; [SUBSCRIPTIONS:93]Order_Item_Number:4=0)
				SELECTION TO ARRAY:C260([SUBSCRIPTIONS:93]x_ID:11; PRD_al_SubsRenewalID)
				SELECTION TO ARRAY:C260([SUBSCRIPTIONS:93]After_Number:5; PRD_ai_SubsRenwalStart)
				SELECTION TO ARRAY:C260([SUBSCRIPTIONS:93]Renewals_Document_Reference:15; PRD_at_SubsRenwalLetterCode)
				
				
				
			Else 
				REDUCE SELECTION:C351([SUBSCRIPTIONS:93]; 0)
			End if 
			SORT ARRAY:C229(PRD_ai_SubsRenwalStart; PRD_al_SubsRenewalID; PRD_at_SubsRenwalLetterCode)
			//There are two 'Catalogues' that will be hidden--Reserved Names;'Price List' and 'All Products'
			LB_SetupListbox(->PROD_lb_SubsMailings; "SBR_t"; "SBR_L"; 1; ->PRD_ai_SubsRenwalStart; ->PRD_at_SubsRenwalLetterCode; ->PRD_al_SubsRenewalID)
			LB_SetColumnHeaders(->PROD_lb_SubsMailings; "SBR_L"; 1; "After Issue"; "Document"; "Renewals ID")
			LB_SetColumnWidths(->PROD_lb_SubsMailings; "SBR_t"; 1; 90; 180; 0)
			LB_SetEnterable(->PROD_lb_SubsMailings; False:C215; 0)
			LB_SetScroll(->PROD_lb_SubsMailings; -3; -2)
			LB_StyleSettings(->PROD_lb_SubsMailings; "Black"; 9; "SBR_t"; ->[PRODUCTS:9])
			QUERY:C277([DIARY:12]; [DIARY:12]Product_Code:13=[PRODUCTS:9]Product_Code:1)
			QUERY SELECTION:C341([DIARY:12]; [DIARY:12]Action_Code:9="PDT")
			ARRAY TEXT:C222(PRD_at_FilterDates; 0)
			ORDER BY:C49([DIARY:12]; [DIARY:12]Date_Do_From:4; >)
			SELECTION TO ARRAY:C260([DIARY:12]Date_Do_From:4; $_ad_DateForFilter)
			$_l_Year:=Year of:C25(!2001-01-01!)
			For ($_l_DateIndex; 1; Size of array:C274($_ad_DateForFilter))
				$_l_Year2:=Year of:C25($_ad_DateForFilter{$_l_DateIndex})
				If ($_l_Year2#$_l_Year)
					APPEND TO ARRAY:C911(PRD_at_FilterDates; "After "+String:C10($_l_Year2-1))
					$_l_Year:=$_l_Year2
				End if 
			End for 
			APPEND TO ARRAY:C911(PRD_at_FilterDates; "Future Dates")
			APPEND TO ARRAY:C911(PRD_at_FilterDates; "From Current Month")
			APPEND TO ARRAY:C911(PRD_at_FilterDates; "From Current Year")
			PRD_at_FilterDates:=0
			
		End if 
		
		
		//``
		FORM GOTO PAGE:C247(7)
		$_l_PageRow:=Find in array:C230(PRD_al_ProductsTabPage; 7)
		If ($_l_PageRow>0)
			PRD_at_ProductsTab:=$_l_PageRow
		End if 
		
		
End case 
ERR_MethodTrackerReturn("OBJ [PRODUCTS].Products_in2009.oProductClass"; $_t_oldMethodName)
