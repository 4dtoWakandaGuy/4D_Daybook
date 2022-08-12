If (False:C215)
	//Table Form Method Name: [USER]SD_MultDiary
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 19/03/2010 17:56
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(SD_abo_IncludeDiaries;0)
	//ARRAY BOOLEAN(SD2_lb_Persons;0)
	//ARRAY INTEGER(SD_ai_includeDiary;0)
	//ARRAY LONGINT(<>SD_al_CombinePersonDiaries;0)
	//ARRAY LONGINT(SD_al_IncludeItemIDs;0)
	//ARRAY LONGINT(SD_al_MyDiaryGroupIDS;0)
	//ARRAY LONGINT(SD_al_PersonClass;0)
	//ARRAY LONGINT(SD_al_ResourceIDs;0)
	//ARRAY LONGINT(SD_al_SelectedPersonIDs;0)
	//ARRAY LONGINT(SD_l_aMyDiaryGroupIDS;0)
	//ARRAY LONGINT(SD2_al_CombineGroupDiaries;0)
	//ARRAY LONGINT(SD2_al_CombinePersonDiaries;0)
	//ARRAY LONGINT(SD2_al_CombineResourceDiaries;0)
	ARRAY TEXT:C222($_at_PersonInitials; 0)
	//ARRAY TEXT(SD_at_DiaryOwners;0)
	//ARRAY TEXT(SD_at_includeDiaries;0)
	//ARRAY TEXT(SD_at_MyDiaryGroups;0)
	//ARRAY TEXT(SD_at_PersonInitials;0)
	//ARRAY TEXT(SD_at_SelectPersonInitials;0)
	//ARRAY TEXT(SD_at_SelectPersonNames;0)
	C_BOOLEAN:C305(DB_bo_NoLoad; SD_bExpand; SD_bo_viewExpand)
	C_LONGINT:C283(<>BUTTPROC; $_l_ComboRow; $_l_CurrentRow; $_l_event; $_l_HLHeight; $_l_NewObjectBottom; $_l_NewObjectTop; $_l_NewWindowBottom; $_l_ObjectBottom; $_l_ObjectLeft; $_l_ObjectRight)
	C_LONGINT:C283($_l_ObjectTop; $_l_personsIndex; $_l_prevObjectRight; $_l_WindowBottom; $_l_WindowLeft; $_l_WindowRight; $_l_windowTop; bExpandView; SD_HL_aDiaries; SD_l_CollapsedHeight; SD_l_Defaultuser)
	C_LONGINT:C283(SD2_l_BUT1; SD2_l_But2; SD2_l_BUT3; SD2_l_BUT4; SD2_l_BUT5; SD2_l_BUT6; SD2_l_BUT7; SD2_l_BUT8; SD2_l_BUT9; SD2_l_UseProcessArrays)
	C_PICTURE:C286(SD_Pi_View)
	C_REAL:C285(SD_HL_DiaryGroups; SD_HL_PersonNames; SD_HL_ResourceNames)
	C_TEXT:C284(<>PER_t_CurrentUserInitials; $_t_oldMethodName; SD2_t_COL1; SD2_t_COL2; SD2_t_COL3; SD2_t_COL4; SD2_t_COL5; SD2_t_COL6; SD2_t_COL7; SD2_t_COL8; SD2_t_COL9)
	C_TEXT:C284(SD2_t_HED1; SD2_t_HED2; SD2_t_HED3; SD2_t_HED4; SD2_t_HED5; SD2_t_HED6; SD2_t_HED7; SD2_t_HED8; SD2_t_HED9)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FM [USER].SD_MultDiary"; Form event code:C388)
$_l_event:=Form event code:C388

