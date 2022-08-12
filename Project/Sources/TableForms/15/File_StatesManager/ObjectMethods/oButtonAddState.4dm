If (False:C215)
	//object Name: [USER]File_StatesManager.oButtonAddState
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 01/11/2012 10:51
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(FS_al_AssociatedStockIDS;0)
	//ARRAY LONGINT(ST_al_CodeUsed;0)
	//ARRAY LONGINT(STATE_al_RelatedTables;0)
	//ARRAY TEXT(FS_at_AssocatedStockStatus;0)
	//ARRAY TEXT(ST_at_2DStateCodes;0)
	//ARRAY TEXT(ST_at_PipelineState;0)
	//ARRAY TEXT(STATE_at_RelatedTableNames;0)
	C_LONGINT:C283($_l_HighState; $_l_index; $_l_ListID; $_l_NextStateNumber; $_l_RelatedTableRow; $_l_StateRow; $_l_TableRow; ST_l_Modified; ST_l_StateClass; ST_l_StateRef; STATE_l_RelateTableID)
	C_LONGINT:C283(STK_l_AllocationStatus)
	C_TEXT:C284($_t_oldMethodName; State_t_AbbrevEntryName; STATE_t_ClassName; STATE_t_Code; State_t_EntryName; State_t_ListName; State_t_PipeLineStatus; STATE_t_SelectedStateRef; State_t_TableName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].File_StatesManager.oButtonAddState"; Form event code:C388)

ST_SaveState(ST_l_StateRef)

OBJECT SET ENTERABLE:C238(State_t_ListName; True:C214)
OBJECT SET ENTERABLE:C238(State_t_EntryName; True:C214)
OBJECT SET ENTERABLE:C238(State_t_AbbrevEntryName; True:C214)
OBJECT SET VISIBLE:C603(STATE_at_RelatedTableNames; True:C214)
OBJECT SET VISIBLE:C603(ST_at_PipelineState; True:C214)
STATE_t_ClassName:=""
ST_l_StateClass:=0

STATE_t_Code:=""
State_t_ListName:=""
State_t_EntryName:=""
State_t_AbbrevEntryName:=""
STATE_l_RelateTableID:=0
STATE_t_SelectedStateRef:=""

State_t_PipeLineStatus:=""
ST_at_PipelineState:=0

