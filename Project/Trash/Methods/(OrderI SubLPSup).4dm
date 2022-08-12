//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      OrderI_SubLPSup
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  28/11/2010 20:58
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(Prod_at_SupplierOption;0)
	C_BOOLEAN:C305(<>PER_bo_ProdUpdateAccess; $_bo_OrderOK; $_bo_Set; $0)
	C_DATE:C307(<>DB_d_CurrentDate)
	C_LONGINT:C283(<>Mod_l_MaxModules; $_l_OK; $_l_SupplierIndex; $_l_SupplierOption; DF_l_ListedOnly; DF_l_SupplierOption; Prod_l_ListedOnly)
	C_TEXT:C284(<>SYS_t_BaseCurrency; <>SYS_t_DefaultTelFormat; <>SYS_t_StockOrderCompany; $_t_DummyContact; $_t_oldMethodName; COM_t_TelephoneNumberFormat; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; PROD_t_SupplierOption; vCompName)
	C_TEXT:C284(vCompNameA; vTel; vTelA)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OrderI_SubLPSup")
$0:=True:C214
If (<>Mod_l_MaxModules=0)
	GET PROCESS VARIABLE:C371(-1; <>Mod_l_MaxModules; <>Mod_l_MaxModules)
End if 
If (DB_t_CurrentFormUsage#"None")
	Check_SecRO(->[ORDER_ITEMS:25]Supplier_Code:20)
End if 
If (OK=1)
	If ([ORDER_ITEMS:25]Product_Code:2="")
		//could be any company
		If (DB_t_CurrentFormUsage#"None")
			If ([ORDER_ITEMS:25]Supplier_Code:20#"COMPONENTS")
				//Check_CompanyNC (->[ORDER ITEMS]Supplier Code;->[CONTACTS]Contact Code;->[ORDER ITEMS])
				//Changed to not pass pointer to current contact - kmw, 10/10/08 v631b120...
				//... (current contact will be to do with the Customer and have nothing to do with...
				//... the Supplier company so don't use it in Supplier Code search/lookup)...
				//...This fixes a problem whereby when doing lookup for supplier company code...
				//...it could sometimes return the sales order's customer company code.
				$_t_DummyContact:=""  //could change this to something useful if for some reason we stored information on the order item reagrding a supplier contact code for this order item
				Check_CompanyNC(->[ORDER_ITEMS:25]Supplier_Code:20; ->$_t_DummyContact; ->[ORDER_ITEMS:25])
			End if 
		End if 
	Else 
		RELATE ONE:C42([ORDER_ITEMS:25]Product_Code:2)
		If (Not:C34(<>PER_bo_ProdUpdateAccess)) | (Not:C34([PRODUCTS:9]Price_Updates:25))
			//cannot add suppliers
			CREATE EMPTY SET:C140([COMPANIES:2]; "Tr1")
			QUERY:C277([PRODUCTS_SUPPLIERS:148]; [PRODUCTS_SUPPLIERS:148]Product_Code:8=[PRODUCTS:9]Product_Code:1)
			
			If (Records in selection:C76([PRODUCTS_SUPPLIERS:148])>0)
				FIRST RECORD:C50([PRODUCTS_SUPPLIERS:148])
				For ($_l_SupplierIndex; 1; Records in selection:C76([PRODUCTS_SUPPLIERS:148]))
					If ([PRODUCTS_SUPPLIERS:148]Company_Code:1#"COMPONENTS")
						QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Code:1=[PRODUCTS_SUPPLIERS:148]Company_Code:1)
						ADD TO SET:C119([COMPANIES:2]; "Tr1")
					Else 
						[ORDER_ITEMS:25]Supplier_Code:20:="COMPONENTS"
					End if 
					NEXT RECORD:C51([PRODUCTS_SUPPLIERS:148])
				End for 
				USE SET:C118("Tr1")
				CLEAR SET:C117("Tr1")
				//check in selection
				If (DB_t_CurrentFormUsage#"None")
					If ([ORDER_ITEMS:25]Supplier_Code:20#"COMPONENTS")
						Check_CompanyNC(->[ORDER_ITEMS:25]Supplier_Code:20; ->[CONTACTS:1]Contact_Code:2; ->[ORDER_ITEMS:25]; True:C214)
					End if 
				End if 
			Else 
				//no suppliers identified
				If (DB_t_CurrentFormUsage#"None")
					If ([ORDER_ITEMS:25]Supplier_Code:20#"COMPONENTS")
						Check_CompanyNC(->[ORDER_ITEMS:25]Supplier_Code:20; ->[CONTACTS:1]Contact_Code:2; ->[ORDER_ITEMS:25])
					End if 
				End if 
			End if 
			
		Else 
			//can add suppliers
			If (DB_t_CurrentFormUsage#"None")
				If ([ORDER_ITEMS:25]Supplier_Code:20#"COMPONENTS")
					Check_CompanyNC(->[ORDER_ITEMS:25]Supplier_Code:20; ->[CONTACTS:1]Contact_Code:2; ->[ORDER_ITEMS:25])
				End if 
			End if 
		End if 
	End if 
	If (False:C215)
		Check_CompanyNC(->[ORDER_ITEMS:25]Supplier_Code:20; ->[CONTACTS:1]Contact_Code:2; ->[ORDER_ITEMS:25])
	End if 
	If ([ORDER_ITEMS:25]Supplier_Code:20#"COMPONENTS")
		vCompNameA:=[COMPANIES:2]Company_Name:2
		vTelA:=[COMPANIES:2]Telephone:9
	Else 
		vCompNameA:="COMPONENTS"
		vTelA:=""
	End if 
	If ([COMPANIES:2]Country:8#"")
		If ([COUNTRIES:73]COUNTRY_CODE:1#[COMPANIES:2]Country:8)
			QUERY:C277([COUNTRIES:73]; [COUNTRIES:73]COUNTRY_CODE:1=[COMPANIES:2]Country:8)
			COM_t_TelephoneNumberFormat:=[COUNTRIES:73]Telephone_Format:7
		End if 
	Else 
		COM_t_TelephoneNumberFormat:=<>SYS_t_DefaultTelFormat
	End if 
	If (COM_t_TelephoneNumberFormat#"")
		OBJECT SET FORMAT:C236(vTelA; COM_t_TelephoneNumberFormat)
		
	End if 
	If (([ORDER_ITEMS:25]Product_Code:2#"") & ([ORDER_ITEMS:25]Supplier_Code:20#""))
		RELATE ONE:C42([ORDER_ITEMS:25]Product_Code:2)
		ARRAY TEXT:C222(Prod_at_SupplierOption; 3)
		Prod_at_SupplierOption{1}:="Auto add suppliers to list"
		Prod_at_SupplierOption{2}:="Ask to add suppliers to list"
		Prod_at_SupplierOption{3}:="Do not add suppliers to list"
		//The above only loaded for clarity
		Prod_l_ListedOnly:=0
		$_l_SupplierOption:=[PRODUCTS:9]x_Supplier_Update_Option:47
		If ($_l_SupplierOption=0)
			//Load the default
			DF_LoadProdPriceSettings
			If (DF_l_SupplierOption>0)
				[PRODUCTS:9]x_Supplier_Update_Option:47:=DF_l_SupplierOption
				For ($_l_SupplierIndex; 1; Size of array:C274(Prod_at_SupplierOption))
					$_bo_Set:=[PRODUCTS:9]x_Supplier_Update_Option:47 ?? $_l_SupplierIndex
					If ($_bo_Set)
						Prod_at_SupplierOption:=$_l_SupplierIndex
						PROD_t_SupplierOption:=Prod_at_SupplierOption{$_l_SupplierIndex}
						$_l_SupplierIndex:=Size of array:C274(Prod_at_SupplierOption)
					End if 
				End for 
				Prod_l_ListedOnly:=DF_l_ListedOnly  //Only allow list suppliers on order
			End if 
			
		Else 
			For ($_l_SupplierIndex; 1; Size of array:C274(Prod_at_SupplierOption))
				$_bo_Set:=[PRODUCTS:9]x_Supplier_Update_Option:47 ?? $_l_SupplierIndex
				If ($_bo_Set)
					Prod_at_SupplierOption:=$_l_SupplierIndex
					PROD_t_SupplierOption:=Prod_at_SupplierOption{$_l_SupplierIndex}
					$_l_SupplierIndex:=Size of array:C274(Prod_at_SupplierOption)
				End if 
				Prod_l_ListedOnly:=Num:C11([PRODUCTS:9]x_Supplier_Update_Option:47 ?? 4)
			End for 
			
		End if 
		QUERY:C277([PRODUCTS_SUPPLIERS:148]; [PRODUCTS_SUPPLIERS:148]Product_Code:8=[PRODUCTS:9]Product_Code:1)
		QUERY SELECTION:C341([PRODUCTS_SUPPLIERS:148]; [PRODUCTS_SUPPLIERS:148]Company_Code:1=[ORDER_ITEMS:25]Supplier_Code:20)
		If (Records in selection:C76([PRODUCTS_SUPPLIERS:148])=0)
			Case of 
				: (((DB_GetModuleSettingByNUM(Module_Products))=3))
					$0:=True:C214
				: ([ORDER_ITEMS:25]Supplier_Code:20=<>SYS_t_StockOrderCompany)
					$0:=True:C214
				: (((DB_GetModuleSettingByNUM(Module_Products))#3) & (Not:C34(<>PER_bo_ProdUpdateAccess)))
					//this user does not have the privelage
					If (DB_t_CurrentFormUsage#"None")
						Gen_Alert("You may not add a suppliers.")
					End if 
					$0:=False:C215
					vCompNameA:=""
					vTelA:=""
					UNLOAD RECORD:C212([PRODUCTS:9])
				: (((DB_GetModuleSettingByNUM(Module_Products))#3) & (Not:C34([PRODUCTS:9]Price_Updates:25)))
					
					If (DB_t_CurrentFormUsage#"None")
						Gen_Alert("You may not add a supplier to this product")
					End if 
					$0:=False:C215
					vCompNameA:=""
					vTelA:=""
					UNLOAD RECORD:C212([PRODUCTS:9])
				: (((DB_GetModuleSettingByNUM(Module_Products))#3) & (<>PER_bo_ProdUpdateAccess) & ([PRODUCTS:9]Price_Updates:25) & ([ORDER_ITEMS:25]Supplier_Code:20#<>SYS_t_StockOrderCompany))
					If (DB_t_CurrentFormUsage#"None")
						Case of 
							: (Prod_at_SupplierOption=1)
								OK:=1
								$_l_OK:=1
								$_bo_OrderOK:=True:C214
							: (Prod_at_SupplierOption=2)
								Gen_Confirm("Do you want to add this Supplier to the Product?"; "Yes"; "No")
								If (OK=0)
									$_l_OK:=0
									If (Prod_l_ListedOnly=1)
										$_bo_OrderOK:=False:C215
									Else 
										$_bo_OrderOK:=True:C214
									End if 
								Else 
									$_l_OK:=1
									$_bo_OrderOK:=True:C214
								End if 
							: (Prod_at_SupplierOption=3)
								$_l_OK:=0
								If (Prod_l_ListedOnly=1)
									$_bo_OrderOK:=False:C215
								Else 
									$_bo_OrderOK:=True:C214
								End if 
								
							Else 
								// Not option set
								Gen_Confirm("Do you want to add this Supplier to the Product?"; "Yes"; "No")
								$_l_OK:=OK
								$_bo_OrderOK:=($_l_OK=1)
						End case 
						
						If ($_l_OK=1)
							READ WRITE:C146([PRODUCTS:9])
							LOAD RECORD:C52([PRODUCTS:9])
							CREATE RECORD:C68([PRODUCTS_SUPPLIERS:148])
							[PRODUCTS_SUPPLIERS:148]Product_Code:8:=[PRODUCTS:9]Product_Code:1
							[PRODUCTS_SUPPLIERS:148]ID:7:=AA_GetNextID(->[PRODUCTS_SUPPLIERS:148]ID:7)
							[PRODUCTS_SUPPLIERS:148]Company_Code:1:=[ORDER_ITEMS:25]Supplier_Code:20
							[PRODUCTS_SUPPLIERS:148]Cost_Price:2:=[ORDER_ITEMS:25]Cost_Price:5
							[PRODUCTS_SUPPLIERS:148]Cost_Price_Currency_Code:9:=[ORDERS:24]Currency_Code:32
							
							[PRODUCTS_SUPPLIERS:148]Margin:3:=Gen_Round((DivideBy(([PRODUCTS:9]Sales_Price:9-[PRODUCTS_SUPPLIERS:148]Cost_Price:2); [PRODUCTS:9]Sales_Price:9)*100); 2; 4)  // 17/02/04 pb
							[PRODUCTS:9]Modified_Date:10:=<>DB_d_CurrentDate
							DB_SaveRecord(->[PRODUCTS_SUPPLIERS:148])
							DB_SaveRecord(->[PRODUCTS:9])
							AA_CheckFileUnlocked(->[PRODUCTS:9]X_ID:43)
							UNLOAD RECORD:C212([PRODUCTS:9])
							READ ONLY:C145([PRODUCTS:9])
							LOAD RECORD:C52([PRODUCTS:9])
						End if 
						$0:=$_bo_OrderOK
					Else 
						//take it off
						$0:=False:C215
						vCompNameA:=""
						vTelA:=""
						UNLOAD RECORD:C212([PRODUCTS:9])
					End if 
				Else 
					$0:=False:C215
					vCompNameA:=""
					vTelA:=""
					UNLOAD RECORD:C212([PRODUCTS:9])
			End case 
		Else 
			//the supplier is on already
			[ORDER_ITEMS:25]Supply_by_Date:31:=<>DB_d_CurrentDate+[PRODUCTS_SUPPLIERS:148]Lead_Days:6
			Case of 
				: ([PRODUCTS_SUPPLIERS:148]Cost_Price_Currency_Code:9="")
					//have to assumme sale
					[ORDER_ITEMS:25]Cost_Price:5:=[PRODUCTS_SUPPLIERS:148]Cost_Price:2
					[ORDER_ITEMS:25]Standard_Cost:41:=[PRODUCTS_SUPPLIERS:148]Standard_Cost:5
				: ([PRODUCTS_SUPPLIERS:148]Cost_Price_Currency_Code:9=[ORDERS:24]Currency_Code:32)
					[ORDER_ITEMS:25]Cost_Price:5:=[PRODUCTS_SUPPLIERS:148]Cost_Price:2
					[ORDER_ITEMS:25]Standard_Cost:41:=[PRODUCTS_SUPPLIERS:148]Standard_Cost:5
				: ([PRODUCTS_SUPPLIERS:148]Cost_Price_Currency_Code:9#[ORDERS:24]Currency_Code:32)
					If ([ORDERS:24]Currency_Code:32="")
						[ORDERS:24]Currency_Code:32:=<>SYS_t_BaseCurrency
					End if 
					[ORDER_ITEMS:25]Cost_Price:5:=Cat_ConvertValue([PRODUCTS_SUPPLIERS:148]Cost_Price:2; [PRODUCTS_SUPPLIERS:148]Cost_Price_Currency_Code:9; [ORDERS:24]Currency_Code:32; Current date:C33(*))
					[ORDER_ITEMS:25]Standard_Cost:41:=Cat_ConvertValue([PRODUCTS_SUPPLIERS:148]Standard_Cost:5; [PRODUCTS_SUPPLIERS:148]Cost_Price_Currency_Code:9; [ORDERS:24]Currency_Code:32; Current date:C33(*))
					
			End case 
			Calc_Item
			$0:=True:C214
		End if 
	Else 
		$0:=True:C214
	End if 
	
	OrderI_SubRel
	vCompName:=[COMPANIES:2]Company_Name:2
	vTel:=[COMPANIES:2]Telephone:9
End if 
ERR_MethodTrackerReturn("OrderI_SubLPSup"; $_t_oldMethodName)
