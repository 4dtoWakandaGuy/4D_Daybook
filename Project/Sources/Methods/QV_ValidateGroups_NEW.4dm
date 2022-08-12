//%attributes = {}
If (False:C215)
	//Project Method Name:      QV_ValidateGroups_NEW
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 01/04/2010 18:12
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(AA_al_ListItemProperttNUM;0;0)
	//ARRAY LONGINT(AA_al_QListItemIDS;0)
	//ARRAY LONGINT(AA_al_QSUBLISTS;0)
	//ARRAY LONGINT(AA_al_SubListItemsIDS;0)
	//ARRAY LONGINT(AL_al_ListItemIDS;0)
	ARRAY TEXT:C222($_at_ValuesUsed; 0)
	//ARRAY TEXT(AA_at_ListItemProperties;0)
	//ARRAY TEXT(AA_at_ListItempropertyNAM;0;0)
	//ARRAY TEXT(AA_at_ListitemPropertyNM;0;0)
	//ARRAY TEXT(AA_at_ListItems;0)
	//ARRAY TEXT(AA_at_QLISTITEMPROPERTIES;0)
	//ARRAY TEXT(AA_at_QListItems;0)
	//ARRAY TEXT(AA_at_SubListItemProperties;0)
	//ARRAY TEXT(AA_at_SubListItems;0)
	//ARRAY TEXT(AA_QLISTITEMPROPERTIES;0)
	//ARRAY TEXT(AA_QListItems;0)
	C_BOOLEAN:C305($_bo_OK)
	C_LONGINT:C283($_l_AddedItemID; $_l_BlankValue; $_l_CurrentWinRefOLD; $_l_Index; $_l_Index2; $_l_ItemID; $_l_LastID; $_l_ListID; $_l_ListIDLoadOther; $_l_listItemIndex; $_l_ListRow)
	C_LONGINT:C283($_l_ParentRow; $_l_ParentRowID; $_l_QualitiesListID; $_l_SubListID; WIN_l_CurrentWinRef; WIN_l_CurrentWinRefOLD)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("QV_ValidateGroups_NEW")
CONFIRM:C162("Clear all?")
If (ok=1)
	User_Vers5000
End if 


SET QUERY DESTINATION:C396(0)
ARRAY TEXT:C222(AA_at_ListItems; 0)
ARRAY LONGINT:C221(AL_al_ListItemIDS; 0)
ARRAY TEXT:C222(AA_at_ListItemProperties; 0)
ARRAY TEXT:C222(AA_at_QListItems; 0)
ARRAY LONGINT:C221(AA_al_QListItemIDS; 0)
ARRAY TEXT:C222(AA_at_QLISTITEMPROPERTIES; 0)
ARRAY TEXT:C222(AA_at_SubListItems; 0)
ARRAY LONGINT:C221(AA_al_SubListItemsIDS; 0)
ARRAY TEXT:C222(AA_at_SubListItemProperties; 0)
//first validate the lists
READ WRITE:C146([LIST_ITEMS:95])
READ WRITE:C146([INFORMATION:55])
ALL RECORDS:C47([LIST_ITEMS:95])
CREATE SET:C116([LIST_ITEMS:95]; "CHECK")
For ($_l_Index; 1; Records in selection:C76([LIST_ITEMS:95]))
	// $_l_Index:=99999999
	USE SET:C118("CHECK")
	GOTO SELECTED RECORD:C245([LIST_ITEMS:95]; $_l_Index)
	
	If ([LIST_ITEMS:95]X_ListID:4>0)
		$_l_ListID:=[LIST_ITEMS:95]X_ListID:4
		QUERY:C277([X_LISTS:111]; [X_LISTS:111]x_ID:1=[LIST_ITEMS:95]X_ListID:4)
		If (Records in selection:C76([X_LISTS:111])=0)
			QUERY:C277([LIST_ITEMS:95]; [LIST_ITEMS:95]X_ListID:4=$_l_ListID)
			If (Records in selection:C76([LIST_ITEMS:95])>0)
				DB_lockFile(->[LIST_ITEMS:95])
				APPLY TO SELECTION:C70([LIST_ITEMS:95]; [LIST_ITEMS:95]X_ListID:4:=0)
				
				AA_CheckFileUnlockedByTableNUM(Table:C252(->[LIST_ITEMS:95]))
				
			End if 
		End if 
	End if 
	
	NEXT RECORD:C51([LIST_ITEMS:95])
