If (False:C215)
	//object Name: [USER]File_StatesManager.Button2
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 26/09/2012 10:07
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(ST_abo_CodeUsed;0)
	//ARRAY INTEGER(STATE_al_TableIDs;0)
	//ARRAY LONGINT(ST_al_2DStateClasses;0;0)
	//ARRAY LONGINT(ST_al_2DStateOrders;0;0)
	//ARRAY LONGINT(ST_al_2DStatePositions;0;0)
	//ARRAY LONGINT(ST_al_CodeID;0)
	//ARRAY LONGINT(ST_al_CodeUsed;0)
	//ARRAY LONGINT(STATE_al_RelatedTables;0)
	//ARRAY TEXT(ST_at_2DStateCodes;0;0)
	//ARRAY TEXT(ST_at_2DStateNames;0;0)
	//ARRAY TEXT(ST_at_2DStateRefs;0;0)
	//ARRAY TEXT(ST_at_CodeUseName;0)
	//ARRAY TEXT(ST_at_PipelineState;0)
	//ARRAY TEXT(STATE_at_FileStateCodes;0)
	//ARRAY TEXT(STATE_at_RelatedTableNames;0)
	C_LONGINT:C283($_l_CurrentRow; $_l_FieldIndex; $_l_PoStateField; $_l_POTable; $_l_RelatedField; $_l_RelatedTable; $_l_Size; $_l_StateRefIndex; $_l_StatesField; $_l_StatesTable; $_l_TableIndex)
	C_LONGINT:C283(ST_HL_SubTable; ST_HL_Tables; STATE_l_RelateTableID)
	C_TEXT:C284($_t_oldMethodName; $_t_TableCode; State_t_AbbrevEntryName; STATE_t_Code; State_t_EntryName; State_t_ListName; STATE_t_SelectedStateRef)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].File_StatesManager.Button2"; Form event code:C388)
