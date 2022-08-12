//%attributes = {}
If (False:C215)
	//Project Method Name:      STK_SFITEM_Lpx
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 14/09/2011 15:34
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>PER_bo_ProdUpdateAccess; DB_bo_RecordModified; STK_bo_ProductisFound)
	C_LONGINT:C283(<>Mod_l_MaxModules; STK_l_ClassDirection)
	C_POINTER:C301($1)
	C_REAL:C285(vTot)
	C_TEXT:C284(<>SYS_t_StockOrderCompany; $_t_oldMethodName; STK_t_SupplierCompany)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("STK_SFITEM_Lpx")

If (<>Mod_l_MaxModules=0)
	GET PROCESS VARIABLE:C371(-1; <>Mod_l_MaxModules; <>Mod_l_MaxModules)
End if 
//SF_STOCKMOVEMENT_ITEMS Sub
Case of 
	: ($1=(->[SF_STOCKMOVEMENT_ITEMS:194]Stock_item_Serial:15))
		If ((DB_GetModuleSettingByNUM(Module_SerialNos)<2) | (DB_GetModuleSettingByNUM(Module_SerialNos)=3))
			Gen_Alert("You cannot modify the Serial Nunber"; "Cancel")
			[SF_STOCKMOVEMENT_ITEMS:194]Stock_item_Serial:15:=Old:C35([SF_STOCKMOVEMENT_ITEMS:194]Stock_item_Serial:15)
		Else 
			If (([SF_STOCKMOVEMENT_ITEMS:194]Stock_item_Serial:15#"") & ([SF_STOCKMOVEMENT_ITEMS:194]Quantity:4>1))
				Gen_Alert("Please enter Items singly if you need to allocate Serial Nos"; "Try again")
				[SF_STOCKMOVEMENT_ITEMS:194]Stock_item_Serial:15:=""
			Else 
				If ([SF_STOCKMOVEMENT_ITEMS:194]Stock_item_Serial:15#"")
					STK_SFITEM_SerialNumber(->[SF_STOCKMOVEMENT_ITEMS:194]Product_Code:3; ->[SF_STOCKMOVEMENT_ITEMS:194]Stock_item_Serial:15; ->[SF_STOCKMOVEMENT_ITEMS:194]Quantity:4)
				End if 
			End if 
			DB_bo_RecordModified:=True:C214
		End if 
		Macro_AccTypePt(->[SF_STOCKMOVEMENT_ITEMS:194]Stock_item_Serial:15)
	: ($1=(->[SF_STOCKMOVEMENT_ITEMS:194]Product_Code:3))
		STK_bo_ProductisFound:=False:C215
		Check_Product(->[SF_STOCKMOVEMENT_ITEMS:194]Product_Code:3; "Product")
		StockI_SubLPPC
		//RELATE ONE([STOCK MOVEMENTS]Company From)
		//vCompName:=[COMPANIES]Company Name`
		//◊ProdCode:=[PRODUCTS]Product Code
		DB_bo_RecordModified:=True:C214
		Macro_AccTypePt(->[SF_STOCKMOVEMENT_ITEMS:194]Product_Code:3)
		//: ($1=(->[SF_STOCKMOVEMENT_ITEMS]Company To))
		//Check_MinorNC (->[SF_STOCKMOVEMENT_ITEMS]Company To;"Company";->[COMPANIES];->[COMPANIES]Company Code;->[COMPANIES]Company Name)
		//DEFAULT TABLE([STOCK MOVEMENTS])
		//RELATE ONE([STOCK MOVEMENTS]Company From)
		//v`CompName:=[COMPANIES]Company Name
		//v`Modified:=True
		//Macro_AccTypePt (->[SF_STOCKMOVEMENT_ITEMS]Company To)
		
		//: ($1=(->[SF_STOCKMOVEMENT_ITEMS]Order Code))
		//Check_MinorNC (->[SF_STOCKMOVEMENT_ITEMS]Order Code;"";->[ORDERS];->[ORDERS]Order Code;->[ORDERS]Company Code;"Order")
		//  RELATE ONE([SF_STOCKMOVEMENT_ITEMS]Order Code;[ORDERS]Company Code)
		//   RELATE ONE([ORDER ITEMS]Order Code)
		// If ([ORDERS]Order Code="")
		// Check_Minor_IL (»[SF_STOCKMOVEMENT_ITEMS]Order Code;"Order";»[ORDERS];»[ORDERS]Order Code;
		//  DEFAULT FILE([SF_STOCKMOVEMENT_ITEMS])
		//  End if
		DB_bo_RecordModified:=True:C214
		//Macro_AccTypePt (->[SF_STOCKMOVEMENT_ITEMS]OrderCode)
		
	: ($1=(->[SF_STOCKMOVEMENT_ITEMS:194]Quantity:4))
		RELATE ONE:C42([SF_STOCKMOVEMENT_ITEMS:194]Product_Code:3)
		If (([PRODUCTS:9]Serial_Numbered:17=True:C214) & (([SF_STOCKMOVEMENT_ITEMS:194]Quantity:4>1) | ([SF_STOCKMOVEMENT_ITEMS:194]Quantity:4<-1)))
			Gen_Alert("This Product requires Serial Nos so must be entered singly"; "Try again")
			If ([SF_STOCKMOVEMENT_ITEMS:194]Quantity:4<0)
				[SF_STOCKMOVEMENT_ITEMS:194]Quantity:4:=-1
			Else 
				[SF_STOCKMOVEMENT_ITEMS:194]Quantity:4:=1
			End if 
		End if 
		[SF_STOCKMOVEMENT_ITEMS:194]Total_Cost_Value:7:=Gen_Round(([SF_STOCKMOVEMENT_ITEMS:194]Unit_Cost_Value:6*Abs:C99([SF_STOCKMOVEMENT_ITEMS:194]Quantity:4)); 2; 2)  //4.0.035/6
		If ([SF_STOCKMOVEMENT_ITEMS:194]Unit_Cost_Previous:19#0) | (STK_l_ClassDirection=1) | (STK_l_ClassDirection=-1)  //1 means in coming or -1 means outgoing
			
			//if in coming
			[SF_STOCKMOVEMENT_ITEMS:194]Stock_item_AccountingUnitCost:40:=[SF_STOCKMOVEMENT_ITEMS:194]Unit_Cost_Value:6
			//anything else
			If ([SF_STOCKMOVEMENT_ITEMS:194]Unit_Cost_Previous:19#0)
				[SF_STOCKMOVEMENT_ITEMS:194]Stock_item_AccountingUnitCost:40:=[SF_STOCKMOVEMENT_ITEMS:194]Unit_Cost_Value:6-[SF_STOCKMOVEMENT_ITEMS:194]Unit_Cost_Previous:19
			End if 
			//if outgoing
			//[SF_STOCKMOVEMENT_ITEMS]Stock_item_AccountingUnitCost-[SF_STOCKMOVEMENT_ITEMS]Unit_Cost_Value
			
			//[SF_STOCKMOVEMENT_ITEMS]Stock_Item_AccountingCostTotal:=Gen_Round (([SF_STOCKMOVEMENT_ITEMS]Stock_item_AccountingUnitCost*Abs([SF_STOCKMOVEMENT_ITEMS]Quantity));2;2)
		End if 
		vTot:=1
		DB_bo_RecordModified:=True:C214
		Macro_AccTypePt(->[SF_STOCKMOVEMENT_ITEMS:194]Quantity:4)
		//[STOCK MOVEMENTS]Total Cost:=Gen_Round (Sum([SF_STOCKMOVEMENT_ITEMS]Total Cost);2;2)
	: ($1=(->[SF_STOCKMOVEMENT_ITEMS:194]Unit_Cost_Value:6))
		If (((DB_GetModuleSettingByNUM(Module_Products))#3) & (<>PER_bo_ProdUpdateAccess) & (STK_t_SupplierCompany#<>SYS_t_StockOrderCompany) & (STK_t_SupplierCompany#""))
			
			RELATE ONE:C42([SF_STOCKMOVEMENT_ITEMS:194]Product_Code:3)
			If ([PRODUCTS:9]Price_Updates:25)
				QUERY:C277([PRODUCTS_SUPPLIERS:148]; [PRODUCTS_SUPPLIERS:148]Product_Code:8=[PRODUCTS:9]Product_Code:1)
				QUERY SELECTION:C341([PRODUCTS_SUPPLIERS:148]; [PRODUCTS_SUPPLIERS:148]Company_Code:1=STK_t_SupplierCompany)
				
				If (([SF_STOCKMOVEMENT_ITEMS:194]Unit_Cost_Value:6>0) & ([SF_STOCKMOVEMENT_ITEMS:194]Unit_Cost_Value:6#[PRODUCTS_SUPPLIERS:148]Cost_Price:2) & (Not:C34(Locked:C147([PRODUCTS:9]))))
					Gen_Confirm("Do you want to update the Product's Cost Price?"; "Yes"; "No")
					If (OK=1)
						If (Records in selection:C76([PRODUCTS_SUPPLIERS:148])=0)
							CREATE RECORD:C68([PRODUCTS_SUPPLIERS:148])
							[PRODUCTS_SUPPLIERS:148]Company_Code:1:=STK_t_SupplierCompany
							[PRODUCTS_SUPPLIERS:148]Product_Code:8:=[PRODUCTS:9]Product_Code:1
							[PRODUCTS_SUPPLIERS:148]ID:7:=AA_GetNextID(->[PRODUCTS_SUPPLIERS:148]ID:7)
						End if 
						[PRODUCTS_SUPPLIERS:148]Cost_Price_Currency_Code:9:=[SF_STOCKMOVEMENT_ITEMS:194]Currency:5
						[PRODUCTS_SUPPLIERS:148]Cost_Price:2:=[SF_STOCKMOVEMENT_ITEMS:194]Unit_Cost_Value:6
						[PRODUCTS_SUPPLIERS:148]Margin:3:=Gen_Round((DivideBy(([PRODUCTS:9]Sales_Price:9-[PRODUCTS_SUPPLIERS:148]Cost_Price:2); [PRODUCTS:9]Sales_Price:9)*100); 2; 4)  // 17/02/04 pb
						DB_SaveRecord(->[PRODUCTS_SUPPLIERS:148])
						AA_CheckFileUnlocked(->[PRODUCTS:9]X_ID:43)
						UNLOAD RECORD:C212([PRODUCTS_SUPPLIERS:148])
						READ ONLY:C145([PRODUCTS_SUPPLIERS:148])
					End if 
				End if 
			End if 
			
		End if 
		[SF_STOCKMOVEMENT_ITEMS:194]Total_Cost_Value:7:=Gen_Round(([SF_STOCKMOVEMENT_ITEMS:194]Unit_Cost_Value:6*Abs:C99([SF_STOCKMOVEMENT_ITEMS:194]Quantity:4)); 2; 2)  //4.0.035/6
		If ([SF_STOCKMOVEMENT_ITEMS:194]Unit_Cost_Previous:19#0) | (STK_l_ClassDirection=1) | (STK_l_ClassDirection=-1)  //1 means in coming or -1 means outgoing
			
			//if in coming
			[SF_STOCKMOVEMENT_ITEMS:194]Stock_item_AccountingUnitCost:40:=[SF_STOCKMOVEMENT_ITEMS:194]Unit_Cost_Value:6
			//anything else
			If ([SF_STOCKMOVEMENT_ITEMS:194]Unit_Cost_Previous:19#0)
				[SF_STOCKMOVEMENT_ITEMS:194]Stock_item_AccountingUnitCost:40:=[SF_STOCKMOVEMENT_ITEMS:194]Unit_Cost_Value:6-[SF_STOCKMOVEMENT_ITEMS:194]Unit_Cost_Previous:19
			End if 
			//if outgoing
			//[SF_STOCKMOVEMENT_ITEMS]Stock_item_AccountingUnitCost-[SF_STOCKMOVEMENT_ITEMS]Unit_Cost_Value
			
			[SF_STOCKMOVEMENT_ITEMS:194]Stock_Item_AccountingCostTotal:41:=Gen_Round(([SF_STOCKMOVEMENT_ITEMS:194]Stock_item_AccountingUnitCost:40*Abs:C99([SF_STOCKMOVEMENT_ITEMS:194]Quantity:4)); 2; 2)
		End if 
		vTot:=1
		DB_bo_RecordModified:=True:C214
		Macro_AccTypePt(->[SF_STOCKMOVEMENT_ITEMS:194]Unit_Cost_Value:6)
		
	: ($1=(->[SF_STOCKMOVEMENT_ITEMS:194]Total_Cost_Value:7))
		If ([SF_STOCKMOVEMENT_ITEMS:194]Unit_Cost_Previous:19#0) | (STK_l_ClassDirection=1) | (STK_l_ClassDirection=-1)  //1 means in coming or -1 means outgoing
			[SF_STOCKMOVEMENT_ITEMS:194]Unit_Cost_Value:6:=Gen_Round(([SF_STOCKMOVEMENT_ITEMS:194]Total_Cost_Value:7/Abs:C99([SF_STOCKMOVEMENT_ITEMS:194]Quantity:4)); 2; 2)  //4.0.035/6If ([SF_STOCKMOVEMENT_ITEMS]Unit_Cost_Previous#0) | (STK_l_ClassDirection=1) | (STK_l_ClassDirection=-1)//1 means in coming or -1 means outgoing																\
				
			
			//if in coming
			[SF_STOCKMOVEMENT_ITEMS:194]Stock_item_AccountingUnitCost:40:=[SF_STOCKMOVEMENT_ITEMS:194]Unit_Cost_Value:6
			//anything else
			If ([SF_STOCKMOVEMENT_ITEMS:194]Unit_Cost_Previous:19#0)
				[SF_STOCKMOVEMENT_ITEMS:194]Stock_item_AccountingUnitCost:40:=[SF_STOCKMOVEMENT_ITEMS:194]Unit_Cost_Value:6-[SF_STOCKMOVEMENT_ITEMS:194]Unit_Cost_Previous:19
			End if 
			//if outgoing
			//[SF_STOCKMOVEMENT_ITEMS]Stock_item_AccountingUnitCost-[SF_STOCKMOVEMENT_ITEMS]Unit_Cost_Value
			
			[SF_STOCKMOVEMENT_ITEMS:194]Stock_Item_AccountingCostTotal:41:=Gen_Round(([SF_STOCKMOVEMENT_ITEMS:194]Stock_item_AccountingUnitCost:40*Abs:C99([SF_STOCKMOVEMENT_ITEMS:194]Quantity:4)); 2; 2)
		End if 
		vTot:=1
		DB_bo_RecordModified:=True:C214
		Macro_AccTypePt(->[SF_STOCKMOVEMENT_ITEMS:194]Total_Cost_Value:7)
		
	: ($1=(->[SF_STOCKMOVEMENT_ITEMS:194]Stock_Item_Location:13))
		Check_MinorNC(->[SF_STOCKMOVEMENT_ITEMS:194]Stock_Item_Location:13; "Location"; ->[LOCATIONS:61]; ->[LOCATIONS:61]Location_Code:1; ->[LOCATIONS:61]Location_Name:2)
		DB_bo_RecordModified:=True:C214
		Macro_AccTypePt(->[SF_STOCKMOVEMENT_ITEMS:194]Stock_Item_Location:13)
End case 
ERR_MethodTrackerReturn("STK_SFITEM_Lpx"; $_t_oldMethodName)
