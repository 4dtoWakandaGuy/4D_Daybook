If (False:C215)
	//Table Form Method Name: [COMPONENTS]EDIT_COMPONENT
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 14/04/2011 14:59
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(PC_abo_INCRestriction;0)
	//ARRAY BOOLEAN(PC_lb_Restrictions;0)
	//ARRAY LONGINT(MOD_al_ModuleBarNum;0)
	//ARRAY LONGINT(MOD_al_ModuleBarOffsets;0)
	//ARRAY LONGINT(PC_al_RestrictSection;0)
	//ARRAY LONGINT(PRD_al_EntryOrder;0)
	//ARRAY LONGINT(PRD_al_RestrictSections;0)
	//ARRAY LONGINT(PRD_al_SectionIDS;0)
	//ARRAY LONGINT(PRD_al_UsedSectionIDS;0)
	//ARRAY TEXT(PC_At_FilterName;0)
	//ARRAY TEXT(PC_at_RestrictionFIlter;0)
	//ARRAY TEXT(PRD_at_ComponentField;0)
	//ARRAY TEXT(PRD_at_RestrictSectionNames;0)
	//ARRAY TEXT(PRD_at_SectionNames;0)
	C_BOOLEAN:C305(DB_bo_NoLoad; PAL_bo_ButtonSubFunction; PC_bo_ComponentMod)
	C_LONGINT:C283($_l_ButtonNumber; $_l_event; $_l_Index; $_l_ModuleRow; $_l_offset; $PRD_l_RelationProcess; cRB1; cRB2; DB_l_WindowCurrentModule; ModuleNumber; PAL_but_LastRecord)
	C_LONGINT:C283(PAL_but_PreviousRecord; PAL_but_NextRecord; PAL_but_FirstRecord; PCL_l_BUT1; PCL_l_BUT10; PCL_l_BUT11; PCL_l_BUT12; PCL_l_BUT13; PCL_l_BUT14; PCL_l_BUT15; PCL_l_BUT16)
	C_LONGINT:C283(PCL_l_BUT17; PCL_l_BUT18; PCL_l_BUT19; PCL_l_BUT2; PCL_l_BUT20; PCL_l_BUT21; PCL_l_BUT22; PCL_l_BUT23; PCL_l_BUT24; PCL_l_BUT25; PCL_l_BUT26)
	C_LONGINT:C283(PCL_l_BUT27; PCL_l_BUT3; PCL_l_BUT4; PCL_l_BUT5; PCL_l_BUT6; PCL_l_BUT7; PCL_l_BUT8; PCL_l_BUT9; PRD_al_CodeFormatID)
	C_TEXT:C284($_t_oldMethodName; $_t_PalletButtonName; BAR_t_Button; DB_t_CUrrentInputMenuRef; oPCL_COL1; oPCL_COL10; oPCL_COL11; oPCL_COL12; oPCL_COL13; oPCL_COL14; oPCL_COL15)
	C_TEXT:C284(oPCL_COL16; oPCL_COL17; oPCL_COL18; oPCL_COL19; oPCL_COL2; oPCL_COL20; oPCL_COL21; oPCL_COL22; oPCL_COL23; oPCL_COL24; oPCL_COL25)
	C_TEXT:C284(oPCL_COL26; oPCL_COL27; oPCL_COL3; oPCL_COL4; oPCL_COL5; oPCL_COL6; oPCL_COL7; oPCL_COL8; oPCL_COL9; oPCL_HED1; oPCL_HED10)
	C_TEXT:C284(oPCL_HED11; oPCL_HED12; oPCL_HED13; oPCL_HED14; oPCL_HED15; oPCL_HED16; oPCL_HED17; oPCL_HED18; oPCL_HED19; oPCL_HED2; oPCL_HED20)
	C_TEXT:C284(oPCL_HED21; oPCL_HED22; oPCL_HED23; oPCL_HED24; oPCL_HED25; oPCL_HED26; oPCL_HED27; oPCL_HED3; oPCL_HED4; oPCL_HED5; oPCL_HED6)
	C_TEXT:C284(oPCL_HED7; oPCL_HED8; oPCL_HED9; PAL_BUTTON; PRD_t_MacroName; PRD_t_RelatedData; PRD_t_RelatedName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FM [COMPONENTS].EDIT_COMPONENT"; Form event code:C388)
$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		
		DB_SetnewToolBar
		If ([COMPONENTS:86]Product_Code:1="")
			[COMPONENTS:86]Product_Code:1:=[PRODUCTS:9]Product_Code:1
		End if 
		PC_bo_ComponentMod:=False:C215
		If ([COMPONENTS:86]Component_Type:6=0)
			//select one
			cRB1:=1
			cRB2:=0
		Else 
			cRB1:=0
			cRB2:=1
		End if 
		ARRAY LONGINT:C221(PRD_al_EntryOrder; 0)
		
		ARRAY TEXT:C222(PRD_at_ComponentField; 0)
		APPEND TO ARRAY:C911(PRD_at_ComponentField; "One Product")  //<-Default
		APPEND TO ARRAY:C911(PRD_at_ComponentField; "Products from Collection")
		APPEND TO ARRAY:C911(PRD_at_ComponentField; "Product using Script")
		APPEND TO ARRAY:C911(PRD_at_ComponentField; "Products from Group")
		
		APPEND TO ARRAY:C911(PRD_at_ComponentField; "Catalogue")
		PRD_t_RelatedData:=""
		PRD_t_RelatedName:=""
		If ([COMPONENTS:86]Component_is_Product_Brand:16) | ([COMPONENTS:86]Component_is_Product_Group:15)
			OBJECT SET ENTERABLE:C238(PRD_t_RelatedData; False:C215)
			OBJECT SET VISIBLE:C603(PRD_t_RelatedName; False:C215)
			ARRAY TEXT:C222(PRD_at_ComponentField; 0)
			If ([COMPONENTS:86]Component_is_Product_Brand:16)
				APPEND TO ARRAY:C911(PRD_at_ComponentField; "All Brands")
			Else 
				APPEND TO ARRAY:C911(PRD_at_ComponentField; "All Groups")
			End if 
			PRD_at_ComponentField:=1
		Else 
			Case of 
				: ([COMPONENTS:86]Catalogue_ID:7#0)
					PRD_t_RelatedData:=String:C10([COMPONENTS:86]Catalogue_ID:7)
					QUERY:C277([CATALOGUE:108]; [CATALOGUE:108]x_ID:1=[COMPONENTS:86]Catalogue_ID:7)
					PRD_t_RelatedName:=[CATALOGUE:108]Catalogue_Name:2
					PRD_at_ComponentField:=2
				: ([COMPONENTS:86]Component_Code:2#"")
					PRD_t_RelatedData:=[COMPONENTS:86]Component_Code:2
					PRD_t_RelatedName:=""
					$PRD_l_RelationProcess:=New process:C317("PRD_GetRelated"; 64000; "Get Related Data"; [COMPONENTS:86]Component_Code:2; Current process:C322)
					PRD_at_ComponentField:=1
					
				: ([COMPONENTS:86]Group_Code:8#"")
					PRD_t_RelatedData:=[COMPONENTS:86]Group_Code:8
					QUERY:C277([PRODUCT_GROUPS:10]; [PRODUCT_GROUPS:10]Group_Code:1=[COMPONENTS:86]Group_Code:8)
					PRD_t_RelatedName:=[PRODUCT_GROUPS:10]Group_Name:2
					PRD_at_ComponentField:=4
				: ([COMPONENTS:86]Macro_Rule:9#"")
					PRD_t_RelatedData:=[COMPONENTS:86]Macro_Rule:9
					QUERY:C277([SCRIPTS:80]; [SCRIPTS:80]Script_Code:1=[COMPONENTS:86]Macro_Rule:9)
					PRD_t_RelatedName:=[PRODUCT_GROUPS:10]Group_Name:2
					PRD_at_ComponentField:=3
				Else 
					OBJECT SET ENTERABLE:C238(PRD_t_RelatedData; False:C215)
			End case 
		End if 
		PRD_t_MacroName:=""
		If ([COMPONENTS:86]Build_Code_Macro:14#"")
			QUERY:C277([SCRIPTS:80]; [SCRIPTS:80]Script_Code:1=[COMPONENTS:86]Build_Code_Macro:14)
			PRD_t_MacroName:=[SCRIPTS:80]Script_Name:2
		End if 
		ARRAY TEXT:C222(PRD_at_SectionNames; 0)
		If (PRD_al_CodeFormatID>0)
			QUERY:C277([BUILT_CODE_FORMAT_SECTION:188]; [BUILT_CODE_FORMAT_SECTION:188]FORMAT_ID:2=PRD_al_CodeFormatID)
			SELECTION TO ARRAY:C260([BUILT_CODE_FORMAT_SECTION:188]SECTION_ID:1; PRD_al_RestrictSections; [BUILT_CODE_FORMAT_SECTION:188]SECTION_NAME:4; PRD_at_RestrictSectionNames)
			ARRAY LONGINT:C221(PRD_al_EntryOrder; Size of array:C274(PRD_al_RestrictSections))
			For ($_l_Index; 1; Size of array:C274(PRD_al_EntryOrder))
				PRD_al_EntryOrder{$_l_Index}:=$_l_Index
			End for 
			If (Size of array:C274(PRD_al_UsedSectionIDS)>0)  //only show unused sections
				For ($_l_Index; 1; Size of array:C274(PRD_al_UsedSectionIDS))
					If (PRD_al_UsedSectionIDS{$_l_Index}#[COMPONENTS:86]X_Build_Code_Section_ID:18)
						QUERY SELECTION:C341([BUILT_CODE_FORMAT_SECTION:188]; [BUILT_CODE_FORMAT_SECTION:188]SECTION_ID:1#PRD_al_UsedSectionIDS{$_l_Index})
					End if 
				End for 
			End if 
			SELECTION TO ARRAY:C260([BUILT_CODE_FORMAT_SECTION:188]SECTION_NAME:4; PRD_at_SectionNames; [BUILT_CODE_FORMAT_SECTION:188]SECTION_ID:1; PRD_al_SectionIDS)
			
			SORT ARRAY:C229(PRD_at_SectionNames; PRD_al_SectionIDS)
			
			
			
		End if 
		If ([COMPONENTS:86]X_Build_Code_Section_ID:18>0)
			$_l_ModuleRow:=Find in array:C230(PRD_al_SectionIDS; [COMPONENTS:86]X_Build_Code_Section_ID:18)
			If ($_l_ModuleRow>0)
				PRD_at_SectionNames:=$_l_ModuleRow  //it should be
			End if 
			$_l_ModuleRow:=Find in array:C230(PRD_al_RestrictSections; [COMPONENTS:86]X_Build_Code_Section_ID:18)
			//Dont allow this component to be restricted to being set after itself!!
			If ($_l_ModuleRow>0)
				DELETE FROM ARRAY:C228(PRD_al_RestrictSections; $_l_ModuleRow)
				DELETE FROM ARRAY:C228(PRD_at_RestrictSectionNames; $_l_ModuleRow)
			End if 
		End if 
		If ([COMPONENTS:86]ComponentSelectionOrderSequence:19>0)
			$_l_ModuleRow:=Find in array:C230(PRD_al_EntryOrder; [COMPONENTS:86]ComponentSelectionOrderSequence:19)
			If ($_l_ModuleRow>0)
				PRD_al_EntryOrder:=$_l_ModuleRow
			End if 
		End if 
		ARRAY LONGINT:C221(PC_al_RestrictSection; 0)
		ARRAY TEXT:C222(PC_At_FilterName; 0)
		If (BLOB size:C605([COMPONENTS:86]X_RestrictionPreferences:20)>0)
			$_l_offset:=0
			BLOB TO VARIABLE:C533([COMPONENTS:86]X_RestrictionPreferences:20; PC_al_RestrictSection; $_l_offset)
			BLOB TO VARIABLE:C533([COMPONENTS:86]X_RestrictionPreferences:20; PC_At_FilterName; $_l_offset)
		End if 
		ARRAY BOOLEAN:C223(PC_abo_INCRestriction; 0)
		ARRAY TEXT:C222(PC_at_RestrictionFIlter; 0)
		ARRAY BOOLEAN:C223(PC_abo_INCRestriction; Size of array:C274(PRD_al_RestrictSections))
		ARRAY TEXT:C222(PC_at_RestrictionFIlter; Size of array:C274(PRD_al_RestrictSections))
		
		For ($_l_Index; 1; Size of array:C274(PC_al_RestrictSection))
			$_l_ModuleRow:=Find in array:C230(PRD_al_RestrictSections; PC_al_RestrictSection{$_l_Index})
			If ($_l_ModuleRow>0)
				PC_abo_INCRestriction{$_l_ModuleRow}:=True:C214
				PC_at_RestrictionFIlter{$_l_ModuleRow}:=PC_At_FilterName{$_l_Index}
			End if 
		End for 
		//PRD_al_RestrictSections;[BUILT_CODE_FORMAT_SECTION]SECTION_NAME;PRD_at_RestrictSectionNames
		//1,2,3,4,5,6,7,14,15,16,17,18,19,20,39,40+ last4 digitsof card
		LB_SetupListbox(->PC_lb_Restrictions; "oPCL"; "PCL_L"; 1; ->PRD_al_RestrictSections; ->PC_abo_INCRestriction; ->PRD_at_RestrictSectionNames; ->PC_at_RestrictionFIlter)
		LB_SetColumnHeaders(->PC_lb_Restrictions; "PCL_L"; 1; "Section ID"; "Restrict"; "Section Name"; "Filter Script Code")
		LB_SetColumnWidths(->PC_lb_Restrictions; "oPCL"; 1; 0; 25; 120; 250)
		LB_SetScroll(->PC_lb_Restrictions; -2; -2)
		LB_SetEnterable(->PC_lb_Restrictions; False:C215; 0; "")
		LB_SetEnterable(->PC_lb_Restrictions; True:C214; 2; "")
		LB_SetEnterable(->PC_lb_Restrictions; True:C214; 4; "")
		LBi_InclSetupJustStyle(->PC_lb_Restrictions)
		
		WS_AutoscreenSize(3; 760; 840)
		INT_SetInput(Table:C252(->[PRODUCTS:9]); "EDIT_COMPONENT")
		DB_SetInputFormMenu(Table:C252(->[COMPONENTS:86]); "EDIT_COMPONENT")
		If (Records in selection:C76([COMPONENTS:86])<=1)
			OBJECT SET VISIBLE:C603(*; "oInputButtonNextRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonPreviousRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonFirstRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonLastRecord"; False:C215)
			DB_MenuAction("File"; "Next Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
			DB_MenuAction("File"; "Previous Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
		End if 
		
	: ($_l_event=On Activate:K2:9)
		DB_SetInputFormMenu(Table:C252(->[COMPONENTS:86]); "EDIT_COMPONENT")
		If (Records in selection:C76([COMPONENTS:86])<=1)
			OBJECT SET VISIBLE:C603(*; "oInputButtonNextRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonPreviousRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonFirstRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonLastRecord"; False:C215)
			DB_MenuAction("File"; "Next Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
			DB_MenuAction("File"; "Previous Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
		End if 
	: ($_l_event=On Menu Selected:K2:14)
		DB_SetInputFormMenu(Table:C252(->[COMPONENTS:86]); "EDIT_COMPONENT")
		If (Records in selection:C76([COMPONENTS:86])<=1)
			OBJECT SET VISIBLE:C603(*; "oInputButtonNextRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonPreviousRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonFirstRecord"; False:C215)
			OBJECT SET VISIBLE:C603(*; "oInputButtonLastRecord"; False:C215)
			DB_MenuAction("File"; "Next Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
			DB_MenuAction("File"; "Previous Record"; 3; ""; Current process:C322; False:C215; DB_t_CUrrentInputMenuRef)
		End if 
	: ($_l_event=On Data Change:K2:15)
		PC_bo_ComponentMod:=True:C214
	: ($_l_event=On Clicked:K2:4)
		Case of 
			: (BAR_t_Button#"")
				$_l_ButtonNumber:=Num:C11(BAR_t_Button)
				If ($_l_ButtonNumber>1)
					ModuleNumber:=MOD_al_ModuleBarOffsets{$_l_ButtonNumber-1}
					$_l_ModuleRow:=Find in array:C230(MOD_al_ModuleBarNum; ModuleNumber)
					DB_SetBrowserBarSelection($_l_ModuleRow; ->MOD_al_ModuleBarNum; DB_l_WindowCurrentModule; ->DB_l_WindowCurrentModule)
					DB_SetInputFormMenu(Table:C252(->[COMPONENTS:86]); "EDIT_COMPONENT")
				End if 
				BAR_t_Button:=""
			: (PAL_BUTTON#"")
				$_t_PalletButtonName:=PAL_BUTTON
				PAL_BUTTON:=""
				DB_HandleInputFormButtons($_t_PalletButtonName)
				PAL_bo_ButtonSubFunction:=False:C215
				
				
				
		End case 
		
End case 
ERR_MethodTrackerReturn("FM [COMPONENTS].EDIT_COMPONENT"; $_t_oldMethodName)
