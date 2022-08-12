//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Cal4D_Cal_RecolorMinis
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/12/2009 10:45`Method: Cal4D_Cal_RecolorMinis
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY DATE:C224($_ad_Dates; 0)
	//ARRAY DATE(CAL_ad_DatesWithEvents;0)
	ARRAY LONGINT:C221($_al_Days; 0)
	ARRAY LONGINT:C221($_al_Ordinals; 0)
	ARRAY TEXT:C222($_at_Names; 0)
	ARRAY TEXT:C222($_at_Refs; 0)
	ARRAY TEXT:C222($_at_Types; 0)
	C_DATE:C307($_d_CurrentDate; $_d_Date; Cal_D_TopMiniDate)
	C_LONGINT:C283($_l_1stDayIndex; $_l_Cal4DNavBar; $_l_CountsEvents; $_l_CurrentMonth; $_l_DateRow; $_l_Days; $_l_Index; $_l_LastDayIndex; $_l_Month; $_l_MonthOfSelectedDate; $_l_PanelIndex)
	C_LONGINT:C283($_l_TodayRow; $_l_Week; $_l_Weeks)
	C_PICTURE:C286(Cal_pic_MiniMonth2; CAL_pic_MiniMonth3)
	C_POINTER:C301($_ptr_PictVar; Cal_ptr_MiniCalender1)
	C_TEXT:C284(<>CAL_t_CalWeekStart; $_t_CellID; $_t_CellTextID; $_t_CellTextRef; $_t_Day_Cell_Ref; $_t_MethodName; $_t_Mini_Ref; $_t_oldMethodName; $_t_TmpID; $_t_TmpRef; Cal_t_SVGRefMini1)
	C_TEXT:C284(Cal_t_SVGRefMini2; Cal_t_SVGRefMini3)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cal4D_Cal_RecolorMinis")

$_d_CurrentDate:=Current date:C33
$_l_CurrentMonth:=Month of:C24($_d_CurrentDate)
$_l_MonthOfSelectedDate:=Month of:C24(Cal4D_Cal_SelectedDate)

// //  Cycle through all three mini calendars
//{
For ($_l_PanelIndex; 1; 3)
	Case of 
		: ($_l_PanelIndex=1)
			$_ptr_PictVar:=Cal_ptr_MiniCalender1  //(->Mini_Month_1_G)
			$_t_Mini_Ref:=Cal_t_SVGRefMini1
			$_d_Date:=Cal_D_TopMiniDate
		: ($_l_PanelIndex=2)
			$_ptr_PictVar:=(->Cal_pic_MiniMonth2)
			$_t_Mini_Ref:=Cal_t_SVGRefMini2
			$_d_Date:=Add to date:C393(Cal_D_TopMiniDate; 0; 1; 0)
		: ($_l_PanelIndex=3)
			$_ptr_PictVar:=(->CAL_pic_MiniMonth3)
			$_t_Mini_Ref:=Cal_t_SVGRefMini3
			$_d_Date:=Add to date:C393(Cal_D_TopMiniDate; 0; 2; 0)
	End case 
	
	ARRAY DATE:C224(CAL_ad_DatesWithEvents; 0)
	Cal4D_Cal_DaysWithEvents($_d_Date; ->CAL_ad_DatesWithEvents)
	
	// //  Get the Refs, Types, and Names of all the cells in this Mini Calendar
	//{
	ARRAY TEXT:C222($_at_Refs; 0)
	ARRAY TEXT:C222($_at_Types; 0)
	ARRAY TEXT:C222($_at_Names; 0)
	SVG_ELEMENTS_TO_ARRAYS($_t_Mini_Ref; ->$_at_Refs; ->$_at_Types; ->$_at_Names)
	
	$_l_TodayRow:=Find in array:C230($_at_Names; "@_Text_Today_Mini")
	$_t_CellTextID:=""
	If ($_l_TodayRow>0)
		$_t_CellTextID:=$_at_Names{$_l_TodayRow}
		$_t_CellTextRef:=$_at_Refs{$_l_TodayRow}
	End if 
	
	$_l_CountsEvents:=Size of array:C274($_at_Refs)
	For ($_l_Index; $_l_CountsEvents; 1; -1)
		If ($_at_Types{$_l_Index}#"rect")
			DELETE FROM ARRAY:C228($_at_Refs; $_l_Index)
			DELETE FROM ARRAY:C228($_at_Types; $_l_Index)
			DELETE FROM ARRAY:C228($_at_Names; $_l_Index)
		End if 
	End for 
	$_l_CountsEvents:=Size of array:C274($_at_Refs)
	//}
	
	// //  Get the dates array for this mini calendar
	//{
	$_l_Month:=Month of:C24($_d_Date)
	$_l_Weeks:=Cal4D_Cal_WeeksToDisplay($_d_Date; <>CAL_t_CalWeekStart)
	If ($_l_Weeks<5)
		$_l_Weeks:=5
	End if 
	
	$_l_Days:=$_l_Weeks*7
	ARRAY LONGINT:C221($_al_Ordinals; $_l_Days)
	ARRAY LONGINT:C221($_al_Days; $_l_Days)
	ARRAY DATE:C224($_ad_Dates; $_l_Days)
	Cal4D_Cal_MonthOfDays($_d_Date; ->$_al_Ordinals; ->$_al_Days; ->$_ad_Dates; <>CAL_t_CalWeekStart)
	$_l_1stDayIndex:=Find in array:C230($_al_Days; 1)
	$_l_LastDayIndex:=Find in array:C230($_al_Days; Cal4D_Cal_DaysInMonth($_d_Date); 1+$_l_1stDayIndex)
	//}
	
	//========================    Method Actions    ==================================
	//Cal4D_NavBar_Tab
	$_l_Cal4DNavBar:=0
	Case of 
		: ($_l_Cal4DNavBar=2)
			// //  First return all backgounds to their natural states
			//{
			If ($_l_Month=$_l_MonthOfSelectedDate)
				// //  Colorize to match the current week
				//{
				For ($_l_Index; 1; $_l_CountsEvents)
					//$Ddx:=Find in array(CAL_ad_DatesWithEvents;$_ad_Dates{$_l_Index})
					If (($_l_Index<$_l_1stDayIndex) | ($_l_Index>$_l_LastDayIndex))
						SVG_SET_ATTRIBUTES($_at_Refs{$_l_Index}; "fill"; Cal4D_Cal_Cell_BG("Mini_OutMonth"))
						
					Else 
						Case of 
							: ($_ad_Dates{$_l_Index}=Cal4D_Cal_SelectedDate)
								SVG_SET_ATTRIBUTES($_at_Refs{$_l_Index}; "fill"; Cal4D_Cal_Cell_BG("Mini_Selected"))
								
							Else 
								If ($_ad_Dates{$_l_Index}=$_d_CurrentDate)
									If ($_l_Month=Month of:C24(Cal4D_Cal_SelectedDate))
										SVG_SET_ATTRIBUTES($_at_Refs{$_l_Index}; "fill"; Cal4D_Cal_Cell_BG("Mini_Today"))
									Else 
										SVG_SET_ATTRIBUTES($_at_Refs{$_l_Index}; "fill"; Cal4D_Cal_Cell_BG("Mini_OutMonth"))
									End if 
								Else 
									SVG_SET_ATTRIBUTES($_at_Refs{$_l_Index}; "fill"; Cal4D_Cal_Cell_BG("Mini_OutMonth"))
								End if 
								
						End case 
						
					End if 
					
				End for 
				//}
			Else 
				For ($_l_Index; 1; $_l_CountsEvents)
					If (($_l_Index<$_l_1stDayIndex) | ($_l_Index>$_l_LastDayIndex))
						SVG_SET_ATTRIBUTES($_at_Refs{$_l_Index}; "fill"; Cal4D_Cal_Cell_BG("Mini_OutMonth"))
						
					Else 
						If ($_ad_Dates{$_l_Index}=$_d_CurrentDate)  // & ($_l_Month=Month of($_ad_Dates{$_l_Index})))
							SVG_SET_ATTRIBUTES($_at_Refs{$_l_Index}; "fill"; Cal4D_Cal_Cell_BG("Mini_Today"))
						Else 
							If ($_l_Week=Cal_ISOWeekNumber($_ad_Dates{$_l_Index}))
								SVG_SET_ATTRIBUTES($_at_Refs{$_l_Index}; "fill"; Cal4D_Cal_Cell_BG("Mini_ThisMonth"))
							Else 
								SVG_SET_ATTRIBUTES($_at_Refs{$_l_Index}; "fill"; Cal4D_Cal_Cell_BG("Mini_OutMonth"))
							End if 
						End if 
						
					End if 
					
				End for 
				
			End if 
			//}
			
		: ($_l_Cal4DNavBar=3)
			$_l_Week:=Cal_ISOWeekNumber(Cal4D_Cal_SelectedDate)
			
			// //  First return all backgounds to their natural states
			//{
			If ($_l_Month=$_l_MonthOfSelectedDate)
				// //  Colorize to match the current week
				//{
				For ($_l_Index; 1; $_l_CountsEvents)
					//$Ddx:=Find in array(CAL_ad_DatesWithEvents;$_ad_Dates{$_l_Index})
					If (($_l_Index<$_l_1stDayIndex) | ($_l_Index>$_l_LastDayIndex))
						SVG_SET_ATTRIBUTES($_at_Refs{$_l_Index}; "fill"; Cal4D_Cal_Cell_BG("Mini_OutMonth"))
						
					Else 
						Case of 
							: (($_l_Week=Cal_ISOWeekNumber($_ad_Dates{$_l_Index})) & ($_l_Month=Month of:C24($_ad_Dates{$_l_Index})))
								Case of 
									: ($_ad_Dates{$_l_Index}=Cal4D_Cal_SelectedDate)
										SVG_SET_ATTRIBUTES($_at_Refs{$_l_Index}; "fill"; Cal4D_Cal_Cell_BG("Mini_Selected"))
									: ($_ad_Dates{$_l_Index}=$_d_CurrentDate)
										SVG_SET_ATTRIBUTES($_at_Refs{$_l_Index}; "fill"; Cal4D_Cal_Cell_BG("Mini_Today"))
									Else 
										SVG_SET_ATTRIBUTES($_at_Refs{$_l_Index}; "fill"; Cal4D_Cal_Cell_BG("Mini_ThisMonth"))
								End case 
								
							Else 
								If ($_ad_Dates{$_l_Index}=$_d_CurrentDate)
									If ($_l_Month=Month of:C24(Cal4D_Cal_SelectedDate))
										SVG_SET_ATTRIBUTES($_at_Refs{$_l_Index}; "fill"; Cal4D_Cal_Cell_BG("Mini_Today"))
									Else 
										SVG_SET_ATTRIBUTES($_at_Refs{$_l_Index}; "fill"; Cal4D_Cal_Cell_BG("Mini_OutMonth"))
									End if 
								Else 
									SVG_SET_ATTRIBUTES($_at_Refs{$_l_Index}; "fill"; Cal4D_Cal_Cell_BG("Mini_OutMonth"))
								End if 
								
						End case 
						
					End if 
					
				End for 
				//}
			Else 
				For ($_l_Index; 1; $_l_CountsEvents)
					If (($_l_Index<$_l_1stDayIndex) | ($_l_Index>$_l_LastDayIndex))
						SVG_SET_ATTRIBUTES($_at_Refs{$_l_Index}; "fill"; Cal4D_Cal_Cell_BG("Mini_OutMonth"))
						
					Else 
						If ($_ad_Dates{$_l_Index}=$_d_CurrentDate)  // & ($_l_Month=Month of($_ad_Dates{$_l_Index})))
							SVG_SET_ATTRIBUTES($_at_Refs{$_l_Index}; "fill"; Cal4D_Cal_Cell_BG("Mini_Today"))
						Else 
							If ($_l_Week=Cal_ISOWeekNumber($_ad_Dates{$_l_Index}))
								SVG_SET_ATTRIBUTES($_at_Refs{$_l_Index}; "fill"; Cal4D_Cal_Cell_BG("Mini_ThisMonth"))
							Else 
								SVG_SET_ATTRIBUTES($_at_Refs{$_l_Index}; "fill"; Cal4D_Cal_Cell_BG("Mini_OutMonth"))
							End if 
						End if 
						
					End if 
					
				End for 
				
			End if 
			//}
			
		: ($_l_Cal4DNavBar=4)
			// //  Colorize the backgrounds
			//{
			If ($_l_Month=$_l_MonthOfSelectedDate)
				// //  Colorize to match the current month
				//{
				For ($_l_Index; 1; $_l_CountsEvents)
					$_l_DateRow:=Find in array:C230(CAL_ad_DatesWithEvents; $_ad_Dates{$_l_Index})
					Case of 
						: ($_l_Month=Month of:C24($_ad_Dates{$_l_Index}))
							Case of 
								: ($_ad_Dates{$_l_Index}=Cal4D_Cal_SelectedDate)
									SVG_SET_ATTRIBUTES($_at_Refs{$_l_Index}; "fill"; Cal4D_Cal_Cell_BG("Mini_Selected"))
								: ($_ad_Dates{$_l_Index}=Current date:C33)
									SVG_SET_ATTRIBUTES($_at_Refs{$_l_Index}; "fill"; Cal4D_Cal_Cell_BG("Mini_Today"))
								Else 
									SVG_SET_ATTRIBUTES($_at_Refs{$_l_Index}; "fill"; Cal4D_Cal_Cell_BG("Mini_ThisMonth"))
							End case 
							
						Else 
							SVG_SET_ATTRIBUTES($_at_Refs{$_l_Index}; "fill"; Cal4D_Cal_Cell_BG("Mini_OutMonth"))
							
					End case 
				End for 
				//}
				
			Else 
				// //  Colorize of the out months
				//{
				$_l_TodayRow:=0  //Find in array($_at_Names;"@_Today_@")
				If ($_l_TodayRow>0)
					$_at_Names{$_l_TodayRow}:=Replace string:C233($_at_Names{$_l_TodayRow}; "_Today_"; "_Day_")
					$_t_TmpID:=$_at_Names{$_l_TodayRow}
					SVG_SET_ID($_at_Refs{$_l_TodayRow}; $_at_Names{$_l_TodayRow})
					
					If ($_t_CellTextID#"")
						$_d_Date:=CAL4D_Cal_DateFromCellID($_t_TmpID)
						$_l_DateRow:=Find in array:C230(CAL_ad_DatesWithEvents; $_d_Date)
						
						$_t_TmpID:=Replace string:C233($_t_TmpID; "_Cell_"; "_Text_")
						SVG_SET_ID($_t_CellTextRef; $_t_TmpID)
						SVG_SET_FONT_COLOR($_t_CellTextRef; "black")
						If ($_l_DateRow>0)
							SVG_SET_FONT_STYLE($_t_CellTextRef; Plain:K14:1)
							SVG_SET_FONT_STYLE($_t_CellTextRef; Underline:K14:4)
						Else 
							SVG_SET_FONT_STYLE($_t_CellTextRef; Plain:K14:1)
						End if 
					End if 
				End if 
				
				For ($_l_Index; 1; $_l_CountsEvents)
					If ($_at_Names{$_l_Index}="@_Today_@")
						//SVG_SET_ATTRIBUTES ($_at_Refs{$_l_Index};"fill";Cal4D_Cal_Cell_BG ("Mini_OutMonth"))
						//SVG_SET_FONT_COLOR ($_t_CellTextRef;"black")
					Else 
						SVG_SET_ATTRIBUTES($_at_Refs{$_l_Index}; "fill"; Cal4D_Cal_Cell_BG("Mini_OutMonth"))
					End if 
				End for 
				//}
			End if 
			//}
			
	End case 
	
	//SVG_ELEMENTS_TO_ARRAYS ($_t_Mini_Ref;->$_at_Refs;->$_at_Types;->$_at_Names)
	
	// //  Tranlate the SVG object to the Picture variable
	//{
	$_ptr_PictVar->:=SVG_Export_to_picture($_t_Mini_Ref)
	//}
End for 
//}

//========================    Clean up and Exit    =================================
ERR_MethodTrackerReturn("Cal4D_Cal_RecolorMinis"; $_t_oldMethodName)