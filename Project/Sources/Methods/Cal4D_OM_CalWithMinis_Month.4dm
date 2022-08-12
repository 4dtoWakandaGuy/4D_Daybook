//%attributes = {}
If (False:C215)
	//Project Method Name:      Cal4D_OM_CalWithMinis_Month
	//------------------ Method Notes ------------------
	//*****************************************************************************
	// //
	// //  Cal4D_OM_CalWithMinis_Month
	// //
	// //  Written by Charles Vass - 03/02/2009, 07:20
	// //
	// //  Purpose:
	// //
	// //  $1 - type - purpose
	// //
	// //
	//*****************************************************************************
	//------------------ Revision Control ----------------
	//Date Created: 22/12/2009 15:32`Method: Cal4D_OM_CalWithMinis_Month
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(SD2_at_Names;0)
	C_BOOLEAN:C305($_bo_ClickedOnEvt)
	C_DATE:C307($_d_Date; Cal_D_TopMiniDate)
	C_LONGINT:C283($_l_Bottom; $_l_CellRow; $_l_EvtEndOrdDate; $_l_EvtStartOrdDate; $_l_FormEvent; $_l_Month; $_l_ObjectLeft; $_l_ObjectRight; $_l_ObjectTop; $2)
	C_PICTURE:C286(Cal_pic_MiniMonth2; CAL_pic_MiniMonth3)
	C_POINTER:C301($_ptr_Self; $1; Cal_ptr_MiniCalender1)
	C_TEXT:C284($_t_Day_Cell_Ref; $_t_Day_Cell_Sym; $_t_Day_Rect_Ref; $_t_Mini_Ref; $_t_oldMethodName; $_t_RefID; $_t_RGBColor; $_t_TmpID; $_t_Type; $Cal_t_SelectedEventRef; Cal_t_SelectedCellRef)
	C_TEXT:C284(Cal_t_SelectedEventRef; Cal_t_SelectedEventUID; Cal_t_SelectedMiniCellRef; CAL_t_SVGref; Cal_t_SVGRefMini1; Cal_t_SVGRefMini2; Cal_t_SVGRefMini3)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cal4D_OM_CalWithMinis_Month")

$_ptr_Self:=$1
$_l_FormEvent:=$2
$_bo_ClickedOnEvt:=False:C215

// //  Get the ID to the object just clicked on
//{
$_t_RefID:=SVG Find element ID by coordinates:C1054($_ptr_Self->; MouseX; MouseY)
//}

//========================    Method Actions    ==================================

