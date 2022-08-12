//%attributes = {}
If (False:C215)
	//Project Method Name:      QV_ConsilidateQUALSgroups
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 10/09/2012 16:06
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY LONGINT:C221($_al_ClearThisItemID; 0)
	ARRAY LONGINT:C221($_al_DeleteMe1; 0)
	ARRAY LONGINT:C221($_al_DeleteMe2; 0)
	//ARRAY LONGINT(AA_al_QListItemIDS;0)
	//ARRAY LONGINT(AA_al_QSUBLISTS;0)
	//ARRAY LONGINT(AL_al_ListItemIDS;0)
	//ARRAY LONGINT(QV_al_QualityPropertiesNUM;0;0)
	//ARRAY TEXT(AA_at_ListItemProperties;0)
	//ARRAY TEXT(AA_at_ListItems;0)
	//ARRAY TEXT(AA_at_QLISTITEMPROPERTIES;0)
	//ARRAY TEXT(AA_at_QListItems;0)
	//ARRAY TEXT(QV_at_QualityProperties;0;0)
	//ARRAY TEXT(QV_at_QualityPropertiesNAM;0;0)
	C_LONGINT:C283($_l_ChangeTo; $_l_CurrentRow; $_l_Index; $_l_listItemIndex; $_l_MovetoGroupID; $_l_NewParentID; $_l_ParentID; $_l_QualitiesListID; $_l_SublistColumn; $_l_SubListID)
	C_TEXT:C284($_t_LastGroupName; $_t_LastItem; $_t_oldMethodName; $_t_SubListSTR)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("QV_ConsilidateQUALSgroups")
//``consilidate double entries
ARRAY TEXT:C222(QV_at_QualityProperties; 0; 0)
ARRAY LONGINT:C221(QV_al_QualityPropertiesNUM; 0; 0)
ARRAY TEXT:C222(QV_at_QualityPropertiesNAM; 0; 0)

$_l_QualitiesListID:=AA_LoadListByName("Qualities"; ->AA_at_QListItems; ->AA_al_QListItemIDS; False:C215; ->AA_at_QLISTITEMPROPERTIES; ->QV_at_QualityProperties; ->QV_al_QualityPropertiesNUM; ->QV_at_QualityPropertiesNAM)

ARRAY LONGINT:C221(AA_al_QSUBLISTS; Size of array:C274(AA_at_QListItems))

For ($_l_Index; 1; Size of array:C274(AA_at_QListItems))
	$_l_SublistColumn:=Find in array:C230(QV_at_QualityProperties{$_l_Index}; "SUBLIST")
	If ($_l_SublistColumn>0)
		AA_al_QSUBLISTS{$_l_Index}:=QV_al_QualityPropertiesNUM{$_l_Index}{$_l_SublistColumn}
	End if 
	
End for 
SORT ARRAY:C229(AA_at_QListItems; AA_al_QListItemIDS; AA_at_QLISTITEMPROPERTIES; AA_al_QSUBLISTS; QV_at_QualityProperties; QV_al_QualityPropertiesNUM; QV_at_QualityPropertiesNAM)
$_t_LastGroupName:=""
ARRAY LONGINT:C221($_al_DeleteMe1; Size of array:C274(AA_at_QListItems))
ARRAY LONGINT:C221($_al_DeleteMe2; Size of array:C274(AA_at_QListItems))
$_l_CurrentRow:=0

For ($_l_Index; 1; Size of array:C274(AA_at_QListItems))
	If (AA_at_QListItems{$_l_Index}=$_t_LastGroupName)
		//this group is the same as the last group
		//so kill it
		If ($_l_MovetoGroupID=0)
			$_l_MovetoGroupID:=AA_al_QSUBLISTS{$_l_Index-1}
			$_l_NewParentID:=AA_al_QListItemIDS{$_l_Index-1}
		End if 
		$_l_ParentID:=AA_al_QListItemIDS{$_l_Index}
		$_l_SubListID:=AA_al_QSUBLISTS{$_l_Index}
		AA_LoadListbyID($_l_SubListID; ->AA_at_ListItems; ->AL_al_ListItemIDS; False:C215; ->AA_at_ListItemProperties)
		READ WRITE:C146([LIST_ITEMS:95])
		QUERY:C277([LIST_ITEMS:95]; [LIST_ITEMS:95]X_ListID:4=$_l_SubListID)
		
		DB_lockFile(->[LIST_ITEMS:95])
		APPLY TO SELECTION:C70([LIST_ITEMS:95]; [LIST_ITEMS:95]X_ListID:4:=$_l_MovetoGroupID)
		
		AA_CheckFileUnlockedByTableNUM(Table:C252(->[LIST_ITEMS:95]))
		READ WRITE:C146([INFORMATION:55])
		QUERY:C277([INFORMATION:55]; [INFORMATION:55]QualityGroupID:15=$_l_ParentID)
		DB_lockFile(->[INFORMATION:55])
		APPLY TO SELECTION:C70([INFORMATION:55]; [INFORMATION:55]QualityGroupID:15:=$_l_NewParentID)
		
		AA_CheckFileUnlockedByTableNUM(Table:C252(->[INFORMATION:55]))
		$_l_CurrentRow:=$_l_CurrentRow+1
		$_al_DeleteMe1{$_l_CurrentRow}:=$_l_SubListID
		$_al_DeleteMe2{$_l_CurrentRow}:=$_l_ParentID
	Else 
		$_l_MovetoGroupID:=0
		$_t_LastGroupName:=AA_at_QListItems{$_l_Index}
	End if 
