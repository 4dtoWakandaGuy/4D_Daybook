//%attributes = {}
If (False:C215)
	//Project Method Name:      MP_ModifyDiaryAccess
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 01/04/2010 18:47
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(<>MP_al_DiaryAccessID;0)
	//ARRAY LONGINT(<>PER_al_RelateIDs;0)
	//ARRAY LONGINT(<>PER_al_RemoveRelationID;0)
	//ARRAY LONGINT(SD3_al_DiaryOwnersPersonIDS;0)
	//ARRAY LONGINT(SD3_al_SelectedDiaryOwners;0)
	//ARRAY TEXT(<>MP_at_DiaryAcessInitials;0)
	//ARRAY TEXT(<>PER_at_RelateInitials;0)
	//ARRAY TEXT(<>PER_at_RelateNames;0)
	ARRAY TEXT:C222($_at_Initials; 0)
	//ARRAY TEXT(WS_at_DiaryOwnersPeople;0)
	C_LONGINT:C283($_l_CurrentWinRefOLD; $_l_PersonIndex; $_l_PersonRow; $1; $2; WIN_l_CurrentWinRef; WIN_l_CurrentWinRefOLD; WS_l_UPDATEOWNERS)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("MP_ModifyDiaryAccess")
//this method will be called as a process
//this will display a list of the current personnel
//and show which people this person has access to

ARRAY LONGINT:C221(<>PER_al_RemoveRelationID; 0)
ARRAY TEXT:C222(<>PER_at_RelateInitials; 0)
ARRAY TEXT:C222(<>PER_at_RelateNames; 0)
ARRAY LONGINT:C221(<>PER_al_RelateIDs; 0)
HIDE PROCESS:C324($1)
READ ONLY:C145([PERSONNEL:11])
QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Personnel_ID:48#$2; *)
QUERY:C277([PERSONNEL:11];  & ; [PERSONNEL:11]Startup_List:15=True:C214; *)
QUERY:C277([PERSONNEL:11];  & ; [PERSONNEL:11]PersonDeleted:38#1; *)

QUERY:C277([PERSONNEL:11];  & ; [PERSONNEL:11]Global_Access:47=False:C215)
SELECTION TO ARRAY:C260([PERSONNEL:11]Personnel_ID:48; SD3_al_DiaryOwnersPersonIDS; [PERSONNEL:11]Name:2; WS_at_DiaryOwnersPeople; [PERSONNEL:11]Initials:1; $_at_Initials)
ARRAY LONGINT:C221(SD3_al_SelectedDiaryOwners; Size of array:C274(SD3_al_DiaryOwnersPersonIDS))
For ($_l_PersonIndex; 1; Size of array:C274(<>MP_at_DiaryAcessInitials))
	$_l_PersonRow:=Find in array:C230(SD3_al_DiaryOwnersPersonIDS; <>MP_al_DiaryAccessID{$_l_PersonIndex})
	If ($_l_PersonRow>0)
		SD3_al_SelectedDiaryOwners{$_l_PersonRow}:=1
	End if 
End for 
SORT ARRAY:C229(WS_at_DiaryOwnersPeople; SD3_al_DiaryOwnersPersonIDS; SD3_al_SelectedDiaryOwners; $_at_Initials)
$_l_CurrentWinRefOLD:=WIN_l_CurrentWinRef
WIN_l_CurrentWinRef:=Open window:C153(20; 20; 20; 20; 1)
DIALOG:C40([USER:15]; "Diary_AccessSelector")
CLOSE WINDOW:C154
WIN_l_CurrentWinRef:=$_l_CurrentWinRefOLD
If (WS_l_UpdateOwners=1)  //save updates
	For ($_l_PersonIndex; 1; Size of array:C274(<>MP_al_DiaryAccessID))
		$_l_PersonRow:=Find in array:C230(SD3_al_DiaryOwnersPersonIDS; <>MP_al_DiaryAccessID{$_l_PersonIndex})
		If ($_l_PersonRow>0)
			If (SD3_al_SelectedDiaryOwners{$_l_PersonRow}=0)
				//we want to remove this
				INSERT IN ARRAY:C227(<>PER_al_RemoveRelationID; 9999; 1)
				<>PER_al_RemoveRelationID{Size of array:C274(<>PER_al_RemoveRelationID)}:=<>MP_al_DiaryAccessID{$_l_PersonIndex}
			End if 
		End if 
	End for 
	For ($_l_PersonIndex; 1; Size of array:C274(SD3_al_DiaryOwnersPersonIDS))
		If (SD3_al_SelectedDiaryOwners{$_l_PersonIndex}=1)
			$_l_PersonRow:=Find in array:C230(<>MP_al_DiaryAccessID; SD3_al_DiaryOwnersPersonIDS{$_l_PersonIndex})
			If ($_l_PersonRow<0)
				INSERT IN ARRAY:C227(<>PER_at_RelateInitials; 9999; 1)
				INSERT IN ARRAY:C227(<>PER_at_RelateNames; 9999; 1)
				INSERT IN ARRAY:C227(<>PER_al_RelateIDs; 9999; 1)
				<>PER_at_RelateInitials{Size of array:C274(<>PER_at_RelateInitials)}:=$_at_Initials{$_l_PersonIndex}
				<>PER_at_RelateNames{Size of array:C274(<>PER_at_RelateNames)}:=WS_at_DiaryOwnersPeople{$_l_PersonIndex}
				<>PER_al_RelateIDs{Size of array:C274(<>PER_al_RelateIDs)}:=SD3_al_DiaryOwnersPersonIDS{$_l_PersonIndex}
			End if 
		End if 
		
	End for 
End if 
SHOW PROCESS:C325($1)
ERR_MethodTrackerReturn("MP_ModifyDiaryAccess"; $_t_oldMethodName)
