If (False:C215)
	//object Method Name: Object Name:      [PERSONNEL].Diary_View.Check Box2
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/10/2012 07:10
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(SD_abo_DoneStatus;0)
	//ARRAY DATE(SD_ad_DateStampValues;0)
	//ARRAY DATE(SD_ad_SortDate;0)
	//ARRAY LONGINT(SD_al_EventRecordIDs;0)
	//ARRAY LONGINT(SD_al_ItemTimeValues;0)
	//ARRAY LONGINT(SD_al_RecordNumbers;0)
	//ARRAY LONGINT(SD_al_Time;0)
	//ARRAY LONGINT(SD_al_Time2;0)
	//ARRAY LONGINT(SD_al_ToDoRecordIDs;0)
	//ARRAY TEXT(SD_at_ActionDetails;0)
	//ARRAY TEXT(SD_at_ActionDetails2;0)
	//ARRAY TEXT(SD_at_CompanyCodes;0)
	//ARRAY TEXT(SD_at_ContactCodes;0)
	//ARRAY TEXT(SD_at_Events;0)
	//ARRAY TEXT(SD_at_ItemActionCode;0)
	//ARRAY TEXT(SD_at_ToDoList;0)
	C_BOOLEAN:C305($_bo_Expanded)
	C_LONGINT:C283($_l_CountListItems; $_l_event; $_l_Index; $_l_ItemReference; $_l_RecordRow; $_l_SelectedListItem; $_l_SublistID; SD_l_HLDayTime; SD_l_IncAppointmentCo; SD_l_IncEventCo; SD_l_IncTodoCo)
	C_TEXT:C284($_t_CompanyName; $_t_ItemText; $_t_oldMethodName)
	C_TIME:C306(SD_ti_GetTime)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [PERSONNEL].Diary_View.Check Box2"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4)
		SD_l_IncAppointmentCo:=Abs:C99(SD_l_IncAppointmentCo-1)
		SD_l_IncEventCo:=Abs:C99(SD_l_IncEventCo-1)
		
		SD_l_IncTodoCo:=Abs:C99(SD_l_IncTodoCo-1)
		
		$_l_SelectedListItem:=Selected list items:C379(SD_l_HLDayTime)
		If ($_l_SelectedListItem>0)  //only if something is loaded
			If (SD_RecordModified(->[DIARY:12]))
				SuperDiary_SaveChk
			End if 
		End if 
		$_l_SelectedListItem:=SD_at_ToDoList
		If (SD_at_ToDoList>0)  //only if something is loaded
			If (SD_RecordModified(->[DIARY:12]))
				SuperDiary_SaveChk
			End if 
		End if 
		If (SD_at_Events>0)  //only if something is loaded
			If (SD_RecordModified(->[DIARY:12]))
				SuperDiary_SaveChk
			End if 
		End if 
		
		$_l_CountListItems:=Count list items:C380(SD_l_HLDayTime)
		For ($_l_Index; 1; $_l_CountListItems)
			GET LIST ITEM:C378(SD_l_HLDayTime; $_l_Index; $_l_ItemReference; $_t_ItemText; $_l_SublistID; $_bo_Expanded)
			If ($_l_SublistID=0)
				$_l_RecordRow:=Find in array:C230(SD_al_RecordNumbers; $_l_ItemReference)
				If ($_l_RecordRow>0)
					Gen_TimeStamp2Date(SD_al_ItemTimeValues{$_l_RecordRow}; ->SD_ad_SortDate{$_l_RecordRow}; ->SD_ti_GetTime)
					
					$_t_ItemText:=""
					If (SD_l_IncAppointmentCo>0)
						$_t_CompanyName:=SD_GETCODETAILS(SD_at_CompanyCodes{$_l_RecordRow}; SD_at_ContactCodes{$_l_RecordRow})
					Else 
						$_t_CompanyName:=""
					End if 
					If ((SD_abo_DoneStatus{$_l_RecordRow}) & (SD_at_ActionDetails2{$_l_RecordRow}#"")) | (SD_at_ActionDetails{$_l_RecordRow}="")
						$_t_ItemText:=String:C10(SD_ti_GetTime; 5)+" :"+$_t_CompanyName+" "+Substring:C12(SD_at_ActionDetails2{$_l_RecordRow}; 1; (220-Length:C16($_t_CompanyName)))  //create: diary item time and description
					Else 
						$_t_ItemText:=String:C10(SD_ti_GetTime; 5)+" :"+$_t_CompanyName+" "+Substring:C12(SD_at_ActionDetails{$_l_RecordRow}; 1; (220-Length:C16($_t_CompanyName)))  //create: diary item time and description
					End if 
					SET LIST ITEM:C385(SD_l_HLDayTime; $_l_ItemReference; $_t_ItemText; $_l_ItemReference)
				End if 
				
			End if 
			
		End for 
		////////_o_REDRAW LIST(SD_l_HLDayTime)
		For ($_l_Index; 1; Size of array:C274(SD_at_Events))
			$_l_RecordRow:=Find in array:C230(SD_al_RecordNumbers; SD_al_EventRecordIDs{$_l_Index})
			If ($_l_RecordRow>0)
				$_t_ItemText:=""
				If (SD_l_IncEventCo>0)
					$_t_CompanyName:=SD_GETCODETAILS(SD_at_CompanyCodes{$_l_RecordRow}; SD_at_ContactCodes{$_l_RecordRow})
				Else 
					$_t_CompanyName:=""
				End if 
				If ((SD_abo_DoneStatus{$_l_RecordRow}) & (SD_at_ActionDetails2{$_l_RecordRow}#"")) | (SD_at_ActionDetails{$_l_RecordRow}="")
					SD_at_Events{$_l_Index}:=Time string:C180(SD_al_Time{$_l_RecordRow})+"-"+Time string:C180(SD_al_Time2{$_l_RecordRow})+" :"+$_t_CompanyName+" "+SD_at_ActionDetails2{$_l_RecordRow}  //create: diary item time and description
				Else 
					SD_at_Events{$_l_Index}:=Time string:C180(SD_al_Time{$_l_RecordRow})+"-"+Time string:C180(SD_al_Time2{$_l_RecordRow})+" :"+$_t_CompanyName+" "+SD_at_ActionDetails{$_l_RecordRow}  //create: diary item time and description
				End if 
			End if 
			
			
		End for 
		
		For ($_l_Index; 1; Size of array:C274(SD_at_ToDoList))
			$_l_RecordRow:=Find in array:C230(SD_al_RecordNumbers; SD_al_ToDoRecordIDs{$_l_Index})
			$_t_ItemText:=""
			If ($_l_RecordRow>0)
				If (SD_l_IncTodoCo>0)
					$_t_CompanyName:=SD_GETCODETAILS(SD_at_CompanyCodes{$_l_RecordRow}; SD_at_ContactCodes{$_l_RecordRow})
				Else 
					$_t_CompanyName:=""
				End if 
				If ((SD_abo_DoneStatus{$_l_RecordRow}) & (SD_at_ActionDetails2{$_l_RecordRow}#"")) | (SD_at_ActionDetails{$_l_RecordRow}="")
					SD_at_ToDoList{$_l_Index}:=String:C10(SD_ad_DateStampValues{$_l_RecordRow}; 4)+":"+SD_at_ItemActionCode{$_l_RecordRow}+" :"+$_t_CompanyName+" "+SD_at_ActionDetails2{$_l_RecordRow}  //create: diary item time and description
				Else 
					SD_at_ToDoList{$_l_Index}:=String:C10(SD_ad_DateStampValues{$_l_RecordRow}; 4)+":"+SD_at_ItemActionCode{$_l_RecordRow}+" :"+$_t_CompanyName+" "+SD_at_ActionDetails{$_l_RecordRow}  //create: diary item time and description
				End if 
			End if 
			
		End for 
		
End case 
ERR_MethodTrackerReturn("OBJ [PERSONNEL].Diary_View.Check Box2"; $_t_oldMethodName)
