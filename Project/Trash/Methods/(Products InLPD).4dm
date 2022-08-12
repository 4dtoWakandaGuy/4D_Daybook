//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Products_InLPD
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 21/11/2009`Method: Products_InLPD`Description
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY DATE:C224($_ad_IssueDates; 0)
	//ARRAY TEXT(PRD_at_FilterDates;0)
	//ARRAY TEXT(Prod_at_SupplierOption;0)
	C_BOOLEAN:C305($_bo_Exit; $_bo_Set; PAL_bo_ButtonSubFunction; vMod2)
	C_DATE:C307($_d_Date; $_d_Date2; $_d_Date2Was; $_d_LastDate)
	C_LONGINT:C283($_l_Dayof; $_l_Dayof2; $_l_everys; $_l_FieldNumber; $_l_FutureUnits; $_l_GroupCodePosition; $_l_Index; $_l_UnitCount; $_l_Year; DF_l_ListedOnly; DF_l_SupplierOption)
	C_LONGINT:C283(Prod_l_ListedOnly; r6; r7; s1; s2; s3)
	C_REAL:C285($1)
	C_TEXT:C284($_t_oldMethodName; $_t_PalletButtonName; $_t_productCode; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; PAL_BUTTON; PROD_t_SupplierOption; vPAccount; vProdCode; vSAccount)
	C_TEXT:C284(vTitle4)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Products_InLPD")
If (Count parameters:C259>=1)
	$_l_FieldNumber:=$1
Else 
	$_l_FieldNumber:=0
