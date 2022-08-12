//%attributes = {}
If (False:C215)
	//Project Method Name:      WS_AddDiaryitemOwner
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 01/04/2010 17:32
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
	C_BOOLEAN:C305($_bo_Available)
	C_LONGINT:C283($_l_Index; $_l_OwnerPosition; $_l_PersonelID; $_l_CurrentWinRefOLD; WIN_l_CurrentWinRef; WIN_l_CurrentWinRefOLD; WS_l_KEYDiaryItemOwner; WS_l_UPDATEOWNERS)
	C_TEXT:C284($_t_oldMethodName; $1; $2)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("WS_AddDiaryitemOwner")

If (Count parameters:C259>=2)
	//who is that diary owner
	If ($2#"")
		READ ONLY:C145([PERSONNEL:11])
		QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Initials:1=$2)
		If ([PERSONNEL:11]Personnel_ID:48=0)
			READ WRITE:C146([PERSONNEL:11])
			QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Personnel_ID:48=0)
			If (Not:C34(In transaction:C397))
				DB_lockFile(->[PERSONNEL:11])
				APPLY TO SELECTION:C70([PERSONNEL:11]; [PERSONNEL:11]Personnel_ID:48:=0)
				
				AA_CheckFileUnlockedByTableNUM(Table:C252(->[PERSONNEL:11]))
			Else 
				FIRST RECORD:C50([PERSONNEL:11])
				For ($_l_Index; 1; Records in selection:C76([PERSONNEL:11]))
					[PERSONNEL:11]Personnel_ID:48:=0
					DB_SaveRecord(->[PERSONNEL:11])
					AA_CheckFileUnlockedByTableNUM(Table:C252(->[PERSONNEL:11]))
					NEXT RECORD:C51([PERSONNEL:11])
				End for 
			End if 
			
			UNLOAD RECORD:C212([PERSONNEL:11])
			READ ONLY:C145([PERSONNEL:11])
			QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Initials:1=$2)
		End if 
		$_l_PersonelID:=[PERSONNEL:11]Personnel_ID:48
	End if 
	If ($_l_PersonelID>0)
		QUERY:C277([DIARY_ITEMOWNERS:106]; [DIARY_ITEMOWNERS:106]DIARY_CODE:1=$1; *)
		QUERY:C277([DIARY_ITEMOWNERS:106];  & ; [DIARY_ITEMOWNERS:106]PERSONNEL_ID:2#$_l_PersonelID)
	Else 
		QUERY:C277([DIARY_ITEMOWNERS:106]; [DIARY_ITEMOWNERS:106]DIARY_CODE:1=$1; *)
		QUERY:C277([DIARY_ITEMOWNERS:106];  & ; [DIARY_ITEMOWNERS:106]PERSONNEL_ID:2#0)
	End if 
	//This give us all the current owners of this diary item
	ARRAY LONGINT:C221(SD3_al_PreSelDiaryItemOwners; 0)
	SELECTION TO ARRAY:C260([DIARY_ITEMOWNERS:106]PERSONNEL_ID:2; SD3_al_PreSelDiaryItemOwners)
	WS_l_KEYDiaryItemOwner:=$_l_PersonelID
	//Now we can display a dialogue
	$_l_CurrentWinRefOLD:=WIN_l_CurrentWinRef
	WIN_l_CurrentWinRef:=Open window:C153(20; 20; 20; 20; 1)
	DIALOG:C40([USER:15]; "Diary_OwnerDialog")
	CLOSE WINDOW:C154
	WIN_l_CurrentWinRef:=$_l_CurrentWinRefOLD
	If (WS_l_UpdateOwners=1)
		//first delete any
		
		For ($_l_Index; 1; Size of array:C274(SD3_al_PreSelDiaryItemOwners))
			$_l_OwnerPosition:=Find in array:C230(SD3_al_DiaryOwnersPersonIDS; SD3_al_PreSelDiaryItemOwners{$_l_Index})
			If ($_l_OwnerPosition>0)
				If (SD3_al_SelectedDiaryOwners{$_l_OwnerPosition}=0)
					//Take the person out of the diary
					READ WRITE:C146([DIARY_ITEMOWNERS:106])
					QUERY:C277([DIARY_ITEMOWNERS:106]; [DIARY_ITEMOWNERS:106]DIARY_CODE:1=$1; *)
					QUERY:C277([DIARY_ITEMOWNERS:106];  & ; [DIARY_ITEMOWNERS:106]PERSONNEL_ID:2=SD3_al_PreSelDiaryItemOwners{$_l_Index})
					DELETE RECORD:C58([DIARY_ITEMOWNERS:106])
					READ ONLY:C145([DIARY_ITEMOWNERS:106])
				End if 
			End if 
		End for 
		For ($_l_Index; 1; Size of array:C274(SD3_al_PreSelDiaryItemOwners))
			$_l_OwnerPosition:=Find in array:C230(SD3_al_DiaryOwners_Resources; SD3_al_PreSelDiaryItemOwners{$_l_Index})
			If ($_l_OwnerPosition>0)
				If (SD3_al_SelectedDiaryResources{$_l_OwnerPosition}=0)
					//Take the person out of the diary
					READ WRITE:C146([DIARY_ITEMOWNERS:106])
					QUERY:C277([DIARY_ITEMOWNERS:106]; [DIARY_ITEMOWNERS:106]DIARY_CODE:1=$1; *)
					QUERY:C277([DIARY_ITEMOWNERS:106];  & ; [DIARY_ITEMOWNERS:106]PERSONNEL_ID:2=SD3_al_PreSelDiaryItemOwners{$_l_Index})
					DELETE RECORD:C58([DIARY_ITEMOWNERS:106])
					READ ONLY:C145([DIARY_ITEMOWNERS:106])
				End if 
			End if 
		End for 
		//    Now Add any in
		For ($_l_Index; 1; Size of array:C274(SD3_al_DiaryOwnersPersonIDS))
			$_l_OwnerPosition:=Find in array:C230(SD3_al_PreSelDiaryItemOwners; SD3_al_DiaryOwnersPersonIDS{$_l_Index})
			If ($_l_OwnerPosition<0)  //this one does not exist
				If (SD3_al_SelectedDiaryOwners{$_l_Index}=1)
					//Add
					$_bo_Available:=SD_CheckAvailable(SD3_al_DiaryOwnersPersonIDS{$_l_Index}; [DIARY:12]Date_Do_From:4; [DIARY:12]Date_Do_To:33; [DIARY:12]Time_Do_From:6; [DIARY:12]Time_Do_To:35; "User")
					If ($_bo_Available)
						READ WRITE:C146([DIARY_ITEMOWNERS:106])
						CREATE RECORD:C68([DIARY_ITEMOWNERS:106])
						[DIARY_ITEMOWNERS:106]DIARY_CODE:1:=$1
						[DIARY_ITEMOWNERS:106]PERSONNEL_ID:2:=SD3_al_DiaryOwnersPersonIDS{$_l_Index}
						[DIARY_ITEMOWNERS:106]RELATIONSHIP_CLASSID:3:=2
						[DIARY_ITEMOWNERS:106]RELATIONSHIP_CLASSNAME:4:="Diary Item Person"
						DB_SaveRecord(->[DIARY_ITEMOWNERS:106])
						UNLOAD RECORD:C212([DIARY_ITEMOWNERS:106])
						READ ONLY:C145([DIARY_ITEMOWNERS:106])
					End if 
					
				End if 
			End if 
		End for 
		For ($_l_Index; 1; Size of array:C274(SD3_al_DiaryOwners_Resources))
			$_l_OwnerPosition:=Find in array:C230(SD3_al_PreSelDiaryItemOwners; SD3_al_DiaryOwners_Resources{$_l_Index})
			If ($_l_OwnerPosition<0)  //this one does not exist
				If (SD3_al_SelectedDiaryResources{$_l_Index}=1)
					//Add
					$_bo_Available:=SD_CheckAvailable(SD3_al_DiaryOwnersPersonIDS{$_l_Index}; [DIARY:12]Date_Do_From:4; [DIARY:12]Date_Do_To:33; [DIARY:12]Time_Do_From:6; [DIARY:12]Time_Do_To:35; "Resource")
					If ($_bo_Available)
						READ WRITE:C146([DIARY_ITEMOWNERS:106])
						CREATE RECORD:C68([DIARY_ITEMOWNERS:106])
						[DIARY_ITEMOWNERS:106]DIARY_CODE:1:=$1
						[DIARY_ITEMOWNERS:106]PERSONNEL_ID:2:=SD3_al_DiaryOwners_Resources{$_l_Index}
						[DIARY_ITEMOWNERS:106]RELATIONSHIP_CLASSID:3:=3
						[DIARY_ITEMOWNERS:106]RELATIONSHIP_CLASSNAME:4:="Diary Item Resource"
						DB_SaveRecord(->[DIARY_ITEMOWNERS:106])
						UNLOAD RECORD:C212([DIARY_ITEMOWNERS:106])
						READ ONLY:C145([DIARY_ITEMOWNERS:106])
					End if 
					
				End if 
			End if 
		End for 
		
		
	End if 
	SD_LoadOtherPerson([DIARY:12]Diary_Code:3; [DIARY:12]Person:8)
	
	
	
	
End if 
ERR_MethodTrackerReturn("WS_AddDiaryitemOwner"; $_t_oldMethodName)