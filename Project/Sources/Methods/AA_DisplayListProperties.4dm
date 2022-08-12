//%attributes = {}
If (False:C215)
	//Project Method Name:      AA_DisplayListProperties
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
	//ARRAY LONGINT(AA_al_ListPropertyIDs;0)
	//ARRAY LONGINT(AA_al_TickMark;0)
	//ARRAY TEXT(AA_at_ListProperties;0)
	//ARRAY TEXT(AA_at_PropertiesListProperties;0)
	C_BOOLEAN:C305($_bo_Updates; $0; AA_bo_SaveProperties)
	C_LONGINT:C283($_l_CurrentWinRefOLD; $_l_index; $_l_PropertyIDPosition; AA_l_PropertyListID; WIN_l_CurrentWinRef; WIN_l_CurrentWinRefOLD)
	C_POINTER:C301($_Ptr_Array; $_ptr_ArrayPointer; $1; $2)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("AA_DisplayListProperties")
//this method will display  a list of all the properties with the set values ticke

If (Count parameters:C259>=1)
	$_Ptr_Array:=$1
	// $1 is a pointer to an array of currently selected values
	ARRAY TEXT:C222(AA_at_ListProperties; 0)
	ARRAY LONGINT:C221(AA_al_ListPropertyIDs; 0)
	ARRAY TEXT:C222(AA_at_PropertiesListProperties; 0)
	ARRAY LONGINT:C221(AA_al_TickMark; 0)
	
	AA_l_PropertyListID:=AA_LoadListByName("List Properties"; ->AA_at_ListProperties; ->AA_al_ListPropertyIDs; False:C215; ->AA_at_PropertiesListProperties)
	ARRAY LONGINT:C221(AA_al_TickMark; Size of array:C274(AA_at_ListProperties))
	For ($_l_index; 1; Size of array:C274($_Ptr_Array->))
		$_l_PropertyIDPosition:=Find in array:C230(AA_al_ListPropertyIDs; $_Ptr_Array->{$_l_index})
		If ($_l_PropertyIDPosition>0)  //it should be
			AA_al_TickMark{$_l_PropertyIDPosition}:=1
		End if 
	End for 
	
End if 
$_l_CurrentWinRefOLD:=WIN_l_CurrentWinRef
WIN_l_CurrentWinRef:=Open window:C153(20; 20; 20; 20; 1)
DIALOG:C40([USER:15]; "List_PropertiesManager")
CLOSE WINDOW:C154
WIN_l_CurrentWinRef:=$_l_CurrentWinRefOLD
$_bo_Updates:=False:C215
If (AA_bo_SaveProperties)
	//save the update to the array-update the screen
	//and also if an item is loaded the list of properties for that
	//and of course flag the list as needing saving
	//first remove any deleted ones
	If (Count parameters:C259>=2)
		$_ptr_ArrayPointer:=$2
		For ($_l_index; Size of array:C274($_Ptr_Array->); 1; -1)
			$_l_PropertyIDPosition:=Find in array:C230(AA_al_ListPropertyIDs; $_Ptr_Array->{$_l_index})
			If ($_l_PropertyIDPosition>0)  //it should be
				If (AA_al_TickMark{$_l_PropertyIDPosition}=0)
					//not required so delete
					DELETE FROM ARRAY:C228($_ptr_ArrayPointer->; $_l_index; 1)
					DELETE FROM ARRAY:C228($_Ptr_Array->; $_l_index; 1)
					$_bo_Updates:=True:C214
				End if 
			End if 
		End for 
		For ($_l_index; 1; Size of array:C274(AA_al_ListPropertyIDs))
			If (AA_al_TickMark{$_l_index}=1)
				$_l_PropertyIDPosition:=Find in array:C230($_Ptr_Array->; AA_al_ListPropertyIDs{$_l_index})
				If ($_l_PropertyIDPosition<0)
					//needs adding in
					APPEND TO ARRAY:C911($_Ptr_Array->; AA_al_ListPropertyIDs{$_l_index})
					APPEND TO ARRAY:C911($_ptr_ArrayPointer->; AA_at_ListProperties{$_l_index})
					
					$_bo_Updates:=True:C214
				End if 
			End if 
			
		End for 
	End if 
Else 
	AA_l_PropertyListID:=AA_LoadListByName("List Properties"; ->AA_at_ListProperties; ->AA_al_ListPropertyIDs; False:C215; ->AA_at_PropertiesListProperties)
	$_bo_Updates:=False:C215
End if 
$0:=$_bo_Updates
ERR_MethodTrackerReturn("AA_DisplayListProperties"; $_t_oldMethodName)