Case of 
	: ($_l_event=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		OpenHelp(Table:C252(->[USER:15]); "SD_MultDiary")
		//15518
		//15519
		ARRAY LONGINT:C221(SD2_al_CombineGroupDiaries; 0)
		ARRAY LONGINT:C221(SD2_al_CombinePersonDiaries; 0)
		ARRAY LONGINT:C221(SD2_al_CombineResourceDiaries; 0)
		//GET PICTURE FROM LIBRARY(15518+(Num(SD_bo_viewExpand)); SD_Pi_View)
		SD_Pi_View:=Get_Picture(15518+(Num:C11(SD_bo_viewExpand)))
		//when we load this window
		//we do not put anything in the selection
		ARRAY LONGINT:C221(SD_al_IncludeItemIDs; 0)
		ARRAY INTEGER:C220(SD_ai_includeDiary; 0)
		ARRAY BOOLEAN:C223(SD_abo_IncludeDiaries; 0)
		
		ARRAY TEXT:C222(SD_at_includeDiaries; 0)
		If (SD_l_Defaultuser>0)
			ARRAY LONGINT:C221(SD_al_IncludeItemIDs; 1)
			ARRAY INTEGER:C220(SD_ai_includeDiary; 1)
			ARRAY BOOLEAN:C223(SD_abo_IncludeDiaries; 1)
			
			ARRAY TEXT:C222(SD_at_includeDiaries; 1)
			QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Personnel_ID:48=SD_l_Defaultuser)
			SD_al_IncludeItemIDs{1}:=[PERSONNEL:11]Personnel_ID:48
			SD_ai_includeDiary{1}:=1
			SD_abo_IncludeDiaries{1}:=True:C214
			
			SD_at_includeDiaries{1}:=[PERSONNEL:11]Name:2
			If (SD2_l_UseProcessArrays=0)
				$_l_ComboRow:=Find in array:C230(<>SD_al_CombinePersonDiaries; [PERSONNEL:11]Personnel_ID:48)
				If ($_l_ComboRow<0)
					INSERT IN ARRAY:C227(<>SD_al_CombinePersonDiaries; Size of array:C274(<>SD_al_CombinePersonDiaries)+1; 1)
					<>SD_al_CombinePersonDiaries{Size of array:C274(<>SD_al_CombinePersonDiaries)}:=[PERSONNEL:11]Personnel_ID:48
				End if 
			Else 
				$_l_ComboRow:=Find in array:C230(SD2_al_CombinePersonDiaries; [PERSONNEL:11]Personnel_ID:48)
				If ($_l_ComboRow<0)
					INSERT IN ARRAY:C227(SD2_al_CombinePersonDiaries; Size of array:C274(SD2_al_CombinePersonDiaries)+1; 1)
					SD2_al_CombinePersonDiaries{Size of array:C274(SD2_al_CombinePersonDiaries)}:=[PERSONNEL:11]Personnel_ID:48
				End if 
				
			End if 
			
			
		End if 
		
		
		
		
		INT_SetLongintCheckFormat(->SD_ai_includeDiary)
		
		If (Is a list:C621(SD_HL_aDiaries))
			CLEAR LIST:C377(SD_HL_aDiaries; *)
		End if 
		//load a list of available persons diaries
		QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Initials:1=<>PER_t_CurrentUserInitials)
		ARRAY TEXT:C222($_at_PersonInitials; 0)
		ARRAY TEXT:C222(SD_at_SelectPersonInitials; 0)
		ARRAY TEXT:C222(SD_at_SelectPersonNames; 0)
		ARRAY LONGINT:C221(SD_al_SelectedPersonIDs; 0)
		QUERY:C277([PERSONNEL_DIARY_ACCESS:149]; [PERSONNEL_DIARY_ACCESS:149]Person_Code:4=[PERSONNEL:11]Initials:1)
		
		If (Records in selection:C76([PERSONNEL_DIARY_ACCESS:149])>0)
			ARRAY TEXT:C222($_at_PersonInitials; Records in selection:C76([PERSONNEL_DIARY_ACCESS:149]))
			
			FIRST RECORD:C50([PERSONNEL_DIARY_ACCESS:149])
			For ($_l_PersonsIndex; 1; Records in selection:C76([PERSONNEL_DIARY_ACCESS:149]))  //then add the values for the diary access values
				$_at_PersonInitials{$_l_PersonsIndex}:=[PERSONNEL_DIARY_ACCESS:149]Person:1
				NEXT RECORD:C51([PERSONNEL_DIARY_ACCESS:149])
				
			End for 
			CREATE EMPTY SET:C140([PERSONNEL:11]; "Temp")
			For ($_l_PersonsIndex; 1; Size of array:C274($_at_PersonInitials))
				QUERY:C277([PERSONNEL:11];  & ; [PERSONNEL:11]Initials:1=$_at_PersonInitials{$_l_PersonsIndex})
				ADD TO SET:C119([PERSONNEL:11]; "Temp")
			End for 
			USE SET:C118("Temp")
			CLEAR SET:C117("Temp")
			
		Else 
			ALL RECORDS:C47([PERSONNEL:11])
			
		End if 
		
		QUERY SELECTION:C341([PERSONNEL:11]; [PERSONNEL:11]PersonDeleted:38#1; *)
		QUERY SELECTION:C341([PERSONNEL:11];  & ; [PERSONNEL:11]Startup_List:15=True:C214; *)
		QUERY SELECTION:C341([PERSONNEL:11];  & ; [PERSONNEL:11]Global_Access:47=False:C215)
		QUERY SELECTION:C341([PERSONNEL:11]; [PERSONNEL:11]Personnel_ID:48#SD_l_Defaultuser)
		
		
		SELECTION TO ARRAY:C260([PERSONNEL:11]Initials:1; SD_at_SelectPersonInitials)
		SELECTION TO ARRAY:C260([PERSONNEL:11]Name:2; SD_at_SelectPersonNames)
		SELECTION TO ARRAY:C260([PERSONNEL:11]Personnel_ID:48; SD_al_SelectedPersonIDs)
		
		
		//````````````
		ARRAY TEXT:C222(SD_at_DiaryOwners; 0)
		ARRAY TEXT:C222(SD_at_PersonInitials; 0)
		ARRAY LONGINT:C221(SD_al_PersonClass; 0)
		ARRAY LONGINT:C221(SD_al_ResourceIDs; 0)
		QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Global_Access:47=True:C214; *)  //WT-17/08/01: listing for global resource items
		QUERY:C277([PERSONNEL:11];  & ; [PERSONNEL:11]PersonDeleted:38#1)
		$_l_CurrentRow:=Size of array:C274(SD_at_DiaryOwners)
		If (Records in selection:C76([PERSONNEL:11])>0)
			INSERT IN ARRAY:C227(SD_at_DiaryOwners; 9999; Records in selection:C76([PERSONNEL:11])+1)
			INSERT IN ARRAY:C227(SD_at_PersonInitials; 9999; Records in selection:C76([PERSONNEL:11])+1)
			INSERT IN ARRAY:C227(SD_al_PersonClass; 9999; Records in selection:C76([PERSONNEL:11])+1)
			INSERT IN ARRAY:C227(SD_al_ResourceIDs; 9999; Records in selection:C76([PERSONNEL:11])+1)
			ORDER BY:C49([PERSONNEL:11]; [PERSONNEL:11]Name:2; >)
			$_l_CurrentRow:=0
			For ($_l_personsIndex; 1; Records in selection:C76([PERSONNEL:11]))
				$_l_CurrentRow:=$_l_CurrentRow+1
				SD_at_PersonInitials{$_l_CurrentRow}:=[PERSONNEL:11]Initials:1
				SD_at_DiaryOwners{$_l_CurrentRow}:=[PERSONNEL:11]Name:2
				SD_al_ResourceIDs{$_l_CurrentRow}:=[PERSONNEL:11]Personnel_ID:48
				SD_al_PersonClass{$_l_CurrentRow}:=3
				NEXT RECORD:C51([PERSONNEL:11])
			End for 
		End if 
		
		SD_HL_aDiaries:=New list:C375
		//we have a list of groups in SD_at_MyDiaryGroups
		//we have a list of people in SD_at_SelectPersonNames
		//we have a list of reSources_In?? SD_at_DiaryOwners
		If (Size of array:C274(SD_at_SelectPersonNames)>0)
			SD_HL_PersonNames:=New list:C375
			For ($_l_personsIndex; 1; Size of array:C274(SD_at_SelectPersonNames))
				APPEND TO LIST:C376(SD_HL_PersonNames; SD_at_SelectPersonNames{$_l_personsIndex}; SD_al_SelectedPersonIDs{$_l_personsIndex})
			End for 
			APPEND TO LIST:C376(SD_HL_aDiaries; "Persons Diaries"; -1; SD_HL_PersonNames; True:C214)
		End if 
		If (Size of array:C274(SD_at_DiaryOwners)>0)
			SD_HL_ResourceNames:=New list:C375
			For ($_l_personsIndex; 1; Size of array:C274(SD_at_DiaryOwners))
				
				APPEND TO LIST:C376(SD_HL_ResourceNames; SD_at_DiaryOwners{$_l_personsIndex}; (SD_al_ResourceIDs{$_l_personsIndex})+9999)
			End for 
			APPEND TO LIST:C376(SD_HL_aDiaries; "Resource Diaries"; -3; SD_HL_ResourceNames; True:C214)
		End if 
		
		If (Size of array:C274(SD_at_MyDiaryGroups)>0)
			SD_HL_DiaryGroups:=New list:C375
			For ($_l_personsIndex; 1; Size of array:C274(SD_at_MyDiaryGroups))
				APPEND TO LIST:C376(SD_HL_DiaryGroups; SD_at_MyDiaryGroups{$_l_personsIndex}; -(SD_al_MyDiaryGroupIDS{$_l_personsIndex}+9999))
			End for 
			APPEND TO LIST:C376(SD_HL_aDiaries; "Group Diaries"; -3; SD_HL_DiaryGroups; True:C214)
			
		End if 
		GET WINDOW RECT:C443($_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRIght; $_l_ObjectBottom)
		OBJECT SET VISIBLE:C603(SD_HL_aDiaries; False:C215)
		If (<>ButtProc>0)
			SET WINDOW RECT:C444(65; 65; 65; 36)
		Else 
			SET WINDOW RECT:C444(0; 64; 64; 32)
		End if 
		WS_AutoscreenSize(2; 141; 165)
		
		LB_SetupListbox(->SD2_lb_Persons; "SD2_t"; "SD2_L"; 1; ->SD_abo_IncludeDiaries; ->SD_at_includeDiaries)
		
		LB_SetColumnHeaders(->SD2_lb_Persons; "SD2_L"; 1; "Include"; "Person")
		
		LB_SetColumnWidths(->SD2_lb_Persons; "SD2_t"; 1; 56; 108)
		
		LB_SetEnterable(->SD2_lb_Persons; False:C215; 0)
		LB_SetEnterable(->SD2_lb_Persons; True:C214; 1)
		LB_SetScroll(->SD2_lb_Persons; -3; -2)
		LB_StyleSettings(->SD2_lb_Persons; "Black"; 9; "SD2_t"; ->[ACCOUNTS:32])
		
		SD_l_CollapsedHeight:=141
		OBJECT GET COORDINATES:C663(SD2_lb_Persons; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
		OBJECT MOVE:C664(SD2_lb_Persons; $_l_ObjectLeft; 2; $_l_ObjectRight; (139-16)-5; *)
		
	: ($_l_event=On Resize:K2:27)
		If (Not:C34(SD_bExpand))
			$_l_HLHeight:=108
			GET WINDOW RECT:C443($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
			Case of 
				: (SD_bo_viewExpand)  //view is expanded
					GET WINDOW RECT:C443($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
					SD_l_CollapsedHeight:=($_l_WindowBottom-$_l_windowTop)
					$_l_NewWindowBottom:=$_l_WindowBottom
					OBJECT SET VISIBLE:C603(SD_HL_aDiaries; True:C214)
					OBJECT MOVE:C664(SD_HL_aDiaries; 2; (($_l_NewWindowBottom-$_l_windowTop)-5)-$_l_HLHeight; ($_l_WindowRight-$_l_WindowLeft)-20; (($_l_NewWindowBottom-$_l_windowTop)-20); *)
					OBJECT GET COORDINATES:C663(SD_Pi_View; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRIght; $_l_ObjectBottom)
					$_l_NewObjectTop:=(((($_l_NewWindowBottom-$_l_windowTop)-5)-$_l_HLHeight)-28)-5
					OBJECT MOVE:C664(SD_Pi_View; $_l_ObjectLeft; $_l_NewObjectTop; $_l_ObjectRIght; 28+$_l_NewObjectTop; *)
					OBJECT MOVE:C664(bExpandView; $_l_ObjectLeft; $_l_NewObjectTop; $_l_ObjectRIght; 28+$_l_NewObjectTop; *)
					//GET PICTURE FROM LIBRARY(15518+(Num(SD_bo_viewExpand)); SD_Pi_View)
					SD_Pi_View:=Get_Picture(15518+(Num:C11(SD_bo_viewExpand)))
					
					$_l_NewObjectBottom:=$_l_NewObjectTop-5
					OBJECT GET COORDINATES:C663(SD2_lb_Persons; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
					$_l_prevObjectRight:=$_l_ObjectLeft
					OBJECT MOVE:C664(SD2_lb_Persons; $_l_ObjectLeft; 2; ($_l_WindowRight-$_l_WindowLeft)-2; $_l_NewObjectBottom; *)
					
					
				Else 
					//view is collapsed)
					GET WINDOW RECT:C443($_l_WindowLeft; $_l_windowTop; $_l_WindowRight; $_l_WindowBottom)
					$_l_NewWindowBottom:=$_l_WindowBottom
					OBJECT SET VISIBLE:C603(SD_HL_aDiaries; False:C215)
					OBJECT GET COORDINATES:C663(SD_Pi_View; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRIght; $_l_ObjectBottom)
					$_l_NewObjectTop:=((($_l_NewWindowBottom-$_l_windowTop)-5)-15)
					OBJECT MOVE:C664(SD_Pi_View; $_l_ObjectLeft; $_l_NewObjectTop; $_l_ObjectRIght; 15+$_l_NewObjectTop; *)
					OBJECT MOVE:C664(bExpandView; $_l_ObjectLeft; $_l_NewObjectTop; $_l_ObjectRIght; 15+$_l_NewObjectTop; *)
					//GET PICTURE FROM LIBRARY(15518+(Num(SD_bo_viewExpand)); SD_Pi_View)
					SD_Pi_View:=Get_Picture(15518+(Num:C11(SD_bo_viewExpand)))
					$_l_NewObjectBottom:=$_l_NewObjectTop-5
					OBJECT GET COORDINATES:C663(SD2_lb_Persons; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_ObjectBottom)
					$_l_prevObjectRight:=$_l_ObjectLeft
					OBJECT MOVE:C664(SD2_lb_Persons; $_l_ObjectLeft; 2; ($_l_WindowRight-$_l_WindowLeft)-2; $_l_NewObjectBottom; *)
					
			End case 
			
		Else 
			SD_bExpand:=False:C215
		End if 
		
		
End case 
ERR_MethodTrackerReturn("FM:SD_MultDiary"; $_t_oldMethodName)