End for 
QV_ConsilidateQUALSgroups
ARRAY TEXT:C222(AA_at_ListitemPropertyNM; 0; 0)
ARRAY LONGINT:C221(AA_al_ListItemProperttNUM; 0; 0)
ARRAY TEXT:C222(AA_at_ListItempropertyNAM; 0; 0)
$_l_QualitiesListID:=AA_LoadListByName("Qualities"; ->AA_at_QListItems; ->AA_al_QListItemIDS; False:C215; ->AA_at_QLISTITEMPROPERTIES; ->AA_at_ListitemPropertyNM; ->AA_al_ListItemProperttNUM; ->AA_at_ListItempropertyNAM)
ARRAY LONGINT:C221(AA_al_QSUBLISTS; Size of array:C274(AA_at_QListItems))
For ($_l_Index; 1; Size of array:C274(AA_at_QListItems))
	$_l_ListRow:=Find in array:C230(AA_at_ListitemPropertyNM{$_l_Index}; "SUBLIST")
	If ($_l_ListRow>0)
		AA_al_QSUBLISTS{$_l_Index}:=AA_al_ListItemProperttNUM{$_l_Index}{$_l_ListRow}
	End if 
End for 
$_l_CurrentWinRefOLD:=WIN_l_CurrentWinRef
WIN_l_CurrentWinRef:=Open window:C153(20; 60; 350; 80; -1984)
CREATE EMPTY SET:C140([INFORMATION:55]; "CHECKED")
ARRAY TEXT:C222($_at_ValuesUsed; 0)
ARRAY TEXT:C222($_at_ValuesUsed; Size of array:C274(AA_at_QListItems))
For ($_l_Index; 1; Size of array:C274(AA_at_QListItems))
	ERASE WINDOW:C160
	MESSAGE:C88("Checking:"+AA_at_QListItems{$_l_Index})
	
	READ WRITE:C146([INFORMATION:55])
	$_l_ParentRowID:=AA_al_QListItemIDS{$_l_Index}
	$_l_SubListID:=AA_al_QSUBLISTS{$_l_Index}
	If ($_l_SubListID>0)
		$_bo_OK:=True:C214
		AA_LoadListbyID($_l_SubListID; ->AA_at_ListItems; ->AL_al_ListItemIDS; False:C215; ->AA_at_ListItemProperties)
		$_l_ListRow:=Find in array:C230($_at_ValuesUsed; AA_at_QListItems{$_l_Index})
		If ($_l_ListRow<0)
			READ WRITE:C146([INFORMATION:55])
			QUERY:C277([INFORMATION:55]; [INFORMATION:55]Group:2=AA_at_QListItems{$_l_Index}; *)
			QUERY:C277([INFORMATION:55];  & ; [INFORMATION:55]QualityGroupID:15#$_l_ParentRowID)
			CREATE SET:C116([INFORMATION:55]; "FOUND")
			
			CREATE EMPTY SET:C140([INFORMATION:55]; "TEMP")
			For ($_l_Index2; 1; Size of array:C274(AA_at_ListItems))
				USE SET:C118("FOUND")
				QUERY SELECTION:C341([INFORMATION:55]; [INFORMATION:55]QualityID:14=AL_al_ListItemIDS{$_l_Index2})
				CREATE SET:C116([INFORMATION:55]; "TEMP2")
				UNION:C120("TEMP"; "TEMP2"; "TEMP")
			End for 
			USE SET:C118("TEMP")
			
			If (Records in selection:C76([INFORMATION:55])>0)
				If (Records in selection:C76([INFORMATION:55])>10)
					
					DB_lockFile(->[INFORMATION:55])
					APPLY TO SELECTION:C70([INFORMATION:55]; [INFORMATION:55]QualityGroupID:15:=$_l_ParentRowID)
					
					AA_CheckFileUnlockedByTableNUM(Table:C252(->[INFORMATION:55]))
					QV_UpdateSet(0; -$_l_ParentRowID; 0)
					
				Else 
					
					DB_lockFile(->[INFORMATION:55])
					APPLY TO SELECTION:C70([INFORMATION:55]; [INFORMATION:55]QualityGroupID:15:=$_l_ParentRowID)
					
					AA_CheckFileUnlockedByTableNUM(Table:C252(->[INFORMATION:55]))
				End if 
			End if 
			$_l_BlankValue:=Find in array:C230($_at_ValuesUsed; "")
			$_at_ValuesUsed{$_l_BlankValue}:=AA_at_QListItems{$_l_Index}
		End if 
		
		
		For ($_l_listItemIndex; 1; Size of array:C274(AA_at_ListItems))
			ERASE WINDOW:C160
			MESSAGE:C88("Checking:"+AA_at_QListItems{$_l_Index}+" -"+AA_at_ListItems{$_l_listItemIndex})
			
			$_l_ItemID:=AL_al_ListItemIDS{$_l_listItemIndex}
			QUERY:C277([INFORMATION:55]; [INFORMATION:55]QualityID:14=$_l_ItemID)
			CREATE SET:C116([INFORMATION:55]; "ThisMatch")
			UNION:C120("CHECKED"; "ThisMatch"; "CHECKED")
			
			READ WRITE:C146([INFORMATION:55])
			QUERY SELECTION:C341([INFORMATION:55]; [INFORMATION:55]QualityGroupID:15#$_l_ParentRowID)
			If (Records in selection:C76([INFORMATION:55])>0)
				If (Records in selection:C76([INFORMATION:55])>10)
					DB_lockFile(->[INFORMATION:55])
					APPLY TO SELECTION:C70([INFORMATION:55]; [INFORMATION:55]QualityGroupID:15:=$_l_ParentRowID)
					
					AA_CheckFileUnlockedByTableNUM(Table:C252(->[INFORMATION:55]))
					QV_UpdateSet(0; -$_l_ParentRowID; 0)
					
				Else 
					
					DB_lockFile(->[INFORMATION:55])
					APPLY TO SELECTION:C70([INFORMATION:55]; [INFORMATION:55]QualityGroupID:15:=$_l_ParentRowID)
					
					AA_CheckFileUnlockedByTableNUM(Table:C252(->[INFORMATION:55]))
				End if 
				
				
				
			End if 
			
			
			
		End for 
	End if 
	
End for 
CLOSE WINDOW:C154
WIN_l_CurrentWinRef:=$_l_CurrentWinRefOLD
$_l_CurrentWinRefOLD:=WIN_l_CurrentWinRef
WIN_l_CurrentWinRef:=Open window:C153(20; 60; 350; 80; -1984)

For ($_l_Index; 1; Size of array:C274(AA_at_QListItems))
	ERASE WINDOW:C160
	MESSAGE:C88("Checking:"+AA_at_QListItems{$_l_Index})
	
	$_l_ParentRowID:=AA_al_QListItemIDS{$_l_Index}
	$_l_SubListID:=AA_al_QSUBLISTS{$_l_Index}
	If ($_l_SubListID>0)
		AA_LoadListbyID($_l_SubListID; ->AA_at_ListItems; ->AL_al_ListItemIDS; False:C215; ->AA_at_ListItemProperties)
	Else 
		$_l_SubListID:=AA_GetListbyName(AA_at_QListItems{$_l_Index})
		ARRAY TEXT:C222(AA_at_ListItems; 0)
		ARRAY LONGINT:C221(AL_al_ListItemIDS; 0)
		ARRAY TEXT:C222(AA_at_ListItemProperties; 0)
	End if 
	
	QUERY:C277([INFORMATION:55]; [INFORMATION:55]QualityGroupID:15=$_l_ParentRowID)
	ORDER BY:C49([INFORMATION:55]; [INFORMATION:55]SubGroup:6)
	$_l_LastID:=0
	For ($_l_listItemIndex; 1; Records in selection:C76([INFORMATION:55]))
		ERASE WINDOW:C160
		MESSAGE:C88("Checking:"+AA_at_QListItems{$_l_Index}+" "+[INFORMATION:55]SubGroup:6)
		If ([INFORMATION:55]QualityID:14#$_l_LastID)
			
			$_l_ListRow:=Find in array:C230(AL_al_ListItemIDS; [INFORMATION:55]QualityID:14)
			$_l_LastID:=[INFORMATION:55]QualityID:14
			If ($_l_ListRow<0)
				MESSAGE:C88("attaching  to group")
				READ WRITE:C146([LIST_ITEMS:95])
				QUERY:C277([LIST_ITEMS:95]; [LIST_ITEMS:95]X_ID:3=[INFORMATION:55]QualityID:14)
				If ([LIST_ITEMS:95]X_ListID:4=0)
					[LIST_ITEMS:95]X_ListID:4:=$_l_SubListID
					DB_SaveRecord(->[LIST_ITEMS:95])
					AA_CheckFileUnlocked(->[LIST_ITEMS:95]X_ID:3)
					AA_LoadListbyID($_l_SubListID; ->AA_at_ListItems; ->AL_al_ListItemIDS; False:C215; ->AA_at_ListItemProperties)
				Else 
					$_l_LastID:=0
					//The qualities item id is wrong-probably
					$_l_ListRow:=Find in array:C230(AA_al_QSUBLISTS; [LIST_ITEMS:95]X_ListID:4)
					$_bo_OK:=False:C215
					If ($_l_ListRow>0)
						If ([INFORMATION:55]Group:2=AA_at_ListItems{$_l_ListRow})
							$_bo_OK:=True:C214
						End if 
						
					End if 
					If ($_bo_OK)
						MESSAGE:C88("quality is in wrong group")
						$_l_ListIDLoadOther:=[LIST_ITEMS:95]X_ListID:4
						AA_LoadListbyID($_l_ListIDLoadOther; ->AA_at_ListItems; ->AL_al_ListItemIDS; False:C215; ->AA_at_ListItemProperties)
						$_l_ListRow:=Find in array:C230(AA_at_ListItems; [INFORMATION:55]SubGroup:6)
						If ($_l_ListRow<0)
							MESSAGE:C88("Attaching to another group")
							$_l_AddedItemID:=AA_ListAddItembyID($_l_ListIDLoadOther; [INFORMATION:55]SubGroup:6)
							AA_LoadListbyID($_l_ListIDLoadOther; ->AA_at_ListItems; ->AL_al_ListItemIDS; False:C215; ->AA_at_ListItemProperties)
							$_l_ListRow:=Find in array:C230(AA_at_ListItems; [INFORMATION:55]SubGroup:6)
						End if 
						$_l_ParentRow:=Find in array:C230(AA_al_QSUBLISTS; $_l_ListIDLoadOther)
						[INFORMATION:55]Group:2:=AA_at_QListItems{$_l_ParentRow}
						[INFORMATION:55]QualityGroupID:15:=AA_al_QListItemIDS{$_l_ParentRow}
						[INFORMATION:55]SubGroup:6:=AA_at_ListItems{$_l_ListRow}
						[INFORMATION:55]QualityID:14:=AL_al_ListItemIDS{$_l_ListRow}
						DB_SaveRecord(->[INFORMATION:55])
						AA_CheckFileUnlocked(->[INFORMATION:55]QualityRecordID:16)
						AA_LoadListbyID($_l_SubListID; ->AA_at_ListItems; ->AL_al_ListItemIDS; False:C215; ->AA_at_ListItemProperties)
						
					Else 
						[LIST_ITEMS:95]X_ListID:4:=$_l_SubListID
						DB_SaveRecord(->[LIST_ITEMS:95])
						AA_CheckFileUnlocked(->[LIST_ITEMS:95]X_ID:3)
						AA_LoadListbyID($_l_SubListID; ->AA_at_ListItems; ->AL_al_ListItemIDS; False:C215; ->AA_at_ListItemProperties)
						
						
						
					End if 
					
				End if 
			End if 
		End if 
		
		NEXT RECORD:C51([INFORMATION:55])
		
	End for 
	
	
	
	
End for 
CLOSE WINDOW:C154
WIN_l_CurrentWinRef:=$_l_CurrentWinRefOLD
ERR_MethodTrackerReturn("QV_ValidateGroups_NEW"; $_t_oldMethodName)
