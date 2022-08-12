//%attributes = {}
If (False:C215)
	//Project Method Name:      SD_SetSchedDiaries
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/02/2010 18:29
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(SD2_abo_CheckBox;0)
	//ARRAY BOOLEAN(SD2_lb_CalendersList;0)
	ARRAY LONGINT:C221($_al_MPDiaryAccesID; 0)
	//ARRAY LONGINT(SD_al_PersonClass;0)
	ARRAY TEXT:C222($_at_DiaryAccess; 0)
	ARRAY TEXT:C222($_at_MPDiaryAccessName; 0)
	//ARRAY TEXT(SD_at_DiaryOwners;0)
	//ARRAY TEXT(SD_at_PersonInitials;0)
	C_BOOLEAN:C305($_bo_Appended; SD_bo_MultiplDiariesAvailable)
	C_LONGINT:C283($_l_DiaryOwnerRow; $_l_Index; $_l_Indexnsert; $_l_NumberofDiaryOwners; $_l_PersonsIndex; $_l_RecordNumber; $_l_RecordsinSelection; $_l_SizeofArray3; SD2_l_BUT1; SD2_l_But2; SD2_l_BUT3)
	C_LONGINT:C283(SD2_l_BUT4; SD2_l_BUT5; SD2_l_BUT6; SD2_l_BUT7; SD2_l_BUT8; SD2_l_BUT9; SD2_l_NewWindowsForDiaries)
	C_REAL:C285($2)
	C_TEXT:C284($_t_oldMethodName; $1; SD2_t_COL1; SD2_t_COL2; SD2_t_COL3; SD2_t_COL4; SD2_t_COL5; SD2_t_COL6; SD2_t_COL7; SD2_t_COL8; SD2_t_COL9)
	C_TEXT:C284(SD2_t_HED1; SD2_t_HED2; SD2_t_HED3; SD2_t_HED4; SD2_t_HED5; SD2_t_HED6; SD2_t_HED7; SD2_t_HED8; SD2_t_HED9)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SD_SetSchedDiaries")

//This method setup the on screen list box area of other diaies in the schedule
//TRACE