Case of 
	: ($_l_FormEvent=On Mouse Move:K2:35)
		// //  Set cursor feedback
		//{
		Case of 
				//……………………………………………………………
			: (($_t_RefID="@_Day") | ($_t_RefID="@_Today") | ($_t_RefID="@_Evt_@") | ($_t_RefID="@_Txt_@"))
				SET CURSOR:C469(9000)  //Within the month
				//……………………………………………………………
			Else 
				SET CURSOR:C469  //outside the month
				//……………………………………………………………
		End case 
		//}
		
	: ($_l_FormEvent=On Double Clicked:K2:5)
		If ($_t_RefID#"")
			If (($_t_RefID="@_Evt_@") | ($_t_RefID="@_Txt_@"))
				Cal4D_Event_Edit(Cal4D_Cal_GetSelectedEvent)
				
			Else 
				If (($_t_RefID="@_Text_Today") | ($_t_RefID="@_Text_Day"))
					$_t_RefID:=Replace string:C233($_t_RefID; "_Text_"; "_Cell_")
				End if 
				$_d_Date:=CAL4D_Cal_DateFromCellID($_t_RefID)
				Cal4D_Cal_SelectedDate($_d_Date)
				If (Month of:C24($_d_Date)=Month of:C24(Cal4D_Cal_SelectedDate))
					Cal4D_Event_Edit(New record:K29:1)
				End if 
			End if 
		End if 
	: ($_l_FormEvent=On Clicked:K2:4)
		If ($_t_RefID#"")
			$_bo_ClickedOnEvt:=True:C214
			
			// //  Clear any previously selected event
			//{
			Cal4D_Cal_SyncEventSelection("Clear")
			//}
			
			Case of 
				: (($_t_RefID="@_Text_Today") | ($_t_RefID="@_Text_Day"))
					$_t_RefID:=Replace string:C233($_t_RefID; "_Text_"; "_Cell_")
					
				: (($_t_RefID="@_Evt_@") | ($_t_RefID="@_Txt_@"))
					$_bo_ClickedOnEvt:=True:C214
					$Cal_t_SelectedEventRef:=$_t_RefID
					
					If ($_t_RefID="@_Evt_@")
						Cal_t_SelectedEventUID:=Substring:C12($_t_RefID; Position:C15("_Evt_"; $_t_RefID)+5)
					Else 
						Cal_t_SelectedEventUID:=Substring:C12($_t_RefID; Position:C15("_Txt_"; $_t_RefID)+5)
						$Cal_t_SelectedEventRef:=Replace string:C233($Cal_t_SelectedEventRef; "_Txt_"; "_Evt_")
					End if 
					
					$_t_RefID:=Substring:C12($_t_RefID; 1; Position:C15("_"; $_t_RefID))
					$_l_CellRow:=Find in array:C230(SD2_at_Names; $_t_RefID+"Cell_@")
					$_t_RefID:=SD2_at_Names{$_l_CellRow}
					
					$_l_CellRow:=Find in array:C230(SD2_at_Names; $Cal_t_SelectedEventRef)
					Cal_t_SelectedEventRef:=SD2_at_Names{$_l_CellRow}
					
				: ($_t_RefID="@_NoEvt_@")
					Cal4D_Cal_ClearSelectedEvent
					$_bo_ClickedOnEvt:=False:C215
					
			End case 
			//}
			
			If ($_bo_ClickedOnEvt)
				$_t_Day_Cell_Ref:=SVG_Find_ID(CAL_t_SVGref; $_t_RefID)
				$_d_Date:=CAL4D_Cal_DateFromCellID($_t_RefID)
				Cal4D_Cal_SelectedDate($_d_Date)
				
				// //  Is the click on a non selected cell or Event?
				//{
				If (($_t_Day_Cell_Ref#Cal_t_SelectedCellRef))  //| $_bo_ClickedOnEvt)
					// //  Return the old selected Mini cell to it's original color
					//{
					If (Cal_t_SelectedMiniCellRef#"")
						$_t_TmpID:=SVG_Get_ID(Cal_t_SelectedMiniCellRef)
						$_t_Mini_Ref:=DOM Get parent XML element:C923(Cal_t_SelectedMiniCellRef)
						Case of 
							: ($_t_Mini_Ref=Cal_t_SVGRefMini1)
								Cal4D_Cal_SetMiniCell_BG(Cal_D_TopMiniDate; $_t_TmpID)
								
							: ($_t_Mini_Ref=Cal_t_SVGRefMini2)
								Cal4D_Cal_SetMiniCell_BG(Add to date:C393(Cal_D_TopMiniDate; 0; 1; 0); $_t_TmpID)
								
							: ($_t_Mini_Ref=Cal_t_SVGRefMini3)
								Cal4D_Cal_SetMiniCell_BG(Add to date:C393(Cal_D_TopMiniDate; 0; 2; 0); $_t_TmpID)
								
							Else 
								
						End case 
					End if 
					//}
					
					// //  Return the old selected cell to it's original color
					//{
					If (Cal_t_SelectedCellRef#"")
						$_t_TmpID:=SVG_Get_ID(Cal_t_SelectedCellRef)
						Case of 
							: (($_t_RefID="@_Text_Today") | ($_t_RefID="@_Text_Day"))
								$_t_TmpID:=Replace string:C233($_t_TmpID; "_Text_"; "_Cell_")
						End case 
						
						$_t_Day_Cell_Ref:=SVG_Find_ID(CAL_t_SVGref; $_t_TmpID)
						Case of 
							: ($_t_TmpID="@_Cell_Today")
								SVG_SET_ATTRIBUTES($_t_Day_Cell_Ref; "fill"; Cal4D_Cal_Cell_BG("Main_Today"))
							: ($_t_TmpID="@_Cell_Day")
								SVG_SET_ATTRIBUTES($_t_Day_Cell_Ref; "fill"; Cal4D_Cal_Cell_BG("Main_Day"))
						End case 
					End if 
					//}
					
					// //  Make sure we're working with the rect and not the text
					//{
					Case of 
						: (($_t_RefID="@_Text_Today") | ($_t_RefID="@_Text_Day"))
							$_t_RefID:=Replace string:C233($_t_RefID; "_Text_"; "_Cell_")
					End case 
					//}
					
					// //  Set the background color of the selected cell & refresh the picture
					//{
					Cal_t_SelectedCellRef:=SVG_Find_ID(CAL_t_SVGref; $_t_RefID)
					SVG_SET_ATTRIBUTES(Cal_t_SelectedCellRef; "fill"; Cal4D_Cal_Cell_BG("Main_Selected"))
					
					//}
					
					// //  Set the highlight color of the mini calendar
					//{
					$_t_RefID:=$_t_RefID+"_Mini"
					$_l_Month:=Month of:C24(Cal4D_Cal_SelectedDate)
					If (False:C215)
						Case of 
							: ($_l_Month=Month of:C24(Cal_D_TopMiniDate))
								Cal_t_SelectedMiniCellRef:=SVG_Find_ID(Cal_t_SVGRefMini1; $_t_RefID)
								SVG_SET_ATTRIBUTES(Cal_t_SelectedMiniCellRef; "fill"; Cal4D_Cal_Cell_BG("Mini_Selected"))
								Cal_ptr_MiniCalender1->:=SVG_Export_to_picture(Cal_t_SVGRefMini1)
								
							: ($_l_Month=Month of:C24(Add to date:C393(Cal_D_TopMiniDate; 0; 1; 0)))
								Cal_t_SelectedMiniCellRef:=SVG_Find_ID(Cal_t_SVGRefMini2; $_t_RefID)
								SVG_SET_ATTRIBUTES(Cal_t_SelectedMiniCellRef; "fill"; Cal4D_Cal_Cell_BG("Mini_Selected"))
								Cal_pic_MiniMonth2:=SVG_Export_to_picture(Cal_t_SVGRefMini2)
								
							: ($_l_Month=Month of:C24(Add to date:C393(Cal_D_TopMiniDate; 0; 2; 0)))
								Cal_t_SelectedMiniCellRef:=SVG_Find_ID(Cal_t_SVGRefMini3; $_t_RefID)
								SVG_SET_ATTRIBUTES(Cal_t_SelectedMiniCellRef; "fill"; Cal4D_Cal_Cell_BG("Mini_Selected"))
								CAL_pic_MiniMonth3:=SVG_Export_to_picture(Cal_t_SVGRefMini3)
								
							Else 
						End case 
					End if 
					
					// //  Sync the week and day calendars
					//{
					//Cal4D_Cal_GetWeekCalendar (CAL_ptr_4DCalendarWeek;CAL_ptr_BannerWeek)
					//Cal4D_Cal_GetDayCalendar (CAL_Ptr_4DCalendarDay;CAL_ptr_BannerDay)
					//}
					
					Cal4D_Cal_SyncEventSelection("Set")
					$_ptr_Self->:=SVG_Export_to_picture(CAL_t_SVGref)
					//}
				End if 
				//}
				//--------------------------------------------------------------------------------
			End if 
		End if 
End case 

//========================    Clean up and Exit    =================================
ERR_MethodTrackerReturn("Cal4D_OM_CalWithMinis_Month"; $_t_oldMethodName)