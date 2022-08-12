//%attributes = {}
If (False:C215)
	//Project Method Name:      Cal4D_Cal_PopulateDayEvents
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/12/2009 20:31`Method: Cal4D_Cal_PopulateDayEvents
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY DATE:C224($_ad_AllDayEndDate; 0)
	ARRAY DATE:C224($_ad_AllDayStartDate; 0)
	ARRAY DATE:C224($_ad_BnrEndDate; 0)
	ARRAY DATE:C224($_ad_BnrStartDate; 0)
	//ARRAY DATE(CAL_ad_EndDate;0)
	//ARRAY DATE(CAL_ad_StartDate;0)
	ARRAY LONGINT:C221($_al_AllDayColor; 0)
	ARRAY LONGINT:C221($_al_AllDayEndTime; 0)
	ARRAY LONGINT:C221($_al_AllDayStartTime; 0)
	ARRAY LONGINT:C221($_al_BnrColor; 0)
	ARRAY LONGINT:C221($_al_BnrEndTime; 0)
	ARRAY LONGINT:C221($_al_BnrStartTime; 0)
	ARRAY LONGINT:C221($_al_RectsBottom; 0)
	ARRAY LONGINT:C221($_al_RectsLeft; 0)
	ARRAY LONGINT:C221($_al_RectsRight; 0)
	ARRAY LONGINT:C221($_al_RectsTop; 0)
	//ARRAY LONGINT(CAL_al_Colour;0)
	ARRAY TEXT:C222($_at_AllDayCALTimeZone; 0)
	ARRAY TEXT:C222($_at_AllDayEventType; 0)
	ARRAY TEXT:C222($_at_AllDayiCalUID; 0)
	ARRAY TEXT:C222($_at_AllDayTitle; 0)
	ARRAY TEXT:C222($_at_AttNames; 0)
	ARRAY TEXT:C222($_at_AttValues; 0)
	ARRAY TEXT:C222($_at_BnrCALTimeZone; 0)
	ARRAY TEXT:C222($_at_BnrEventType; 0)
	ARRAY TEXT:C222($_at_BnriCalUID; 0)
	ARRAY TEXT:C222($_at_BnrNames; 0)
	ARRAY TEXT:C222($_at_BnrRefs; 0)
	ARRAY TEXT:C222($_at_BnrTitle; 0)
	ARRAY TEXT:C222($_at_BnrTypes; 0)
	ARRAY TEXT:C222($_at_Names; 0)
	ARRAY TEXT:C222($_at_Refs; 0)
	ARRAY TEXT:C222($_at_Types; 0)
	//ARRAY TEXT(CAL_at_ActionCode;0)
	//ARRAY TEXT(CAL_at_iCalUUID;0)
	//ARRAY TEXT(CAL_at_TimeZone;0)
	//ARRAY TEXT(CAL_at_Title;0)
	//ARRAY TEXT(Tmp_at_Names;0)
	//ARRAY TEXT(Tmp_at_RefID;0)
	//ARRAY TIME(CAL_ati_StartTime;0)
	//ARRAY TIME(CAL_ati_TimeEnd;0)
	C_BLOB:C604($_blb_WorkingBLOB)
	C_BOOLEAN:C305($_bo_Break; $_bo_Exit; $_bo_PIR)
	C_LONGINT:C283($_l_15MinIncs; $_l_1stInc; $_l_allDayRow; $_l_ColumnLeft; $_l_ColWidth; $_l_Height; $_l_HR; $_l_Indents; $_l_Index2; $_l_ItemIndex; $_l_KIndex)
	C_LONGINT:C283($_l_LineIndex; $_l_Min; $_l_ObjectLeft; $_l_ObjectTop; $_l_SizeofArray; $_l_Width)
	C_POINTER:C301($_ptr_Nul)
	C_TEXT:C284($_t_CallReference; $_t_CellID; $_t_Event; $_t_ObjRef; $_t_oldMethodName; $_t_OrdDate; $_t_RGBColor; $_t_SQL; CAL_t_Banner_Ref_Day; Cal_t_DisplayFont; SVG_t_Ref_Day)
	C_TIME:C306($_ti_EndTime; $_ti_StartTime)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cal4D_Cal_PopulateDayEvents")


If (True:C214)
	ARRAY TEXT:C222(Tmp_at_RefID; 0)
	Tmp_at_RefID:=0
	ARRAY TEXT:C222(Tmp_at_Names; 0)
	
	ARRAY TEXT:C222($_at_Refs; 0)
	ARRAY TEXT:C222($_at_Types; 0)
	ARRAY TEXT:C222($_at_Names; 0)
	SVG_ELEMENTS_TO_ARRAYS(SVG_t_Ref_Day; ->$_at_Refs; ->$_at_Types; ->$_at_Names)
	
	ARRAY TEXT:C222($_at_BnrRefs; 0)
	ARRAY TEXT:C222($_at_BnrTypes; 0)
	ARRAY TEXT:C222($_at_BnrNames; 0)
	SVG_ELEMENTS_TO_ARRAYS(CAL_t_Banner_Ref_Day; ->$_at_BnrRefs; ->$_at_BnrTypes; ->$_at_BnrNames)
End if 

//========================    Method Actions    ==================================

////  Get events of the day
//{
$_t_OrdDate:=String:C10(Cal4D_Cal_DateToOrdinal(Cal4D_Cal_SelectedDate))
Cal4D_Cal_GetEventsForOneDay(Cal4D_Cal_SelectedDate)
//}

If (True:C214)
	////  Parse out Banner and All-Day events from the Appointments
	//{
	ARRAY LONGINT:C221($_al_BnrStartTime; 0)
	ARRAY LONGINT:C221($_al_BnrEndTime; 0)
	ARRAY TEXT:C222($_at_BnrTitle; 0)
	ARRAY TEXT:C222($_at_BnrEventType; 0)
	ARRAY TEXT:C222($_at_BnriCalUID; 0)
	ARRAY LONGINT:C221($_al_BnrColor; 0)
	ARRAY DATE:C224($_ad_BnrStartDate; 0)
	ARRAY DATE:C224($_ad_BnrEndDate; 0)
	ARRAY TEXT:C222($_at_BnrCALTimeZone; 0)
	
	ARRAY LONGINT:C221($_al_AllDayStartTime; 0)
	ARRAY LONGINT:C221($_al_AllDayEndTime; 0)
	ARRAY TEXT:C222($_at_AllDayTitle; 0)
	ARRAY TEXT:C222($_at_AllDayEventType; 0)
	ARRAY TEXT:C222($_at_AllDayiCalUID; 0)
	ARRAY LONGINT:C221($_al_AllDayColor; 0)
	ARRAY DATE:C224($_ad_AllDayStartDate; 0)
	ARRAY DATE:C224($_ad_AllDayEndDate; 0)
	ARRAY TEXT:C222($_at_AllDayCALTimeZone; 0)
	
	SET BLOB SIZE:C606($_blb_WorkingBLOB; 0)
	CAL4D_VarstoBlob(->$_blb_WorkingBLOB; ->CAL_ati_StartTime; ->CAL_ati_TimeEnd; ->CAL_at_Title; ->CAL_at_ActionCode; ->CAL_at_iCalUUID; ->CAL_al_Colour; ->CAL_ad_StartDate; ->CAL_ad_EndDate; ->CAL_at_TimeZone)
	
	Cal4D_ParseArrays(->$_blb_WorkingBLOB)
	
	$_l_ItemIndex:=0
	$_l_ItemIndex:=CAL4D_GetVarsFromBlob($_l_ItemIndex; ->$_blb_WorkingBLOB; ->CAL_ati_StartTime; ->CAL_ati_TimeEnd; ->CAL_at_Title; ->CAL_at_ActionCode; ->CAL_at_iCalUUID; ->CAL_al_Colour; ->CAL_ad_StartDate; ->CAL_ad_EndDate; ->CAL_at_TimeZone)
	$_l_ItemIndex:=CAL4D_GetVarsFromBlob($_l_ItemIndex; ->$_blb_WorkingBLOB; ->$_al_BnrStartTime; ->$_al_BnrEndTime; ->$_at_BnrTitle; ->$_at_BnrEventType; ->$_at_BnriCalUID; ->$_al_BnrColor; ->$_ad_BnrStartDate; ->$_ad_BnrEndDate; ->$_at_BnrCALTimeZone)
	$_l_ItemIndex:=CAL4D_GetVarsFromBlob($_l_ItemIndex; ->$_blb_WorkingBLOB; ->$_al_AllDayStartTime; ->$_al_AllDayEndTime; ->$_at_AllDayTitle; ->$_at_AllDayEventType; ->$_at_AllDayiCalUID; ->$_al_AllDayColor; ->$_ad_AllDayStartDate; ->$_ad_AllDayEndDate; ->$_at_AllDayCALTimeZone)
	//}
	
End if 

$_l_ColumnLeft:=0
$_l_allDayRow:=Find in array:C230($_at_BnrNames; "AllDay_@")
ARRAY TEXT:C222($_at_AttNames; 0)
ARRAY TEXT:C222($_at_AttValues; 0)
SVG_GET_ATTRIBUTES($_at_BnrRefs{$_l_allDayRow}; ->$_at_AttNames; ->$_at_AttValues)
$_l_ObjectLeft:=Num:C11($_at_AttValues{Find in array:C230($_at_AttNames; "x")})
$_l_ObjectTop:=Num:C11($_at_AttValues{Find in array:C230($_at_AttNames; "y")})
$_l_Height:=Num:C11($_at_AttValues{Find in array:C230($_at_AttNames; "height")})
$_l_Width:=Num:C11($_at_AttValues{Find in array:C230($_at_AttNames; "width")})

////  Process Banner events
//{
$_l_SizeofArray:=Size of array:C274($_al_BnrStartTime)
If ($_l_SizeofArray>0)
	For ($_l_ItemIndex; 1; $_l_SizeofArray)
		$_t_RGBColor:=Cal4D_Util_RGBToRGBString($_al_BnrColor{$_l_ItemIndex})
		$_t_ObjRef:=SVG_New_rect(CAL_t_Banner_Ref_Day; $_l_ObjectLeft; $_l_ObjectTop; $_l_Width; 16; 0; 0; $_t_RGBColor; $_t_RGBColor; 1)
		SVG_SET_OPACITY($_t_ObjRef; Cal4D_Cal_SetOpacity("All-Day"); 0)
		$_t_CellID:=$_t_OrdDate+"_Evt_"+$_at_BnriCalUID{$_l_ItemIndex}
		SVG_SET_ID($_t_ObjRef; $_t_CellID)
		
		$_t_ObjRef:=SVG_New_textArea(CAL_t_Banner_Ref_Day; $_at_BnrTitle{$_l_ItemIndex}; $_l_ObjectLeft; $_l_ObjectTop+1; $_l_Width; 16; Cal_t_DisplayFont; 13; Plain:K14:1; Align center:K42:3)
		$_t_CellID:=$_t_OrdDate+"_Txt_"+$_at_BnriCalUID{$_l_ItemIndex}
		SVG_SET_ID($_t_ObjRef; $_t_CellID)
		SVG_SET_FONT_COLOR($_t_ObjRef; "white")
		
		Tmp_at_RefID:=Tmp_at_RefID+1
		INSERT IN ARRAY:C227(Tmp_at_RefID; Tmp_at_RefID)
		INSERT IN ARRAY:C227(Tmp_at_Names; Tmp_at_RefID)
		Tmp_at_RefID{Tmp_at_RefID}:=$_t_ObjRef
		Tmp_at_Names{Tmp_at_RefID}:=$_t_CellID
		
		$_l_ObjectTop:=$_l_ObjectTop+18
	End for 
End if 
//}

////  Process All-day events
//{
$_l_SizeofArray:=Size of array:C274($_al_AllDayStartTime)
If ($_l_SizeofArray>0)
	For ($_l_ItemIndex; 1; $_l_SizeofArray)
		$_t_RGBColor:=Cal4D_Util_RGBToRGBString($_al_AllDayColor{$_l_ItemIndex})
		$_t_ObjRef:=SVG_New_rect(CAL_t_Banner_Ref_Day; $_l_ObjectLeft; $_l_ObjectTop; $_l_Width; 16; 6; 6; $_t_RGBColor; $_t_RGBColor; 1)
		SVG_SET_OPACITY($_t_ObjRef; Cal4D_Cal_SetOpacity("All-Day"); 0)
		$_t_CellID:=$_t_OrdDate+"_Evt_"+$_at_AllDayiCalUID{$_l_ItemIndex}
		SVG_SET_ID($_t_ObjRef; $_t_CellID)
		
		$_t_ObjRef:=SVG_New_textArea(CAL_t_Banner_Ref_Day; $_at_AllDayTitle{$_l_ItemIndex}; $_l_ObjectLeft; $_l_ObjectTop+1; $_l_Width; 16; Cal_t_DisplayFont; 13; Plain:K14:1; Align center:K42:3)
		$_t_CellID:=$_t_OrdDate+"_Txt_"+$_at_AllDayiCalUID{$_l_ItemIndex}
		SVG_SET_ID($_t_ObjRef; $_t_CellID)
		SVG_SET_FONT_COLOR($_t_ObjRef; "white")
		
		Tmp_at_RefID:=Tmp_at_RefID+1
		INSERT IN ARRAY:C227(Tmp_at_RefID; Tmp_at_RefID)
		INSERT IN ARRAY:C227(Tmp_at_Names; Tmp_at_RefID)
		Tmp_at_RefID{Tmp_at_RefID}:=$_t_ObjRef
		Tmp_at_Names{Tmp_at_RefID}:=$_t_CellID
		
		$_l_ObjectTop:=$_l_ObjectTop+18
	End for 
End if 
//}

////  Process Appointment events
//{
$_l_SizeofArray:=Size of array:C274(CAL_ati_StartTime)
If ($_l_SizeofArray>0)
	ARRAY LONGINT:C221($_al_RectsLeft; $_l_SizeofArray)
	ARRAY LONGINT:C221($_al_RectsTop; $_l_SizeofArray)
	ARRAY LONGINT:C221($_al_RectsRight; $_l_SizeofArray)
	ARRAY LONGINT:C221($_al_RectsBottom; $_l_SizeofArray)
	
	ARRAY TEXT:C222($_at_AttNames; 0)
	ARRAY TEXT:C222($_at_AttValues; 0)
	
	$_t_CellID:=$_t_OrdDate+"_00"
	$_l_allDayRow:=Find in array:C230($_at_Names; $_t_CellID)
	SVG_GET_ATTRIBUTES($_at_Refs{$_l_allDayRow}; ->$_at_AttNames; ->$_at_AttValues)
	$_l_ObjectLeft:=Num:C11($_at_AttValues{Find in array:C230($_at_AttNames; "x")})
	$_l_ColumnLeft:=Num:C11($_at_AttValues{Find in array:C230($_at_AttNames; "x")})
	$_l_ColWidth:=Num:C11($_at_AttValues{Find in array:C230($_at_AttNames; "width")})
	
	$_l_Indents:=0
	For ($_l_ItemIndex; 1; $_l_SizeofArray)
		$_ti_StartTime:=CAL_ati_StartTime{$_l_ItemIndex}
		$_ti_EndTime:=CAL_ati_TimeEnd{$_l_ItemIndex}
		$_l_Min:=Cal4D_UTIL_MinuteOf($_ti_StartTime)
		
		$_l_15MinIncs:=($_ti_EndTime-$_ti_StartTime)/900
		$_l_Height:=(48/4)*$_l_15MinIncs
		
		$_l_HR:=Cal4D_UTIL_HourOf($_ti_StartTime)
		$_t_CellID:=$_t_OrdDate+"_"+String:C10($_l_HR; "00")
		$_l_allDayRow:=Find in array:C230($_at_Names; $_t_CellID)
		If ($_l_allDayRow>0)
			$_l_ObjectLeft:=$_l_ColumnLeft
			SVG_GET_ATTRIBUTES($_at_Refs{$_l_allDayRow}; ->$_at_AttNames; ->$_at_AttValues)
			$_l_ObjectTop:=Num:C11($_at_AttValues{Find in array:C230($_at_AttNames; "y")})
			Case of 
				: ($_l_Min>=45)
					$_l_ObjectTop:=$_l_ObjectTop+36
				: ($_l_Min>=30)
					$_l_ObjectTop:=$_l_ObjectTop+24
				: ($_l_Min>=15)
					$_l_ObjectTop:=$_l_ObjectTop+12
			End case 
			
			Case of 
				: (($_l_ItemIndex=1) & ($_l_SizeofArray>1))
					If (True:C214)
						$_bo_Break:=False:C215
						$_l_LineIndex:=0
						If ($_l_SizeofArray>1)
							For ($_l_Index2; $_l_SizeofArray; 2; -1)
								$_l_allDayRow:=$_l_Index2-1
								If (CAL_ati_StartTime{$_l_Index2}=CAL_ati_StartTime{$_l_allDayRow})
									$_l_LineIndex:=$_l_LineIndex+1
									$_l_allDayRow:=$_l_Index2
									$_l_Index2:=$_l_Index2-1
									If ($_l_Index2>0)
										Repeat 
											If (CAL_ati_StartTime{$_l_Index2}=CAL_ati_StartTime{$_l_allDayRow})
												$_l_LineIndex:=$_l_LineIndex+1
											Else 
												$_bo_Break:=True:C214
											End if 
											
											If (($_l_Index2-1)>0)
												$_l_allDayRow:=$_l_Index2
												$_l_Index2:=$_l_Index2-1
											Else 
												$_bo_Break:=True:C214
											End if 
										Until ($_bo_Break)
										
										If ($_l_LineIndex>$_l_Indents)
											$_l_Indents:=$_l_LineIndex
										End if 
										$_l_LineIndex:=0
									End if 
									
								Else 
									If (CAL_ati_StartTime{$_l_Index2}<CAL_ati_TimeEnd{$_l_allDayRow})
										$_l_LineIndex:=$_l_LineIndex+1
									Else 
										
									End if 
									
								End if 
							End for 
							
							If ($_l_LineIndex>$_l_Indents)
								$_l_Indents:=$_l_LineIndex
							End if 
						End if 
						
					Else 
						For ($_l_allDayRow; 1; ($_l_SizeofArray-1))
							$_l_KIndex:=0
							$_l_LineIndex:=0
							Repeat 
								$_l_KIndex:=$_l_KIndex+1
								$_bo_Exit:=(($_l_allDayRow+$_l_KIndex)>=$_l_SizeofArray)
								If (Not:C34($_bo_Exit))
									$_bo_Exit:=(CAL_ati_TimeEnd{$_l_allDayRow}<CAL_ati_StartTime{$_l_allDayRow+$_l_KIndex})
									If (Not:C34($_bo_Exit))
										$_l_LineIndex:=$_l_LineIndex+1
										If ($_l_LineIndex>$_l_Indents)
											$_l_Indents:=$_l_LineIndex
										End if 
										$_bo_Exit:=(($_l_KIndex+1)>=$_l_SizeofArray)
									End if 
								End if 
							Until ($_bo_Exit)
							
						End for 
					End if 
					
					////  Handle event overlaps
					//{
					If ($_l_Indents>0)
						$_l_Width:=$_l_Width/$_l_Indents
					End if 
					
				: ($_l_ItemIndex>1)  // (($_l_Indents>0) & ($_l_LineIndex=$_l_Indents) & ($_l_ItemIndex<$_l_SizeofArray))
					For ($_l_Index2; 1; $_l_ItemIndex-1)
						$_bo_PIR:=UTIL_PointInRect($_l_ObjectLeft+1; $_l_ObjectTop+1; $_ptr_Nul; $_al_RectsLeft{$_l_Index2}; $_al_RectsTop{$_l_Index2}; $_al_RectsRight{$_l_Index2}; $_al_RectsBottom{$_l_Index2})
						If ($_bo_PIR)
							$_l_ObjectLeft:=$_l_ObjectLeft+$_l_Width
						End if 
					End for 
			End case 
			//}
			
			$_t_RGBColor:=Cal4D_Util_RGBToRGBString(CAL_al_Colour{$_l_ItemIndex})
			$_t_ObjRef:=SVG_New_rect(SVG_t_Ref_Day; $_l_ObjectLeft; $_l_ObjectTop; $_l_Width; $_l_Height; 8; 8; $_t_RGBColor; $_t_RGBColor; 8)
			SVG_SET_OPACITY($_t_ObjRef; 30; 0)
			$_t_CellID:=$_t_OrdDate+"_Evt_"+CAL_at_iCalUUID{$_l_ItemIndex}
			SVG_SET_ID($_t_ObjRef; $_t_CellID)
			
			$_al_RectsLeft{$_l_ItemIndex}:=$_l_ObjectLeft
			$_al_RectsTop{$_l_ItemIndex}:=$_l_ObjectTop
			$_al_RectsRight{$_l_ItemIndex}:=$_l_ObjectLeft+$_l_Width
			$_al_RectsBottom{$_l_ItemIndex}:=$_l_ObjectTop+$_l_Height
			
			$_t_Event:=String:C10($_ti_StartTime; HH MM AM PM:K7:5)+" - "+CAL_at_Title{$_l_ItemIndex}
			$_t_ObjRef:=SVG_New_textArea(SVG_t_Ref_Day; $_t_Event; $_l_ObjectLeft+4; $_l_ObjectTop; $_l_Width; 32; "Lucida Grande, Tahoma"; 13; Plain:K14:1; Align left:K42:2)
		End if 
		
	End for 
End if 
//}

//========================    Clean up and Exit    =================================

////  Free the memory used
//{
Cal4D_Cal_GetEventsForOneDay(!00-00-00!)
//}
ERR_MethodTrackerReturn("Cal4D_Cal_PopulateDayEvents"; $_t_oldMethodName)