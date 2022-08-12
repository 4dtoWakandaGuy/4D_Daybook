
If (False:C215)
	//Object Name:      [DIARY_ITEMOWNERS].SD3_ThreadArea
	//------------------ Script Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  25/11/2019
	//Created BY:  DefaultUser
	
	//Date Modified: 
	//Modified By: DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(SD3_lb_ThreadItems;0)
	ARRAY DATE:C224($_ad_DateDoFrom; 0)
	ARRAY DATE:C224($_ad_DateDoTo; 0)
	//ARRAY DATE(SD3_ad_DiaryDateFrom;0)
	//ARRAY DATE(SD3_ad_DiaryDateTo;0)
	//ARRAY DATE(SD3_ati_DiaryTimeTo;0)
	ARRAY LONGINT:C221($_al_ArrayTypes; 0)
	ARRAY LONGINT:C221($_al_PersonorGroup; 0)
	//ARRAY LONGINT(SD3_al_DiaryThreadOrder;0)
	//ARRAY LONGINT(SD3_al_DiaryWhoID;0)
	ARRAY TEXT:C222($_at_ActionDetails; 0)
	ARRAY TEXT:C222($_at_Arrays; 0)
	ARRAY TEXT:C222($_at_Person; 0)
	ARRAY TEXT:C222($_at_ResultCode; 0)
	ARRAY TEXT:C222($_at_ResultName; 0)
	//ARRAY TEXT(ACC_at_DaybookFields;0)
	//ARRAY TEXT(ACC_at_StatementFields;0)
	//ARRAY TEXT(SD_at_DateTimeInfo;0)
	//ARRAY TEXT(SD3_at_DiaryActionCodes;0)
	//ARRAY TEXT(SD3_at_DiaryActionNames;0)
	//ARRAY TEXT(SD3_at_DiaryActionNotes;0)
	//ARRAY TEXT(SD3_at_DiaryItemCodes;0)
	//ARRAY TEXT(SD3_at_DiaryOutcomeCodes;0)
	//ARRAY TEXT(SD3_at_DiaryOutcomeNames;0)
	//ARRAY TEXT(SD3_at_DIaryWhoName;0)
	ARRAY TIME:C1223($_ati_TimeDoFrom; 0)
	ARRAY TIME:C1223($_ati_TimeDoTo; 0)
	//ARRAY TIME(SD3_ati_DiaryDateTo;0)
	//ARRAY TIME(SD3_ati_DiaryTimeFrom;0)
	C_LONGINT:C283($_l_BuildDateStrings; $_l_FormEvent; $_l_GetThread; $_l_max)
	C_OBJECT:C1216($_obj_DiaryThread; SD3_obj_ThreadItems)
	C_TEXT:C284($_t_DateInfo; $_t_oldMethodName; $_t_TimeInfo)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("FM [DIARY_ITEMOWNERS]SD3_ThreadArea"; Form event code:C388)