Gen_Confirm("Are you sure you wish to delete a state?"; "No"; "YES")
If (OK=0)
	READ WRITE:C146([TABLE_RECORD_STATES:90])
	QUERY:C277([TABLE_RECORD_STATES:90]; [TABLE_RECORD_STATES:90]State_Code:1=STATE_t_Code)
	If (Records in selection:C76([TABLE_RECORD_STATES:90])>0)
		$_t_TableCode:=String:C10(STATE_l_RelateTableID)
		$_t_TableCode:=("0"*(3-Length:C16($_t_TableCode)))+$_t_TableCode+STATE_t_SelectedStateRef
		DB_DeletionControl(->[TABLE_RECORD_STATES:90])
		
		DELETE RECORD:C58([TABLE_RECORD_STATES:90])
		QUERY:C277([CODE_USES:91]; [CODE_USES:91]Code:1=$_t_TableCode)
		If (Records in selection:C76([CODE_USES:91])>0)
			READ WRITE:C146([CODE_USES:91])
			DELETE SELECTION:C66([CODE_USES:91])
			READ ONLY:C145([CODE_USES:91])
		End if 
		
	End if 
	READ ONLY:C145([TABLE_RECORD_STATES:90])
	//`reload the states
	ALL RECORDS:C47([TABLE_RECORD_STATES:90])
	SELECTION TO ARRAY:C260([TABLE_RECORD_STATES:90]State_Code:1; STATE_at_FileStateCodes; [TABLE_RECORD_STATES:90]Table_number:3; STATE_al_TableIDs)
	//Now  set up the relations
	ARRAY LONGINT:C221(STATE_al_RelatedTables; Get last table number:C254)
	ARRAY TEXT:C222(STATE_at_RelatedTableNames; Get last table number:C254)
	
	$_l_StatesTable:=Table:C252(->[TABLE_RECORD_STATES:90])
	$_l_StatesField:=Field:C253(->[TABLE_RECORD_STATES:90]State_Reference:4)
	$_l_CurrentRow:=0
	
	
	//file state records have been created
	//but they will not use the code uses system
	
	//users cannot add new records or change the wording on existing ones
	
	
	For ($_l_TableIndex; 1; Get last table number:C254)
		If (Is table number valid:C999($_l_TableIndex))
			For ($_l_FieldIndex; 1; Get last field number:C255(Table:C252($_l_TableIndex)))
				If (Is field number valid:C1000($_l_TableIndex; $_l_FieldIndex))
					GET RELATION PROPERTIES:C686($_l_TableIndex; $_l_FieldIndex; $_l_RelatedTable; $_l_RelatedField)
					
					Case of 
						: ($_l_RelatedTable=$_l_StatesTable) & ($_l_RelatedField=$_l_StatesField)
							$_l_CurrentRow:=$_l_CurrentRow+1
							STATE_at_RelatedTableNames{$_l_CurrentRow}:=Table name:C256($_l_TableIndex)
							STATE_al_RelatedTables{$_l_CurrentRow}:=$_l_TableIndex
							$_l_FieldIndex:=9899999
						: ($_l_TableIndex=$_l_POTable) & ($_l_PoStateField=$_l_FieldIndex)
							$_l_CurrentRow:=$_l_CurrentRow+1
							STATE_at_RelatedTableNames{$_l_CurrentRow}:=Table name:C256($_l_TableIndex)
							STATE_al_RelatedTables{$_l_CurrentRow}:=$_l_TableIndex
							$_l_FieldIndex:=9899999
					End case 
				End if 
			End for 
		End if 
	End for 
	ARRAY LONGINT:C221(STATE_al_RelatedTables; $_l_CurrentRow)
	ARRAY TEXT:C222(STATE_at_RelatedTableNames; $_l_CurrentRow)
	ST_HL_Tables:=New list:C375
	ARRAY TEXT:C222(ST_at_2DStateRefs; 0; 0)
	ARRAY TEXT:C222(ST_at_2DStateNames; 0; 0)
	ARRAY TEXT:C222(ST_at_2DStateCodes; 0; 0)
	ARRAY LONGINT:C221(ST_al_2DStatePositions; 0; 0)
	ARRAY LONGINT:C221(ST_al_2DStateClasses; 0; 0)
	ARRAY LONGINT:C221(ST_al_2DStateOrders; 0; 0)
	ARRAY TEXT:C222(ST_at_2DStateRefs; $_l_CurrentRow; 0)
	ARRAY TEXT:C222(ST_at_2DStateNames; $_l_CurrentRow; 0)
	ARRAY TEXT:C222(ST_at_2DStateCodes; $_l_CurrentRow; 0)
	ARRAY LONGINT:C221(ST_al_2DStatePositions; $_l_CurrentRow; 0)
	ARRAY LONGINT:C221(ST_al_2DStateClasses; $_l_CurrentRow; 0)
	ARRAY LONGINT:C221(ST_al_2DStateOrders; $_l_CurrentRow; 0)
	
	ALL RECORDS:C47([TABLE_RECORD_STATES:90])
	CREATE SET:C116([TABLE_RECORD_STATES:90]; "ALL")
	CREATE EMPTY SET:C140([TABLE_RECORD_STATES:90]; "Related")
	For ($_l_TableIndex; 1; $_l_CurrentRow)
		QUERY:C277([TABLE_RECORD_STATES:90]; [TABLE_RECORD_STATES:90]Table_number:3=STATE_al_RelatedTables{$_l_TableIndex})
		//this gives us the states for that file
		CREATE SET:C116([TABLE_RECORD_STATES:90]; "SOME")
		UNION:C120("SOME"; "Related"; "Related")
		ORDER BY:C49([TABLE_RECORD_STATES:90]; [TABLE_RECORD_STATES:90]State_Reference:4)
		
		SELECTION TO ARRAY:C260([TABLE_RECORD_STATES:90]State_Reference:4; ST_at_2DStateRefs{$_l_TableIndex}; [TABLE_RECORD_STATES:90]Listing_Name:2; ST_at_2DStateNames{$_l_TableIndex}; [TABLE_RECORD_STATES:90]State_Code:1; ST_at_2DStateCodes{$_l_TableIndex}; [TABLE_RECORD_STATES:90]xStateClass:8; ST_al_2DStateClasses{$_l_TableIndex}; [TABLE_RECORD_STATES:90]xSortOrder:9; ST_al_2DStateOrders{$_l_TableIndex})
		
		
		SORT ARRAY:C229(ST_al_2DStateOrders{$_l_TableIndex}; ST_at_2DStateRefs{$_l_TableIndex}; ST_at_2DStateNames{$_l_TableIndex}; ST_at_2DStateCodes{$_l_TableIndex}; ST_al_2DStateClasses{$_l_TableIndex})
		
		ST_at_2DStateCodes{$_l_TableIndex}{0}:=""
		ST_HL_SubTable:=New list:C375
		INSERT IN ARRAY:C227(ST_al_2DStatePositions{$_l_TableIndex}; 1; Size of array:C274(ST_at_2DStateRefs{$_l_TableIndex}))
		For ($_l_StateRefIndex; 1; Size of array:C274(ST_at_2DStateRefs{$_l_TableIndex}))
			ST_al_2DStatePositions{$_l_TableIndex}{$_l_StateRefIndex}:=256+STATE_al_RelatedTables{$_l_TableIndex}+$_l_StateRefIndex
			APPEND TO LIST:C376(ST_HL_SubTable; ST_at_2DStateNames{$_l_TableIndex}{$_l_StateRefIndex}; 256+STATE_al_RelatedTables{$_l_TableIndex}+$_l_StateRefIndex; 0; False:C215)
		End for 
		APPEND TO LIST:C376(ST_HL_Tables; STATE_at_RelatedTableNames{$_l_TableIndex}; STATE_al_RelatedTables{$_l_TableIndex}; ST_HL_SubTable; True:C214)
		
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
	$_l_Size:=18
	ARRAY TEXT:C222(ST_at_CodeUseName; 0)
	ARRAY LONGINT:C221(ST_al_CodeUsed; 0)
	ARRAY LONGINT:C221(ST_al_CodeID; 0)
	ARRAY TEXT:C222(ST_at_CodeUseName; $_l_Size)
	ARRAY LONGINT:C221(ST_al_CodeUsed; $_l_Size)
	ARRAY LONGINT:C221(ST_al_CodeID; $_l_Size)
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
	ARRAY BOOLEAN:C223(ST_abo_CodeUsed; 18)
	For ($_l_TableIndex; 1; Size of array:C274(ST_abo_CodeUsed))
		ST_abo_CodeUsed{$_l_TableIndex}:=(ST_al_CodeUsed{$_l_TableIndex}=1)
	End for 
	
End if 
ERR_MethodTrackerReturn("OBJ [USER].File_StatesManager.Button2"; $_t_oldMethodName)
