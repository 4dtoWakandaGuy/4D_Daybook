//%attributes = {}
If (False:C215)
	//Project Method Name:      Diary_Mess
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 01/04/2010 19:12
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(SD3_al_DiaryOwnersPersonIDS;0)
	//ARRAY LONGINT(SD3_al_PreSelDiaryItemOwners;0)
	//ARRAY LONGINT(SD3_al_SelectedDiaryOwners;0)
	C_BOOLEAN:C305(SD_bo_AddingDiaryRecord)
	C_LONGINT:C283($_l_CurrentWinRefOLD; $_l_PersonID; $_l_PersonsIndex; SD_l_EditingDiaryRecord; vNo; WIN_l_CurrentWinRef; WIN_l_CurrentWinRefOLD; WS_l_KEYDiaryItemOwner; WS_l_UPDATEOWNERS)
	C_TEXT:C284(<>SYS_t_MessageAction; $_t_CurrentOutputform; $_t_oldMethodName; $Mess; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; WIN_t_CurrentOutputform)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Diary_Mess")
//Diary_Message


//Diary_Message

If ([DIARY:12]Diary_Code:3#"")
	If (Read only state:C362([DIARY:12]))
		READ WRITE:C146([DIARY:12])
		LOAD RECORD:C52([DIARY:12])
		[DIARY:12]Done:14:=False:C215
		SD_SetVisible(True:C214)
		SD_SetFieldsTrue
		SD_l_EditingDiaryRecord:=1
		
	End if 
Else 
	If (<>SYS_t_MessageAction#"")
		SD_AutoAddRec(<>SYS_t_MessageAction; SD_D_CurrentviewDate; ?00:00:00?)
	Else 
		Gen_Alert("Message Diary action is not declared in your configuration,"+" speak with your administrator to have this corrected")
	End if 
	
End if 
If ([DIARY:12]Done:14=False:C215) & (SD_bo_AddingDiaryRecord)
	QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Initials:1=[DIARY:12]Person:8)
	$_l_PersonID:=[PERSONNEL:11]Personnel_ID:48
	$_t_CurrentOutputform:=WIN_t_CurrentOutputform
	Menu_Record("Diary_Mess"; "Message to Personnel")
	If (Modified record:C314([DIARY:12]))
		Diary_PersPrior
		DB_SaveRecord(->[DIARY:12])
		AA_CheckFileUnlocked(->[DIARY:12]x_ID:50)
	End if 
	ADD TO SET:C119([DIARY:12]; "DMaster")
	//PUSH RECORD([DIARY])
	DB_t_CurrentFormUsage:="Select"
	//Open_Pro_Window ("Please Select Personnel")
	ARRAY LONGINT:C221(SD3_al_PreSelDiaryItemOwners; 0)
	WIN_t_CurrentOutputform:="Personnel_Out"
	WS_l_KEYDiaryItemOwner:=$_l_PersonID
	$_l_CurrentWinRefOLD:=WIN_l_CurrentWinRef
	WIN_l_CurrentWinRef:=Open window:C153(20; 20; 20; 20; 1)
	DIALOG:C40([USER:15]; "Diary_OwnerDialog")
	CLOSE WINDOW:C154
	WIN_l_CurrentWinRef:=$_l_CurrentWinRefOLD
	If (WS_l_UpdateOwners=1)
		vNo:=0
		
		For ($_l_PersonsIndex; 1; Size of array:C274(SD3_al_DiaryOwnersPersonIDS))
			If (SD3_al_SelectedDiaryOwners{$_l_PersonsIndex}=1)
				vNo:=VNo+1
			End if 
		End for 
		
		Gen_Confirm("Send "+String:C10(vNo)+" Messages?"; "Yes"; "No")
		If (OK=1)
			// $Desc:=[DIARY]Action Desc
			//FIRST RECORD([PERSONNEL])
			For ($_l_PersonsIndex; 1; Size of array:C274(SD3_al_DiaryOwnersPersonIDS))
				If (SD3_al_SelectedDiaryOwners{$_l_PersonsIndex}=1)
					READ WRITE:C146([DIARY_ITEMOWNERS:106])
					CREATE RECORD:C68([DIARY_ITEMOWNERS:106])
					[DIARY_ITEMOWNERS:106]DIARY_CODE:1:=[DIARY:12]Diary_Code:3
					[DIARY_ITEMOWNERS:106]PERSONNEL_ID:2:=SD3_al_DiaryOwnersPersonIDS{$_l_PersonsIndex}
					[DIARY_ITEMOWNERS:106]RELATIONSHIP_CLASSID:3:=2
					[DIARY_ITEMOWNERS:106]RELATIONSHIP_CLASSNAME:4:="Diary Item Person"
					DB_SaveRecord(->[DIARY_ITEMOWNERS:106])
					UNLOAD RECORD:C212([DIARY_ITEMOWNERS:106])
					READ ONLY:C145([DIARY_ITEMOWNERS:106])
				End if 
			End for 
			DB_t_CurrentFormUsage:=""
			SD_LoadOtherPerson([DIARY:12]Diary_Code:3; [DIARY:12]Person:8)
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("Diary_Mess"; $_t_oldMethodName)