End if 
Case of 
	: (Modified:C32([PRODUCTS:9]Short_Code:19)) | ($_l_FieldNumber=Field:C253(->[PRODUCTS:9]Short_Code:19))
		
		[PRODUCTS:9]Short_Code:19:=Uppers2([PRODUCTS:9]Short_Code:19)
		Products_InMod
		Macro_AccTypePt(->[PRODUCTS:9]Short_Code:19)
	: (Modified:C32([PRODUCTS:9]Product_Name:2)) | ($_l_FieldNumber=Field:C253(->[PRODUCTS:9]Product_Name:2))
		[PRODUCTS:9]Product_Name:2:=Uppers2([PRODUCTS:9]Product_Name:2)
		Products_InMod
		Macro_AccTypePt(->[PRODUCTS:9]Product_Name:2)
	: (Modified:C32([PRODUCTS:9]Description:6)) | ($_l_FieldNumber=Field:C253(->[PRODUCTS:9]Description:6))
		Products_InMod
		Macro_AccTypePt(->[PRODUCTS:9]Description:6)
	: (Modified:C32([PRODUCTS:9]Sales_Price:9)) | ($_l_FieldNumber=Field:C253(->[PRODUCTS:9]Sales_Price:9))
		Prod_CalcMarg
		If (DB_t_CurrentFormUsage#"None")
			Products_InLPß("S1")
		End if 
		Products_InMod
		vMod2:=True:C214
		Macro_AccTypePt(->[PRODUCTS:9]Sales_Price:9)
	: (Modified:C32([PRODUCTS:9]Standard_Price:16)) | ($_l_FieldNumber=Field:C253(->[PRODUCTS:9]Standard_Price:16))
		Products_InMod
		vMod2:=True:C214
		Macro_AccTypePt(->[PRODUCTS:9]Standard_Price:16)
	: (Modified:C32([PRODUCTS:9]Weight:26)) | ($_l_FieldNumber=Field:C253(->[PRODUCTS:9]Weight:26))
		Products_InMod
		vMod2:=True:C214
		Macro_AccTypePt(->[PRODUCTS:9]Weight:26)
	: (Modified:C32([PRODUCTS:9]Group_Code:3)) | ($_l_FieldNumber=Field:C253(->[PRODUCTS:9]Group_Code:3))
		If (DB_t_CurrentFormUsage#"None")
			Check_Minor(->[PRODUCTS:9]Group_Code:3; "Group"; ->[PRODUCT_GROUPS:10]; ->[PRODUCT_GROUPS:10]Group_Code:1; ->[PRODUCT_GROUPS:10]Group_Name:2; "Groups In")
		End if 
		Products_InLPCo
		If ([PRODUCT_GROUPS:10]Sales_Account:4#"")
			[PRODUCTS:9]Sales_Account:7:=[PRODUCT_GROUPS:10]Sales_Account:4
			RELATE ONE:C42([PRODUCTS:9]Sales_Account:7)
			vSAccount:=[ACCOUNTS:32]Account_Name:3
		End if 
		If ([PRODUCT_GROUPS:10]Purchase_Account:5#"")
			[PRODUCTS:9]Purchase_Account:13:=[PRODUCT_GROUPS:10]Purchase_Account:5
			RELATE ONE:C42([PRODUCTS:9]Purchase_Account:13)
			vPAccount:=[ACCOUNTS:32]Account_Name:3
		End if 
		If ([PRODUCT_GROUPS:10]Stock_Account:8#"")
			[PRODUCTS:9]Stock_Account:42:=[PRODUCT_GROUPS:10]Stock_Account:8
		End if 
		If ([PRODUCT_GROUPS:10]Analysis_Code:6#"")
			[PRODUCTS:9]Analysis_Code:18:=[PRODUCT_GROUPS:10]Analysis_Code:6
			//  RELATE ONE([PRODUCTS]Analysis Code)
			// vAnalysis:=[ANALYSES]Analysis Name
		End if 
		Products_InMod
		Macro_AccTypePt(->[PRODUCTS:9]Group_Code:3)
	: (Modified:C32([PRODUCTS:9]Brand_Code:4)) | ($_l_FieldNumber=Field:C253(->[PRODUCTS:9]Brand_Code:4))
		If (DB_t_CurrentFormUsage#"None")
			Check_Minor(->[PRODUCTS:9]Brand_Code:4; ""; ->[PRODUCT_BRANDS:8]; ->[PRODUCT_BRANDS:8]Brand_Code:1; ->[PRODUCT_BRANDS:8]Brand_Name:2; "Brands In"; "Brand")
		End if 
		Products_InLPCo
		Products_InMod
		Macro_AccTypePt(->[PRODUCTS:9]Brand_Code:4)
	: (Modified:C32([PRODUCTS:9]Model_Code:5)) | ($_l_FieldNumber=Field:C253(->[PRODUCTS:9]Model_Code:5))
		RemoveLeadTr(Uppercase:C13([PRODUCTS:9]Model_Code:5); ->[PRODUCTS:9]Model_Code:5)
		If (((DB_GetProductGroupBrand) | (DB_Get_ProductBrandPref)) & (Length:C16([PRODUCTS:9]Model_Code:5)>255))
			If (DB_t_CurrentFormUsage#"None")
				Gen_Alert("The Model Code maximum length is 255 characters if the Groups and Brands are incl"+"uded in the Product Code"; "Try again")
			End if 
			[PRODUCTS:9]Model_Code:5:=Substring:C12([PRODUCTS:9]Model_Code:5; 1; 255)
			REJECT:C38([PRODUCTS:9]Model_Code:5)
		Else 
			Products_InLPCo
			Products_InMod
		End if 
		Macro_AccTypePt(->[PRODUCTS:9]Model_Code:5)
	: (Modified:C32([PRODUCTS:9]Product_Code:1)) | ($_l_FieldNumber=Field:C253(->[PRODUCTS:9]Product_Code:1))
		RemoveLeadTr(Uppercase:C13([PRODUCTS:9]Product_Code:1); ->[PRODUCTS:9]Product_Code:1)
		If ((DB_GetProductGroupBrand) | (DB_Get_ProductBrandPref))
			
			If (False:C215)
				$_t_productCode:=[PRODUCTS:9]Product_Code:1
				If ([PRODUCTS:9]Group_Code:3#"")
					$_l_GroupCodePosition:=Position:C15([PRODUCTS:9]Group_Code:3; $_t_productCode)
					If ($_l_GroupCodePosition=1)
						$_t_productCode:=Substring:C12($_t_productCode; Length:C16([PRODUCTS:9]Group_Code:3)+1; Length:C16($_t_productCode))
					End if 
				End if 
				If ([PRODUCTS:9]Brand_Code:4#"")
					$_l_GroupCodePosition:=Position:C15([PRODUCTS:9]Brand_Code:4; $_t_productCode)
					If ($_l_GroupCodePosition=1)
						$_t_productCode:=Substring:C12($_t_productCode; Length:C16([PRODUCTS:9]Brand_Code:4)+1; Length:C16($_t_productCode))
					End if 
				End if 
				
				
				[PRODUCTS:9]Model_Code:5:=$_t_productCode
			End if 
		Else 
			[PRODUCTS:9]Model_Code:5:=[PRODUCTS:9]Product_Code:1
		End if 
		Products_InMod
		Macro_AccTypePt(->[PRODUCTS:9]Product_Code:1)
	: (Modified:C32([PRODUCTS:9]Sales_Account:7)) | ($_l_FieldNumber=Field:C253(->[PRODUCTS:9]Sales_Account:7))
		If (DB_t_CurrentFormUsage#"None")
			Check_MinorNC(->[PRODUCTS:9]Sales_Account:7; "SAccount"; ->[ACCOUNTS:32]; ->[ACCOUNTS:32]Account_Code:2; ->[ACCOUNTS:32]Account_Name:3; "Account")
		End if 
		If ([PRODUCTS:9]Sales_Account:7#"")
			If (Check_AnalAcc(->[PRODUCTS:9]Sales_Account:7; ->[PRODUCTS:9]Analysis_Code:18; 1))
			End if 
		End if 
		If ([PRODUCTS:9]Sales_Account:7="")
			vSAccount:=""
		End if 
		Products_InMod
		Macro_AccTypePt(->[PRODUCTS:9]Sales_Account:7)
	: (Modified:C32([PRODUCTS:9]Purchase_Account:13)) | ($_l_FieldNumber=Field:C253(->[PRODUCTS:9]Purchase_Account:13))
		If (DB_t_CurrentFormUsage#"None")
			Check_MinorNC(->[PRODUCTS:9]Purchase_Account:13; "PAccount"; ->[ACCOUNTS:32]; ->[ACCOUNTS:32]Account_Code:2; ->[ACCOUNTS:32]Account_Name:3; "Account")
		End if 
		If ([PRODUCTS:9]Purchase_Account:13#"")
			If (Check_AnalAcc(->[PRODUCTS:9]Purchase_Account:13; ->[PRODUCTS:9]Analysis_Code:18; 1; False:C215))
			End if 
		End if 
		If ([PRODUCTS:9]Purchase_Account:13="")
			vPAccount:=""
		End if 
		Products_InMod
		Macro_AccTypePt(->[PRODUCTS:9]Purchase_Account:13)
	: (Modified:C32([PRODUCTS:9]Stock_Account:42)) | ($_l_FieldNumber=Field:C253(->[PRODUCTS:9]Stock_Account:42))
		If (DB_t_CurrentFormUsage#"None")
			Check_MinorNC(->[PRODUCTS:9]Stock_Account:42; ""; ->[ACCOUNTS:32]; ->[ACCOUNTS:32]Account_Code:2; ->[ACCOUNTS:32]Account_Name:3; "Account")
		End if 
		If ([PRODUCTS:9]Stock_Account:42#"")
			If (Check_AnalAcc(->[PRODUCTS:9]Stock_Account:42; ->[PRODUCTS:9]Analysis_Code:18; 1))
			End if 
		End if 
		Products_InMod
		Macro_AccTypePt(->[PRODUCTS:9]Stock_Account:42)
	: (Modified:C32([PRODUCTS:9]Analysis_Code:18)) | ($_l_FieldNumber=Field:C253(->[PRODUCTS:9]Analysis_Code:18))
		If (DB_t_CurrentFormUsage#"None")
			Check_Analysis(->[PRODUCTS:9]Analysis_Code:18; "Analysis"; ->[PRODUCTS:9]Sales_Account:7; ->[PRODUCTS:9]Purchase_Account:13)
		End if 
		Products_InMod
		Macro_AccTypePt(->[PRODUCTS:9]Analysis_Code:18)
	: (Modified:C32([PRODUCTS:9]Maintain_Stock:14)) | ($_l_FieldNumber=Field:C253(->[PRODUCTS:9]Maintain_Stock:14))
		// Stock_Calc
		Products_InMod
		Macro_AccTypePt(->[PRODUCTS:9]Maintain_Stock:14)
	: (Modified:C32([PRODUCTS:9]Superior:15)) | ($_l_FieldNumber=Field:C253(->[PRODUCTS:9]Superior:15))
		[PRODUCTS:9]Superior:15:=Uppercase:C13([PRODUCTS:9]Superior:15)
		If ([PRODUCTS:9]Superior:15#"")
			DB_SaveRecord(->[PRODUCTS:9])
			AA_CheckFileUnlocked(->[PRODUCTS:9]X_ID:43)
			COPY NAMED SELECTION:C331([PRODUCTS:9]; "Products")
			Check_ProdSu([PRODUCTS:9]Superior:15)
			USE NAMED SELECTION:C332("Products")
			CLEAR NAMED SELECTION:C333("Products")
			[PRODUCTS:9]Superior:15:=vProdCode
		End if 
		Products_InMod
		Macro_AccTypePt(->[PRODUCTS:9]Superior:15)
	: (Modified:C32([PRODUCTS:9]Default_Tax:23)) | ($_l_FieldNumber=Field:C253(->[PRODUCTS:9]Default_Tax:23))
		RELATE ONE:C42([PRODUCTS:9]Default_Tax:23; [TAX_CODES:35]Tax_Name:2)
		If (Records in selection:C76([TAX_CODES:35])=0)
			If (DB_t_CurrentFormUsage#"None")
				Gen_Alert("That is not a recognized VAT Code"; "Try again")
			End if 
			[PRODUCTS:9]Default_Tax:23:=""
		End if 
		Products_InMod
		Macro_AccTypePt(->[PRODUCTS:9]Default_Tax:23)
	: (Modified:C32([PRODUCTS:9]Bundle_Assembly:36)) | ($_l_FieldNumber=Field:C253(->[PRODUCTS:9]Bundle_Assembly:36))
		If ([PRODUCTS:9]Bundle_Assembly:36)
			OBJECT SET TITLE:C194(s1; "Under each product")
			OBJECT SET TITLE:C194(s2; "At the base")
			OBJECT SET ENABLED:C1123(s3; True:C214)
			vTitle4:="Show on SR Forms"
			r6:=0
			r7:=0
			[PRODUCTS:9]Maintain_Stock:14:=False:C215
			[PRODUCTS:9]Serial_Numbered:17:=False:C215
		Else 
			OBJECT SET TITLE:C194(s1; "Assembled item")
			OBJECT SET TITLE:C194(s2; "Components")
			vTitle4:="Purchase Order"
			OBJECT SET ENABLED:C1123(s3; False:C215)
			If ([PRODUCTS:9]Bundle_Show:37=0)
				[PRODUCTS:9]Bundle_Show:37:=1
				s1:=1
				s3:=0
			End if 
		End if 
		Products_InMod
		Macro_AccTypePt(->[PRODUCTS:9]Bundle_Assembly:36)
	: (Modified:C32([PRODUCTS:9]Price_Updates:25)) | ($_l_FieldNumber=Field:C253(->[PRODUCTS:9]Price_Updates:25))
		If ([PRODUCTS:9]Price_Updates:25)
			ARRAY TEXT:C222(Prod_at_SupplierOption; 3)
			Prod_at_SupplierOption{1}:="Auto add suppliers to list"
			Prod_at_SupplierOption{2}:="Ask to add suppliers to list"
			Prod_at_SupplierOption{3}:="Do not add suppliers to list"
			OBJECT SET VISIBLE:C603(PROD_t_SupplierOption; True:C214)
			If (Not:C34(Read only state:C362([PRODUCTS:9])))  //if read write
				
				OBJECT SET VISIBLE:C603(Prod_at_SupplierOption; True:C214)
			Else 
				OBJECT SET VISIBLE:C603(Prod_at_SupplierOption; False:C215)
			End if 
			If ([PRODUCTS:9]x_Supplier_Update_Option:47#0)
				For ($_l_Index; 1; Size of array:C274(Prod_at_SupplierOption))
					$_bo_Set:=[PRODUCTS:9]x_Supplier_Update_Option:47 ?? $_l_Index
					If ($_bo_Set)
						PROD_t_SupplierOption:=Prod_at_SupplierOption{$_l_Index}
						$_l_Index:=Size of array:C274(Prod_at_SupplierOption)
					End if 
				End for 
				Prod_l_ListedOnly:=Num:C11([PRODUCTS:9]x_Supplier_Update_Option:47 ?? 4)  //Only allow list suppliers on order
			Else 
				DF_LoadProdPriceSettings
				//Get Default
				If (DF_l_SupplierOption>0)
					[PRODUCTS:9]x_Supplier_Update_Option:47:=DF_l_SupplierOption
					For ($_l_Index; 1; Size of array:C274(Prod_at_SupplierOption))
						$_bo_Set:=[PRODUCTS:9]x_Supplier_Update_Option:47 ?? $_l_Index
						If ($_bo_Set)
							PROD_t_SupplierOption:=Prod_at_SupplierOption{$_l_Index}
							$_l_Index:=Size of array:C274(Prod_at_SupplierOption)
						End if 
					End for 
					//Note that in the pref this is stored as a seperate value
					Prod_l_ListedOnly:=DF_l_ListedOnly  //Only allow list suppliers on order
				End if 
				
			End if 
		Else 
			[PRODUCTS:9]x_Supplier_Update_Option:47:=0
			OBJECT SET VISIBLE:C603(PROD_t_SupplierOption; False:C215)
			OBJECT SET VISIBLE:C603(Prod_at_SupplierOption; False:C215)
			OBJECT SET VISIBLE:C603(Prod_l_ListedOnly; False:C215)
			
		End if 
		
	: (Modified:C32([PRODUCTS:9]Commodity_Code:38)) | ($_l_FieldNumber=Field:C253(->[PRODUCTS:9]Commodity_Code:38))
		Products_InMod
		Macro_AccTypePt(->[PRODUCTS:9]Commodity_Code:38)
	: (Modified:C32([PRODUCTS:9]Size:39)) | ($_l_FieldNumber=Field:C253(->[PRODUCTS:9]Size:39))
		Products_InMod
		Macro_AccTypePt(->[PRODUCTS:9]Size:39)
	: (Modified:C32([PRODUCTS:9]Price_Per:40)) | ($_l_FieldNumber=Field:C253(->[PRODUCTS:9]Price_Per:40))
		If ([PRODUCTS:9]Price_Per:40<1)
			If (DB_t_CurrentFormUsage#"None")
				Gen_Alert("The Price Per must be 1 or above")
			End if 
			[PRODUCTS:9]Price_Per:40:=1
		End if 
		Products_InMod
		Macro_AccTypePt(->[PRODUCTS:9]Price_Per:40)
	: (Modified:C32([PRODUCTS:9]First_Issue_Date:32)) | ($_l_FieldNumber=Field:C253(->[PRODUCTS:9]First_Issue_Date:32))
		//TRACE
		If ([PRODUCTS:9]Every_Number:28#0) & ([PRODUCTS:9]Unit_Number:29#0) & ([PRODUCTS:9]First_Issue_Date:32#!00-00-00!) & ([PRODUCTS:9]Issues_Number:27#0) & ([PRODUCTS:9]Product_Code:1#"")
			ARRAY DATE:C224($_ad_IssueDates; 0)
			//TRACE
			$_d_Date:=[PRODUCTS:9]First_Issue_Date:32
			$_l_FutureUnits:=[PRODUCTS:9]Issues_Number:27
			Case of 
				: ([PRODUCTS:9]Unit_Number:29=7)  // years
					$_d_LastDate:=Current date:C33(*)-7
					If ($_d_Date<$_d_LastDate)
						Repeat 
							$_d_Date:=$_d_Date+([PRODUCTS:9]Unit_Number:29*[PRODUCTS:9]Every_Number:28)
						Until ($_d_Date>=$_d_LastDate)
					End if 
					
				: ([PRODUCTS:9]Unit_Number:29=1)  //days
					$_d_LastDate:=Current date:C33(*)-1
					If ($_d_Date<$_d_LastDate)
						Repeat 
							$_d_Date:=$_d_Date+([PRODUCTS:9]Unit_Number:29*[PRODUCTS:9]Every_Number:28)
						Until ($_d_Date>=$_d_LastDate)
					End if 
				: ([PRODUCTS:9]Unit_Number:29=31)  //month
					$_d_LastDate:=Current date:C33(*)-31
					If ($_d_Date<$_d_LastDate)
						Repeat 
							$_d_Date:=$_d_Date+([PRODUCTS:9]Unit_Number:29*[PRODUCTS:9]Every_Number:28)
						Until ($_d_Date>=$_d_LastDate)
					End if 
				: ([PRODUCTS:9]Unit_Number:29=365)
					$_d_LastDate:=Current date:C33(*)-365
					If ($_d_Date<$_d_LastDate)
						Repeat 
							$_d_Date:=$_d_Date+([PRODUCTS:9]Unit_Number:29*[PRODUCTS:9]Every_Number:28)
						Until ($_d_Date>=$_d_LastDate)
					End if 
			End case 
			//we are not going to check or create the existence of past issues
			SD2_CheckDefaultAction("PDT")
			QUERY:C277([DIARY:12]; [DIARY:12]Action_Code:9="PDT"; *)
			QUERY:C277([DIARY:12];  & [DIARY:12]Product_Code:13=[PRODUCTS:9]Product_Code:1; *)
			QUERY:C277([DIARY:12];  & [DIARY:12]Date_Do_From:4=$_d_Date)
			If (Records in selection:C76([DIARY:12])=0)
				APPEND TO ARRAY:C911($_ad_IssueDates; $_d_Date)
			End if 
			$_bo_Exit:=False:C215
			$_l_UnitCount:=0
			Repeat 
				Case of 
					: ([PRODUCTS:9]Unit_Number:29=31)  //month
						If ($_d_Date>!00-00-00!)
							$_l_Dayof:=Day of:C23($_d_Date)
						Else 
							$_l_Dayof:=Day of:C23([PRODUCTS:9]First_Issue_Date:32)
							
						End if 
						$_d_Date2:=$_d_Date+([PRODUCTS:9]Unit_Number:29*[PRODUCTS:9]Every_Number:28)
						$_l_Dayof2:=Day of:C23($_d_Date2)
						If ($_l_Dayof2>$_l_Dayof)
							For ($_l_Index; $_l_Dayof2; 1; -1)
								$_d_Date2:=$_d_Date2-1
								If (Day of:C23($_d_Date2)=$_l_Dayof)
									$_l_Index:=1
								End if 
							End for 
						Else 
							For ($_l_Index; $_l_Dayof2; 31)
								$_d_Date2:=$_d_Date2+1
								If (Day of:C23($_d_Date2)=$_l_Dayof)
									$_l_Index:=32
								End if 
							End for 
						End if 
						$_d_Date:=$_d_Date2
						
					Else 
						$_d_Date:=$_d_Date+([PRODUCTS:9]Unit_Number:29*[PRODUCTS:9]Every_Number:28)
				End case 
				$_l_UnitCount:=$_l_UnitCount+1
				QUERY:C277([DIARY:12];  & [DIARY:12]Product_Code:13=[PRODUCTS:9]Product_Code:1; *)
				QUERY:C277([DIARY:12];  & [DIARY:12]Date_Do_From:4=$_d_Date)
				If (Records in selection:C76([DIARY:12])=0)
					APPEND TO ARRAY:C911($_ad_IssueDates; $_d_Date)
				End if 
			Until ($_l_UnitCount>=$_l_FutureUnits)
			If (Size of array:C274($_ad_IssueDates)>0)
				//there are some issue records to be created
				For ($_l_Index; 1; Size of array:C274($_ad_IssueDates))
					QUERY:C277([DIARY:12]; [DIARY:12]Action_Code:9="PDT"; *)
					QUERY:C277([DIARY:12];  & ; [DIARY:12]Product_Code:13=[PRODUCTS:9]Product_Code:1; *)
					QUERY:C277([DIARY:12];  & ; [DIARY:12]Date_Do_From:4=$_ad_IssueDates{$_l_Index})
					If (Records in selection:C76([DIARY:12])=0)
						CREATE RECORD:C68([DIARY:12])
						Diary_Code
						[DIARY:12]Action_Code:9:="PDT"
						[DIARY:12]Date_Do_From:4:=$_ad_IssueDates{$_l_Index}
						[DIARY:12]Date_Do_From:4:=$_ad_IssueDates{$_l_Index}
						[DIARY:12]Time_Do_From:6:=?00:00:01?
						[DIARY:12]Time_Do_To:35:=?23:59:59?
						[DIARY:12]Product_Code:13:=[PRODUCTS:9]Product_Code:1
						[DIARY:12]Action_Details:10:=[PRODUCTS:9]Product_Name:2+" Publication Date"
						DB_SaveRecord(->[DIARY:12])
					End if 
				End for 
			End if 
			QUERY:C277([DIARY:12]; [DIARY:12]Action_Code:9="PDT"; *)
			QUERY:C277([DIARY:12];  & [DIARY:12]Product_Code:13=[PRODUCTS:9]Product_Code:1)
			ORDER BY:C49([DIARY:12]; [DIARY:12]Date_Do_From:4; >)
			If (PRD_at_FilterDates>0)
				GOTO OBJECT:C206([PRODUCTS:9]Description:6)
				QUERY:C277([DIARY:12]; [DIARY:12]Action_Code:9="PDT"; *)
				QUERY:C277([DIARY:12];  & [DIARY:12]Product_Code:13=[PRODUCTS:9]Product_Code:1)
				Case of 
					: (PRD_at_FilterDates{PRD_at_FilterDates}="Future Dates")
						QUERY SELECTION:C341([DIARY:12]; [DIARY:12]Date_Do_From:4>=Current date:C33(*))
					: (PRD_at_FilterDates{PRD_at_FilterDates}="From Current Month")
						$_d_Date:=Current date:C33(*)
						$_l_Dayof:=Day of:C23(Current date:C33(*))
						If ($_l_Dayof>1)
							Repeat 
								$_d_Date:=$_d_Date-1
								$_l_Dayof:=Day of:C23($_d_Date)
							Until ($_l_Dayof=1)
						End if 
						QUERY SELECTION:C341([DIARY:12]; [DIARY:12]Date_Do_From:4>=$_d_Date)
					: (PRD_at_FilterDates{PRD_at_FilterDates}="From Current Year")
						$_l_Year:=Year of:C25(Current date:C33(*))
						$_d_Date:=Date:C102("01/01/"+String:C10($_l_Year))
						QUERY SELECTION:C341([DIARY:12]; [DIARY:12]Date_Do_From:4>=$_d_Date)
					Else 
						$_l_Year:=Num:C11(PRD_at_FilterDates{PRD_at_FilterDates})
						$_l_Year:=Year of:C25(Current date:C33(*))
						$_d_Date:=Date:C102("01/01/"+String:C10($_l_Year))
						QUERY SELECTION:C341([DIARY:12]; [DIARY:12]Date_Do_From:4>=$_d_Date)
						
				End case 
				ORDER BY:C49([DIARY:12]; [DIARY:12]Date_Do_From:4; >)
			End if 
			
		End if 
	: (Modified:C32([PRODUCTS:9]Every_Number:28)) | ($_l_FieldNumber=Field:C253(->[PRODUCTS:9]Every_Number:28))
		//TRACE
		If ([PRODUCTS:9]Every_Number:28#0) & ([PRODUCTS:9]Unit_Number:29#0) & ([PRODUCTS:9]First_Issue_Date:32#!00-00-00!) & ([PRODUCTS:9]Issues_Number:27#0) & ([PRODUCTS:9]Product_Code:1#"")
			ARRAY DATE:C224($_ad_IssueDates; 0)
			//TRACE
			$_d_Date:=[PRODUCTS:9]First_Issue_Date:32
			$_l_FutureUnits:=[PRODUCTS:9]Issues_Number:27
			Case of 
				: ([PRODUCTS:9]Unit_Number:29=7)  // years
					$_d_LastDate:=Current date:C33(*)-7
					If ($_d_Date<$_d_LastDate)
						Repeat 
							$_d_Date:=$_d_Date+([PRODUCTS:9]Unit_Number:29*[PRODUCTS:9]Every_Number:28)
						Until ($_d_Date>=$_d_LastDate)
					End if 
					
				: ([PRODUCTS:9]Unit_Number:29=1)  //days
					$_d_LastDate:=Current date:C33(*)-1
					If ($_d_Date<$_d_LastDate)
						Repeat 
							$_d_Date:=$_d_Date+([PRODUCTS:9]Unit_Number:29*[PRODUCTS:9]Every_Number:28)
						Until ($_d_Date>=$_d_LastDate)
					End if 
				: ([PRODUCTS:9]Unit_Number:29=31)  //month
					$_d_LastDate:=Current date:C33(*)-31
					If ($_d_Date<$_d_LastDate)
						Repeat 
							$_d_Date:=$_d_Date+([PRODUCTS:9]Unit_Number:29*[PRODUCTS:9]Every_Number:28)
						Until ($_d_Date>=$_d_LastDate)
					End if 
				: ([PRODUCTS:9]Unit_Number:29=365)
					$_d_LastDate:=Current date:C33(*)-365
					If ($_d_Date<$_d_LastDate)
						Repeat 
							$_d_Date:=$_d_Date+([PRODUCTS:9]Unit_Number:29*[PRODUCTS:9]Every_Number:28)
						Until ($_d_Date>=$_d_LastDate)
					End if 
			End case 
			//we are not going to check or create the existence of past issues
			SD2_CheckDefaultAction("PDT")
			QUERY:C277([DIARY:12]; [DIARY:12]Action_Code:9="PDT"; *)
			QUERY:C277([DIARY:12];  & [DIARY:12]Product_Code:13=[PRODUCTS:9]Product_Code:1; *)
			QUERY:C277([DIARY:12];  & [DIARY:12]Date_Do_From:4=$_d_Date)
			If (Records in selection:C76([DIARY:12])=0)
				APPEND TO ARRAY:C911($_ad_IssueDates; $_d_Date)
			End if 
			$_bo_Exit:=False:C215
			$_l_UnitCount:=0
			Repeat 
				Case of 
					: ([PRODUCTS:9]Unit_Number:29=31)  //month
						If ($_d_Date>!00-00-00!)
							$_l_Dayof:=Day of:C23($_d_Date)
						Else 
							$_l_Dayof:=Day of:C23([PRODUCTS:9]First_Issue_Date:32)
						End if 
						$_d_Date2:=$_d_Date+([PRODUCTS:9]Unit_Number:29*[PRODUCTS:9]Every_Number:28)
						$_l_Dayof2:=Day of:C23($_d_Date2)
						If ($_l_Dayof2>$_l_Dayof)
							For ($_l_Index; $_l_Dayof2; 1; -1)
								$_d_Date2:=$_d_Date2-1
								If (Day of:C23($_d_Date2)=$_l_Dayof)
									$_l_Index:=1
								End if 
							End for 
						Else 
							For ($_l_Index; $_l_Dayof2; 31)
								$_d_Date2:=$_d_Date2+1
								If (Day of:C23($_d_Date2)=$_l_Dayof)
									$_l_Index:=32
								End if 
							End for 
						End if 
						$_d_Date:=$_d_Date2
						
					Else 
						$_d_Date:=$_d_Date+([PRODUCTS:9]Unit_Number:29*[PRODUCTS:9]Every_Number:28)
				End case 
				$_l_UnitCount:=$_l_UnitCount+1
				QUERY:C277([DIARY:12];  & [DIARY:12]Product_Code:13=[PRODUCTS:9]Product_Code:1; *)
				QUERY:C277([DIARY:12];  & [DIARY:12]Date_Do_From:4=$_d_Date)
				If (Records in selection:C76([DIARY:12])=0)
					APPEND TO ARRAY:C911($_ad_IssueDates; $_d_Date)
				End if 
			Until ($_l_UnitCount>=$_l_FutureUnits)
			If (Size of array:C274($_ad_IssueDates)>0)
				//there are some issue records to be created
				For ($_l_Index; 1; Size of array:C274($_ad_IssueDates))
					QUERY:C277([DIARY:12]; [DIARY:12]Action_Code:9="PDT"; *)
					QUERY:C277([DIARY:12];  & ; [DIARY:12]Product_Code:13=[PRODUCTS:9]Product_Code:1; *)
					QUERY:C277([DIARY:12];  & ; [DIARY:12]Date_Do_From:4=$_ad_IssueDates{$_l_Index})
					If (Records in selection:C76([DIARY:12])=0)
						CREATE RECORD:C68([DIARY:12])
						Diary_Code
						[DIARY:12]Action_Code:9:="PDT"
						[DIARY:12]Date_Do_From:4:=$_ad_IssueDates{$_l_Index}
						[DIARY:12]Date_Do_From:4:=$_ad_IssueDates{$_l_Index}
						[DIARY:12]Time_Do_From:6:=?00:00:01?
						[DIARY:12]Time_Do_To:35:=?23:59:59?
						[DIARY:12]Product_Code:13:=[PRODUCTS:9]Product_Code:1
						[DIARY:12]Action_Details:10:=[PRODUCTS:9]Product_Name:2+" Publication Date"
						DB_SaveRecord(->[DIARY:12])
					End if 
				End for 
			End if 
			QUERY:C277([DIARY:12]; [DIARY:12]Action_Code:9="PDT"; *)
			QUERY:C277([DIARY:12];  & [DIARY:12]Product_Code:13=[PRODUCTS:9]Product_Code:1)
			ORDER BY:C49([DIARY:12]; [DIARY:12]Date_Do_From:4; >)
			If (PRD_at_FilterDates>0)
				GOTO OBJECT:C206([PRODUCTS:9]Description:6)
				QUERY:C277([DIARY:12]; [DIARY:12]Action_Code:9="PDT"; *)
				QUERY:C277([DIARY:12];  & [DIARY:12]Product_Code:13=[PRODUCTS:9]Product_Code:1)
				Case of 
					: (PRD_at_FilterDates{PRD_at_FilterDates}="Future Dates")
						QUERY SELECTION:C341([DIARY:12]; [DIARY:12]Date_Do_From:4>=Current date:C33(*))
					: (PRD_at_FilterDates{PRD_at_FilterDates}="From Current Month")
						$_d_Date:=Current date:C33(*)
						$_l_Dayof:=Day of:C23(Current date:C33(*))
						If ($_l_Dayof>1)
							Repeat 
								$_d_Date:=$_d_Date-1
								$_l_Dayof:=Day of:C23($_d_Date)
							Until ($_l_Dayof=1)
						End if 
						QUERY SELECTION:C341([DIARY:12]; [DIARY:12]Date_Do_From:4>=$_d_Date)
					: (PRD_at_FilterDates{PRD_at_FilterDates}="From Current Year")
						$_l_Year:=Year of:C25(Current date:C33(*))
						$_d_Date:=Date:C102("01/01/"+String:C10($_l_Year))
						QUERY SELECTION:C341([DIARY:12]; [DIARY:12]Date_Do_From:4>=$_d_Date)
					Else 
						$_l_Year:=Num:C11(PRD_at_FilterDates{PRD_at_FilterDates})
						$_l_Year:=Year of:C25(Current date:C33(*))
						$_d_Date:=Date:C102("01/01/"+String:C10($_l_Year))
						QUERY SELECTION:C341([DIARY:12]; [DIARY:12]Date_Do_From:4>=$_d_Date)
						
				End case 
				ORDER BY:C49([DIARY:12]; [DIARY:12]Date_Do_From:4; >)
			End if 
			
		End if 
	: (Modified:C32([PRODUCTS:9]Issues_Number:27)) | ($_l_FieldNumber=Field:C253(->[PRODUCTS:9]Issues_Number:27))
		//TRACE
		If ([PRODUCTS:9]Every_Number:28#0) & ([PRODUCTS:9]Unit_Number:29#0) & ([PRODUCTS:9]First_Issue_Date:32#!00-00-00!) & ([PRODUCTS:9]Issues_Number:27#0) & ([PRODUCTS:9]Product_Code:1#"")
			ARRAY DATE:C224($_ad_IssueDates; 0)
			//TRACE
			$_d_Date:=[PRODUCTS:9]First_Issue_Date:32
			$_l_FutureUnits:=[PRODUCTS:9]Issues_Number:27
			Case of 
				: ([PRODUCTS:9]Unit_Number:29=7)  // years
					$_d_LastDate:=Current date:C33(*)-7
					If ($_d_Date<$_d_LastDate)
						Repeat 
							$_d_Date:=$_d_Date+([PRODUCTS:9]Unit_Number:29*[PRODUCTS:9]Every_Number:28)
						Until ($_d_Date>=$_d_LastDate)
					End if 
					
				: ([PRODUCTS:9]Unit_Number:29=1)  //days
					$_d_LastDate:=Current date:C33(*)-1
					If ($_d_Date<$_d_LastDate)
						Repeat 
							$_d_Date:=$_d_Date+([PRODUCTS:9]Unit_Number:29*[PRODUCTS:9]Every_Number:28)
						Until ($_d_Date>=$_d_LastDate)
					End if 
				: ([PRODUCTS:9]Unit_Number:29=31)  //month
					$_d_LastDate:=Current date:C33(*)-31
					If ($_d_Date<$_d_LastDate)
						Repeat 
							$_d_Date:=$_d_Date+([PRODUCTS:9]Unit_Number:29*[PRODUCTS:9]Every_Number:28)
						Until ($_d_Date>=$_d_LastDate)
					End if 
				: ([PRODUCTS:9]Unit_Number:29=365)
					$_d_LastDate:=Current date:C33(*)-365
					If ($_d_Date<$_d_LastDate)
						Repeat 
							$_d_Date:=$_d_Date+([PRODUCTS:9]Unit_Number:29*[PRODUCTS:9]Every_Number:28)
						Until ($_d_Date>=$_d_LastDate)
					End if 
			End case 
			//we are not going to check or create the existence of past issues
			SD2_CheckDefaultAction("PDT")
			QUERY:C277([DIARY:12]; [DIARY:12]Action_Code:9="PDT"; *)
			QUERY:C277([DIARY:12];  & [DIARY:12]Product_Code:13=[PRODUCTS:9]Product_Code:1; *)
			QUERY:C277([DIARY:12];  & [DIARY:12]Date_Do_From:4=$_d_Date)
			If (Records in selection:C76([DIARY:12])=0)
				APPEND TO ARRAY:C911($_ad_IssueDates; $_d_Date)
			End if 
			$_bo_Exit:=False:C215
			$_l_UnitCount:=0
			Repeat 
				Case of 
					: ([PRODUCTS:9]Unit_Number:29=31)  //month
						If ($_d_Date>!00-00-00!)
							$_l_Dayof:=Day of:C23($_d_Date)
						Else 
							$_l_Dayof:=Day of:C23([PRODUCTS:9]First_Issue_Date:32)
						End if 
						$_l_everys:=0
						$_d_Date2:=$_d_Date
						Repeat 
							$_d_Date2Was:=$_d_Date2
							Repeat 
								$_d_Date2:=$_d_Date2+1
							Until (Month of:C24($_d_Date2)#Month of:C24($_d_Date2Was))
							$_l_everys:=$_l_everys+1
						Until ($_l_everys=[PRODUCTS:9]Every_Number:28)
						If (False:C215)
							$_d_Date2:=$_d_Date+([PRODUCTS:9]Unit_Number:29*[PRODUCTS:9]Every_Number:28)
							$_l_Dayof2:=Day of:C23($_d_Date2)
							If ($_l_Dayof2>$_l_Dayof)
								For ($_l_Index; $_l_Dayof2; 1; -1)
									$_d_Date2:=$_d_Date2-1
									If (Day of:C23($_d_Date2)=$_l_Dayof)
										$_l_Index:=1
									End if 
								End for 
								
							Else 
								For ($_l_Index; $_l_Dayof2; 31)
									$_d_Date2:=$_d_Date2+1
									If (Day of:C23($_d_Date2)=$_l_Dayof)
										$_l_Index:=32
									End if 
								End for 
							End if 
						End if 
						$_d_Date:=$_d_Date2
						
						
					Else 
						$_d_Date:=$_d_Date+([PRODUCTS:9]Unit_Number:29*[PRODUCTS:9]Every_Number:28)
				End case 
				$_l_UnitCount:=$_l_UnitCount+1
				QUERY:C277([DIARY:12];  & [DIARY:12]Product_Code:13=[PRODUCTS:9]Product_Code:1; *)
				QUERY:C277([DIARY:12];  & [DIARY:12]Date_Do_From:4=$_d_Date)
				If (Records in selection:C76([DIARY:12])=0)
					APPEND TO ARRAY:C911($_ad_IssueDates; $_d_Date)
				End if 
			Until ($_l_UnitCount>=$_l_FutureUnits)
			If (Size of array:C274($_ad_IssueDates)>0)
				//there are some issue records to be created
				For ($_l_Index; 1; Size of array:C274($_ad_IssueDates))
					QUERY:C277([DIARY:12]; [DIARY:12]Action_Code:9="PDT"; *)
					QUERY:C277([DIARY:12];  & ; [DIARY:12]Product_Code:13=[PRODUCTS:9]Product_Code:1; *)
					QUERY:C277([DIARY:12];  & ; [DIARY:12]Date_Do_From:4=$_ad_IssueDates{$_l_Index})
					If (Records in selection:C76([DIARY:12])=0)
						CREATE RECORD:C68([DIARY:12])
						Diary_Code
						[DIARY:12]Action_Code:9:="PDT"
						[DIARY:12]Date_Do_From:4:=$_ad_IssueDates{$_l_Index}
						[DIARY:12]Date_Do_From:4:=$_ad_IssueDates{$_l_Index}
						[DIARY:12]Time_Do_From:6:=?00:00:01?
						[DIARY:12]Time_Do_To:35:=?23:59:59?
						[DIARY:12]Product_Code:13:=[PRODUCTS:9]Product_Code:1
						[DIARY:12]Action_Details:10:=[PRODUCTS:9]Product_Name:2+" Publication Date"
						DB_SaveRecord(->[DIARY:12])
					End if 
				End for 
			End if 
			QUERY:C277([DIARY:12]; [DIARY:12]Action_Code:9="PDT"; *)
			QUERY:C277([DIARY:12];  & [DIARY:12]Product_Code:13=[PRODUCTS:9]Product_Code:1)
			ORDER BY:C49([DIARY:12]; [DIARY:12]Date_Do_From:4; >)
			If (PRD_at_FilterDates>0)
				GOTO OBJECT:C206([PRODUCTS:9]Description:6)
				QUERY:C277([DIARY:12]; [DIARY:12]Action_Code:9="PDT"; *)
				QUERY:C277([DIARY:12];  & [DIARY:12]Product_Code:13=[PRODUCTS:9]Product_Code:1)
				Case of 
					: (PRD_at_FilterDates{PRD_at_FilterDates}="Future Dates")
						QUERY SELECTION:C341([DIARY:12]; [DIARY:12]Date_Do_From:4>=Current date:C33(*))
					: (PRD_at_FilterDates{PRD_at_FilterDates}="From Current Month")
						$_d_Date:=Current date:C33(*)
						$_l_Dayof:=Day of:C23(Current date:C33(*))
						If ($_l_Dayof>1)
							Repeat 
								$_d_Date:=$_d_Date-1
								$_l_Dayof:=Day of:C23($_d_Date)
							Until ($_l_Dayof=1)
						End if 
						QUERY SELECTION:C341([DIARY:12]; [DIARY:12]Date_Do_From:4>=$_d_Date)
					: (PRD_at_FilterDates{PRD_at_FilterDates}="From Current Year")
						$_l_Year:=Year of:C25(Current date:C33(*))
						$_d_Date:=Date:C102("01/01/"+String:C10($_l_Year))
						QUERY SELECTION:C341([DIARY:12]; [DIARY:12]Date_Do_From:4>=$_d_Date)
					Else 
						$_l_Year:=Num:C11(PRD_at_FilterDates{PRD_at_FilterDates})
						$_l_Year:=Year of:C25(Current date:C33(*))
						$_d_Date:=Date:C102("01/01/"+String:C10($_l_Year))
						QUERY SELECTION:C341([DIARY:12]; [DIARY:12]Date_Do_From:4>=$_d_Date)
						
				End case 
				ORDER BY:C49([DIARY:12]; [DIARY:12]Date_Do_From:4; >)
			End if 
			
		End if 
	Else 
		If (PAL_BUTTON#"")
			$_t_PalletButtonName:=PAL_BUTTON
			PAL_BUTTON:=""
			DB_HandleInputFormButtons($_t_PalletButtonName)
			PAL_bo_ButtonSubFunction:=False:C215
		End if 
End case 
ERR_MethodTrackerReturn("Products_InLPD"; $_t_oldMethodName)