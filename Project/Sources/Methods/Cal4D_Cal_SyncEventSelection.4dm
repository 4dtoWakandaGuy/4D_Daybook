//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Cal4D_Cal_SyncEventSelection
	//------------------ Method Notes ------------------
	//*****************************************************************************
	////
	////  Cal4D_Cal_SyncEventSelection
	////
	////  Written by Charles Vass - 07/10/2009, 12:49
	////
	////  Purpose:
	////
	////  $1 - type - purpose
	////
	////
	//*****************************************************************************
	
	//------------------ Revision Control ----------------
	//Date Created: 23/12/2009 15:25
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(CAL_at_DayBnrNames;0)
	//ARRAY TEXT(CAL_at_DayBnrRefs;0)
	//ARRAY TEXT(CAL_at_DayEvtNames;0)
	//ARRAY TEXT(CAL_at_DayEvtRefs;0)
	//ARRAY TEXT(SD2_at_Names;0)
	//ARRAY TEXT(SD2_at_Refs;0)
	//ARRAY TEXT(SD2_at_WkBnrNames;0)
	//ARRAY TEXT(SD2_at_WKBnrRefs;0)
	//ARRAY TEXT(SD2_at_WkEvtNames;0)
	//ARRAY TEXT(SD2_at_WkEvtRefs;0)
	C_DATE:C307(CAL_d_EvtEndDate; CAL_d_EvtStartDate)
	C_LONGINT:C283($_l_EventRow; $_l_EvtEndOrdDate; $_l_EvtStartOrdDate; $_l_Index; $_l_NumberOfRows)
	C_POINTER:C301(CAL_Ptr_4DCalendarDay; CAL_ptr_4DCalendarWeek; CAL_ptr_4DFullCalendar; CAL_ptr_BannerDay; CAL_ptr_BannerWeek)
	C_TEXT:C284($_t_MethodName; $_t_Msg; $_t_oldMethodName; $_t_RGBColor; $_t_TmpID; $_t_Type; $1; $2; CAL_t_Banner_Ref_Day; Cal_t_SelectedEventRef; Cal_t_SelectedEventUID)
	C_TEXT:C284(CAL_t_SVGref; Cal_t_WeekRef; SVG_t_Ref_Day; SVG_t_Ref_Week)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cal4D_Cal_SyncEventSelection")


