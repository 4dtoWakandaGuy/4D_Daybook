//%attributes = {}

If (False:C215)
	//Project Method Name:      PROD_LoadComponents
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  22/11/2009
	//Created BY:  Nigel Greenlee
	
	//Date Modified: 
	//Modified By: DefaultUser
	//Modification notes
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(PRD_abo_AdditionalOrderItems;0)
	//ARRAY BOOLEAN(PRD_abo_IgnorePricing;0)
	//ARRAY BOOLEAN(PRD_abo_IsProductBrand;0)
	//ARRAY BOOLEAN(PRD_abo_isProductGroup;0)
	//ARRAY BOOLEAN(PRD_abo_OptionalComponents;0)
	//ARRAY BOOLEAN(PRD_LB_ProdComponents;0)
	//ARRAY BOOLEAN(PROD_abo_ComponentsModified;0)
	//ARRAY BOOLEAN(PROD_lb_SubsComponents;0)
	//ARRAY LONGINT(PRD_al_CatalogueID;0)
	//ARRAY LONGINT(PRD_al_SectionID;0)
	//ARRAY LONGINT(PROD_al_ComponentID;0)
	//ARRAY LONGINT(PROD_al_ComponentsDEL;0)
	//ARRAY LONGINT(PTD_al_ComponentType;0)
	//ARRAY LONGINT(PTD_al_ComponentTypes;0)
	//ARRAY REAL(PROD_ar_ComponentsQTY;0)
	ARRAY TEXT:C222($_at_ComponentNames; 0)
	//ARRAY TEXT(PRD_at_BuildMacro;0)
	//ARRAY TEXT(PRD_at_GroupCode;0)
	//ARRAY TEXT(PRD_at_MacroCode;0)
	//ARRAY TEXT(PRD_at_RelatedThing;0)
	//ARRAY TEXT(PRD_at_SectionName;0)
	//ARRAY TEXT(PROD_at_ComponentsCode;0)
	//ARRAY TEXT(PROD_at_ComponentsDEL;0)
	//ARRAY TEXT(PROD_at_ComponentsNM;0)
	//ARRAY TEXT(PROD_at_ComponentUnique;0)
	C_BOOLEAN:C305($_bo_SetLB; $1; $3; PROD_bo_CompCheckReady; PROD_bo_ShowAlert)
	C_LONGINT:C283($_l_ComponentRow; $_l_Index; $_l_SizeofArray; bPROD_l_ComponentsDelete; bPROD_l_Componentsmodify; PROc_l_BUT1; PROc_l_BUT10; PROc_l_BUT11; PROc_l_But12; PROc_l_BUT13; PROc_l_BUT14)
	C_LONGINT:C283(PROc_l_BUT15; PROc_l_BUT16; PROc_l_BUT17; PROc_l_BUT18; PROc_l_BUT19; PROc_l_But2; PROc_l_BUT3; PROc_l_BUT4; PROc_l_BUT5; PROc_l_BUT6; PROc_l_BUT7)
	C_LONGINT:C283(PROc_l_BUT8; PROc_l_BUT9; Prod_ComponentCheck; PROD_l_ComponentCheck; PROD_l_ComponentResult; PROD_l_curComponentsQTY; PROD_l_CurrentComponentsStatus)
	C_TEXT:C284($_t_CatalogueIDSTR; $_t_oldMethodName; $2; oComponents_COL1; oComponents_COL10; oComponents_COL11; oComponents_COL12; oComponents_COL13; oComponents_COL14; oComponents_COL15; oComponents_COL16)
	C_TEXT:C284(oComponents_COL17; oComponents_COL18; oComponents_COL19; oComponents_COL2; oComponents_COL3; oComponents_COL4; oComponents_COL5; oComponents_COL6; oComponents_COL7; oComponents_COL8; oComponents_COL9)
	C_TEXT:C284(oComponents_HED1; oComponents_HED10; oComponents_HED11; oComponents_HED12; oComponents_HED13; oComponents_HED14; oComponents_HED15; oComponents_HED16; oComponents_HED17; oComponents_HED18; oComponents_HED19)
	C_TEXT:C284(oComponents_HED2; oComponents_HED3; oComponents_HED4; oComponents_HED5; oComponents_HED6; oComponents_HED7; oComponents_HED8; oComponents_HED9; PROD_t_curComponentsCode; PROD_t_curComponentsNM; PROD_t_ParentProductCode)
	C_TEXT:C284(PROD_t_ProductCode; PROD_t_RetProductCode; PROD_t_RetProductName)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("PROD_LoadComponents")
