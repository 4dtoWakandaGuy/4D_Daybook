//%attributes = {}
If (False:C215)
	//Project Method Name:      Products_InLP_NEW
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:    25/02/2011 18:09 v7.0.0/B45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(PROD_al_EditMode;0)
	//ARRAY POINTER(PRD_aPtr_RelatedConfiguration;0)
	//ARRAY TEXT(PRD_at_ModeSupplier;0)
	C_BOOLEAN:C305(<>ProdGrpBrd; DB_bo_NoLoad; vMod2)
	C_LONGINT:C283(<>AutoProc; $_l_Event; DB_l_ButtonClickedFunction; iCancel; iOK; r6; r7; s1; s2; s3)
	C_PICTURE:C286(PROD_apic_ModePictProd)
	C_TEXT:C284($_t_oldMethodName; $Mand; DB_t_CUrrentInputMenuRef; DB_T_CurrentInputWindowMenu; IP_t_MessageReplySTR; vButtDisPro; vPAccount; vProdCode; vSAccount; vTitle4; WIN_t_CurrentInputForm)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Products_InLP_NEW")
//Products_InLP
//Prod in
$_l_Event:=Form event code:C388

Case of 
	: ($_l_Event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		OpenHelp(Table:C252(->[PRODUCTS:9]); WIN_t_CurrentInputForm)
		ARRAY TEXT:C222(PRD_at_ModeSupplier; 0)
		ARRAY LONGINT:C221(PROD_al_EditMode; 0)
		LBi_SetListBoxOptions(->PRD_at_ModeSupplier; ->PROD_al_EditMode; ->PROD_apic_ModePictProd)
		
		DB_l_ButtonClickedFunction:=0
		Products_InLPB_new
		
		
		
		// vBefore2P:=True
		//  Gen_PostKey (1;92;256)
		//: (vBefore2P)
		//   vBefore2P:=False
		Products_InLPß("B")
		
		
		If ([PRODUCTS:9]Group_Code:3="")
			GOTO OBJECT:C206([PRODUCTS:9]Group_Code:3)
		End if 
		
	: ($_l_Event=On Activate:K2:9)
		OpenHelp(Table:C252(->[PRODUCTS:9]); WIN_t_CurrentInputForm)
		
		In_ButtChkDis(->vButtDisPro)
		
	: ($_l_Event=On Outside Call:K2:11)
		Case of 
			: (DB_l_ButtonClickedFunction=DB_GetButtonFunction("FormWindows"))
				If (DB_t_CUrrentInputMenuRef#"") & (DB_T_CurrentInputWindowMenu#"")
					DB_T_CurrentInputWindowMenu:=DB_BuildWIndowsMenu(DB_T_CurrentInputWindowMenu)
					SET MENU BAR:C67(DB_t_CUrrentInputMenuRef)
				End if 
				DB_l_ButtonClickedFunction:=0
				
			: (DB_l_ButtonClickedFunction=DB_GetButtonFunction("Plus")) | (DB_l_ButtonClickedFunction=DB_GetButtonFunction("Minus")) | (DB_l_ButtonClickedFunction=DB_GetButtonFunction("Open"))
				Case of 
					: (FORM Get current page:C276=1)
						inButtSubHandle(FORM Get current page:C276; ->[PRODUCTS:9]; "Price")
					: (FORM Get current page:C276=2)
						inButtSubHandle(FORM Get current page:C276; ->[PRODUCTS:9]; "Stock")
					: (FORM Get current page:C276=3)
						
						inButtSubHandle(FORM Get current page:C276; ->[PRODUCTS:9]; "Supplier")
						
						
						
					: (FORM Get current page:C276=4)
						inButtSubHandle(FORM Get current page:C276; ->[PRODUCTS:9]; "FurthAnal")
					: (FORM Get current page:C276=5)
						inButtSubHandle(FORM Get current page:C276; ->[PRODUCTS:9]; "Component")
						
						
				End case 
				
			: (((DB_l_ButtonClickedFunction#0)) | (iOK=1) | (iCancel=1))
				Case of 
					: (DB_GetProductGroupBrand)
						$Mand:="1 3 4 5"
					: (DB_Get_ProductBrandPref)
						$Mand:="1 4 5"
					Else 
						$Mand:="1 5"
				End case 
				In_ButtCall("Products_InLPA"; ""; "Products_InDel"; ->[PRODUCTS:9]; ->[PRODUCTS:9]Product_Code:1; "Products"; $Mand; "Products_InLPß"; "Master"; "Prod_Sel"; ""; ->[IDENTIFIERS:16]; ->vButtDisPro; ->PRD_aPtr_RelatedConfiguration)
				
				
			Else 
				If (<>AutoProc=8888)
					<>AutoProc:=0
					Gen_Confirm3("Do you want to recalculate the Sales and Cost Prices, and the Weight of "+[PRODUCTS:9]Product_Code:1+" from its Components?"; "All"; "None"; "Weight only")
					If (OK=1)
						Prod_CompRecalc
					End if 
				End if 
				
				
				
				
		End case 
		
		
		
		
	: ($_l_Event=On Data Change:K2:15)
		
		Case of 
			: (Modified:C32([PRODUCTS:9]Short_Code:19))
				[PRODUCTS:9]Short_Code:19:=Uppers2([PRODUCTS:9]Short_Code:19)
				Products_InMod
				Macro_AccTypePt(->[PRODUCTS:9]Short_Code:19)
			: (Modified:C32([PRODUCTS:9]Product_Name:2))
				[PRODUCTS:9]Product_Name:2:=Uppers2([PRODUCTS:9]Product_Name:2)
				Products_InMod
				Macro_AccTypePt(->[PRODUCTS:9]Product_Name:2)
			: (Modified:C32([PRODUCTS:9]Description:6))
				Products_InMod
				Macro_AccTypePt(->[PRODUCTS:9]Description:6)
			: (Modified:C32([PRODUCTS:9]Sales_Price:9))
				Prod_CalcMarg
				Products_InLPß("S1")
				Products_InMod
				vMod2:=True:C214
				Macro_AccTypePt(->[PRODUCTS:9]Sales_Price:9)
			: (Modified:C32([PRODUCTS:9]Standard_Price:16))
				Products_InMod
				vMod2:=True:C214
				Macro_AccTypePt(->[PRODUCTS:9]Standard_Price:16)
			: (Modified:C32([PRODUCTS:9]Weight:26))
				Products_InMod
				vMod2:=True:C214
				Macro_AccTypePt(->[PRODUCTS:9]Weight:26)
			: (Modified:C32([PRODUCTS:9]Group_Code:3))
				Check_Minor(->[PRODUCTS:9]Group_Code:3; "Group"; ->[PRODUCT_GROUPS:10]; ->[PRODUCT_GROUPS:10]Group_Code:1; ->[PRODUCT_GROUPS:10]Group_Name:2; "Groups In")
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
			: (Modified:C32([PRODUCTS:9]Brand_Code:4))
				Check_Minor(->[PRODUCTS:9]Brand_Code:4; ""; ->[PRODUCT_BRANDS:8]; ->[PRODUCT_BRANDS:8]Brand_Code:1; ->[PRODUCT_BRANDS:8]Brand_Name:2; "Brands In"; "Brand")
				Products_InLPCo
				Products_InMod
				Macro_AccTypePt(->[PRODUCTS:9]Brand_Code:4)
			: (Modified:C32([PRODUCTS:9]Model_Code:5))
				RemoveLeadTr(Uppercase:C13([PRODUCTS:9]Model_Code:5); ->[PRODUCTS:9]Model_Code:5)
				If (((DB_GetProductGroupBrand) | (DB_Get_ProductBrandPref)) & (Length:C16([PRODUCTS:9]Model_Code:5)>255))
					Gen_Alert("The Model Code maximum length is 19 characters if the Groups and Brands are incl"+"uded in the Product Code"; "Try again")
					[PRODUCTS:9]Model_Code:5:=Substring:C12([PRODUCTS:9]Model_Code:5; 1; 255)
					REJECT:C38([PRODUCTS:9]Model_Code:5)
				Else 
					Products_InLPCo
					Products_InMod
				End if 
				Macro_AccTypePt(->[PRODUCTS:9]Model_Code:5)
			: (Modified:C32([PRODUCTS:9]Product_Code:1))
				RemoveLeadTr(Uppercase:C13([PRODUCTS:9]Product_Code:1); ->[PRODUCTS:9]Product_Code:1)
				[PRODUCTS:9]Model_Code:5:=[PRODUCTS:9]Product_Code:1
				Products_InMod
				Macro_AccTypePt(->[PRODUCTS:9]Product_Code:1)
			: (Modified:C32([PRODUCTS:9]Sales_Account:7))
				Check_MinorNC(->[PRODUCTS:9]Sales_Account:7; "SAccount"; ->[ACCOUNTS:32]; ->[ACCOUNTS:32]Account_Code:2; ->[ACCOUNTS:32]Account_Name:3; "Account")
				If ([PRODUCTS:9]Sales_Account:7#"")
					If (Check_AnalAcc(->[PRODUCTS:9]Sales_Account:7; ->[PRODUCTS:9]Analysis_Code:18; 1))
					End if 
				End if 
				If ([PRODUCTS:9]Sales_Account:7="")
					vSAccount:=""
				End if 
				Products_InMod
				Macro_AccTypePt(->[PRODUCTS:9]Sales_Account:7)
			: (Modified:C32([PRODUCTS:9]Purchase_Account:13))
				Check_MinorNC(->[PRODUCTS:9]Purchase_Account:13; "PAccount"; ->[ACCOUNTS:32]; ->[ACCOUNTS:32]Account_Code:2; ->[ACCOUNTS:32]Account_Name:3; "Account")
				If ([PRODUCTS:9]Purchase_Account:13#"")
					If (Check_AnalAcc(->[PRODUCTS:9]Purchase_Account:13; ->[PRODUCTS:9]Analysis_Code:18; 1))
					End if 
				End if 
				If ([PRODUCTS:9]Purchase_Account:13="")
					vPAccount:=""
				End if 
				Products_InMod
				Macro_AccTypePt(->[PRODUCTS:9]Purchase_Account:13)
			: (Modified:C32([PRODUCTS:9]Stock_Account:42))
				Check_MinorNC(->[PRODUCTS:9]Stock_Account:42; ""; ->[ACCOUNTS:32]; ->[ACCOUNTS:32]Account_Code:2; ->[ACCOUNTS:32]Account_Name:3; "Account")
				If ([PRODUCTS:9]Stock_Account:42#"")
					If (Check_AnalAcc(->[PRODUCTS:9]Stock_Account:42; ->[PRODUCTS:9]Analysis_Code:18; 1))
					End if 
				End if 
				Products_InMod
				Macro_AccTypePt(->[PRODUCTS:9]Stock_Account:42)
			: (Modified:C32([PRODUCTS:9]Analysis_Code:18))
				Check_Analysis(->[PRODUCTS:9]Analysis_Code:18; "Analysis"; ->[PRODUCTS:9]Sales_Account:7; ->[PRODUCTS:9]Purchase_Account:13)
				Products_InMod
				Macro_AccTypePt(->[PRODUCTS:9]Analysis_Code:18)
			: (Modified:C32([PRODUCTS:9]Maintain_Stock:14))
				// Stock_Calc
				Products_InMod
				Macro_AccTypePt(->[PRODUCTS:9]Maintain_Stock:14)
			: (Modified:C32([PRODUCTS:9]Superior:15))
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
			: (Modified:C32([PRODUCTS:9]Default_Tax:23))
				RELATE ONE:C42([PRODUCTS:9]Default_Tax:23; [TAX_CODES:35]Tax_Name:2)
				If (Records in selection:C76([TAX_CODES:35])=0)
					Gen_Alert("That is not a recognized VAT Code"; "Try again")
					[PRODUCTS:9]Default_Tax:23:=""
				End if 
				Products_InMod
				Macro_AccTypePt(->[PRODUCTS:9]Default_Tax:23)
			: (Modified:C32([PRODUCTS:9]Bundle_Assembly:36))
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
			: (Modified:C32([PRODUCTS:9]Commodity_Code:38))
				Products_InMod
				Macro_AccTypePt(->[PRODUCTS:9]Commodity_Code:38)
			: (Modified:C32([PRODUCTS:9]Size:39))
				Products_InMod
				Macro_AccTypePt(->[PRODUCTS:9]Size:39)
			: (Modified:C32([PRODUCTS:9]Price_Per:40))
				If ([PRODUCTS:9]Price_Per:40<1)
					Gen_Alert("The Price Per must be 1 or above")
					[PRODUCTS:9]Price_Per:40:=1
				End if 
				Products_InMod
				Macro_AccTypePt(->[PRODUCTS:9]Price_Per:40)
		End case 
	: ($_l_Event=On Deactivate:K2:10)
		//  PAUSE PROCESS(vProc)
End case 
ERR_MethodTrackerReturn("Products_InLP_NEW"; $_t_oldMethodName)
