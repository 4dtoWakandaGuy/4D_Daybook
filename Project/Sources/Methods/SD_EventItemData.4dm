//%attributes = {}
If (False:C215)
	//Project Method Name:      SD_EventItemData
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 24/10/2012 18:28
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(SD_al_PriorityNUM;0)
	//ARRAY TEXT(SD_at_PriorityNM;0)
	C_BOOLEAN:C305($_bo_Expanded; SD_bo_AddingDiaryRecord)
	C_DATE:C307(SD_D_ItemDate)
	C_LONGINT:C283($_l_DiaryID; $_l_ItemReference; $_l_ParentItemPosition; $_l_ParentItemReference; $_l_PriorityNumElem; $_l_RecordNumber; $_l_SelectedItemParent; $_l_SublistID; $1; $2; bAddBut)
	C_LONGINT:C283(ListFour; ListOne; ListThree; ListTwo; SD_l_DescriptionSplitter; SD_l_EditingDiaryRecord; SD_l_HLDayTime; vlItemPos)
	C_TEXT:C284($_t_ItemText; $_t_oldMethodName; SD_t_PriorityName)
	C_TIME:C306(SD_ti_TestTime)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SD_EventItemData")
//$1:first Hierachial List
//$2:second Hierachial List
//$3:third Hierachial List
If (Count parameters:C259>=1)
	//If ($1>0)
	
	//MODNG 67-2
	//WT_hl_DiaryDETAIL4
	If (Count parameters:C259>=2)
		If ($1>0)
			vlItemPos:=Selected list items:C379(SD_l_HLDayTime)  // Get the position of the selected item
			If (vlItemPos#0)  // Just in case, check the position
				GET LIST ITEM:C378(SD_l_HLDayTime; vlItemPos; $_l_ItemReference; $_t_ItemText; $_l_SublistID; $_bo_Expanded)
				$_l_SelectedItemParent:=List item parent:C633(SD_l_HLDayTime; $_l_ItemReference)
				If ($_l_SelectedItemParent>0)
					SELECT LIST ITEMS BY REFERENCE:C630(SD_l_HLDayTime; $_l_SelectedItemParent)  // Select the parent item
					$_l_ParentItemPosition:=Selected list items:C379(SD_l_HLDayTime)
					GET LIST ITEM:C378(SD_l_HLDayTime; $_l_ParentItemPosition; $_l_ParentItemReference; $_t_ItemText)
					SELECT LIST ITEMS BY REFERENCE:C630(SD_l_HLDayTime; $_l_ItemReference)  // Reselect the child item
				Else 
					GET LIST ITEM:C378(SD_l_HLDayTime; vlItemPos; $_l_ItemReference; $_t_ItemText; $_l_SublistID; $_bo_Expanded)
				End if 
			End if 
		End if 
		
	Else 
		$_l_SublistID:=0
	End if 
	
	SD_bo_AddingDiaryRecord:=False:C215
	
	//here need to test if a  record is already loaded
	//what if adding a new record
	//must save/cancel first
	UNLOAD RECORD:C212([DIARY:12])
	READ ONLY:C145([DIARY:12])
	
	Case of 
		: ($_l_SublistID#0)  //clicked on a parent item
			WT_hl_DiaryDETAIL3
			bAddBut:=1
			SD_SetFieldsFalse
			SD_LoadOtherPerson(""; "")
		: ($_l_SublistID=0)  //clicked on a child item
			bAddBut:=0
			SD_SetFieldsFalse
			$_l_DiaryID:=0
			$_l_RecordNumber:=0
			Case of 
				: ($1>0)
					$_l_RecordNumber:=$1
				: ($1<0)
					$_l_DiaryID:=Abs:C99($1)
				Else 
					$_l_RecordNumber:=-1
			End case 
			
			If ($_l_RecordNumber>=0) | ($_l_DiaryID>0)
				If ($_l_DiaryID>0)
					QUERY:C277([DIARY:12]; [DIARY:12]x_ID:50=$_l_DiaryID)
					
				Else 
					GOTO RECORD:C242([DIARY:12]; $1)
				End if 
				UNLOAD RECORD:C212([PERSONNEL:11])
				
				LOAD RECORD:C52([DIARY:12])
				SD_SetVisible(False:C215)
				RELATE ONE:C42([DIARY:12]Company_Code:1)
				WT_hl_DiaryDETAIL2
				HIGHLIGHT TEXT:C210([DIARY:12]Action_Details:10; Length:C16([DIARY:12]Action_Details:10); Length:C16([DIARY:12]Action_Details:10))
				SD_SetSplitter(->SD_l_DescriptionSplitter)
				SD_LoadOtherPerson([DIARY:12]Diary_Code:3; [DIARY:12]Person:8)
				
				If (Records in selection:C76([DIARY:12])>0)
					DB_MenuAction("Functions"; ""; 2; "")
					DB_MenuAction("Functions"; "Switch Access"; 3; "")
					
					//ENABLE MENU ITEM(3;0)
					//DISABLE MENU ITEM(3;11)
					$_l_PriorityNumElem:=Find in array:C230(SD_al_PriorityNUM; Num:C11([DIARY:12]Priority:17))
					If ($_l_PriorityNumElem>0)
						SD_al_PriorityNUM:=SD_al_PriorityNUM{$_l_PriorityNumElem}
						SD_t_PriorityName:=SD_at_PriorityNM{$_l_PriorityNumElem}
					Else 
						SD_al_PriorityNUM:=3
						SD_t_PriorityName:="Normal"
					End if 
					If ([DIARY:12]Done:14=True:C214)
						
						READ WRITE:C146([DIARY:12])
						LOAD RECORD:C52([DIARY:12])
						OBJECT SET ENTERABLE:C238([DIARY:12]Done:14; True:C214)
					Else 
						
					End if 
				End if 
			Else 
				//new record
				Gen_TimeStamp2Date(Abs:C99($1); ->SD_D_ItemDate; ->SD_ti_TestTime)
				
				SD_AutoAddRec(""; SD_D_ItemDate; SD_ti_TestTime; True:C214)
			End if 
			
	End case 
	//End if
End if 
ERR_MethodTrackerReturn("SD_EventItemData"; $_t_oldMethodName)
