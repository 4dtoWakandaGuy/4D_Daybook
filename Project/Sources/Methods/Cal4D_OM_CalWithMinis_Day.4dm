//%attributes = {}
If (False:C215)
	//Project Method Name:      Cal4D_OM_CalWithMinis_Day
	//------------------ Method Notes ------------------
	//*****************************************************************************
	////
	////  Cal4D_OM_CalWithMinis_Day
	////
	////  Written by Charles Vass - 06/30/2009, 14:44
	////
	////  Purpose:
	////
	////  $1 - type - purpose
	////
	////
	//*****************************************************************************
	//------------------ Revision Control ----------------
	//Date Created: 22/12/2009 15:34`Method: Cal4D_OM_CalWithMinis_Day
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(CAL_at_DayEvtNames;0)
	//ARRAY TEXT(CAL_at_DayEvtRefs;0)
	C_BOOLEAN:C305($_bo_ClickedOnEvt)
	C_DATE:C307($_d_Date)
	C_LONGINT:C283($_l_Bottom; $_l_ColWidth; $_l_FormEvent; $_l_Height; $_l_HrCol; $_l_MouseButton; $_l_MouseX; $_l_MouseY; $_l_ObjectLeft; $_l_ObjectRight; $_l_ObjectTop)
	C_LONGINT:C283($_l_Width; $1)
	C_POINTER:C301($_ptr_Self; $2; CAL_Ptr_4DCalendarDay; CAL_ptr_4DCalendarWeek; CAL_ptr_4DFullCalendar; CAL_ptr_BannerDay; CAL_ptr_BannerWeek)
	C_TEXT:C284($_t_CellID; $_t_ObjRef; $_t_oldMethodName; $_t_Ordinal; Cal_t_SelectedEventRef; Cal_t_SelectedEventUID)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cal4D_OM_CalWithMinis_Day")

$_l_FormEvent:=$1
$_ptr_Self:=$2

If (($_l_FormEvent=On Double Clicked:K2:5) | ($_l_FormEvent=On Clicked:K2:4))
	////  Get the ID to the object just clicked on
	//{
	$_t_ObjRef:=SVG Find element ID by coordinates:C1054($_ptr_Self->; MouseX; MouseY)
	//}
End if 

//===========================      Method Actions      ===========================
Case of 
	: ($_l_FormEvent=On Double Clicked:K2:5)
		If (($_t_ObjRef="@_Evt_@") | ($_t_ObjRef="@_Txt_@"))
			Cal4D_Event_Edit(Cal4D_Cal_GetSelectedEvent)
			
		Else 
			If (($_t_ObjRef="@_Text_Today") | ($_t_ObjRef="@_Text_Day"))
				$_t_ObjRef:=Replace string:C233($_t_ObjRef; "_Text_"; "_Cell_")
			End if 
			$_d_Date:=CAL4D_Cal_DateFromCellID($_t_ObjRef)
			Cal4D_Cal_SelectedDate($_d_Date)
			If (Month of:C24($_d_Date)=Month of:C24(Cal4D_Cal_SelectedDate))
				Cal4D_Event_Edit(New record:K29:1)
			End if 
		End if 
		//
		//--------------------------------------------------------------------------------
	: ($_l_FormEvent=On Clicked:K2:4)
		OBJECT GET COORDINATES:C663($_ptr_Self->; $_l_ObjectLeft; $_l_ObjectTop; $_l_ObjectRight; $_l_Bottom)
		GET MOUSE:C468($_l_MouseX; $_l_MouseY; $_l_MouseButton)
		If ($_l_MouseX<($_l_ObjectRight-16))  ////  The click was left of the scrollbar
			Cal4D_Cal_SyncEventSelection("Clear")
			
			If (($_t_ObjRef="@_Evt_@") | ($_t_ObjRef="@_Txt_@"))
				$_bo_ClickedOnEvt:=True:C214
				
				If ($_t_ObjRef="@_Evt_@")
					Cal_t_SelectedEventUID:=Substring:C12($_t_ObjRef; Position:C15("_Evt_"; $_t_ObjRef)+5)
				Else 
					Cal_t_SelectedEventUID:=Substring:C12($_t_ObjRef; Position:C15("_Txt_"; $_t_ObjRef)+5)
				End if 
				
				Cal_t_SelectedEventRef:=CAL_at_DayEvtRefs{Find in array:C230(CAL_at_DayEvtNames; "@_Evt_"+Cal_t_SelectedEventUID)}
				SVG_SET_ATTRIBUTES(Cal_t_SelectedEventRef; "fill"; Cal4D_Cal_Cell_BG("Evt_Selected"))
				SVG_SET_OPACITY(Cal_t_SelectedEventRef; 100; 0)
				
			End if 
			
			If (Cal4D_Cal_SelectedOrdDate>0)
				$_t_Ordinal:=String:C10(Cal4D_Cal_SelectedOrdDate)
				Cal4D_Cal_SetDayCell_BG($_t_Ordinal; "default")
				Cal4D_Cal_SetWeekdayCell_BG($_t_Ordinal; "default")
				Cal4D_Cal_SetFullCell_BG($_t_Ordinal; "default")
			End if 
			
			$_t_Ordinal:=Substring:C12($_t_ObjRef; 1; Position:C15("_"; $_t_ObjRef)-1)
			Cal4D_Cal_SelectedOrdDate(Num:C11($_t_Ordinal))
			Cal4D_Cal_SetWeekdayCell_BG($_t_Ordinal; "select")
			
			Cal4D_Cal_RecolorMinis
			Cal4D_Cal_SetFullCell_BG($_t_Ordinal; "select")
			
			////  Sync the week and month calendars
			//{
			Cal4D_Cal_GetWeekCalendar(CAL_ptr_4DCalendarWeek; CAL_ptr_BannerWeek)
			Cal4D_Cal_GetFullCalendar(CAL_ptr_4DFullCalendar)
			//}
			
			Cal4D_Cal_SyncEventSelection("Set")
			//}
		End if 
		//
		//--------------------------------------------------------------------------------
	: ($_l_FormEvent=On Resize:K2:27)
		Cal4D_Cal_GetDayCalendar(CAL_Ptr_4DCalendarDay; CAL_ptr_BannerDay)
		//--------------------------------------------------------------------------------
End case 

//===========================     Clean up and Exit      ===========================

//EOM
ERR_MethodTrackerReturn("Cal4D_OM_CalWithMinis_Day"; $_t_oldMethodName)