End for 
ARRAY LONGINT:C221($_al_DeleteMe1; $_l_CurrentRow)
ARRAY LONGINT:C221($_al_DeleteMe2; $_l_CurrentRow)

For ($_l_Index; 1; Size of array:C274($_al_DeleteMe2))
	READ WRITE:C146([X_LISTS:111])
	QUERY:C277([X_LISTS:111]; [X_LISTS:111]x_ID:1=$_al_DeleteMe1{$_l_Index})
	DELETE RECORD:C58([X_LISTS:111])
	READ WRITE:C146([LIST_ITEMS:95])
	QUERY:C277([LIST_ITEMS:95]; [LIST_ITEMS:95]X_ID:3=$_al_DeleteMe2{$_l_Index})
	DELETE RECORD:C58([LIST_ITEMS:95])
End for 
$_l_QualitiesListID:=AA_LoadListByName("Qualities"; ->AA_at_QListItems; ->AA_al_QListItemIDS; False:C215; ->AA_at_QLISTITEMPROPERTIES)
ARRAY LONGINT:C221(AA_al_QSUBLISTS; Size of array:C274(AA_at_QListItems))
For ($_l_Index; 1; Size of array:C274(AA_at_QListItems))
	$_t_SubListSTR:=AA_GetProperty("SUBLIST"; AA_at_QLISTITEMPROPERTIES{$_l_Index})
	AA_al_QSUBLISTS{$_l_Index}:=Num:C11($_t_SubListSTR)
End for 
For ($_l_Index; 1; Size of array:C274(AA_at_QListItems))
	$_l_ParentID:=AA_al_QListItemIDS{$_l_Index}
	$_l_SubListID:=AA_al_QSUBLISTS{$_l_Index}
	If ($_l_SubListID>0)
		AA_LoadListbyID($_l_SubListID; ->AA_at_ListItems; ->AL_al_ListItemIDS; False:C215; ->AA_at_ListItemProperties)
		SORT ARRAY:C229(AA_at_ListItems; AL_al_ListItemIDS; AA_at_ListItemProperties)
		$_t_LastItem:=""
		ARRAY LONGINT:C221($_al_ClearThisItemID; Size of array:C274(AA_at_ListItems))
		$_l_CurrentRow:=0
		For ($_l_listItemIndex; 1; Size of array:C274(AA_at_ListItems))
			If (AA_at_ListItems{$_l_listItemIndex}=$_t_LastItem)
				MESSAGE:C88("Checking:"+AA_at_QListItems{$_l_Index}+" -"+AA_at_ListItems{$_l_listItemIndex})
				$_l_CurrentRow:=$_l_CurrentRow+1
				$_al_ClearThisItemID{$_l_CurrentRow}:=AL_al_ListItemIDS{$_l_listItemIndex}
				If ($_l_ChangeTo=0)
					$_l_ChangeTo:=AL_al_ListItemIDS{$_l_listItemIndex-1}
				End if 
				READ WRITE:C146([INFORMATION:55])
				QUERY:C277([INFORMATION:55]; [INFORMATION:55]QualityID:14=AL_al_ListItemIDS{$_l_listItemIndex})
				
				
				If (Records in selection:C76([INFORMATION:55])>0)
					DB_lockFile(->[INFORMATION:55])
					APPLY TO SELECTION:C70([INFORMATION:55]; [INFORMATION:55]QualityID:14:=$_l_ChangeTo)
					
					AA_CheckFileUnlockedByTableNUM(Table:C252(->[INFORMATION:55]))
					QV_UpdateSet(0; $_l_ChangeTo; 0)
				End if 
				
				
			Else 
				$_t_LastItem:=AA_at_ListItems{$_l_listItemIndex}
				$_l_ChangeTo:=0
			End if 
			
		End for 
		ARRAY LONGINT:C221($_al_ClearThisItemID; $_l_CurrentRow)
		For ($_l_listItemIndex; 1; Size of array:C274($_al_ClearThisItemID))
			READ WRITE:C146([LIST_ITEMS:95])
			QUERY:C277([LIST_ITEMS:95]; [LIST_ITEMS:95]X_ID:3=$_al_ClearThisItemID{$_l_listItemIndex})
			DELETE RECORD:C58([LIST_ITEMS:95])
		End for 
		
	End if 
	
End for 
ERR_MethodTrackerReturn("QV_ConsilidateQUALSgroups"; $_t_oldMethodName)
