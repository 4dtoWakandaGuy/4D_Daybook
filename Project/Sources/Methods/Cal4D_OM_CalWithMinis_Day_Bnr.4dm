//%attributes = {}
If (False:C215)
	//Project Method Name:      Cal4D_OM_CalWithMinis_Day_Bnr
	//------------------ Method Notes ------------------
	//*****************************************************************************
	////
	////  Cal4D_OM_CalWithMinis_Day_Bnr
	////
	////  Written by Charles Vass - 07/07/2009, 12:16
	////
	////  Purpose:
	////
	////  $1 - type - purpose
	////
	////
	//*****************************************************************************
	
	//------------------ Revision Control ----------------
	//Date Created: 22/12/2009 15:34`Method: Cal4D_OM_CalWithMinis_Day_Bnr
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(CAL_al_WeekOrdinals;0)
	//ARRAY TEXT(CAL_at_DayBnrNames;0)
	//ARRAY TEXT(CAL_at_DayBnrRefs;0)
	C_BOOLEAN:C305($_bo_ClickedOnEvt)
	C_DATE:C307(CAL_d_EvtEndDate; CAL_d_EvtStartDate)
	C_LONGINT:C283($_l_BannerRow; $_l_BannerRow2; $_l_Bottom; $_l_DateSpanDays; $_l_EvtEndOrdDate; $_l_EvtStartOrdDate; $_l_FormEvent; $_l_MouseButton; $_l_MouseX; $_l_MouseY; $_l_ObjectLeft)
	C_LONGINT:C283($_l_ObjectRight; $_l_ObjectTop; $1)
	C_POINTER:C301($_ptr_Self; $2; CAL_Ptr_4DCalendarDay; CAL_ptr_BannerDay)
	C_TEXT:C284($_t_ObjRef; $_t_oldMethodName; $_t_Ordinal; $_t_SelectedEventRef; $_t_TmpID; $_t_Type; CAL_t_Banner_Ref_Day; Cal_t_SelectedEventRef; Cal_t_SelectedEventUID; SVG_t_Ref_Day)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cal4D_OM_CalWithMinis_Day_Bnr")
$_l_FormEvent:=$1
$_ptr_Self:=$2

If (($_l_FormEvent=On Double Clicked:K2:5) | ($_l_FormEvent=On Clicked:K2:4))
	////  Get the ID to the object just clicked on
	//{
	$_t_ObjRef:=SVG Find element ID by coordinates:C1054($_ptr_Self->; MouseX; MouseY)
	//}
End if 

//========================    Method Actions    ==================================

Case of 
	: ($_l_FormEvent=On Double Clicked:K2:5)
		If ($_t_ObjRef="@_Evt_@")
			Cal4D_Event_Edit(Cal4D_Cal_GetSelectedEvent)
			
		Else 
			
		End if 
		//
		//--------------------------------------------------------------------------------
	: ($_l_FormEvent=On Clicked:K2:4)
		OBJECT GET COORDINATES:C663($_ptr_Self->; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_Bottom)
		GET MOUSE:C468($_l_MouseX; $_l_MouseY; $_l_MouseButton)
		If ($_l_MouseX<($_l_ObjectRight-2))
			Cal4D_Cal_SyncEventSelection("Clear")
			
			If ($_t_ObjRef="@_Evt_@")
				$_bo_ClickedOnEvt:=True:C214
				$_t_SelectedEventRef:=$_t_ObjRef
				Cal_t_SelectedEventUID:=Substring:C12($_t_ObjRef; Position:C15("_Evt_"; $_t_ObjRef)+5)
				$_l_BannerRow:=Find in array:C230(CAL_at_DayBnrNames; $_t_ObjRef)
				Cal_t_SelectedEventRef:=CAL_at_DayBnrRefs{$_l_BannerRow}
				
				$_t_Type:=Cal4D_Cal_GetEventType
				If ($_t_Type="Banner")
					Cal4D_Cal_GetEventDates
					$_l_EvtStartOrdDate:=Cal4D_Cal_DateToOrdinal(CAL_d_EvtStartDate)
					$_l_EvtEndOrdDate:=Cal4D_Cal_DateToOrdinal(CAL_d_EvtEndDate)
					$_l_DateSpanDays:=($_l_EvtEndOrdDate-$_l_EvtStartOrdDate)+1
					For ($_l_BannerRow; 1; $_l_DateSpanDays)
						$_l_BannerRow2:=Find in array:C230(CAL_at_DayBnrNames; String:C10($_l_EvtStartOrdDate)+"_Evt_"+Cal_t_SelectedEventUID)
						If ($_l_BannerRow2>0)
							$_t_TmpID:=CAL_at_DayBnrRefs{$_l_BannerRow2}
							SVG_SET_ATTRIBUTES($_t_TmpID; "fill"; Cal4D_Cal_Cell_BG("Evt_Selected"))
							SVG_SET_OPACITY($_t_TmpID; 100; 0)
						End if 
						$_l_EvtStartOrdDate:=$_l_EvtStartOrdDate+1
					End for 
					
				Else 
					
				End if 
				
				CAL_ptr_BannerDay->:=SVG_Export_to_picture(CAL_t_Banner_Ref_Day)
				
			Else 
				$_l_BannerRow:=Num:C11(Substring:C12($_t_ObjRef; Position:C15("_"; $_t_ObjRef)+1))
				
				If (Cal4D_Cal_SelectedOrdDate>0)
					$_t_Ordinal:=String:C10(Cal4D_Cal_SelectedOrdDate)
					Cal4D_Cal_SetWeekdayCell_BG($_t_Ordinal; "default")
					Cal4D_Cal_SetFullCell_BG($_t_Ordinal; "default")
				End if 
				
				$_t_Ordinal:=String:C10(CAL_al_WeekOrdinals{$_l_BannerRow})
				Cal4D_Cal_SelectedOrdDate(CAL_al_WeekOrdinals{$_l_BannerRow})
				Cal4D_Cal_SetWeekdayCell_BG($_t_Ordinal; "select")
				
				CAL_Ptr_4DCalendarDay->:=SVG_Export_to_picture(SVG_t_Ref_Day)
				
				Cal4D_Cal_RecolorMinis
				Cal4D_Cal_SetFullCell_BG($_t_Ordinal; "select")
				
			End if 
		End if 
		//
		//--------------------------------------------------------------------------------
End case 

//========================    Clean up and Exit    =================================
ERR_MethodTrackerReturn("Cal4D_OM_CalWithMinis_Day_Bnr"; $_t_oldMethodName)