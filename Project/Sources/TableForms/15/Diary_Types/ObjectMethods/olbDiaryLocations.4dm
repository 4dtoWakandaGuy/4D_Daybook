If (False:C215)
	//object Name: [USER]Diary_Types.olbDiaryLocations
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 01/11/2012 09:49
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(DIA_lb_Locations;0)
	//ARRAY INTEGER(SD2_ai_DiaryLocationsSEL;0)
	//ARRAY LONGINT(SD2_al_DiaryDone;0)
	//ARRAY LONGINT(SD2_al_DiaryLocations;0)
	//ARRAY LONGINT(SD2_al_DiaryTypeDiary;0)
	//ARRAY LONGINT(SD2_al_DiaryTypeOriginal;0)
	//ARRAY LONGINT(SD2_al_DiaryTypeThreaded;0)
	//ARRAY TEXT(SD_at_Nonmodifiable;0)
	C_BOOLEAN:C305(SD2_bo_recordModified)
	C_LONGINT:C283($_l_event; $_l_Location3Row; $_l_Location4Row; $_l_NonModRow; $_l_SelectedRow; $_l_ShowPost; $_l_ShowThread; SD2_l_CBPostAction; SD2_l_CBThreaded; sRB_l_Diary; sRB_l_Original)
	C_TEXT:C284($_t_oldMethodName; SD2_t_DiaryType)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].Diary_Types.olbDiaryLocations"; Form event code:C388)

$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4)
		$_l_SelectedRow:=Self:C308->
		$_l_NonModRow:=Find in array:C230(SD_at_Nonmodifiable; SD2_t_DiaryType)
		LISTBOX SELECT ROW:C912(DIA_lb_Locations; $_l_SelectedRow)
		If ($_l_NonModRow<0)
			
			SD2_ai_DiaryLocationsSEL{$_l_SelectedRow}:=Abs:C99((SD2_ai_DiaryLocationsSEL{$_l_SelectedRow})-1)
			$_l_Location3Row:=Find in array:C230(SD2_al_DiaryLocations; 1)  //because these are hard coded IDS
			$_l_ShowThread:=0
			If ($_l_Location3Row>0)
				//$_l_ShowThread:=SD2_aI_DiaryLocationsSEL{$_l_Location3Row}
				If ($_l_ShowThread=0)
					$_l_Location3Row:=Find in array:C230(SD2_al_DiaryLocations; 2)
					If ($_l_Location3Row>0)
						$_l_ShowThread:=SD2_aI_DiaryLocationsSEL{$_l_Location3Row}
					End if 
				End if 
			End if 
			If ($_l_ShowThread>0)
				SD2_l_CBThreaded:=SD2_al_DiaryTypeThreaded{$_l_Location3Row}
				sRB_l_Original:=SD2_al_DiaryTypeOriginal{$_l_Location3Row}
				sRB_l_Diary:=SD2_al_DiaryTypeDiary{$_l_Location3Row}
				OBJECT SET VISIBLE:C603(*; "oThreadedObjects@"; True:C214)
			Else 
				OBJECT SET VISIBLE:C603(SD2_l_CBThreaded; False:C215)
				OBJECT SET VISIBLE:C603(*; "oThreadedObjects@"; False:C215)
			End if 
			$_l_ShowPost:=0
			$_l_Location3Row:=Find in array:C230(SD2_al_DiaryLocations; 3)  //because these are hard coded IDS
			$_l_Location4Row:=Find in array:C230(SD2_al_DiaryLocations; 4)  //because these are hard coded IDS
			If ($_l_Location3Row>0)
				$_l_ShowPost:=SD2_aI_DiaryLocationsSEL{$_l_Location3Row}
			End if 
			If ($_l_ShowPost>0)
				SD2_l_CBPostAction:=SD2_al_DiaryDone{$_l_NonModRow}
			Else 
				OBJECT SET ENTERABLE:C238(SD2_l_CBPostAction; False:C215)
			End if 
			LISTBOX SELECT ROW:C912(DIA_lb_Locations; $_l_SelectedRow)
			
			If (SD2_l_CBThreaded=1)
				//OBJECT SET VISIBLE(*;"oThreadOption@";True)
			Else 
				//OBJECT SET VISIBLE(*;"oThreadOption@";False)
			End if 
			SD2_bo_recordModified:=True:C214
		End if 
	Else 
		$_l_SelectedRow:=Self:C308->
		LISTBOX SELECT ROW:C912(DIA_lb_Locations; $_l_SelectedRow)
End case 
ERR_MethodTrackerReturn("OBJ [USER].Diary_Types.olbDiaryLocations"; $_t_oldMethodName)