If (Cal_t_SelectedEventUID#"")
	$_t_Msg:=$1
	Cal4D_Cal_GetEventDates
	$_l_EvtStartOrdDate:=Cal4D_Cal_DateToOrdinal(CAL_d_EvtStartDate)
	$_l_EvtEndOrdDate:=Cal4D_Cal_DateToOrdinal(CAL_d_EvtEndDate)
	$_l_NumberOfRows:=($_l_EvtEndOrdDate-$_l_EvtStartOrdDate)+1
	$_t_Type:=Cal4D_Cal_GetEventType
	
	OK:=1
	If (Cal_t_SelectedEventRef="")
		$_l_Index:=Find in array:C230(SD2_at_Names; String:C10($_l_EvtStartOrdDate)+"_Evt_"+Cal_t_SelectedEventUID)
		If ($_l_Index>0)
			Cal_t_SelectedEventRef:=SD2_at_Refs{$_l_Index}
		Else 
			////  Because all events are not necessarily displayed on the month calendar
			////  Check to see if it is in the week list
			////
			$_l_Index:=Find in array:C230(SD2_at_WkEvtNames; String:C10($_l_EvtStartOrdDate)+"_Evt_"+Cal_t_SelectedEventUID)
			If ($_l_Index>0)
				Cal_t_SelectedEventRef:=SD2_at_WkEvtRefs{$_l_Index}
			Else 
				OK:=0
			End if 
			
		End if 
	End if 
	
	//========================    Method Actions    ==================================
	
	If (OK=1)
		Case of 
			: ($_t_Msg="Clear")
				$_t_RGBColor:=Cal4D_Util_RGBToRGBString(Cal4D_Cal_GetEventColor)
				
				If (True:C214)
					////  Handle event selection - Month View
					//{
					Case of 
						: ($_t_Type="Banner")
							For ($_l_Index; 1; $_l_NumberOfRows)
								If (Find in array:C230(SD2_at_Names; String:C10($_l_EvtStartOrdDate)+"_Evt_"+Cal_t_SelectedEventUID)>0)
									$_t_TmpID:=SD2_at_Refs{Find in array:C230(SD2_at_Names; String:C10($_l_EvtStartOrdDate)+"_Evt_"+Cal_t_SelectedEventUID)}
									SVG_SET_ATTRIBUTES($_t_TmpID; "fill"; $_t_RGBColor)
									SVG_SET_OPACITY($_t_TmpID; Cal4D_Cal_SetOpacity($_t_Type); 0)
									
									$_t_TmpID:=String:C10($_l_EvtStartOrdDate)+"_Txt_"+Cal_t_SelectedEventUID
									$_l_EventRow:=Find in array:C230(SD2_at_Names; $_t_TmpID)
									If ($_l_EventRow>0)
										$_t_TmpID:=SD2_at_Refs{$_l_EventRow}
										SVG_SET_ATTRIBUTES($_t_TmpID; "fill"; "white")
									End if 
								End if 
								$_l_EvtStartOrdDate:=$_l_EvtStartOrdDate+1
								
							End for 
							
						: ($_t_Type="All-day")
							SVG_SET_ATTRIBUTES(Cal_t_SelectedEventRef; "fill"; $_t_RGBColor)
							SVG_SET_OPACITY(Cal_t_SelectedEventRef; Cal4D_Cal_SetOpacity($_t_Type); 0)
							
							$_t_TmpID:=String:C10($_l_EvtStartOrdDate)+"_Txt_"+Cal_t_SelectedEventUID
							$_l_Index:=Find in array:C230(SD2_at_Names; $_t_TmpID)
							If ($_l_Index>0)
								$_t_TmpID:=SD2_at_Refs{$_l_Index}
								SVG_SET_ATTRIBUTES($_t_TmpID; "fill"; "white")
							End if 
							
						Else 
							SVG_SET_OPACITY(Cal_t_SelectedEventRef; 10; 0)
							
					End case 
					//}
				End if 
				
				If (True:C214)
					////  Handle event selection - Week View
					//{
					Case of 
						: ($_t_Type="Banner")
							$_l_EvtStartOrdDate:=Cal4D_Cal_DateToOrdinal(CAL_d_EvtStartDate)
							For ($_l_Index; 1; $_l_NumberOfRows)
								If (Find in array:C230(SD2_at_WkBnrNames; String:C10($_l_EvtStartOrdDate)+"_Evt_"+Cal_t_SelectedEventUID)>0)
									
									$_t_TmpID:=SD2_at_WKBnrRefs{Find in array:C230(SD2_at_WkBnrNames; String:C10($_l_EvtStartOrdDate)+"_Evt_"+Cal_t_SelectedEventUID)}
									SVG_SET_ATTRIBUTES($_t_TmpID; "fill"; $_t_RGBColor)
									SVG_SET_OPACITY($_t_TmpID; Cal4D_Cal_SetOpacity($_t_Type); 0)
								End if 
								$_l_EvtStartOrdDate:=$_l_EvtStartOrdDate+1
								
							End for 
							
						: ($_t_Type="All-day")
							If (Find in array:C230(SD2_at_WkBnrNames; "@_Evt_"+Cal_t_SelectedEventUID)>0)
								$_t_TmpID:=SD2_at_WKBnrRefs{Find in array:C230(SD2_at_WkBnrNames; "@_Evt_"+Cal_t_SelectedEventUID)}
								SVG_SET_ATTRIBUTES($_t_TmpID; "fill"; $_t_RGBColor)
								SVG_SET_OPACITY($_t_TmpID; Cal4D_Cal_SetOpacity($_t_Type); 0)
							End if 
						Else 
							If (Find in array:C230(SD2_at_WkEvtNames; "@_Evt_"+Cal_t_SelectedEventUID)>0)
								$_t_TmpID:=SD2_at_WkEvtRefs{Find in array:C230(SD2_at_WkEvtNames; "@_Evt_"+Cal_t_SelectedEventUID)}
								SVG_SET_ATTRIBUTES($_t_TmpID; "fill"; $_t_RGBColor)
								SVG_SET_OPACITY($_t_TmpID; 30; 0)
							End if 
					End case 
					//}
				End if 
				
				If (True:C214)
					////  Handle event selection - Day View
					//{
					Case of 
						: ($_t_Type="Banner")
							$_l_EvtStartOrdDate:=Cal4D_Cal_DateToOrdinal(CAL_d_EvtStartDate)
							For ($_l_Index; 1; $_l_NumberOfRows)
								$_l_EventRow:=Find in array:C230(CAL_at_DayBnrNames; String:C10($_l_EvtStartOrdDate)+"_Evt_"+Cal_t_SelectedEventUID)
								If ($_l_EventRow>0)
									$_t_TmpID:=CAL_at_DayBnrRefs{$_l_EventRow}
									SVG_SET_ATTRIBUTES($_t_TmpID; "fill"; $_t_RGBColor)
									SVG_SET_OPACITY($_t_TmpID; Cal4D_Cal_SetOpacity($_t_Type); 0)
								End if 
								$_l_EvtStartOrdDate:=$_l_EvtStartOrdDate+1
							End for 
							
						: ($_t_Type="All-day")
							If (Find in array:C230(CAL_at_DayBnrNames; "@_Evt_"+Cal_t_SelectedEventUID)>0)
								$_t_TmpID:=CAL_at_DayEvtRefs{Find in array:C230(CAL_at_DayBnrNames; "@_Evt_"+Cal_t_SelectedEventUID)}
								SVG_SET_ATTRIBUTES($_t_TmpID; "fill"; $_t_RGBColor)
								SVG_SET_OPACITY($_t_TmpID; 30; 0)
							End if 
							
						Else 
							If (Find in array:C230(CAL_at_DayEvtNames; "@_Evt_"+Cal_t_SelectedEventUID)>0)
								$_t_TmpID:=CAL_at_DayEvtRefs{Find in array:C230(CAL_at_DayEvtNames; "@_Evt_"+Cal_t_SelectedEventUID)}
								SVG_SET_ATTRIBUTES($_t_TmpID; "fill"; $_t_RGBColor)
								SVG_SET_OPACITY($_t_TmpID; 30; 0)
							End if 
					End case 
					//}
				End if 
				
				Cal4D_Cal_ClearSelectedEvent
				
				//===========================================
			Else 
				//===========================================
				$_t_RGBColor:=Cal4D_Cal_Cell_BG("Evt_Selected")
				
				If (True:C214)
					////  Handle event selection - Month View
					//{
					Case of 
						: ($_t_Type="Banner")
							For ($_l_Index; 1; $_l_NumberOfRows)
								If (Find in array:C230(SD2_at_Names; String:C10($_l_EvtStartOrdDate)+"_Evt_"+Cal_t_SelectedEventUID)>0)
									$_t_TmpID:=SD2_at_Refs{Find in array:C230(SD2_at_Names; String:C10($_l_EvtStartOrdDate)+"_Evt_"+Cal_t_SelectedEventUID)}
									SVG_SET_ATTRIBUTES($_t_TmpID; "fill"; $_t_RGBColor)
									SVG_SET_OPACITY($_t_TmpID; 100; 0)
									
									$_t_TmpID:=String:C10($_l_EvtStartOrdDate)+"_Txt_"+Cal_t_SelectedEventUID
									$_l_EventRow:=Find in array:C230(SD2_at_Names; $_t_TmpID)
									If ($_l_EventRow>0)
										$_t_TmpID:=SD2_at_Refs{$_l_EventRow}
										SVG_SET_ATTRIBUTES($_t_TmpID; "fill"; Cal4D_Util_RGBToRGBString(Cal4D_Cal_GetEventColor))
									End if 
								End if 
								$_l_EvtStartOrdDate:=$_l_EvtStartOrdDate+1
							End for 
							$_l_EvtStartOrdDate:=Cal4D_Cal_DateToOrdinal(CAL_d_EvtStartDate)
							
						: ($_t_Type="All-day")
							If (Find in array:C230(SD2_at_Names; String:C10($_l_EvtStartOrdDate)+"_Evt_"+Cal_t_SelectedEventUID)>0)
								$_t_TmpID:=SD2_at_Refs{Find in array:C230(SD2_at_Names; String:C10($_l_EvtStartOrdDate)+"_Evt_"+Cal_t_SelectedEventUID)}
								SVG_SET_ATTRIBUTES($_t_TmpID; "fill"; $_t_RGBColor)
								SVG_SET_OPACITY($_t_TmpID; 100; 0)
								
								$_t_TmpID:=String:C10($_l_EvtStartOrdDate)+"_Txt_"+Cal_t_SelectedEventUID
								$_l_Index:=Find in array:C230(SD2_at_Names; $_t_TmpID)
								If ($_l_Index>0)
									$_t_TmpID:=SD2_at_Refs{$_l_Index}
									SVG_SET_ATTRIBUTES($_t_TmpID; "fill"; Cal4D_Util_RGBToRGBString(Cal4D_Cal_GetEventColor))
								End if 
							End if 
						Else 
							$_l_Index:=Find in array:C230(SD2_at_Names; String:C10($_l_EvtStartOrdDate)+"_Evt_"+Cal_t_SelectedEventUID)
							If ($_l_Index>0)
								$_t_TmpID:=SD2_at_Refs{$_l_Index}
								SVG_SET_ATTRIBUTES($_t_TmpID; "fill"; $_t_RGBColor)
								SVG_SET_OPACITY($_t_TmpID; 100; 0)
								
							Else 
								////  Because all events are not necessarily displayed on the month calendar
								////  Check to see if it is in the week list
								////
								$_l_eventRow:=Find in array:C230(SD2_at_WkEvtNames; String:C10($_l_EvtStartOrdDate)+"_Evt_"+Cal_t_SelectedEventUID)
								If ($_l_eventRow>0)
									$_t_TmpID:=SD2_at_WkEvtRefs{$_l_eventRow}
									SVG_SET_ATTRIBUTES($_t_TmpID; "fill"; $_t_RGBColor)
									SVG_SET_OPACITY($_t_TmpID; 100; 0)
									
								End if 
								
							End if 
							
					End case 
					//}
				End if 
				
				If (True:C214)
					////  Handle event selection - Week View
					//{
					Case of 
						: ($_t_Type="Banner")
							For ($_l_Index; 1; $_l_NumberOfRows)
								$_l_eventRow:=Find in array:C230(SD2_at_WkBnrNames; String:C10($_l_EvtStartOrdDate)+"_Evt_"+Cal_t_SelectedEventUID)
								If ($_l_EventRow>0)
									$_t_TmpID:=SD2_at_WkBnrRefs{$_l_EventRow}
									SVG_SET_ATTRIBUTES($_t_TmpID; "fill"; $_t_RGBColor)
									SVG_SET_OPACITY($_t_TmpID; 100; 0)
									
									$_l_EventRow:=Find in array:C230(SD2_at_WkBnrNames; String:C10($_l_EvtStartOrdDate)+"_Txt_"+Cal_t_SelectedEventUID)
									If ($_l_EventRow>0)
										$_t_TmpID:=SD2_at_WkBnrRefs{$_l_EventRow}
										SVG_SET_ATTRIBUTES($_t_TmpID; "fill"; Cal4D_Util_RGBToRGBString(Cal4D_Cal_GetEventColor))
									End if 
								End if 
								$_l_EvtStartOrdDate:=$_l_EvtStartOrdDate+1
							End for 
							$_l_EvtStartOrdDate:=Cal4D_Cal_DateToOrdinal(CAL_d_EvtStartDate)
							
						: ($_t_Type="All-day")
							$_l_EventRow:=Find in array:C230(SD2_at_WkBnrNames; String:C10($_l_EvtStartOrdDate)+"_Evt_"+Cal_t_SelectedEventUID)
							If ($_l_EventRow>0)
								$_t_TmpID:=SD2_at_WkBnrRefs{$_l_EventRow}
								SVG_SET_ATTRIBUTES($_t_TmpID; "fill"; $_t_RGBColor)
								SVG_SET_OPACITY($_t_TmpID; 100; 0)
								
								$_l_EventRow:=Find in array:C230(SD2_at_WkBnrNames; String:C10($_l_EvtStartOrdDate)+"_Txt_"+Cal_t_SelectedEventUID)
								If ($_l_EventRow>0)
									$_t_TmpID:=SD2_at_WKBnrRefs{$_l_EventRow}
									SVG_SET_ATTRIBUTES($_t_TmpID; "fill"; Cal4D_Util_RGBToRGBString(Cal4D_Cal_GetEventColor))
								End if 
							End if 
							
						Else 
							$_l_EventRow:=Find in array:C230(SD2_at_WkEvtNames; "@_Evt_"+Cal_t_SelectedEventUID)
							If ($_l_EventRow>0)
								$_t_TmpID:=SD2_at_WkEvtRefs{$_l_EventRow}
								SVG_SET_ATTRIBUTES($_t_TmpID; "fill"; $_t_RGBColor)
								SVG_SET_OPACITY($_t_TmpID; 100; 0)
							End if 
							
					End case 
					//}
				End if 
				
				If (True:C214)
					////  Handle event selection - Day View
					//{
					Case of 
						: ($_t_Type="Banner")
							For ($_l_Index; 1; $_l_NumberOfRows)
								$_l_EventRow:=Find in array:C230(CAL_at_DayBnrNames; String:C10($_l_EvtStartOrdDate)+"_Evt_"+Cal_t_SelectedEventUID)
								If ($_l_EventRow>0)
									$_t_TmpID:=CAL_at_DayBnrRefs{$_l_EventRow}
									SVG_SET_ATTRIBUTES($_t_TmpID; "fill"; $_t_RGBColor)
									SVG_SET_OPACITY($_t_TmpID; 100; 0)
									
									$_l_EventRow:=Find in array:C230(CAL_at_DayBnrNames; String:C10($_l_EvtStartOrdDate)+"_Txt_"+Cal_t_SelectedEventUID)
									If ($_l_EventRow>0)
										$_t_TmpID:=CAL_at_DayBnrRefs{$_l_EventRow}
										SVG_SET_ATTRIBUTES($_t_TmpID; "fill"; Cal4D_Util_RGBToRGBString(Cal4D_Cal_GetEventColor))
									End if 
								End if 
								$_l_EvtStartOrdDate:=$_l_EvtStartOrdDate+1
							End for 
							
						: ($_t_Type="All-day")
							$_l_EventRow:=Find in array:C230(CAL_at_DayBnrNames; String:C10($_l_EvtStartOrdDate)+"_Evt_"+Cal_t_SelectedEventUID)
							If ($_l_EventRow>0)
								$_t_TmpID:=CAL_at_DayBnrRefs{$_l_EventRow}
								SVG_SET_ATTRIBUTES($_t_TmpID; "fill"; $_t_RGBColor)
								SVG_SET_OPACITY($_t_TmpID; 30; 0)
								
								$_l_EventRow:=Find in array:C230(CAL_at_DayBnrNames; String:C10($_l_EvtStartOrdDate)+"_Txt_"+Cal_t_SelectedEventUID)
								If ($_l_EventRow>0)
									$_t_TmpID:=CAL_at_DayBnrRefs{$_l_EventRow}
									SVG_SET_ATTRIBUTES($_t_TmpID; "fill"; Cal4D_Util_RGBToRGBString(Cal4D_Cal_GetEventColor))
								End if 
							End if 
							
						Else 
							$_l_EventRow:=Find in array:C230(CAL_at_DayEvtNames; String:C10($_l_EvtStartOrdDate)+"_Evt_"+Cal_t_SelectedEventUID)
							If ($_l_EventRow>0)
								$_t_TmpID:=CAL_at_DayEvtRefs{$_l_EventRow}
								SVG_SET_ATTRIBUTES($_t_TmpID; "fill"; $_t_RGBColor)
								SVG_SET_OPACITY($_t_TmpID; 30; 0)
							End if 
							
					End case 
					//}
				End if 
				
		End case 
		
		//========================    Clean up and Exit    =================================
		
		CAL_ptr_4DFullCalendar->:=SVG_Export_to_picture(CAL_t_SVGref)
		
		CAL_ptr_BannerWeek->:=SVG_Export_to_picture(Cal_t_WeekRef)
		CAL_ptr_4DCalendarWeek->:=SVG_Export_to_picture(SVG_t_Ref_Week)
		
		CAL_ptr_BannerDay->:=SVG_Export_to_picture(CAL_t_Banner_Ref_Day)
		CAL_Ptr_4DCalendarDay->:=SVG_Export_to_picture(SVG_t_Ref_Day)
	End if 
End if 
ERR_MethodTrackerReturn("Cal4D_Cal_SyncEventSelection"; $_t_oldMethodName)