//State_t_TableName:=""
If (State_t_TableName#"")
	$_l_RelatedTableRow:=Find in array:C230(STATE_at_RelatedTableNames; State_t_TableName)
	If ($_l_RelatedTableRow>0)
		STATE_l_RelateTableID:=STATE_al_RelatedTables{STATE_at_RelatedTableNames}
		$_l_TableRow:=Find in array:C230(STATE_al_RelatedTables; STATE_l_RelateTableID)
		If ($_l_TableRow>0)  //it should be
			$_l_HighState:=Num:C11(ST_at_2DStateCodes{$_l_TableRow}{Size of array:C274(ST_at_2DStateCodes{$_l_TableRow})})
		End if 
		$_l_NextStateNumber:=AA_GetNextID(->[TABLE_RECORD_STATES:90]State_Code:1; $_l_HighState+1)
		STATE_t_Code:=String:C10($_l_NextStateNumber)
		ST_l_Modified:=1
		Case of 
			: (STATE_l_RelateTableID=Table:C252(->[PURCHASE_ORDERS:57]))  //load the purchase allocation status here
				$_l_ListID:=AA_GetListbyName("Purchase Order Stock Status")
				ARRAY TEXT:C222(FS_at_AssocatedStockStatus; 0)
				ARRAY LONGINT:C221(FS_al_AssociatedStockIDS; 0)
				AA_LoadListbyID($_l_ListID; ->FS_at_AssocatedStockStatus; ->FS_al_AssociatedStockIDS)
				$_l_StateRow:=Find in array:C230(FS_at_AssocatedStockStatus; "Cannot Be allocated to Orders")
				If ($_l_StateRow<0)
					AA_ListAddItembyID($_l_ListID; "Cannot Be allocated to Orders")
				End if 
				$_l_StateRow:=Find in array:C230(FS_at_AssocatedStockStatus; "Can Be Allocated To Orders")
				If ($_l_StateRow<0)
					AA_ListAddItembyID($_l_ListID; "Cancel Allocations to Orders")
				End if 
				$_l_StateRow:=Find in array:C230(FS_at_AssocatedStockStatus; "Cancel Allocations to Orders")
				If ($_l_StateRow<0)
					AA_ListAddItembyID($_l_ListID; "Can Be Allocated To Orders")
				End if 
				AA_LoadListbyID($_l_ListID; ->FS_at_AssocatedStockStatus; ->FS_al_AssociatedStockIDS)
				
				
			: (STATE_l_RelateTableID=Table:C252(->[PURCHASE_INVOICES:37]))
				$_l_ListID:=AA_GetListbyName("Purchases Stock Status")
				ARRAY TEXT:C222(FS_at_AssocatedStockStatus; 0)
				ARRAY LONGINT:C221(FS_al_AssociatedStockIDS; 0)
				AA_LoadListbyID($_l_ListID; ->FS_at_AssocatedStockStatus; ->FS_al_AssociatedStockIDS)
				$_l_StateRow:=Find in array:C230(FS_at_AssocatedStockStatus; "Cannot Be allocated to Orders")
				If ($_l_StateRow<0)
					AA_ListAddItembyID($_l_ListID; "Cannot Be allocated to Orders")
				End if 
				$_l_StateRow:=Find in array:C230(FS_at_AssocatedStockStatus; "Can Be Allocated To Orders")
				If ($_l_StateRow<0)
					AA_ListAddItembyID($_l_ListID; "Cancel Allocations to Orders")
				End if 
				$_l_StateRow:=Find in array:C230(FS_at_AssocatedStockStatus; "Cancel Allocations to Orders")
				If ($_l_StateRow<0)
					AA_ListAddItembyID($_l_ListID; "Can Be Allocated To Orders")
				End if 
				AA_LoadListbyID($_l_ListID; ->FS_at_AssocatedStockStatus; ->FS_al_AssociatedStockIDS)
				
				
			: (STATE_l_RelateTableID=Table:C252(->[ORDERS:24]))
				$_l_ListID:=AA_GetListbyName("Sales Order Stock Status")
				ARRAY TEXT:C222(FS_at_AssocatedStockStatus; 0)
				ARRAY LONGINT:C221(FS_al_AssociatedStockIDS; 0)
				AA_LoadListbyID($_l_ListID; ->FS_at_AssocatedStockStatus; ->FS_al_AssociatedStockIDS)
				$_l_StateRow:=Find in array:C230(FS_at_AssocatedStockStatus; "No Stock Allocation")
				If ($_l_StateRow<0)
					AA_ListAddItembyID($_l_ListID; "No Stock Allocation")
				End if 
				$_l_StateRow:=Find in array:C230(FS_at_AssocatedStockStatus; "Unconfirmed Allocation")
				If ($_l_StateRow<0)
					AA_ListAddItembyID($_l_ListID; "Unconfirmed Allocation")
				End if 
				$_l_StateRow:=Find in array:C230(FS_at_AssocatedStockStatus; "Confirmed Allocation")
				If ($_l_StateRow<0)
					AA_ListAddItembyID($_l_ListID; "Confirmed Allocation")
				End if 
				$_l_StateRow:=Find in array:C230(FS_at_AssocatedStockStatus; "Fixed Allocation")
				If ($_l_StateRow<0)
					AA_ListAddItembyID($_l_ListID; "Fixed Allocation")
				End if 
				$_l_StateRow:=Find in array:C230(FS_at_AssocatedStockStatus; "Release Allocation")
				If ($_l_StateRow<0)
					AA_ListAddItembyID($_l_ListID; "Release Allocation")
				End if 
				AA_LoadListbyID($_l_ListID; ->FS_at_AssocatedStockStatus; ->FS_al_AssociatedStockIDS)
				
			: (STATE_l_RelateTableID=Table:C252(->[INVOICES:39]))
			Else 
				STK_l_AllocationStatus:=0
		End case 
	Else 
		STATE_l_RelateTableID:=0
	End if 
End if 
ST_l_Modified:=0
ST_l_StateRef:=-1
For ($_l_index; 1; Size of array:C274(ST_al_CodeUsed))
	ST_al_CodeUsed{$_l_index}:=0
End for 

//Clear Functions
ERR_MethodTrackerReturn("OBJ [USER].File_StatesManager.oButtonAddState"; $_t_oldMethodName)
