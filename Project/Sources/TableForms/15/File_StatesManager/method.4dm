If (False:C215)
	//Table Form Method Name: [USER]File_StatesManager
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 01/11/2012 10:56
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(FS_lb_Functions;0)
	//ARRAY BOOLEAN(ST_abo_CodeUsed;0)
	ARRAY INTEGER:C220($_ai_StateTableIDS; 0)
	//ARRAY INTEGER(STATE_al_TableIDs;0)
	ARRAY LONGINT:C221($_al_StateSortOrder; 0)
	ARRAY LONGINT:C221($_al_TableIDS; 0)
	//ARRAY LONGINT(MOD_al_ModuleBarNum;0)
	//ARRAY LONGINT(MOD_al_ModuleBarOffsets;0)
	//ARRAY LONGINT(ST_al_2DStateClasses;0;0)
	//ARRAY LONGINT(ST_al_2DStateOrders;0;0)
	//ARRAY LONGINT(ST_al_2DStatePositions;0;0)
	//ARRAY LONGINT(ST_al_CodeID;0)
	//ARRAY LONGINT(ST_al_CodeUsed;0)
	//ARRAY LONGINT(ST_al_PipelineStates;0)
	//ARRAY LONGINT(STATE_al_ClassIDs;0)
	//ARRAY LONGINT(STATE_al_RelatedTables;0)
	//ARRAY LONGINT(STATE_al_SortOrder;0)
	ARRAY TEXT:C222($_at_FilesStateRefs; 0)
	//ARRAY TEXT(ST_at_2DStateCodes;0;0)
	//ARRAY TEXT(ST_at_2DStateNames;0;0)
	//ARRAY TEXT(ST_at_2DStateRefs;0;0)
	//ARRAY TEXT(ST_at_CodeUseName;0)
	//ARRAY TEXT(ST_at_PipelineState;0)
	//ARRAY TEXT(STATE_at_ClassNames;0)
	//ARRAY TEXT(STATE_at_FileStateCodes;0)
	//ARRAY TEXT(STATE_at_RelatedTableNames;0)
	C_BOOLEAN:C305($_bo_CheckOrders; $_bo_Expanded; $_bo_Include; $_bo_IncludeProjects; $_bo_ReadOnly; $_bo_StartTransaction; $_bo_Update; DB_bo_NoLoad; PAL_bo_ButtonSubFunction)
	C_LONGINT:C283($_l_AddedItemID; $_l_ButtonNumber; $_l_ButtonPressed; $_l_CodesSize; $_l_CurrentElement; $_l_CurrentSort; $_l_event; $_l_FieldIndex; $_l_Index; $_l_Index2; $_l_ItemPosition)
	C_LONGINT:C283($_l_ItemReference; $_l_ItemReferenceNumber; $_l_JobsTable; $_l_ListID; $_l_ModulePosition; $_l_OrderPosition; $_l_POStateField; $_l_POTable; $_l_ProjectsTable; $_l_RelatedFIeld; $_l_RelatedTable)
	C_LONGINT:C283($_l_SertviceTable; $_l_ServiceStateField; $_l_SortOrder; $_l_SublistID; $_l_TableNumber; $_l_TablePosition; $_l_TableStatesFIeld; $_l_TableStatesTable; DB_l_ButtonClickedFunction; DB_l_WindowCurrentModule; iCancel)
	C_LONGINT:C283(iOK; ModuleNumber; RS_l_BUT1; RS_l_BUT10; RS_l_BUT11; RS_l_BUT12; RS_l_BUT13; RS_l_BUT14; RS_l_BUT15; RS_l_BUT16; RS_l_BUT17)
	C_LONGINT:C283(RS_l_BUT18; RS_l_BUT19; RS_l_BUT2; RS_l_BUT20; RS_l_BUT21; RS_l_BUT22; RS_l_BUT23; RS_l_BUT24; RS_l_BUT25; RS_l_BUT26; RS_l_BUT27)
	C_LONGINT:C283(RS_l_BUT3; RS_l_BUT4; RS_l_BUT5; RS_l_BUT6; RS_l_BUT7; RS_l_BUT8; RS_l_BUT9; ST_HL_SubTable; ST_HL_Tables; ST_l_AnyMods; ST_l_Modified)
	C_LONGINT:C283(ST_l_StateClass; ST_l_StateRef; ST_ReadWrite; STATE_l_RelateTableID)
	C_TEXT:C284($_t_ItemText; $_t_oldMethodName; $_t_PalletButtonName; BAR_t_Button; oRS_COL1; oRS_COL10; oRS_COL11; oRS_COL12; oRS_COL13; oRS_COL14; oRS_COL15)
	C_TEXT:C284(oRS_COL16; oRS_COL17; oRS_COL18; oRS_COL19; oRS_COL2; oRS_COL20; oRS_COL21; oRS_COL22; oRS_COL23; oRS_COL24; oRS_COL25)
	C_TEXT:C284(oRS_COL26; oRS_COL27; oRS_COL3; oRS_COL4; oRS_COL5; oRS_COL6; oRS_COL7; oRS_COL8; oRS_COL9; oRS_HED1; oRS_HED10)
	C_TEXT:C284(oRS_HED11; oRS_HED12; oRS_HED13; oRS_HED14; oRS_HED15; oRS_HED16; oRS_HED17; oRS_HED18; oRS_HED19; oRS_HED2; oRS_HED20)
	C_TEXT:C284(oRS_HED21; oRS_HED22; oRS_HED23; oRS_HED24; oRS_HED25; oRS_HED26; oRS_HED27; oRS_HED3; oRS_HED4; oRS_HED5; oRS_HED6)
	C_TEXT:C284(oRS_HED7; oRS_HED8; oRS_HED9; PAL_BUTTON; State_t_AbbrevEntryName; STATE_t_ClassName; STATE_t_Code; State_t_EntryName; State_t_ListName; State_t_PipeLineStatus; STATE_t_SelectedStateRef)
	C_TEXT:C284(State_t_TableName; vButtDisFS)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FM [USER].File_StatesManager"; Form event code:C388)

