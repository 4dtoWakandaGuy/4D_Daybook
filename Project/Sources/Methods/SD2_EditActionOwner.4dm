//%attributes = {}
If (False:C215)
	//Project Method Name:      SD2_EditActionOwner
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 2010/01/14 2:48 PM
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY INTEGER(SD3_al_SelectedDiaryResources;0)
	//ARRAY LONGINT(SD3_al_DiaryOwners_Resources;0)
	//ARRAY LONGINT(SD3_al_DiaryOwnersPersonIDS;0)
	//ARRAY LONGINT(SD3_al_PreSelDiaryItemOwners;0)
	//ARRAY LONGINT(SD3_al_SelectedDiaryOwners;0)
	C_LONGINT:C283($_l_CurrentWinRefOLD; $_l_Index; $_l_IndexD; $_l_PersonRow; $_l_ResourceRow; WIN_l_CurrentWinRef; WIN_l_CurrentWinRefOLD; WS_l_KEYDiaryItemOwner; WS_l_UPDATEOWNERS)
	C_POINTER:C301($1)
	C_TEXT:C284($_t_oldMethodName; DB_t_Methodname)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SD2_EditActionOwner")
DB_t_Methodname:=Current method name:C684

If (Count parameters:C259>=1)
	If (GenValidatePointer($1))
		ARRAY LONGINT:C221(SD3_al_PreSelDiaryItemOwners; 0)
		COPY ARRAY:C226($1->; SD3_al_PreSelDiaryItemOwners)
		WS_l_KEYDiaryItemOwner:=0
		//Now we can display a dialogue
		$_l_CurrentWinRefOLD:=WIN_l_CurrentWinRef
		WIN_l_CurrentWinRef:=Open window:C153(20; 20; 20; 20; 1)
		DIALOG:C40([USER:15]; "Diary_OwnerDialog")
		CLOSE WINDOW:C154
		WIN_l_CurrentWinRef:=$_l_CurrentWinRefOLD
		If (WS_l_UpdateOwners=1)
			//first delete any
			
			For ($_l_Index; 1; Size of array:C274(SD3_al_PreSelDiaryItemOwners))
				$_l_ResourceRow:=Find in array:C230(SD3_al_DiaryOwnersPersonIDS; SD3_al_PreSelDiaryItemOwners{$_l_Index})
				If ($_l_ResourceRow>0)
					If (SD3_al_SelectedDiaryOwners{$_l_ResourceRow}=0)
						//Take the person out of the diary
						$_l_PersonRow:=Find in array:C230($1->; SD3_al_PreSelDiaryItemOwners{$_l_Index})
						DELETE FROM ARRAY:C228($1->; $_l_PersonRow)
					End if 
				End if 
			End for 
			For ($_l_Index; 1; Size of array:C274(SD3_al_PreSelDiaryItemOwners))
				$_l_ResourceRow:=Find in array:C230(SD3_al_DiaryOwners_Resources; SD3_al_PreSelDiaryItemOwners{$_l_Index})
				If ($_l_ResourceRow>0)
					If (SD3_al_SelectedDiaryOwners{$_l_ResourceRow}=0)
						//Take the person out of the diary
						$_l_PersonRow:=Find in array:C230($1->; SD3_al_PreSelDiaryItemOwners{$_l_Index})
						DELETE FROM ARRAY:C228($1->; $_l_PersonRow)
					End if 
				End if 
			End for 
			//    Now Add any in
			For ($_l_Index; 1; Size of array:C274(SD3_al_DiaryOwnersPersonIDS))
				$_l_PersonRow:=Find in array:C230($1->; SD3_al_DiaryOwnersPersonIDS{$_l_Index})
				If ($_l_PersonRow<0)  //this one does not exist
					If (SD3_al_SelectedDiaryOwners{$_l_Index}=1)
						INSERT IN ARRAY:C227($1->; Size of array:C274($1->)+1; 1)
						$1->{Size of array:C274($1->)}:=SD3_al_DiaryOwnersPersonIDS{$_l_Index}
					End if 
				End if 
			End for 
			For ($_l_Index; 1; Size of array:C274(SD3_al_DiaryOwners_Resources))
				$_l_ResourceRow:=Find in array:C230($1->; SD3_al_DiaryOwners_Resources{$_l_Index})
				If ($_l_ResourceRow<0)  //this one does not exist
					If (SD3_al_SelectedDiaryResources{$_l_Index}=1)
						//Add
						INSERT IN ARRAY:C227($1->; Size of array:C274($1->)+1; 1)
						$1->{Size of array:C274($1->)}:=SD3_al_DiaryOwners_Resources{$_l_Index}
					End if 
				End if 
			End for 
			
			
		End if 
		
	End if 
End if 
ERR_MethodTrackerReturn("SD2_EditActionOwner"; $_t_oldMethodName)
