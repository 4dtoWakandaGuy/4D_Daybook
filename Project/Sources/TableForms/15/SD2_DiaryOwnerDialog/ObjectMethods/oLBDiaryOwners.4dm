If (False:C215)
	//object Method Name: Object Name:      [USER].SD2_DiaryOwnerDialog.oLBDiaryOwners
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:46
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(SD2_lb_DiaryOwners;0)
	//ARRAY LONGINT(SD2_al_DiaryOwnerpersons;0)
	//ARRAY LONGINT(SD2_al_DiaryPersREL;0)
	//ARRAY TEXT(SD2_at_DiaryOwnerPersonCD;0)
	//ARRAY TEXT(SD2_at_DiaryOwnerPersonNM;0)
	//ARRAY TEXT(SD2_at_DiaryPersREL;0)
	C_LONGINT:C283($_l_Column; $_l_event; $_l_PersonRow; $_l_Row)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].SD2_DiaryOwnerDialog.oLBDiaryOwners"; Form event code:C388)

$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Header Click:K2:40)
	Else 
		LISTBOX GET CELL POSITION:C971(SD2_lb_DiaryOwners; $_l_Column; $_l_Row)
		Case of 
			: ($_l_Column=2)
				Check_MinorNC(->SD2_at_DiaryOwnerPersonNM{$_l_Row}; "Person"; ->[PERSONNEL:11]; ->[PERSONNEL:11]Name:2; ->[PERSONNEL:11]Initials:1)  //5
				If (SD2_at_DiaryOwnerPersonNM{$_l_Row}#"")
					QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Name:2=SD2_at_DiaryOwnerPersonNM{$_l_Row})
					$_l_PersonRow:=Find in array:C230(SD2_at_DiaryOwnerPersonCD; [PERSONNEL:11]Initials:1)
					If ($_l_PersonRow<0)
						SD2_at_DiaryOwnerPersonCD{$_l_Row}:=[PERSONNEL:11]Initials:1
						SD2_at_DiaryOwnerPersonNM{$_l_Row}:=[PERSONNEL:11]Name:2
						SD2_al_DiaryOwnerpersons{$_l_Row}:=[PERSONNEL:11]Personnel_ID:48
						If ([PERSONNEL:11]Global_Access:47)
							SD2_at_DiaryPersREL{$_l_Row}:="Resource"
							SD2_al_DiaryPersREL{$_l_Row}:=-1
						Else 
							SD2_at_DiaryPersREL{$_l_Row}:="Owner"
							SD2_al_DiaryPersREL{$_l_Row}:=1
						End if 
					Else 
						DELETE FROM ARRAY:C228(SD2_at_DiaryOwnerPersonNM; $_l_Row)
						DELETE FROM ARRAY:C228(SD2_at_DiaryOwnerPersonCD; $_l_Row)
						DELETE FROM ARRAY:C228(SD2_al_DiaryOwnerpersons; $_l_Row)
						DELETE FROM ARRAY:C228(SD2_at_DiaryPersREL; $_l_Row)
						DELETE FROM ARRAY:C228(SD2_al_DiaryPersREL; $_l_Row)
					End if 
				End if 
				
		End case 
		
End case 
ERR_MethodTrackerReturn("OBJ [USER].SD2_DiaryOwnerDialog.oLBDiaryOwners"; $_t_oldMethodName)