$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		
		DB_SetnewToolBar(0)
		OpenHelp(Table:C252(->[USER:15]); "File_StatesManager")
		
		WS_AutoscreenSize(1; 420; 645)
		SET WINDOW TITLE:C213("Table Record States")
		
		READ ONLY:C145([TABLE_RECORD_STATES:90])
		//only put them into RR when we need to
		ARRAY TEXT:C222(STATE_at_ClassNames; 0)
		ARRAY LONGINT:C221(STATE_al_ClassIDs; 0)
		//the class list is a fixed list so i am hard coding it
		ARRAY TEXT:C222(STATE_at_ClassNames; 3)
		ARRAY LONGINT:C221(STATE_al_ClassIDs; 3)
		ST_l_AnyMods:=0
		STATE_at_ClassNames{1}:="Pre-Sale"
		STATE_at_ClassNames{2}:="Converted Sale"
		STATE_at_ClassNames{3}:="Cancelled Sale"
		STATE_al_ClassIDs{1}:=1
		STATE_al_ClassIDs{2}:=2
		STATE_al_ClassIDs{3}:=-1
		
		ST_l_StateRef:=0  //the selected state ref
		
		ST_l_Modified:=0
		STATE_t_SelectedStateRef:=""
		ST_l_StateClass:=0
		STATE_t_ClassName:=""
		ST_ReadWrite:=1  //does this user have rr access
		
		ARRAY TEXT:C222(ST_at_PipelineState; 0)
		ARRAY LONGINT:C221(ST_al_PipelineStates; 0)
		If (In transaction:C397)
			//CANCEL TRANSACTION
			Transact_End(False:C215)
			$_bo_StartTransaction:=True:C214
		End if 
		
		$_l_ListID:=AA_LoadList(->[SALES_PROJECTION:113]Status:20; ->ST_at_PipelineState; ->ST_al_PipelineStates; False:C215)
		If (Size of array:C274(ST_at_PipelineState)=0)
			$_l_AddedItemID:=AA_ListAddItem(->[SALES_PROJECTION:113]Status:20; "Projected Sale"; "Completed Sale"; "Lost Sale")
			$_l_ListID:=AA_LoadList(->[SALES_PROJECTION:113]Status:20; ->ST_at_PipelineState; ->ST_al_PipelineStates; False:C215)
		End if 
		If ($_bo_StartTransaction)
			//START TRANSACTION
			StartTransaction
		End if 
		//Get all the states
		ARRAY TEXT:C222(STATE_at_FileStateCodes; 0)
		ARRAY INTEGER:C220(STATE_al_TableIDs; 0)
		ARRAY LONGINT:C221(STATE_al_SortOrder; 0)
		ALL RECORDS:C47([TABLE_RECORD_STATES:90])
		SELECTION TO ARRAY:C260([TABLE_RECORD_STATES:90]State_Code:1; STATE_at_FileStateCodes; [TABLE_RECORD_STATES:90]Table_number:3; STATE_al_TableIDs; [TABLE_RECORD_STATES:90]xSortOrder:9; STATE_al_SortOrder)
		//NG-October 2004-Check the sort order
		$_l_OrderPosition:=Find in array:C230(STATE_al_SortOrder; 0)
		If ($_l_OrderPosition>0)
			ARRAY LONGINT:C221($_al_TableIDS; Size of array:C274(STATE_al_TableIDs))
			$_l_CurrentElement:=0
			For ($_l_Index; 1; Size of array:C274(STATE_al_TableIDs))
				$_l_TablePosition:=Find in array:C230($_al_TableIDS; STATE_al_TableIDs{$_l_Index})
				If ($_l_TablePosition<0)
					$_l_CurrentElement:=$_l_CurrentElement+1
					$_al_TableIDS{$_l_CurrentElement}:=STATE_al_TableIDs{$_l_Index}
				End if 
				
			End for 
			ARRAY LONGINT:C221($_al_TableIDS; $_l_CurrentElement)
			ARRAY TEXT:C222($_at_FilesStateRefs; 0)
			ARRAY INTEGER:C220($_ai_StateTableIDS; 0)
			ARRAY LONGINT:C221($_al_StateSortOrder; 0)
			$_bo_ReadOnly:=Read only state:C362([TABLE_RECORD_STATES:90])
			READ WRITE:C146([TABLE_RECORD_STATES:90])
			For ($_l_Index; 1; Size of array:C274($_al_TableIDS))
				
				QUERY:C277([TABLE_RECORD_STATES:90]; [TABLE_RECORD_STATES:90]Table_number:3=$_al_TableIDS{$_l_Index})
				SELECTION TO ARRAY:C260([TABLE_RECORD_STATES:90]State_Reference:4; $_at_FilesStateRefs; [TABLE_RECORD_STATES:90]Table_number:3; $_ai_StateTableIDS; [TABLE_RECORD_STATES:90]xSortOrder:9; $_al_StateSortOrder)
				$_l_OrderPosition:=Find in array:C230($_al_StateSortOrder; 0)
				If ($_l_OrderPosition>0)
					ORDER BY:C49([TABLE_RECORD_STATES:90]; [TABLE_RECORD_STATES:90]State_Reference:4)
					For ($_l_Index2; 1; Records in selection:C76([TABLE_RECORD_STATES:90]))
						[TABLE_RECORD_STATES:90]xSortOrder:9:=$_l_Index2
						DB_SaveRecord(->[TABLE_RECORD_STATES:90])
						NEXT RECORD:C51([TABLE_RECORD_STATES:90])
					End for 
					
				End if 
				
			End for 
			UNLOAD RECORD:C212([TABLE_RECORD_STATES:90])
			If ($_bo_ReadOnly)
				READ ONLY:C145([TABLE_RECORD_STATES:90])
			End if 
			ALL RECORDS:C47([TABLE_RECORD_STATES:90])
			SELECTION TO ARRAY:C260([TABLE_RECORD_STATES:90]State_Code:1; STATE_at_FileStateCodes; [TABLE_RECORD_STATES:90]Table_number:3; STATE_al_TableIDs; [TABLE_RECORD_STATES:90]xSortOrder:9; STATE_al_SortOrder)
			
		End if 
		//Now  set up the relations
		
		ARRAY LONGINT:C221(STATE_al_RelatedTables; Get last table number:C254)
		ARRAY TEXT:C222(STATE_at_RelatedTableNames; Get last table number:C254)
		
		
		$_l_TableStatesTable:=Table:C252(->[TABLE_RECORD_STATES:90])
		$_l_TableStatesFIeld:=Field:C253(->[TABLE_RECORD_STATES:90]State_Reference:4)
		$_l_CurrentElement:=0
		
		$_l_POTable:=Table:C252(->[PURCHASE_ORDERS:57])
		$_l_POStateField:=Field:C253(->[PURCHASE_ORDERS:57]Record_State:19)
		$_l_SertviceTable:=Table:C252(->[SERVICE_CALLS:20])
		$_l_ServiceStateField:=Field:C253(->[SERVICE_CALLS:20]Table_State:29)
		$_l_JobsTable:=Table:C252(->[SERVICE_CALLS:20])
		$_l_ProjectsTable:=Field:C253(->[SERVICE_CALLS:20]Table_State:29)
		If (DB_GetModuleSettingByNUM(Module_JobCosting)>2)
			
			$_bo_IncludeProjects:=True:C214
		Else 
			$_bo_IncludeProjects:=False:C215
		End if 
		//file state records have been created
		//but they will not use the code uses system
		
		//users cannot add new records or change the wording on existing ones
		
		For ($_l_Index; 1; Get last table number:C254)
			If (Is table number valid:C999($_l_Index))
				For ($_l_FieldIndex; 1; Get last field number:C255(Table:C252($_l_Index)))
					If (Is field number valid:C1000($_l_Index; $_l_FieldIndex))
						GET RELATION PROPERTIES:C686($_l_Index; $_l_FieldIndex; $_l_RelatedTable; $_l_RelatedFIeld)
						
						If ($_l_Index=$_l_POTable)
							//TRACE
							
						End if 
						
						Case of 
							: ($_l_RelatedTable=$_l_TableStatesTable) & ($_l_RelatedFIeld=$_l_TableStatesFIeld)
								If ($_bo_IncludeProjects)
									$_bo_Include:=True:C214
								Else 
									$_bo_Include:=($_l_Index#$_l_JobsTable) & ($_l_Index#$_l_ProjectsTable)
								End if 
								If ($_bo_Include)
									$_l_CurrentElement:=$_l_CurrentElement+1
									STATE_at_RelatedTableNames{$_l_CurrentElement}:=Table name:C256($_l_Index)
									STATE_al_RelatedTables{$_l_CurrentElement}:=$_l_Index
									$_l_FieldIndex:=9899999
								End if 
							: ($_l_Index=$_l_POTable) & ($_l_POStateField=$_l_FieldIndex) & (DB_GetModuleSettingByNUM(Module_PurchaseOrders)>=2)
								
								
								$_l_CurrentElement:=$_l_CurrentElement+1
								STATE_at_RelatedTableNames{$_l_CurrentElement}:=Table name:C256($_l_Index)
								STATE_al_RelatedTables{$_l_CurrentElement}:=$_l_Index
								$_l_FieldIndex:=9899999
							: ($_l_Index=$_l_SertviceTable) & ($_l_ServiceStateField=$_l_FieldIndex) & (DB_GetModuleSettingByNUM(Module_ServiceCentre)>=2)
								
								
								$_l_CurrentElement:=$_l_CurrentElement+1
								STATE_at_RelatedTableNames{$_l_CurrentElement}:=Table name:C256($_l_Index)
								STATE_al_RelatedTables{$_l_CurrentElement}:=$_l_Index
								$_l_FieldIndex:=9899999
						End case 
					End if 
				End for 
			End if 
		End for 
		ARRAY LONGINT:C221(STATE_al_RelatedTables; $_l_CurrentElement)
		ARRAY TEXT:C222(STATE_at_RelatedTableNames; $_l_CurrentElement)
		ST_HL_Tables:=New list:C375
		ARRAY TEXT:C222(ST_at_2DStateRefs; 0; 0)
		ARRAY TEXT:C222(ST_at_2DStateNames; 0; 0)
		ARRAY TEXT:C222(ST_at_2DStateCodes; 0; 0)
		ARRAY LONGINT:C221(ST_al_2DStatePositions; 0; 0)
		ARRAY LONGINT:C221(ST_al_2DStateClasses; 0; 0)
		ARRAY LONGINT:C221(ST_al_2DStateOrders; 0; 0)
		ARRAY TEXT:C222(ST_at_2DStateRefs; $_l_CurrentElement; 0)
		ARRAY TEXT:C222(ST_at_2DStateNames; $_l_CurrentElement; 0)
		ARRAY TEXT:C222(ST_at_2DStateCodes; $_l_CurrentElement; 0)
		ARRAY LONGINT:C221(ST_al_2DStatePositions; $_l_CurrentElement; 0)
		ARRAY LONGINT:C221(ST_al_2DStateClasses; $_l_CurrentElement; 0)
		ARRAY LONGINT:C221(ST_al_2DStateOrders; $_l_CurrentElement; 0)
		ALL RECORDS:C47([TABLE_RECORD_STATES:90])
		CREATE SET:C116([TABLE_RECORD_STATES:90]; "ALL")
		CREATE EMPTY SET:C140([TABLE_RECORD_STATES:90]; "Related")
		For ($_l_Index; 1; $_l_CurrentElement)
			QUERY:C277([TABLE_RECORD_STATES:90]; [TABLE_RECORD_STATES:90]Table_number:3=STATE_al_RelatedTables{$_l_Index})
			//this gives us the states for that file
			CREATE SET:C116([TABLE_RECORD_STATES:90]; "SOME")
			UNION:C120("SOME"; "Related"; "Related")
			ORDER BY:C49([TABLE_RECORD_STATES:90]; [TABLE_RECORD_STATES:90]State_Reference:4)
			
			SELECTION TO ARRAY:C260([TABLE_RECORD_STATES:90]State_Reference:4; ST_at_2DStateRefs{$_l_Index}; [TABLE_RECORD_STATES:90]Listing_Name:2; ST_at_2DStateNames{$_l_Index}; [TABLE_RECORD_STATES:90]State_Code:1; ST_at_2DStateCodes{$_l_Index}; [TABLE_RECORD_STATES:90]xStateClass:8; ST_al_2DStateClasses{$_l_Index}; [TABLE_RECORD_STATES:90]xSortOrder:9; ST_al_2DStateOrders{$_l_Index})
			
			SORT ARRAY:C229(ST_al_2DStateOrders{$_l_Index}; ST_at_2DStateRefs{$_l_Index}; ST_at_2DStateNames{$_l_Index}; ST_at_2DStateCodes{$_l_Index}; ST_al_2DStateClasses{$_l_Index})
			
			ST_at_2DStateCodes{$_l_Index}{0}:=""
			ST_HL_SubTable:=New list:C375
			INSERT IN ARRAY:C227(ST_al_2DStatePositions{$_l_Index}; 1; Size of array:C274(ST_at_2DStateRefs{$_l_Index}))
			For ($_l_Index2; 1; Size of array:C274(ST_at_2DStateRefs{$_l_Index}))
				ST_al_2DStatePositions{$_l_Index}{$_l_Index2}:=256+STATE_al_RelatedTables{$_l_Index}+$_l_Index2
				APPEND TO LIST:C376(ST_HL_SubTable; ST_at_2DStateNames{$_l_Index}{$_l_Index2}; 256+STATE_al_RelatedTables{$_l_Index}+$_l_Index2; 0; False:C215)
			End for 
			APPEND TO LIST:C376(ST_HL_Tables; STATE_at_RelatedTableNames{$_l_Index}; STATE_al_RelatedTables{$_l_Index}; ST_HL_SubTable; True:C214)
			
		End for 
		DIFFERENCE:C122("ALL"; "Related"; "ALL")
		USE SET:C118("ALL")
		OBJECT SET VISIBLE:C603(STATE_at_RelatedTableNames; False:C215)
		OBJECT SET VISIBLE:C603(ST_at_PipelineState; False:C215)
		OBJECT SET ENTERABLE:C238(STATE_t_Code; False:C215)
		OBJECT SET ENTERABLE:C238(State_t_ListName; False:C215)
		OBJECT SET ENTERABLE:C238(State_t_EntryName; False:C215)
		OBJECT SET ENTERABLE:C238(State_t_AbbrevEntryName; False:C215)
		
		//I dont like the following hard coded list
		//but changing it will have to wait
		$_l_CodesSize:=18
		ARRAY TEXT:C222(ST_at_CodeUseName; 0)
		ARRAY LONGINT:C221(ST_al_CodeUsed; 0)
		ARRAY LONGINT:C221(ST_al_CodeID; 0)
		ARRAY TEXT:C222(ST_at_CodeUseName; $_l_CodesSize)
		ARRAY LONGINT:C221(ST_al_CodeUsed; $_l_CodesSize)
		ARRAY LONGINT:C221(ST_al_CodeID; $_l_CodesSize)
		ST_at_CodeUseName{1}:="Credit Check"
		ST_al_CodeID{1}:=1
		ST_at_CodeUseName{2}:="Sales Ledger"
		ST_al_CodeID{2}:=2
		ST_at_CodeUseName{3}:="Purchase Ledger"
		ST_al_CodeID{3}:=3
		ST_at_CodeUseName{4}:="Stock Control"
		ST_al_CodeID{4}:=4
		ST_at_CodeUseName{5}:="Purchase Orders"
		ST_al_CodeID{5}:=5
		ST_at_CodeUseName{6}:="Delivery Notes"
		ST_al_CodeID{6}:=6
		ST_at_CodeUseName{7}:="Authorisation"
		ST_al_CodeID{7}:=7
		ST_at_CodeUseName{8}:="Acknowledgement"
		ST_al_CodeID{8}:=8
		ST_at_CodeUseName{9}:="Full Details Form"
		ST_al_CodeID{9}:=9
		ST_at_CodeUseName{10}:="No Deletions"
		ST_al_CodeID{10}:=10
		ST_at_CodeUseName{11}:="Warn on Upgrade"
		ST_al_CodeID{11}:=11
		ST_at_CodeUseName{12}:="Warn on Downgrade"
		ST_al_CodeID{12}:=12
		ST_at_CodeUseName{13}:="Prevent Downgrade"
		ST_al_CodeID{13}:=13
		ST_at_CodeUseName{14}:="Prevent Upgrade"
		ST_al_CodeID{14}:=14
		ST_at_CodeUseName{15}:="Prevent if Stock Allocated"
		ST_al_CodeID{15}:=15
		ST_at_CodeUseName{16}:="Prevent if Delivered"
		ST_al_CodeID{16}:=16
		ST_at_CodeUseName{17}:="Prevent if Invoiced"
		ST_al_CodeID{17}:=17
		ST_at_CodeUseName{18}:="Copy Previous"
		ST_al_CodeID{18}:=18
		
		INT_SetLongintCheckFormat(->ST_al_CodeUsed)
		//there should not be any
		
		INT_SetDialog
		WS_GETPALLETEBUTTONS
		vButtDisFS:="A DPMONPFSSSRCADT"
		Input_Buttons(->[USER:15]; ->vButtDisFS)
		In_ButtChkDis(->vButtDisFS)
		DB_AppendInputMenu(9)
		//ARRAY STRING(79;ST_at_CodeUseName;18)
		//ARRAY LONGINT(ST_al_CodeUsed;18)
		//ARRAY LONGINT(ST_al_CodeID;18)
		ARRAY BOOLEAN:C223(ST_abo_CodeUsed; 18)
		For ($_l_Index; 1; Size of array:C274(ST_abo_CodeUsed))
			ST_abo_CodeUsed{$_l_Index}:=(ST_al_CodeUsed{$_l_Index}=1)
		End for 
		
		
		
		
		
		LB_SetupListbox(->FS_lb_Functions; "oRS"; "RS_L"; 1; ->ST_abo_CodeUsed; ->ST_at_CodeUseName; ->ST_al_CodeID; ->ST_al_CodeUsed)
		
		
		
		LB_SetColumnHeaders(->FS_lb_Functions; "RS_L"; 1; "Allow"; "Function")
		
		
		LB_SetColumnWidths(->FS_lb_Functions; "oABR"; 1; 50; 200; 0; 0)
		
		LB_SetEnterable(->FS_lb_Functions; False:C215; 0)
		LB_SetEnterable(->FS_lb_Functions; True:C214; 1)
		
		If ((Size of array:C274(ST_abo_CodeUsed)*16)>90)
			LB_SetScroll(->FS_lb_Functions; -3; -2)
		Else 
			LB_SetScroll(->FS_lb_Functions; -3; -3)
		End if 
		LB_StyleSettings(->FS_lb_Functions; "Black"; 9; "STK_t"; ->[COMPANIES:2])
		
	: ($_l_event=On Resize:K2:27)
		
		INT_SetDialog
		
	: ($_l_event=On Activate:K2:9)  //| (vFromIn))
		
		OpenHelp(Table:C252(->[USER:15]); "File_StatesManager")
		vButtDisFS:="A DPMONPFSSSRCADT"
		In_ButtChkDis(->vButtDisFS)
	: ($_l_event=On Outside Call:K2:11)
		
		$_l_ButtonPressed:=DB_l_ButtonClickedFunction
		Case of 
			: (($_l_ButtonPressed=DB_GetButtonFunction("OK")) | (iOK=1))
				// if any re-sorting took place deal with it here
				$_bo_Update:=False:C215
				For ($_l_Index; 1; Size of array:C274(ST_at_2DStateCodes))
					
					$_l_TableNumber:=STATE_al_RelatedTables{$_l_Index}
					$_l_ItemPosition:=List item position:C629(ST_HL_Tables; $_l_TableNumber)
					$_l_ItemReferenceNumber:=0
					GET LIST ITEM:C378(ST_HL_Tables; $_l_ItemPosition; $_l_ItemReference; $_t_ItemText; $_l_SublistID; $_bo_Expanded)
					If (Not:C34($_bo_Expanded))
						SET LIST ITEM:C385(ST_HL_Tables; $_l_ItemReference; $_t_ItemText; $_l_ItemReference; $_l_SublistID; True:C214)
					End if 
					$_l_SortOrder:=0
					For ($_l_Index2; $_l_ItemPosition+1; Count list items:C380(ST_HL_Tables))
						GET LIST ITEM:C378(ST_HL_Tables; $_l_Index2; $_l_ItemReference; $_t_ItemText; $_l_SublistID; $_bo_Expanded)
						If ($_l_SublistID=0)
							$_l_SortOrder:=$_l_SortOrder+1
							$_l_OrderPosition:=Find in array:C230(ST_al_2DStatePositions{$_l_Index}; $_l_ItemReference)
							If ($_l_OrderPosition>0)
								$_l_CurrentSort:=ST_al_2DStateOrders{$_l_Index}{$_l_OrderPosition}
							End if 
							If ($_l_SortOrder#$_l_CurrentSort)
								ST_al_2DStateOrders{$_l_Index}{$_l_OrderPosition}:=$_l_SortOrder
								$_bo_Update:=True:C214
								$_l_OrderPosition:=Find in array:C230(ST_al_2DStatePositions{$_l_Index}; $_l_ItemReference)
								READ WRITE:C146([TABLE_RECORD_STATES:90])
								QUERY:C277([TABLE_RECORD_STATES:90]; [TABLE_RECORD_STATES:90]Table_number:3=STATE_al_RelatedTables{$_l_Index}; *)
								QUERY:C277([TABLE_RECORD_STATES:90];  & ; [TABLE_RECORD_STATES:90]State_Code:1=ST_at_2DStateCodes{$_l_Index}{$_l_OrderPosition})
								[TABLE_RECORD_STATES:90]xSortOrder:9:=$_l_SortOrder
								DB_SaveRecord(->[TABLE_RECORD_STATES:90])
							End if 
						Else 
							$_l_Index2:=Count list items:C380(ST_HL_Tables)+1
						End if 
					End for 
					//End if
				End for 
				
				If ($_bo_Update)
					Transact_End(True:C214)
					$_bo_CheckOrders:=False:C215
					
				Else 
					Transact_End(True:C214)
				End if 
				
				
				CANCEL:C270
				
			: (($_l_ButtonPressed=DB_GetButtonFunction("Cancel")) | (iCancel=1))
				OK:=0
				Transact_End(False:C215)
				CANCEL:C270
			: ($_l_ButtonPressed=DB_GetButtonFunction("Add"))
				ST_SaveState(ST_l_StateRef)
				OBJECT SET ENTERABLE:C238(State_t_ListName; True:C214)
				OBJECT SET ENTERABLE:C238(State_t_EntryName; True:C214)
				OBJECT SET ENTERABLE:C238(State_t_AbbrevEntryName; True:C214)
				OBJECT SET VISIBLE:C603(STATE_at_RelatedTableNames; True:C214)
				OBJECT SET VISIBLE:C603(ST_at_PipelineState; True:C214)
				
				STATE_t_Code:=""
				State_t_ListName:=""
				State_t_EntryName:=""
				State_t_AbbrevEntryName:=""
				STATE_l_RelateTableID:=0
				STATE_t_SelectedStateRef:=""
				State_t_PipeLineStatus:=""
				State_t_TableName:=""
				ST_l_Modified:=0
				ST_l_StateRef:=-1
				ST_al_2DStateClasses:=0
				For ($_l_Index; 1; Size of array:C274(ST_al_CodeUsed))
					ST_al_CodeUsed:=0
				End for 
				
				
				
		End case 
		DB_l_ButtonClickedFunction:=0
	: ($_l_event=On Clicked:K2:4)
		
		If (PAL_BUTTON#"")
			$_t_PalletButtonName:=PAL_BUTTON
			PAL_BUTTON:=""
			DB_HandleInputFormButtons($_t_PalletButtonName)
			PAL_bo_ButtonSubFunction:=False:C215
		Else 
			If (BAR_t_Button#"")
				
				$_l_ButtonNumber:=Num:C11(BAR_t_Button)
				If ($_l_ButtonNumber>1)
					ModuleNumber:=MOD_al_ModuleBarOffsets{$_l_ButtonNumber-1}
					$_l_ModulePosition:=Find in array:C230(MOD_al_ModuleBarNum; ModuleNumber)
					SET MENU BAR:C67(9)
					
					DB_SetBrowserBarSelection($_l_ModulePosition; ->MOD_al_ModuleBarNum; DB_l_WindowCurrentModule; ->DB_l_WindowCurrentModule)
					DB_AppendInputMenu(9)
					
				End if 
				BAR_t_Button:=""
				
			Else 
				
			End if 
		End if 
		
End case 
ERR_MethodTrackerReturn("FM:File_StatesManager"; $_t_oldMethodName)
