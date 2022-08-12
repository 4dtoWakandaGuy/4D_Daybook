//%attributes = {}
If (False:C215)
	//Project Method Name:      AA_CloseStates
	//------------------ Method Notes ------------------
	//------------------ Revision Control ----------------
	//Date Created: 01/04/2010 19:42
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(ST_al_2DStateOrders;0)
	//ARRAY LONGINT(ST_al_2DStatePositions;0)
	//ARRAY LONGINT(STATE_al_RelatedTables;0)
	//ARRAY TEXT(ST_at_2DStateCodes;0)
	C_BOOLEAN:C305($_bo_CheckOrders; $_bo_Expanded; $_bo_Update)
	C_LONGINT:C283($_l_CountListItems; $_l_CurrentSort; $_l_CurrentWinRefOLD; $_l_Index; $_l_ItemReference2; $_l_ItemRefPosition; $_l_OK; $_l_ReferenceNum; $_l_SelectedListItem; $_l_SelectedListItem2; $_l_SortOrder)
	C_LONGINT:C283($_l_SublistID; $_l_TableNumber; $_l_WidthCentre; AA_l_CurrentListiD; ST_HL_Tables; ST_l_AnyMods; ST_l_StateRef; WIN_l_CurrentWinRef; WIN_l_CurrentWinRefOLD; xCancel)
	C_TEXT:C284($_t_ItemText; $_t_oldMethodName; $_T_SQLTEXT; UTI_t_CloseMessage; vConfirm)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("AA_CloseStates")

$_l_OK:=0
ST_SaveState(ST_l_StateRef)
If (ST_l_AnyMods=0)
	
	$_l_OK:=0
	OK:=0
	Transact_End
	CANCEL:C270
	
Else 
	UTI_t_CloseMessage:="Do you want to save the changes?"
	$_l_WidthCentre:=Screen width:C187/2
	$_l_CurrentWinRefOLD:=WIN_l_CurrentWinRef
	WIN_l_CurrentWinRef:=Open window:C153($_l_WidthCentre-182; 80; $_l_WidthCentre+182; 175)
	DIALOG:C40([COMPANIES:2]; "dClose")
	CLOSE WINDOW:C154
	WIN_l_CurrentWinRef:=$_l_CurrentWinRefOLD
	$_l_OK:=OK
	If ($_l_OK=0)
		If (xCancel=1)
			$_l_OK:=-1
		End if 
	End if 
	
End if 
Case of 
	: ($_l_OK=1)
		$_bo_Update:=False:C215
		For ($_l_Index; 1; Size of array:C274(ST_at_2DStateCodes))
			
			$_l_TableNumber:=STATE_al_RelatedTables{$_l_Index}
			$_l_SelectedListItem:=List item position:C629(ST_HL_Tables; $_l_TableNumber)
			$_l_ReferenceNum:=0
			
			GET LIST ITEM:C378(ST_HL_Tables; $_l_SelectedListItem; $_l_ItemReference2; $_t_ItemText; $_l_SublistID; $_bo_Expanded)
			
			If (Not:C34($_bo_Expanded))
				SET LIST ITEM:C385(ST_HL_Tables; $_l_ItemReference2; $_t_ItemText; $_l_ItemReference2; $_l_SublistID; True:C214)
			End if 
			$_l_SortOrder:=0
			$_l_CountListItems:=Count list items:C380(ST_HL_Tables)
			For ($_l_SelectedListItem2; $_l_SelectedListItem+1; $_l_CountListItems)
				GET LIST ITEM:C378(ST_HL_Tables; $_l_SelectedListItem2; $_l_ItemReference2; $_t_ItemText; $_l_SublistID; $_bo_Expanded)
				If ($_l_SublistID=0)
					$_l_SortOrder:=$_l_SortOrder+1
					$_l_ItemRefPosition:=Find in array:C230(ST_al_2DStatePositions{$_l_Index}; $_l_ItemReference2)
					If ($_l_ItemRefPosition>0)
						$_l_CurrentSort:=ST_al_2DStateOrders{$_l_Index}{$_l_ItemRefPosition}
					End if 
					If ($_l_SortOrder#$_l_CurrentSort)
						ST_al_2DStateOrders{$_l_Index}{$_l_ItemRefPosition}:=$_l_SortOrder
						$_bo_Update:=True:C214
						$_l_ItemRefPosition:=Find in array:C230(ST_al_2DStatePositions{$_l_Index}; $_l_ItemReference2)
						READ WRITE:C146([TABLE_RECORD_STATES:90])
						QUERY:C277([TABLE_RECORD_STATES:90]; [TABLE_RECORD_STATES:90]Table_number:3=STATE_al_RelatedTables{$_l_Index}; *)
						QUERY:C277([TABLE_RECORD_STATES:90];  & ; [TABLE_RECORD_STATES:90]State_Code:1=ST_at_2DStateCodes{$_l_Index}{$_l_ItemRefPosition})
						[TABLE_RECORD_STATES:90]xSortOrder:9:=$_l_SortOrder
						DB_SaveRecord(->[TABLE_RECORD_STATES:90])
					End if 
				Else 
					$_l_SelectedListItem2:=999999
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
		
	: ($_l_OK=0)
		OK:=0
		Transact_End(False:C215)
		CANCEL:C270
		
	: ($_l_OK=-1)
		
End case 
ERR_MethodTrackerReturn("AA_CloseStates"; $_t_oldMethodName)


