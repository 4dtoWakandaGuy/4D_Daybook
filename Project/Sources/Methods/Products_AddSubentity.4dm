//%attributes = {}
If (False:C215)
	//Project Method Name:      Products_AddSubentity
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 21/11/2009`Method: Products_AddSubentity`Description
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY INTEGER(SD2_aI_DiaryLocationsSEL;0)
	ARRAY LONGINT:C221($_al_FieldNumbers; 0)
	ARRAY LONGINT:C221($_al_RelationFields; 0)
	ARRAY LONGINT:C221($_al_RelationTables; 0)
	ARRAY LONGINT:C221($_al_TabIncludes; 0)
	//ARRAY LONGINT(AL_l_ModeSubs;0)
	//ARRAY LONGINT(DOC_al_FIeldLink;0)
	//ARRAY LONGINT(DOC_al_RecordID;0)
	//ARRAY LONGINT(DOC_al_TableLink;0)
	//ARRAY LONGINT(PRD_al_TabIncludes;0)
	//ARRAY LONGINT(SD2_al_ActionVirtFieldDataMANY;0)
	//ARRAY LONGINT(SD2_al_DiaryLocations;0)
	//ARRAY POINTER(PRD_aPtr_RelatedConfiguration;0)
	//ARRAY POINTER(SUBS_aPtr_LBSettings;0)
	ARRAY TEXT:C222($_at_FieldValues; 0)
	ARRAY TEXT:C222($_at_Relations; 0)
	ARRAY TEXT:C222($_at_Tabincludes; 0)
	//ARRAY TEXT(SUB_at_Modes;0)
	//ARRAY TEXT(DOC_at_RecordCode;0)
	//ARRAY TEXT(PRD_at_Moderelated;0)
	//ARRAY TEXT(PRD_at_ModeSupplier;0)
	//ARRAY TEXT(PRD_at_ModRelated;0)
	//ARRAY TEXT(PRD_at_TabNames;0)
	//ARRAY TEXT(PRD_at_ViewTabsLabels;0)
	//ARRAY TEXT(PROD_at_SubsItems;0)
	//ARRAY TEXT(SD2_at_ActionVirtFieldName;0)
	//ARRAY TEXT(SD2_at_DiaryLocations;0)
	C_BOOLEAN:C305($_bo_FromIn; $_bo_OK; $_bo_ReadOnly; $_bo_UseAll; PROD_bo_AddSupplier; VFromin)
	C_LONGINT:C283($_l_ActionLocationsRow; $_l_AddedLineNumber; $_l_AddMode; $_l_CharacterPosition; $_l_Column; $_l_CurrentProcess; $_l_DiaryType; $_l_index; $_l_Row; $_l_SizeofArray; $_l_TabColumn)
	C_LONGINT:C283($_l_TableColumn; $_l_TableRestrictRow; Vadd; vCT)
	C_PICTURE:C286(PRD_pic_ModeSubs)
	C_POINTER:C301($_ptr_ArrayFieldPointers; $_ptr_ArrayOfArrayNames; $_ptr_ArrayofArrayPointers; $_ptr_ArrayOfColumFormats; $_Ptr_ArrayofColumnFormulas; $_ptr_ArrayReferences; $_ptr_EnterabilityArray; $_ptr_LBTable; $_ptr_ListboxArea; $_Ptr_ThisColumnArray)
	C_TEXT:C284(<>ProdCode; $_t_DummyTab; $_t_oldMethodName; $_t_ProductCode; $1; PRD_t_FalseTab)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Products_AddSubentity"; Form event code:C388)