//NG MAY 2004 New method to load
READ WRITE:C146([COMPONENTS:86])
If (Record number:C243([PRODUCTS:9])#-3)
	QUERY:C277([COMPONENTS:86]; [COMPONENTS:86]Product_Code:1=[PRODUCTS:9]Product_Code:1)
	QUERY SELECTION:C341([COMPONENTS:86]; [COMPONENTS:86]UniqueValue:4="")
Else 
	REDUCE SELECTION:C351([COMPONENTS:86]; 0)
End if 
If (Records in selection:C76([COMPONENTS:86])>0)
	DB_lockFile(->[COMPONENTS:86])
	For ($_l_Index; 1; Records in selection:C76([COMPONENTS:86]))
		Case of 
			: ([COMPONENTS:86]Component_is_Product_Group:15)
				[COMPONENTS:86]UniqueValue:4:=BLD_FIXEDLENGTH(25; [COMPONENTS:86]Product_Code:1; "*GROUPS")
			: ([COMPONENTS:86]Component_is_Product_Brand:16)
				[COMPONENTS:86]UniqueValue:4:=BLD_FIXEDLENGTH(25; [COMPONENTS:86]Product_Code:1; "*BRANDS")
			: ([COMPONENTS:86]Component_Code:2#"")
				[COMPONENTS:86]UniqueValue:4:=BLD_FIXEDLENGTH(25; [COMPONENTS:86]Product_Code:1; [COMPONENTS:86]Component_Code:2)
			: ([COMPONENTS:86]Catalogue_ID:7#0)
				$_t_CatalogueIDSTR:=String:C10([COMPONENTS:86]Catalogue_ID:7)
				[COMPONENTS:86]UniqueValue:4:=BLD_FIXEDLENGTH(25; [COMPONENTS:86]Product_Code:1; $_t_CatalogueIDSTR)
			: ([COMPONENTS:86]Group_Code:8#"")
				[COMPONENTS:86]UniqueValue:4:=BLD_FIXEDLENGTH(25; [COMPONENTS:86]Product_Code:1; [COMPONENTS:86]Group_Code:8)
			: ([COMPONENTS:86]Macro_Rule:9#"")
				[COMPONENTS:86]UniqueValue:4:=BLD_FIXEDLENGTH(25; [COMPONENTS:86]Product_Code:1; [COMPONENTS:86]Macro_Rule:9)
				//NG may 2004 the above line said [products]product code
		End case 
		DB_SaveRecord(->[COMPONENTS:86])
		NEXT RECORD:C51([COMPONENTS:86])
	End for 
	//zAPPLY TO SELECTION([COMPONENTS];[COMPONENTS]UniqueValue:=BLD_FIXEDLENGTH (25;[PRODUCTS]Product Code;[COMPONENTS]Component Code))
	AA_CheckFileUnlockedByTableNUM(Table:C252(->[COMPONENTS:86]))
End if 
READ WRITE:C146([COMPONENTS:86])
If (Record number:C243([PRODUCTS:9])#-3)
	QUERY:C277([COMPONENTS:86]; [COMPONENTS:86]Product_Code:1=[PRODUCTS:9]Product_Code:1)
	QUERY SELECTION:C341([COMPONENTS:86]; [COMPONENTS:86]UniqueValue:4="")
Else 
	REDUCE SELECTION:C351([COMPONENTS:86]; 0)
End if 

If (Records in selection:C76([COMPONENTS:86])>0)
	DB_lockFile(->[COMPONENTS:86])
	APPLY TO SELECTION:C70([COMPONENTS:86]; [COMPONENTS:86]X_ComponentID:21:=AA_GetNextID(->[COMPONENTS:86]X_ComponentID:21))
	AA_CheckFileUnlockedByTableNUM(Table:C252(->[COMPONENTS:86]))
End if 
If ($1=False:C215)
	UNLOAD RECORD:C212([COMPONENTS:86])
	READ ONLY:C145([COMPONENTS:86])
End if 
If ($2#"")
	QUERY:C277([COMPONENTS:86]; [COMPONENTS:86]Product_Code:1=$2; *)
	QUERY:C277([COMPONENTS:86];  & ; [COMPONENTS:86]X_ProductNoLongeravailable:5>=0)
Else 
	REDUCE SELECTION:C351([COMPONENTS:86]; 0)
End if 
If (Count parameters:C259>=3)
	$_bo_SetLB:=$3
Else 
	$_bo_SetLB:=True:C214
End if 

SELECTION TO ARRAY:C260([COMPONENTS:86]UniqueValue:4; PROD_at_ComponentUnique; [COMPONENTS:86]X_ComponentID:21; PROD_al_ComponentID)
ARRAY TEXT:C222(PROD_at_ComponentsCode; 0)
ARRAY TEXT:C222(PROD_at_ComponentsNM; 0)
ARRAY REAL:C219(PROD_ar_ComponentsQTY; 0)
If ($_bo_SetLB)
	ARRAY BOOLEAN:C223(PROD_abo_ComponentsModified; 0)
	ARRAY TEXT:C222(PROD_at_ComponentsDEL; 0)  //To track any deleted
	ARRAY LONGINT:C221(PROD_al_ComponentsDEL; 0)
End if   //note if you dont reset the listbox when you relead the records and there are any deletiongs they would re-appear on the screen. so you hace to deal with them -remove them from the arrays
//````
//``
OBJECT SET VISIBLE:C603(bPROD_l_Componentsmodify; True:C214)
OBJECT SET TITLE:C194(bPROD_l_Componentsmodify; "Add")
OBJECT SET VISIBLE:C603(bPROD_l_ComponentsDelete; False:C215)
PROD_l_CurrentComponentsStatus:=0
OBJECT SET VISIBLE:C603(PROD_t_curComponentsCode; False:C215)
OBJECT SET VISIBLE:C603(PROD_t_curComponentsNM; False:C215)
OBJECT SET VISIBLE:C603(PROD_l_curComponentsQTY; False:C215)
READ ONLY:C145([CONTRACT_RECORD_ANALYSIS:88])
Case of 
	: ([PRODUCTS:9]x_Product_Entry_Class:55=0) | ([PRODUCTS:9]x_Product_Entry_Class:55=1)  //standard product
		SELECTION TO ARRAY:C260([COMPONENTS:86]UniqueValue:4; PROD_at_ComponentUnique; [COMPONENTS:86]Component_Code:2; PROD_at_ComponentsCode; [COMPONENTS:86]Quantity:3; PROD_ar_ComponentsQTY; [COMPONENTS:86]X_ComponentID:21; PROD_al_ComponentID)
		
		ARRAY TEXT:C222(PROD_at_ComponentsNM; Size of array:C274(PROD_at_ComponentUnique))
		ARRAY BOOLEAN:C223(PROD_abo_ComponentsModified; Size of array:C274(PROD_at_ComponentUnique))
		
		
		If (PROD_l_ComponentCheck=0)
			If ([PRODUCTS:9]Product_Code:1#Char:C90(64))
				PROD_bo_CompCheckReady:=False:C215
				PROD_l_ComponentCheck:=New process:C317("Prod_ComponentChecker"; 128000; "Check_Product Components"; Current process:C322)
				Repeat 
					DelayTicks(2)
				Until (PROD_bo_CompCheckReady)
			End if 
			
		End if 
		
		
		For ($_l_Index; 1; Size of array:C274(PROD_abo_ComponentsModified))
			If (PROD_abo_ComponentsModified{$_l_Index})
				PROD_l_ComponentResult:=0
				PROD_t_RetProductCode:=""
				PROD_t_RetProductName:=""
				While (Test semaphore:C652("$CompCheckerBusy"))
					DelayTicks(5)
				End while 
				SET PROCESS VARIABLE:C370(PROD_l_ComponentCheck; PROD_t_ParentProductCode; [PRODUCTS:9]Product_Code:1)
				SET PROCESS VARIABLE:C370(PROD_l_ComponentCheck; PROD_bo_ShowAlert; False:C215)
				SET PROCESS VARIABLE:C370(PROD_l_ComponentCheck; PROD_t_ProductCode; PROD_at_ComponentsCode{$_l_Index})
				Repeat 
					DelayTicks(6)
				Until (PROD_l_ComponentResult#0)
				CLEAR SEMAPHORE:C144("$CompCheckerBusy")
				Case of 
					: (PROD_l_ComponentResult=-2)
						//PRODUCT DOES NOT EXIST
						APPEND TO ARRAY:C911(PROD_al_ComponentsDEL; PROD_al_ComponentID{$_l_Index})
						
					: (PROD_l_ComponentResult=-1)
						//PRODUCC CODE IS SAME
						APPEND TO ARRAY:C911(PROD_al_ComponentsDEL; PROD_al_ComponentID{$_l_Index})
						
					: (PROD_l_ComponentResult=1)
						PROD_at_ComponentsNM{$_l_Index}:=PROD_t_RetProductName
				End case 
			End if 
		End for 
		If ($_bo_SetLB)
			PROD_at_ComponentsCode{0}:=""
			PROD_at_ComponentsNM{0}:=""
			PROD_at_ComponentsCode:=0
			PROD_at_ComponentsNM:=0
			PROD_ar_ComponentsQTY{0}:=0
			PROD_ar_ComponentsQTY:=0
			PROD_al_ComponentID{0}:=0
			ARRAY BOOLEAN:C223(PRD_LB_ProdComponents; 0)
			LB_SetupListbox(->PRD_LB_ProdComponents; "oComponents"; "PROc_L"; 1; ->PROD_al_ComponentID; ->PROD_at_ComponentsCode; ->PROD_at_ComponentsNM; ->PROD_ar_ComponentsQTY; ->PROD_at_ComponentUnique; ->PROD_abo_ComponentsModified)
			LB_SetEnterable(->PRD_LB_ProdComponents; False:C215; 0)
			LB_SetEnterable(->PRD_LB_ProdComponents; True:C214; 2)
			LB_SetEnterable(->PRD_LB_ProdComponents; True:C214; 4)
			LB_SetFormat(->PRD_LB_ProdComponents; 2; ""; 4; 4; 3)
			LB_SetColumnHeaders(->PRD_LB_ProdComponents; "PROc_L"; 1; "ID"; "Component Code"; "Name"; "Qty"; "unique code"; "Modified")
			LB_SetColumnWidths(->PRD_LB_ProdComponents; "oComponents"; 1; 0; 95; 162; 42; 0; 0)
			LB_SetScroll(->PRD_LB_ProdComponents; -3; -2)
			LB_StyleSettings(->PRD_LB_ProdComponents; "Black"; 9; "oComponents"; ->[PRODUCTS:9])
			
			LBI_Scrollonresize(->PRD_LB_ProdComponents)
			
		Else 
			
			If (Size of array:C274(PROD_al_ComponentsDEL)>0)
				//there are deletions and we are reloading the records
				For ($_l_Index; 1; Size of array:C274(PROD_al_ComponentsDEL))
					$_l_ComponentRow:=Find in array:C230(PROD_al_ComponentID; PROD_al_ComponentsDEL{$_l_Index})
					If ($_l_ComponentRow>0)
						LISTBOX DELETE ROWS:C914(PRD_LB_ProdComponents; $_l_ComponentRow)
					End if 
				End for 
			End if 
			
		End if 
	: ([PRODUCTS:9]x_Product_Entry_Class:55=2)  //Built Product
		ARRAY BOOLEAN:C223(PRD_abo_AdditionalOrderItems; 0)  //when included add an additional order item onto a sales order
		ARRAY TEXT:C222(PRD_at_BuildMacro; 0)  //use this to create a macro that creates the section code this will override the code output that is on a product
		ARRAY TEXT:C222(PRD_at_SectionName; 0)  //this is the names section of the built product code that this component will contribute to the constructed product code, the section will be from the format and only one instance of a section can be used on the components
		//if the component does not contribute to the product code this can be left blank
		ARRAY LONGINT:C221(PRD_al_CatalogueID; 0)  //if the range of products to choose from for the component can be grouped into a catalogue the id will be stored here
		ARRAY BOOLEAN:C223(PRD_abo_IsProductBrand; 0)  //if the range of products is  actually non existent and we want them to select a brand code this will be true..if this is true there cannot be a group code or catalogue id or a macro
		ARRAY BOOLEAN:C223(PRD_abo_isProductGroup; 0)  // like the above but select a group code
		ARRAY TEXT:C222($_at_ComponentNames; 0)  // local array because there is a already a component name column which used the product name
		ARRAY LONGINT:C221(PTD_al_ComponentType; 0)  //this will say , 'Product' 'Range of products select one' 'Range of products select many' 'Product Group(select one)' 'Product brand(select one)'
		ARRAY TEXT:C222(PRD_at_GroupCode; 0)  //if tis is set the rand of products is all products with a given product group code
		ARRAY BOOLEAN:C223(PRD_abo_IgnorePricing; 0)  //if this is set we will not bring through pricinging to the build product any pricing
		ARRAY TEXT:C222(PRD_at_MacroCode; 0)  //this will assign a macro to get the selection of products to display
		ARRAY BOOLEAN:C223(PRD_abo_OptionalComponents; 0)  // if the component is optional it is possible to select nothing. Note that were the compoenet must return a 'nothing' code then you must create a product for the nothing that returns the code)
		ARRAY REAL:C219(PROD_ar_ComponentsQTY; 0)  //not changing this to a real!!! in the context of a build product this is the default quantity to select
		ARRAY TEXT:C222(PRD_at_MacroCode; 0)
		ARRAY TEXT:C222(PROD_at_ComponentsCode; 0)  //this is used when the component is a product.
		ARRAY TEXT:C222(PRD_at_RelatedThing; 0)
		ARRAY TEXT:C222(PROD_at_ComponentsNM; 0)
		ARRAY BOOLEAN:C223(PROD_abo_ComponentsModified; 0)
		SELECTION TO ARRAY:C260([COMPONENTS:86]UniqueValue:4; PROD_at_ComponentUnique; [COMPONENTS:86]Component_Code:2; PROD_at_ComponentsCode; [COMPONENTS:86]Quantity:3; PROD_ar_ComponentsQTY; [COMPONENTS:86]Optional_Component:11; PRD_abo_OptionalComponents; [COMPONENTS:86]Macro_Rule:9; PRD_at_MacroCode; [COMPONENTS:86]Ignore_Pricing:13; PRD_abo_IgnorePricing; [COMPONENTS:86]Group_Code:8; PRD_at_GroupCode; [COMPONENTS:86]Component_Type:6; PTD_al_ComponentTypes; [COMPONENTS:86]Component_is_Product_Group:15; PRD_abo_isProductGroup; [COMPONENTS:86]Component_is_Product_Brand:16; PRD_abo_IsProductBrand; [COMPONENTS:86]Component_Name:17; $_at_ComponentNames; [COMPONENTS:86]Catalogue_ID:7; PRD_al_CatalogueID; [COMPONENTS:86]Build_Code_Section:10; PRD_at_SectionName; [COMPONENTS:86]Build_Code_Macro:14; PRD_at_BuildMacro; [COMPONENTS:86]Additional_Order_Item:12; PRD_abo_AdditionalOrderItems; [COMPONENTS:86]X_Build_Code_Section_ID:18; PRD_al_SectionID; [COMPONENTS:86]X_ComponentID:21; PROD_al_ComponentID)
		
		
		$_l_SizeofArray:=Size of array:C274(PROD_at_ComponentUnique)
		ARRAY TEXT:C222(PROD_at_ComponentsNM; $_l_SizeofArray)
		ARRAY BOOLEAN:C223(PROD_abo_ComponentsModified; $_l_SizeofArray)
		ARRAY TEXT:C222(PRD_at_RelatedThing; $_l_SizeofArray)
		
		
		
		If (PROD_l_ComponentCheck=0)
			PROD_bo_CompCheckReady:=False:C215
			PROD_l_ComponentCheck:=New process:C317("Prod_ComponentChecker"; 128000; "Check_Product Components"; Current process:C322; [PRODUCTS:9]Product_Code:1)
			Repeat 
				DelayTicks(2)
			Until (PROD_bo_CompCheckReady)
		End if 
		
		
		For ($_l_Index; 1; Size of array:C274(PROD_abo_ComponentsModified))
			Case of 
				: (PRD_abo_IsProductBrand{$_l_Index})
					PRD_at_RelatedThing{$_l_Index}:="All Brands"
				: (PRD_abo_IsProductBrand{$_l_Index})
					PRD_at_RelatedThing{$_l_Index}:="All Product Groups"
				: (PRD_al_CatalogueID{$_l_Index}#0)
					QUERY:C277([CATALOGUE:108]; [CATALOGUE:108]x_ID:1=PRD_al_CatalogueID{$_l_Index})
					
					PRD_at_RelatedThing{$_l_Index}:="Products_In Catalogue "+[CATALOGUE:108]Catalogue_Name:2
				: (PRD_at_GroupCode{$_l_Index}#"")
					QUERY:C277([PRODUCT_GROUPS:10]; [PRODUCT_GROUPS:10]Group_Code:1=PRD_at_GroupCode{$_l_Index})
					PRD_at_RelatedThing{$_l_Index}:="Products_In product groups "+[PRODUCT_GROUPS:10]Group_Name:2
				: (PRD_at_MacroCode{$_l_Index}#"")
					QUERY:C277([SCRIPTS:80]; [SCRIPTS:80]Script_Code:1=PRD_at_MacroCode{$_l_Index})
					PRD_at_RelatedThing{$_l_Index}:="Products Found by Macro "+[SCRIPTS:80]Script_Name:2
			End case 
			
			If ($_at_ComponentNames{$_l_Index}="")
				PROD_l_ComponentResult:=0
				PROD_t_RetProductCode:=""
				PROD_t_RetProductName:=""
				
				
				While (Test semaphore:C652("$CompCheckerBusy"))
					DelayTicks(5)
				End while 
				SET PROCESS VARIABLE:C370(PROD_l_ComponentCheck; PROD_bo_ShowAlert; False:C215)
				SET PROCESS VARIABLE:C370(PROD_l_ComponentCheck; PROD_t_ProductCode; PROD_at_ComponentsCode{$_l_Index})
				Repeat 
					DelayTicks(6)
				Until (PROD_l_ComponentResult#0)
				CLEAR SEMAPHORE:C144("$CompCheckerBusy")
				Case of 
					: (PROD_l_ComponentResult=-2)
						//PRODUCT DOES NOT EXIST
						APPEND TO ARRAY:C911(PROD_al_ComponentsDEL; PROD_al_ComponentID{$_l_Index})
						
					: (PROD_l_ComponentResult=-1)
						APPEND TO ARRAY:C911(PROD_al_ComponentsDEL; PROD_al_ComponentID{$_l_Index})
						//PRODUCC CODE IS SAME
						
					: (PROD_l_ComponentResult=1)
						PROD_at_ComponentsNM{$_l_Index}:=PROD_t_RetProductName
				End case 
			Else 
				PROD_at_ComponentsNM{$_l_Index}:=$_at_ComponentNames{$_l_Index}
			End if 
		End for 
		If ($_bo_SetLB)
			PROD_at_ComponentsCode{0}:=""
			PROD_at_ComponentsNM{0}:=""
			PROD_at_ComponentsCode:=0
			PROD_at_ComponentsNM:=0
			PROD_ar_ComponentsQTY{0}:=0
			PROD_ar_ComponentsQTY:=0
			LB_SetupListbox(->PRD_LB_ProdComponents; "oComponents"; "PROc_L"; 1; ->PROD_al_ComponentID; ->PRD_abo_OptionalComponents; ->PRD_abo_AdditionalOrderItems; ->PROD_at_ComponentsNM; ->PRD_at_RelatedThing; ->PTD_al_ComponentTypes; ->PRD_at_SectionName; ->PROD_ar_ComponentsQTY; ->PRD_abo_IgnorePricing; ->PROD_at_ComponentUnique; ->PROD_abo_ComponentsModified; ->PRD_abo_IsProductBrand; ->PRD_abo_isProductGroup; ->PRD_at_GroupCode; ->PRD_at_MacroCode; ->PRD_al_CatalogueID; ->PROD_at_ComponentsCode; ->PRD_at_BuildMacro; ->PRD_al_SectionID)
			
			LB_SetEnterable(->PRD_LB_ProdComponents; False:C215; 0)
			
			//LB_SetFormat (->PRD_LB_ProdComponents;2;"";3;3;2)
			LB_SetColumnHeaders(->PRD_LB_ProdComponents; "PROc_L"; 1; "ID"; "Optional"; "Additional"; "Name"; "Select From"; "Selection Type"; "Product Code Section"; "Default Qty"; "Ignore  Prices"; "Unique ident"; "Modified"; "is a brand"; "Is a group"; "Group Code"; "Macro Code"; "Catalogue ID"; "Product Code"; "Macroforsectioncode")
			
			LB_SetColumnWidths(->PRD_LB_ProdComponents; "oComponents"; 1; 0; 55; 55; 165; 165; 165; 165; 55; 35; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0)
			LB_SetScroll(->PRD_LB_ProdComponents; -3; -2)
			LB_StyleSettings(->PRD_LB_ProdComponents; "Black"; 9; "oComponents"; ->[PRODUCTS:9])
			LBI_Scrollonresize(->PRD_LB_ProdComponents)
			
		Else 
			If (Size of array:C274(PROD_al_ComponentsDEL)>0)
				//there are deletions and we are reloading the records
				For ($_l_Index; 1; Size of array:C274(PROD_al_ComponentsDEL))
					$_l_ComponentRow:=Find in array:C230(PROD_al_ComponentID; PROD_al_ComponentsDEL{$_l_Index})
					If ($_l_ComponentRow>0)
						LISTBOX DELETE ROWS:C914(PRD_LB_ProdComponents; $_l_ComponentRow)
					End if 
				End for 
			End if 
			
			
			
		End if 
	: ([PRODUCTS:9]x_Product_Entry_Class:55=4)  //Linked SUbscription Product
		SELECTION TO ARRAY:C260([COMPONENTS:86]UniqueValue:4; PROD_at_ComponentUnique; [COMPONENTS:86]Component_Code:2; PROD_at_ComponentsCode; [COMPONENTS:86]Quantity:3; PROD_ar_ComponentsQTY; [COMPONENTS:86]X_ComponentID:21; PROD_al_ComponentID)
		
		ARRAY TEXT:C222(PROD_at_ComponentsNM; Size of array:C274(PROD_at_ComponentUnique))
		ARRAY BOOLEAN:C223(PROD_abo_ComponentsModified; Size of array:C274(PROD_at_ComponentUnique))
		
		
		If (PROD_l_ComponentCheck=0)
			If ([PRODUCTS:9]Product_Code:1#Char:C90(64))
				PROD_bo_CompCheckReady:=False:C215
				PROD_l_ComponentCheck:=New process:C317("Prod_ComponentChecker"; 128000; "Check_Product Components"; Current process:C322)
				Repeat 
					DelayTicks(2)
				Until (PROD_bo_CompCheckReady)
			End if 
			
		End if 
		
		
		For ($_l_Index; 1; Size of array:C274(PROD_abo_ComponentsModified))
			If (PROD_abo_ComponentsModified{$_l_Index})
				PROD_l_ComponentResult:=0
				PROD_t_RetProductCode:=""
				PROD_t_RetProductName:=""
				While (Test semaphore:C652("$CompCheckerBusy"))
					DelayTicks(5)
				End while 
				SET PROCESS VARIABLE:C370(PROD_l_ComponentCheck; PROD_t_ParentProductCode; [PRODUCTS:9]Product_Code:1)
				SET PROCESS VARIABLE:C370(PROD_l_ComponentCheck; PROD_bo_ShowAlert; False:C215)
				SET PROCESS VARIABLE:C370(PROD_l_ComponentCheck; PROD_t_ProductCode; PROD_at_ComponentsCode{$_l_Index})
				Repeat 
					DelayTicks(6)
				Until (PROD_l_ComponentResult#0)
				CLEAR SEMAPHORE:C144("$CompCheckerBusy")
				Case of 
					: (PROD_l_ComponentResult=-2)
						//PRODUCT DOES NOT EXIST
						APPEND TO ARRAY:C911(PROD_al_ComponentsDEL; PROD_al_ComponentID{$_l_Index})
						
					: (PROD_l_ComponentResult=-1)
						//PRODUCC CODE IS SAME
						APPEND TO ARRAY:C911(PROD_al_ComponentsDEL; PROD_al_ComponentID{$_l_Index})
						
					: (PROD_l_ComponentResult=1)
						PROD_at_ComponentsNM{$_l_Index}:=PROD_t_RetProductName
				End case 
			End if 
		End for 
		If ($_bo_SetLB)
			PROD_at_ComponentsCode{0}:=""
			PROD_at_ComponentsNM{0}:=""
			PROD_at_ComponentsCode:=0
			PROD_at_ComponentsNM:=0
			PROD_ar_ComponentsQTY{0}:=0
			PROD_ar_ComponentsQTY:=0
			PROD_al_ComponentID{0}:=0
			ARRAY BOOLEAN:C223(PROD_lb_SubsComponents; 0)
			LB_SetupListbox(->PROD_lb_SubsComponents; "oComponents"; "PROc_L"; 1; ->PROD_al_ComponentID; ->PROD_at_ComponentsCode; ->PROD_at_ComponentsNM; ->PROD_ar_ComponentsQTY; ->PROD_at_ComponentUnique; ->PROD_abo_ComponentsModified)
			LB_SetEnterable(->PROD_lb_SubsComponents; False:C215; 0)
			LB_SetEnterable(->PROD_lb_SubsComponents; True:C214; 2)
			LB_SetEnterable(->PROD_lb_SubsComponents; True:C214; 4)
			LB_SetFormat(->PROD_lb_SubsComponents; 2; ""; 4; 4; 3)
			LB_SetColumnHeaders(->PROD_lb_SubsComponents; "PROc_L"; 1; "ID"; "Component Code"; "Name"; "Qty"; "unique code"; "Modified")
			LB_SetColumnWidths(->PROD_lb_SubsComponents; "oComponents"; 1; 0; 95; 162; 4; 0; 0)
			LB_SetScroll(->PROD_lb_SubsComponents; -3; -2)
			LB_StyleSettings(->PROD_lb_SubsComponents; "Black"; 9; "oComponents"; ->[PRODUCTS:9])
			
			LBI_Scrollonresize(->PROD_lb_SubsComponents)
			
		Else 
			
			If (Size of array:C274(PROD_al_ComponentsDEL)>0)
				//there are deletions and we are reloading the records
				For ($_l_Index; 1; Size of array:C274(PROD_al_ComponentsDEL))
					$_l_ComponentRow:=Find in array:C230(PROD_al_ComponentID; PROD_al_ComponentsDEL{$_l_Index})
					If ($_l_ComponentRow>0)
						LISTBOX DELETE ROWS:C914(PROD_lb_SubsComponents; $_l_ComponentRow)
					End if 
				End for 
			End if 
			
		End if 
End case 
ERR_MethodTrackerReturn("PROD_LoadComponents"; $_t_oldMethodName)