If (Count parameters:C259>=1)
	If ($1#"")
		If ([PERSONNEL:11]Initials:1#$1)
			QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Initials:1=$1)
		End if 
	Else 
		If (Count parameters:C259>=2)
			If ($2#0)
				QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Personnel_ID:48=2)
			End if 
		End if 
		
		
	End if 
	ARRAY TEXT:C222(SD_at_DiaryOwners; 1)
	ARRAY TEXT:C222(SD_at_PersonInitials; 1)
	ARRAY LONGINT:C221(SD_al_PersonClass; 1)
	SD_at_DiaryOwners{1}:=[PERSONNEL:11]Name:2
	SD_at_PersonInitials{1}:=[PERSONNEL:11]Initials:1
	SD_al_PersonClass{1}:=1
	QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Global_Access:47=True:C214; *)
	QUERY:C277([PERSONNEL:11];  & ; [PERSONNEL:11]PersonDeleted:38#1)
	$_l_NumberofDiaryOwners:=Size of array:C274(SD_at_DiaryOwners)
	$_l_Indexnsert:=Records in selection:C76([PERSONNEL:11])
	If (Records in selection:C76([PERSONNEL:11])>0)
		INSERT IN ARRAY:C227(SD_at_DiaryOwners; 9999; $_l_Indexnsert)
		INSERT IN ARRAY:C227(SD_at_PersonInitials; 9999; $_l_Indexnsert)
		INSERT IN ARRAY:C227(SD_al_PersonClass; 9999; $_l_Indexnsert)
		$_l_SizeofArray3:=Size of array:C274(SD_at_PersonInitials)+1
		//$_l_NumberofDiaryOwners:=$_l_NumberofDiaryOwners+1
		//SD_at_PersonInitials{$_l_NumberofDiaryOwners}:="-"  `insert a seperator here
		//SD_at_DiaryOwners{$_l_NumberofDiaryOwners}:="-"  `and insert a seperator here
		ORDER BY:C49([PERSONNEL:11]; [PERSONNEL:11]Name:2; >)
		For ($_l_PersonsIndex; 1; Records in selection:C76([PERSONNEL:11]))
			$_l_NumberofDiaryOwners:=$_l_NumberofDiaryOwners+1
			SD_at_PersonInitials{$_l_NumberofDiaryOwners}:=[PERSONNEL:11]Initials:1
			SD_at_DiaryOwners{$_l_NumberofDiaryOwners}:=[PERSONNEL:11]Name:2
			SD_al_PersonClass{$_l_NumberofDiaryOwners}:=3
			NEXT RECORD:C51([PERSONNEL:11])
		End for 
	End if 
	If ($1#"")
		QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Initials:1=$1)
	Else 
		If (Count parameters:C259>=2)
			If ($2#0)
				QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Personnel_ID:48=2)
			End if 
		End if 
		
		
	End if 
	If (Records in selection:C76([PERSONNEL:11])=1)
		SD2_l_NewWindowsForDiaries:=[PERSONNEL:11]SD_openNewWindow:49-1  //This is correct-the field contains one(no) or two(yes)
		$_l_RecordNumber:=Record number:C243([PERSONNEL:11])
		QUERY:C277([PERSONNEL_DIARY_ACCESS:149]; [PERSONNEL_DIARY_ACCESS:149]Person_Code:4=[PERSONNEL:11]Initials:1)
		
		$_l_RecordsinSelection:=Records in selection:C76([PERSONNEL_DIARY_ACCESS:149])
		ARRAY TEXT:C222($_at_DiaryAccess; $_l_RecordsinSelection)
		ARRAY TEXT:C222($_at_MPDiaryAccessName; 0)
		ARRAY LONGINT:C221($_al_MPDiaryAccesID; 0)
		For ($_l_Index; 1; $_l_RecordsinSelection)
			$_at_DiaryAccess{$_l_Index}:=[PERSONNEL_DIARY_ACCESS:149]Person:1
			NEXT RECORD:C51([PERSONNEL_DIARY_ACCESS:149])
		End for 
		//Now we can look up the name and add it to thelist
		If ($_l_RecordsinSelection>0)
			$_bo_Appended:=False:C215
			//insert a seperator here
			SD_at_DiaryOwners{$_l_NumberofDiaryOwners}:="-"  //and insert a seperator here
			For ($_l_Index; 1; $_l_RecordsinSelection)
				$_l_DiaryOwnerRow:=Find in array:C230(SD_at_PersonInitials; $_at_DiaryAccess{$_l_Index})
				If ($_l_DiaryOwnerRow<0)  //dont add same name twice
					If ($_bo_Appended=False:C215)
						//APPEND TO ARRAY(SD_at_PersonInitials;"-")
						//APPEND TO ARRAY(SD_at_DiaryOwners;"-")
						//APPEND TO ARRAY(SD_al_PersonClass;0)
						$_bo_Appended:=True:C214
					End if 
					QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Initials:1=$_at_DiaryAccess{$_l_Index})
					APPEND TO ARRAY:C911(SD_at_PersonInitials; $_at_DiaryAccess{$_l_Index})
					APPEND TO ARRAY:C911(SD_at_DiaryOwners; [PERSONNEL:11]Name:2)
					APPEND TO ARRAY:C911(SD_al_PersonClass; 2)
				End if 
			End for 
			
			
		End if 
	End if 
	//APPEND TO ARRAY(SD_at_DiaryOwners;"-")
	//APPEND TO ARRAY(SD_at_PersonInitials;"")
	//APPEND TO ARRAY(SD_al_PersonClass;0)
	SD_bo_MultiplDiariesAvailable:=False:C215
	If (Size of array:C274(SD_at_DiaryOwners)>1)
		SD_bo_MultiplDiariesAvailable:=True:C214
		ARRAY BOOLEAN:C223(SD2_abo_CheckBox; Size of array:C274(SD_at_DiaryOwners))
		If (False:C215)
			APPEND TO ARRAY:C911(SD_at_DiaryOwners; "Multiple Diaries")
			APPEND TO ARRAY:C911(SD_at_PersonInitials; "")
			APPEND TO ARRAY:C911(SD_al_PersonClass; 0)
			ARRAY BOOLEAN:C223(SD2_abo_CheckBox; Size of array:C274(SD_at_DiaryOwners))
			SD2_abo_CheckBox{1}:=True:C214
		End if 
	End if 
	
	LB_SetupListbox(->SD2_lb_CalendersList; "SD2_t"; "SD2_L"; 1; ->SD2_abo_CheckBox; ->SD_at_DiaryOwners; ->SD_at_PersonInitials; ->SD_al_PersonClass)
	LB_SetColumnHeaders(->SD2_lb_CalendersList; "SD2_L"; 1; ""; "Name"; "initials"; "Class")
	LB_SetColumnWidths(->SD2_lb_CalendersList; "SD2_t"; 1; 20; 100; 0; 0)
	LB_SetEnterable(->SD2_lb_CalendersList; False:C215; 0)
	LB_SetEnterable(->SD2_lb_CalendersList; True:C214; 1)
	LB_StyleSettings(->SD2_lb_CalendersList; "Black"; 9; "SD2_t"; ->[DIARY:12])
	LB_Setdividers(->SD2_lb_CalendersList; 0; 0)  //Both off
	LBI_Scrollonresize(->SD2_lb_CalendersList)
	
	
End if 
ERR_MethodTrackerReturn("SD_SetSchedDiaries"; $_t_oldMethodName)