If (Count parameters:C259>=1)
	
	
	$_t_DummyTab:=PRD_t_FalseTab  //Use has selected something from the add diary on the left....
	PRD_t_FalseTab:=""
	
	Case of 
		: ($1="FurtherField") & ($_t_DummyTab="")
			
		: ($1="Diary") | ($_t_DummyTab#"")  //Diary
			If (True:C214) & (Not:C34(Is compiled mode:C492))
				
				//get the settings for the current tab
				ARRAY LONGINT:C221($_al_TabIncludes; 0)
				If ($_t_DummyTab="")
					$_l_TabColumn:=Find in array:C230(PRD_at_TabNames; PRD_at_ViewTabsLabels{PRD_at_ViewTabsLabels})
				Else 
					$_l_CharacterPosition:=Position:C15("Enter "; $_t_DummyTab)
					If ($_l_CharacterPosition>0)
						$_t_DummyTab:=Substring:C12($_t_DummyTab; $_l_CharacterPosition+Length:C16("Enter "); Length:C16($_t_DummyTab))
						
						$_l_TabColumn:=Find in array:C230(PRD_at_TabNames; $_t_DummyTab)
					End if 
				End if 
				If ($_l_TabColumn>0)
					COPY ARRAY:C226(PRD_al_TabIncludes{$_l_TabColumn}; $_al_TabIncludes)
					If (Size of array:C274($_al_TabIncludes)>0)
						QUERY WITH ARRAY:C644([ACTIONS:13]xID:12; $_al_TabIncludes)
						$_bo_UseAll:=False:C215
					Else 
						$_bo_UseAll:=True:C214
					End if 
				Else 
					$_bo_UseAll:=True:C214
				End if 
				If ($_bo_UseAll)
					ARRAY LONGINT:C221($_al_TabIncludes; 0)
					ALL RECORDS:C47([ACTIONS:13])
					FIRST RECORD:C50([ACTIONS:13])
					ARRAY TEXT:C222(SD2_at_DiaryLocations; 0)
					ARRAY LONGINT:C221(SD2_al_DiaryLocations; 0)
					ARRAY INTEGER:C220(SD2_aI_DiaryLocationsSEL; 0)
					SD2_LoadDiaryLocations(->SD2_al_DiaryLocations; ->SD2_at_DiaryLocations)
					CREATE EMPTY SET:C140([ACTIONS:13]; "Temp")
					For ($_l_index; 1; Records in selection:C76([ACTIONS:13]))
						ARRAY INTEGER:C220(SD2_aI_DiaryLocationsSEL; 0)
						SD2_ActionAttributesToArrays
						$_bo_OK:=False:C215
						$_l_ActionLocationsRow:=Find in array:C230(SD2_at_ActionVirtFieldName; "Action Locations")
						If ($_l_ActionLocationsRow>0)
							If (Size of array:C274(SD2_al_ActionVirtFieldDataMANY{$_l_ActionLocationsRow})>0)
								$_bo_OK:=(Find in array:C230(SD2_al_ActionVirtFieldDataMANY{$_l_ActionLocationsRow}; 8)<0)  //8  is for time functions-here we are ok if it NOT
							Else 
								$_bo_OK:=True:C214
							End if 
						Else 
							$_bo_OK:=True:C214  //nothing is setup so it must be ok
						End if 
						If ($_bo_OK)
							$_l_TableRestrictRow:=Find in array:C230(SD2_at_ActionVirtFieldName; "Restrict Table")
							If ($_l_TableRestrictRow>0)
								If (Size of array:C274(SD2_al_ActionVirtFieldDataMANY{$_l_TableRestrictRow})>0)
									$_l_TableColumn:=Find in array:C230(SD2_al_ActionVirtFieldDataMANY{$_l_TableRestrictRow}; Table:C252(->[PRODUCTS:9]))
									If ($_l_TableColumn>0)
										$_bo_OK:=True:C214
									End if 
								Else 
									$_bo_OK:=True:C214  //no table restrictions
								End if 
							Else 
								$_bo_OK:=True:C214  //restrictions not setup has to be ok
							End if 
						End if 
						If ($_bo_OK)
							ADD TO SET:C119([ACTIONS:13]; "Temp")
						End if 
						NEXT RECORD:C51([ACTIONS:13])
						
					End for 
					USE SET:C118("Temp")
					CLEAR SET:C117("Temp")
					//Find action codes that can be used with companies
				End if 
				SELECTION TO ARRAY:C260([ACTIONS:13]Action_Code:1; $_at_Tabincludes)
				
				ARRAY TEXT:C222($_at_Relations; 1)
				ARRAY LONGINT:C221($_al_RelationTables; 1)
				ARRAY LONGINT:C221($_al_RelationFields; 1)
				$_at_Relations{1}:=[PRODUCTS:9]Product_Code:1
				$_al_RelationTables{1}:=Table:C252(->[PRODUCTS:9])
				$_al_RelationFields{1}:=Field:C253(->[PRODUCTS:9]Product_Code:1)
				
				//if you want to send  other values to the diary entry such as start time then do so in the following way
				ARRAY LONGINT:C221($_al_FieldNumbers; 0)  //an array of the DIARY FIELD NUMBERS to set
				
				ARRAY TEXT:C222($_at_FieldValues; 0)  // a TEXT array of the values to put in=so coerse the date you want into alpha(its text so you can pass descriptions
				//Fields that can be passed here are
				//Action Description(code is handles be passing one value in $7
				//Budget units
				//Charge Rate
				//units
				//Value
				//Date Do/Done from
				//Date Do/Done To
				//Document code
				//Person Code(if a specific person
				//priority
				//Result code
				//Result descrtiption
				//SourceDataField(TABLE NUMBER)
				//Subject
				//Thread ID
				//Time do/done from
				//Time do/done to
				//xIstrhead
				
				//$_al_FieldNumbers{1}:=»[diary]date do from
				//$_at_FieldValues{1}:=String(Current Date(*))
				
				$_l_CurrentProcess:=Current process:C322
				$_l_DiaryType:=2
				SD2_DiaryEntry("SD2_AddDiaryRecord"; DB_ProcessMemoryinit(4); "Enter to Diary"; Current process:C322; $_l_DiaryType; "Diary_InNEW"; ->$_at_Tabincludes; ->$_al_RelationTables; ->$_al_RelationFields; ->$_at_Relations)
				
			Else 
				ZProc("Diary_In"; DB_ProcessMemoryinit(4); "Enter to Diary"; String:C10(Current process:C322); [INVOICES:39]Company_Code:2; [INVOICES:39]Contact_Code:3; "Diary_InNEW")
			End if 
			
		: ($1="Document") & ($_t_DummyTab="")
			//attach external document
			
			//letter
			If ([PRODUCTS:9]X_ID:43=0)
				[PRODUCTS:9]X_ID:43:=AA_GetNextID(->[PRODUCTS:9]X_ID:43)
			End if 
			ARRAY LONGINT:C221(DOC_al_TableLink; 0)
			ARRAY LONGINT:C221(DOC_al_FIeldLink; 0)
			ARRAY LONGINT:C221(DOC_al_RecordID; 0)
			ARRAY TEXT:C222(DOC_at_RecordCode; 0)
			APPEND TO ARRAY:C911(DOC_al_TableLink; Table:C252(->[PRODUCTS:9]))
			APPEND TO ARRAY:C911(DOC_al_FIeldLink; Field:C253(->[PRODUCTS:9]Product_Code:1))
			APPEND TO ARRAY:C911(DOC_al_RecordID; [PRODUCTS:9]X_ID:43)
			APPEND TO ARRAY:C911(DOC_at_RecordCode; [PRODUCTS:9]Product_Code:1)
			
			
			DOC_AddExternalDocument(->DOC_al_TableLink; ->DOC_al_FIeldLink; ->DOC_at_RecordCode; ->DOC_al_RecordID)
			vCT:=0
			LBi_RemoveAll(->PRD_aPtr_RelatedConfiguration)
			ARRAY POINTER:C280(PRD_aPtr_RelatedConfiguration; 0)
			PRD_inonloadrelated("P1")
			
			
			
		: ($1="Supplier")
			If (PROD_bo_AddSupplier)
				DB_SaveRecord(->[PRODUCTS_SUPPLIERS:148])
			End if 
			PROD_bo_AddSupplier:=True:C214
			CREATE RECORD:C68([PRODUCTS_SUPPLIERS:148])
			[PRODUCTS_SUPPLIERS:148]Product_Code:8:=[PRODUCTS:9]Product_Code:1
			[PRODUCTS_SUPPLIERS:148]ID:7:=AA_GetNextID(->[PRODUCTS_SUPPLIERS:148]ID:7)
			
			//what no lpb
			$_ptr_ListboxArea:=PRD_aPtr_RelatedConfiguration{1}
			LISTBOX GET CELL POSITION:C971($_ptr_ListboxArea->; $_l_Column; $_l_Row)
			$_l_AddedLineNumber:=LBi_xPlus(->PRD_aPtr_RelatedConfiguration; ->PRD_at_ModeSupplier; $_l_Row; $_l_Column)
			//put the cursor in the correct place
			
			$_ptr_ArrayofArrayPointers:=PRD_aPtr_RelatedConfiguration{3}
			$_ptr_ArrayReferences:=PRD_aPtr_RelatedConfiguration{9}
			$_ptr_EnterabilityArray:=PRD_aPtr_RelatedConfiguration{14}
			$_ptr_LBTable:=PRD_aPtr_RelatedConfiguration{10}
			$_Ptr_ThisColumnArray:=$_ptr_ArrayofArrayPointers->{1}
			$_l_SizeofArray:=Size of array:C274($_Ptr_ThisColumnArray->)
			If ($_l_AddedLineNumber>0)
				$_l_SizeofArray:=$_l_AddedLineNumber
			End if 
			$_bo_ReadOnly:=((Read only state:C362($_ptr_LBTable->)) | (Locked:C147($_ptr_LBTable->)))
			For ($_l_index; 1; Size of array:C274($_ptr_EnterabilityArray->))
				If (($_bo_ReadOnly=False:C215) & ($_ptr_EnterabilityArray->{$_l_index}))
					LB_GoToCell($_ptr_ListboxArea; $_l_index; $_l_SizeofArray)
					$_l_index:=Size of array:C274($_ptr_EnterabilityArray->)
				End if 
			End for 
			
		: ($1="Stock")
		: ($1="PriceTable")
			If ([PRODUCTS:9]Product_Code:1#"")
				$_l_AddMode:=Vadd
				$_bo_FromIn:=VFromin
				$_t_ProductCode:=<>ProdCode
				<>ProdCode:=[PRODUCTS:9]Product_Code:1
				vAdd:=1
				vFromIn:=False:C215
				ARRAY TEXT:C222(PRD_at_ModRelated; 3)
				
				CREATE RECORD:C68([PRICE_TABLE:28])
				PriceT_InLPB
				[PRICE_TABLE:28]Product_Code:1:=[PRODUCTS:9]Product_Code:1
				$_ptr_ListboxArea:=PRD_aPtr_RelatedConfiguration{1}
				LISTBOX GET CELL POSITION:C971($_ptr_ListboxArea->; $_l_Column; $_l_Row)
				//LB_l_RowNumber:=LB_GetLine ($_ptr_ListboxArea)
				//LB_l_ColumnNumber:=LB_GetColumn ($_ptr_ListboxArea)
				$_l_AddedLineNumber:=LBi_xPlus(->PRD_aPtr_RelatedConfiguration; ->PRD_at_Moderelated; $_l_Row; $_l_Column)
				VAdd:=$_l_AddMode
				VFromin:=$_bo_FromIn
				<>ProdCode:=$_t_ProductCode
				
				
			End if 
		: ($1="FurthAnal") & ($_t_DummyTab="")
			PROD_AddSubEntityAnalyses
			
		: ($1="Component") & ($_t_DummyTab="")
			PROD_AddSubEntityComponents
		: ($1="SUBSComponent") & ($_t_DummyTab="")
			PROD_AddSubEntityComponents("SUBS")
			
		: ($1="Items_Su") & ($_t_DummyTab="")
			//subscriptions
			If ([SUBSCRIPTIONS:93]Product_Code:1#"")
				DB_SaveRecord(->[SUBSCRIPTIONS:93])
				AA_CheckFileUnlockedByTableNUM(Table:C252(->[SUBSCRIPTIONS:93]))
			End if 
			PROD_at_SubsItems:=1
			SUB_at_Modes:=1
			LBi_EditListLay(->SUBS_aPtr_LBSettings; ->SUB_at_Modes; ->PRD_pic_ModeSubs; ->AL_l_ModeSubs)
			CREATE RECORD:C68([SUBSCRIPTIONS:93])
			[SUBSCRIPTIONS:93]Order_Item_Number:4:=[ORDER_ITEMS:25]Item_Number:27
			[SUBSCRIPTIONS:93]Product_Code:1:=[ORDER_ITEMS:25]Product_Code:2
			[SUBSCRIPTIONS:93]Unit_Number:6:=7
			[SUBSCRIPTIONS:93]X_Units_Type:13:="Week"
			[SUBSCRIPTIONS:93]Type:7:="ISS"
			[SUBSCRIPTIONS:93]X_Subscription_Type:12:="Issue"
			$_l_AddedLineNumber:=LBi_xPlus(->SUBS_aPtr_LBSettings)
			$_ptr_ListboxArea:=SUBS_aPtr_LBSettings{1}
			//put the cursor in the correct place
			
			$_ptr_ArrayofArrayPointers:=SUBS_aPtr_LBSettings{3}
			$_ptr_ArrayReferences:=SUBS_aPtr_LBSettings{9}
			$_ptr_EnterabilityArray:=SUBS_aPtr_LBSettings{14}
			$_ptr_LBTable:=SUBS_aPtr_LBSettings{10}
			$_Ptr_ThisColumnArray:=$_ptr_ArrayofArrayPointers->{1}
			$_l_SizeofArray:=Size of array:C274($_Ptr_ThisColumnArray->)
			If ($_l_AddedLineNumber>0)
				$_l_SizeofArray:=$_l_AddedLineNumber
			End if 
			$_bo_ReadOnly:=((Read only state:C362($_ptr_LBTable->)) | (Locked:C147($_ptr_LBTable->)))
			For ($_l_index; 1; Size of array:C274($_ptr_EnterabilityArray->))
				If (($_bo_ReadOnly=False:C215) & ($_ptr_EnterabilityArray->{$_l_index}))
					LB_GoToCell($_ptr_ListboxArea; $_l_index; $_l_SizeofArray)
					$_l_index:=Size of array:C274($_ptr_EnterabilityArray->)
				End if 
			End for 
			
	End case 
End if 
ERR_MethodTrackerReturn("Products_AddSubentity"; $_t_oldMethodName)