$_l_FormEvent:=Form event code:C388
Case of 
	: ($_l_FormEvent=On Load:K2:1)
		If ([DIARY:12]ThreadID:64>0)
			$_l_GetThread:=New process:C317("SD3_GetThreadtoObject"; 256000; "Get Thread List"; [DIARY:12]ThreadID:64; Current process:C322)
			While (Process state:C330($_l_GetThread)>0)
				DelayTicks(10)
			End while 
			//SELECTION TO ARRAY([DIARY]Diary_Code;$_at_DiaryCodes;[DIARY]Action_Code;$_at_ActionCode;[DIARY]Action_Details;$_at_ActionDetails;[DIARY]Display_Date_From;$_ad_DateDoFrom;[DIARY]Display_Date_To;$_ad_DateDoTo;[DIARY]Display_Time_From;$_ati_TimeDoFrom;[DIARY]Display_Time_To;$_ati_TimeDoTo;[DIARY]PersonID;$_al_PersonorGroup;[DIARY]Result_Code;$_at_ResultCode)
			//ARRAY TEXT($_at_Person;Size of array($_at_DiaryCodes))
			//ARRAY TEXT($_at_ActionName;Size of array($_at_DiaryCodes))
			//ARRAY TEXT($_at_ResultName;Size of array($_at_DiaryCodes))
			//ARRAY LONGINT($_al_SortSequence;Size of array($_at_DiaryCodes))
			OB GET PROPERTY NAMES:C1232(SD3_obj_ThreadItems; $_at_Arrays; $_al_ArrayTypes)
			ARRAY TEXT:C222(SD3_at_DiaryItemCodes; 0)
			ARRAY TEXT:C222(SD3_at_DiaryActionCodes; 0)
			ARRAY TEXT:C222(SD3_at_DiaryActionNames; 0)
			ARRAY TEXT:C222(SD3_at_DiaryActionNotes; 0)
			ARRAY LONGINT:C221(SD3_al_DiaryThreadOrder; 0)
			ARRAY LONGINT:C221(SD3_al_DiaryWhoID; 0)
			ARRAY TEXT:C222(SD3_at_DIaryWhoName; 0)
			ARRAY DATE:C224(SD3_ad_DiaryDateFrom; 0)
			ARRAY DATE:C224(SD3_ad_DiaryDateTo; 0)
			ARRAY TIME:C1223(SD3_ati_DiaryTimeFrom; 0)
			ARRAY TIME:C1223(SD3_ati_DiaryTimeTo; 0)
			ARRAY TEXT:C222(SD3_at_DiaryOutcomeCodes; 0)
			ARRAY TEXT:C222(SD3_at_DiaryOutcomeNames; 0)
			$_l_max:=0
			If (Find in array:C230($_at_Arrays; "Diary Codes")>0)
				OB GET ARRAY:C1229(SD3_obj_ThreadItems; "Diary Codes"; SD3_at_DiaryItemCodes)
				If (Size of array:C274(SD3_at_DiaryItemCodes)>$_l_max)
					$_l_max:=Size of array:C274(SD3_at_DiaryItemCodes)
				End if 
			End if 
			If (Find in array:C230($_at_Arrays; "ActionCode")>0)
				OB GET ARRAY:C1229(SD3_obj_ThreadItems; "ActionCode"; SD3_at_DiaryActionCodes)
				If (Size of array:C274(SD3_at_DiaryActionCodes)>$_l_max)
					$_l_max:=Size of array:C274(SD3_at_DiaryActionCodes)
				End if 
			End if 
			If (Find in array:C230($_at_Arrays; "ActionName")>0)
				OB GET ARRAY:C1229(SD3_obj_ThreadItems; "ActionCode"; SD3_at_DiaryActionNames)
				If (Size of array:C274(SD3_at_DiaryActionNames)>$_l_max)
					$_l_max:=Size of array:C274(SD3_at_DiaryActionNames)
				End if 
			End if 
			If (Find in array:C230($_at_Arrays; "Details")>0)
				OB GET ARRAY:C1229(SD3_obj_ThreadItems; "Details"; $_at_ActionDetails)
				If (Size of array:C274(SD3_at_DiaryActionNames)>$_l_max)
					$_l_max:=Size of array:C274(SD3_at_DiaryActionNames)
				End if 
			End if 
			If (Find in array:C230($_at_Arrays; "Sequence")>0)
				OB GET ARRAY:C1229(SD3_obj_ThreadItems; "Sequence"; SD3_al_DiaryThreadOrder)
				If (Size of array:C274(SD3_al_DiaryThreadOrder)>$_l_max)
					$_l_max:=Size of array:C274(SD3_al_DiaryThreadOrder)
				End if 
			End if 
			If (Find in array:C230($_at_Arrays; "PersonID")>0)
				OB GET ARRAY:C1229(SD3_obj_ThreadItems; "PersonID"; SD3_al_DiaryWhoID)
				If (Size of array:C274(SD3_al_DiaryWhoID)>$_l_max)
					$_l_max:=Size of array:C274(SD3_al_DiaryWhoID)
				End if 
			End if 
			If (Find in array:C230($_at_Arrays; "DiaryName")>0)
				OB GET ARRAY:C1229(SD3_obj_ThreadItems; "DiaryName"; SD3_at_DIaryWhoName)
				If (Size of array:C274(SD3_at_DIaryWhoName)>$_l_max)
					$_l_max:=Size of array:C274(SD3_at_DIaryWhoName)
				End if 
			End if 
			If (Find in array:C230($_at_Arrays; "DatesFrom")>0)
				OB GET ARRAY:C1229(SD3_obj_ThreadItems; "DatesFrom"; SD3_ad_DiaryDateFrom)
				If (Size of array:C274(SD3_ad_DiaryDateFrom)>$_l_max)
					$_l_max:=Size of array:C274(SD3_ad_DiaryDateFrom)
				End if 
			End if 
			If (Find in array:C230($_at_Arrays; "DatesTo")>0)
				OB GET ARRAY:C1229(SD3_obj_ThreadItems; "DatesTo"; SD3_ad_DiaryDateTo)
				If (Size of array:C274(SD3_ad_DiaryDateTo)>$_l_max)
					$_l_max:=Size of array:C274(SD3_ad_DiaryDateTo)
				End if 
			End if 
			If (Find in array:C230($_at_Arrays; "TimesFrom")>0)
				OB GET ARRAY:C1229(SD3_obj_ThreadItems; "DatesFrom"; SD3_ati_DiaryTimeFrom)
				If (Size of array:C274(SD3_ati_DiaryTimeFrom)>$_l_max)
					$_l_max:=Size of array:C274(SD3_ati_DiaryTimeFrom)
				End if 
			End if 
			If (Find in array:C230($_at_Arrays; "TimesTo")>0)
				OB GET ARRAY:C1229(SD3_obj_ThreadItems; "DatesTo"; SD3_ati_DiaryTimeTo)
				If (Size of array:C274(SD3_ati_DiaryTimeTo)>$_l_max)
					$_l_max:=Size of array:C274(SD3_ati_DiaryTimeTo)
				End if 
			End if 
			If (Find in array:C230($_at_Arrays; "Outcome")>0)
				OB GET ARRAY:C1229(SD3_obj_ThreadItems; "Outcome"; SD3_at_DiaryOutcomeCodes)
				If (Size of array:C274(SD3_at_DiaryOutcomeCodes)>$_l_max)
					$_l_max:=Size of array:C274(SD3_at_DiaryOutcomeCodes)
				End if 
			End if 
			If (Find in array:C230($_at_Arrays; "OutcomeName")>0)
				OB GET ARRAY:C1229(SD3_obj_ThreadItems; "OutcomeName"; SD3_at_DiaryOutcomeNames)
				If (Size of array:C274(SD3_at_DiaryOutcomeNames)>$_l_max)
					$_l_max:=Size of array:C274(SD3_at_DiaryOutcomeNames)
				End if 
			End if 
			
			SORT ARRAY:C229(SD3_al_DiaryThreadOrder; SD3_at_DiaryItemCodes; SD3_at_DiaryActionCodes; SD3_at_DiaryActionNames; SD3_at_DiaryActionNotes; SD3_al_DiaryWhoID; SD3_at_DIaryWhoName; SD3_ad_DiaryDateFrom; SD3_ad_DiaryDateTo; SD3_ati_DiaryTimeFrom; SD3_ati_DiaryTimeTo; SD3_at_DiaryOutcomeCodes; SD3_at_DiaryOutcomeNames; >)
			ARRAY TEXT:C222(SD_at_DateTimeInfo; 0)
			ARRAY TEXT:C222(SD_at_DateTimeInfo; Size of array:C274(SD3_at_DiaryItemCodes))
			For ($_l_BuildDateStrings; 1; Size of array:C274(SD3_at_DiaryItemCodes))
				$_t_DateInfo:=""
				$_t_TimeInfo:=""
				If (SD3_ad_DiaryDateFrom{$_l_BuildDateStrings}#!00-00-00!)
					$_t_DateInfo:=String:C10(SD3_ad_DiaryDateFrom{$_l_BuildDateStrings}; Internal date short:K1:7)
					If (SD3_ad_DiaryDateTo{$_l_BuildDateStrings}#!00-00-00!)
						If (SD3_ad_DiaryDateFrom{$_l_BuildDateStrings}#SD3_ad_DiaryDateTo{$_l_BuildDateStrings})
							$_t_DateInfo:=$_t_DateInfo+"-"+String:C10(SD3_ad_DiaryDateTo{$_l_BuildDateStrings}; Internal date short:K1:7)
						End if 
					End if 
				Else 
					If (SD3_ad_DiaryDateTo{$_l_BuildDateStrings}#!00-00-00!)
						$_t_DateInfo:=String:C10(SD3_ad_DiaryDateTo{$_l_BuildDateStrings}; Internal date short:K1:7)
					End if 
				End if 
				If (SD3_ati_DiaryTimeFrom{$_l_BuildDateStrings}#?00:00:00?)
					$_t_TimeInfo:=String:C10(SD3_ati_DiaryTimeFrom{$_l_BuildDateStrings}; HH MM:K7:2)
					If (SD3_ati_DiaryTimeTo{$_l_BuildDateStrings}#?00:00:00?)
						If (SD3_ati_DiaryTimeTo{$_l_BuildDateStrings}#SD3_ati_DiaryTimeFrom{$_l_BuildDateStrings})
							$_t_TimeInfo:=$_t_TimeInfo+"-"+String:C10(SD3_ati_DiaryTimeTo{$_l_BuildDateStrings}; HH MM:K7:2)
						End if 
					End if 
				Else 
					If (SD3_ati_DiaryTimeTo{$_l_BuildDateStrings}#?00:00:00?)
						$_t_TimeInfo:=String:C10(SD3_ati_DiaryTimeTo{$_l_BuildDateStrings}; HH MM:K7:2)
					End if 
				End if 
				If ($_t_DateInfo#"")
					SD_at_DateTimeInfo{$_l_BuildDateStrings}:=$_t_DateInfo+" "+$_t_TimeInfo
				Else 
					SD_at_DateTimeInfo{$_l_BuildDateStrings}:=$_t_TimeInfo
					
				End if 
			End for 
			LB_SetupListbox(->SD3_lb_ThreadItems; "SD3_S55"; "ABC_L"; 1; ->SD3_al_DiaryThreadOrder; ->SD3_at_DiaryItemCodes; ->SD3_at_DiaryActionCodes; ->SD3_al_DiaryWhoID; ->SD3_at_DiaryOutcomeCodes; ->SD3_at_DiaryActionNames; ->SD3_at_DiaryActionNotes; ->SD3_at_DIaryWhoName; ->SD_at_DateTimeInfo; ->SD3_at_DiaryOutcomeNames)
			LB_SetColumnHeaders(->SD3_lb_ThreadItems; "SD3_L"; 1; "Sort"; "Item Code"; "Action Code"; "Person ID"; "Outcome Code"; "Action"; "Notes"; "Diary"; "When"; "Outcome")
			LB_SetColumnWidths(->SD3_lb_ThreadItems; "SD3_S55"; 1; 0; 0; 0; 0; 0; 100; 200; 100; 200; 100)
			LB_SetScroll(->SD3_lb_ThreadItems; -3; -2)
			LB_StyleSettings(->SD3_lb_ThreadItems; "Black"; 9; "SD3_S55"; ->[DIARY:12])
			LB_SetEnterable(->SD3_lb_ThreadItems; False:C215; 0)
			
			
			
		End if 
End case 
ERR_MethodTrackerReturn("FM [DIARY_ITEMOWNERS]SD3_ThreadArea"; $_t_oldMethodName)
