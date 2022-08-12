//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Cal4D_OM_DateWidget
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/12/2009 16:09
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY DATE:C224($_ad_CalendarDates; 0)
	ARRAY LONGINT:C221($_al_Ordinals; 0)
	ARRAY TEXT:C222($_at_NamesArray; 0)
	ARRAY TEXT:C222($_at_ValuesArray; 0)
	C_DATE:C307($_d_DTPDate; $_d_Today; $Cal_d_tempDate; DTP_d_Date)
	C_LONGINT:C283($_l_FormEvent; $_l_Month; $_l_MonthNameIndex; $_l_MonthofDate; $_l_PopupSelected; $_l_YearofDate; $2)
	C_PICTURE:C286(Cal4D_pic_DateWiget)
	C_POINTER:C301($_ptr_Self; $1)
	C_TEXT:C284($_t_CellID; $_t_DateString; $_t_Day_Cell_Ref; $_t_MenuValues; $_t_MethodName; $_t_Mini_Ref; $_t_oldMethodName; $_t_TmpID; $_t_TmpRef; Cal4D_t_MouseOverSVGref; SVG_t_XMLDateWigetRef)
	C_TEXT:C284(SVG_t_XMLFooterObj)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cal4D_OM_DateWidget")


$_ptr_Self:=$1
$_l_FormEvent:=$2
$_t_CellID:=SVG Find element ID by coordinates:C1054($_ptr_Self->; MouseX; MouseY)
If ($_t_CellID#"")
	
	//========================    Method Actions    ==================================
	Case of 
		: ($_l_FormEvent=On Clicked:K2:4)
			$_t_MenuValues:=""
			Case of 
				: (MouseY<41)
					Case of 
						: ($_t_CellID="Prev_Yr")
							DTP_d_Date:=Add to date:C393(DTP_d_Date; -1; 0; 0)
							$_l_MonthNameIndex:=1
							
						: ($_t_CellID="Prev_Mo")
							DTP_d_Date:=Add to date:C393(DTP_d_Date; 0; -1; 0)
							$_l_MonthNameIndex:=1
							
						: ($_t_CellID="Next_Mo")
							DTP_d_Date:=Add to date:C393(DTP_d_Date; 0; 1; 0)
							$_l_MonthNameIndex:=1
							
						: ($_t_CellID="Next_Yr")
							DTP_d_Date:=Add to date:C393(DTP_d_Date; 1; 0; 0)
							$_l_MonthNameIndex:=1
							
						: ($_t_CellID="Prev_Yrs")
							$_l_YearofDate:=Year of:C25(DTP_d_Date)
							For ($_l_MonthNameIndex; 1; 12)
								$_t_MenuValues:=$_t_MenuValues+String:C10($_l_YearofDate-$_l_MonthNameIndex)+Choose:C955($_l_MonthNameIndex<12; ";"; "")
							End for 
							$_l_PopupSelected:=Pop up menu:C542($_t_MenuValues)
							If ($_l_PopupSelected>0)
								DTP_d_Date:=Add to date:C393(DTP_d_Date; -$_l_PopupSelected; 0; 0)
							End if 
							
						: ($_t_CellID="Prev_Mos")
							For ($_l_MonthNameIndex; 1; 12)
								$_t_MenuValues:=$_t_MenuValues+Get indexed string:C510(14002; $_l_MonthNameIndex)+Choose:C955($_l_MonthNameIndex<12; ";"; "")
							End for 
							$_l_PopupSelected:=Pop up menu:C542($_t_MenuValues; Month of:C24(DTP_d_Date))
							If ($_l_PopupSelected>0)
								$_l_MonthofDate:=Month of:C24(DTP_d_Date)
								If ($_l_PopupSelected>$_l_MonthofDate)
									$_l_PopupSelected:=$_l_PopupSelected-12
								End if 
								$_l_MonthofDate:=$_l_PopupSelected-$_l_MonthofDate
								DTP_d_Date:=Add to date:C393(DTP_d_Date; 0; $_l_MonthofDate; 0)
							End if 
							
						: ($_t_CellID="Next_Mos")
							For ($_l_MonthNameIndex; 1; 12)
								$_t_MenuValues:=$_t_MenuValues+Get indexed string:C510(14002; $_l_MonthNameIndex)+Choose:C955($_l_MonthNameIndex<12; ";"; "")
							End for 
							$_l_PopupSelected:=Pop up menu:C542($_t_MenuValues; Month of:C24(DTP_d_Date))
							If ($_l_PopupSelected>0)
								$_l_MonthofDate:=Month of:C24(DTP_d_Date)
								If ($_l_PopupSelected<$_l_MonthofDate)
									$_l_PopupSelected:=$_l_PopupSelected+12
								End if 
								$_l_MonthofDate:=$_l_PopupSelected-$_l_MonthofDate
								DTP_d_Date:=Add to date:C393(DTP_d_Date; 0; $_l_MonthofDate; 0)
							End if 
							
						: ($_t_CellID="Next_Yrs")
							$_l_YearofDate:=Year of:C25(DTP_d_Date)
							For ($_l_MonthNameIndex; 1; 12)
								$_t_MenuValues:=$_t_MenuValues+String:C10($_l_YearofDate+$_l_MonthNameIndex)+Choose:C955($_l_MonthNameIndex<12; ";"; "")
							End for 
							$_l_MonthNameIndex:=Pop up menu:C542($_t_MenuValues)
							If ($_l_MonthNameIndex>0)
								DTP_d_Date:=Add to date:C393(DTP_d_Date; $_l_MonthNameIndex; 0; 0)
							End if 
							
						: ($_t_CellID="Today")
							DTP_d_Date:=Current date:C33
							$_l_MonthNameIndex:=1
							
					End case 
					
					If ($_l_MonthNameIndex#0)
						Cal4D_t_MouseOverSVGref:=""
						Cal4D_Cal_GetDateWidget(->Cal4D_pic_DateWiget; DTP_d_Date)
					End if 
					
				Else 
					If (MouseX>24)
						$_t_CellID:=Replace string:C233($_t_CellID; "_Text_"; "_Cell_")
						
						$_t_Day_Cell_Ref:=SVG_Find_ID(SVG_t_XMLDateWigetRef; $_t_CellID)
						ARRAY TEXT:C222($_at_NamesArray; 0)
						ARRAY TEXT:C222($_at_ValuesArray; 0)
						SVG_GET_ATTRIBUTES($_t_Day_Cell_Ref; ->$_at_NamesArray; ->$_at_ValuesArray)
						DTP_d_Date:=CAL4D_Cal_DateFromCellID($_t_CellID)
						
						ACCEPT:C269
					End if 
					
			End case 
			
		: ($_l_FormEvent=On Mouse Move:K2:35)
			If ((MouseX>24) & (MouseY>60))
				ARRAY LONGINT:C221($_al_Ordinals; 7)
				ARRAY DATE:C224($_ad_CalendarDates; 7)
				$_d_Today:=Current date:C33
				$_l_Month:=Month of:C24(Cal4D_Cal_SelectedDate)
				
				$_t_CellID:=Replace string:C233($_t_CellID; "_Text_"; "_Cell_")
				$_d_DTPDate:=CAL4D_Cal_DateFromCellID($_t_CellID)
				
				$_t_Day_Cell_Ref:=SVG_Find_ID(SVG_t_XMLDateWigetRef; $_t_CellID)
				If ((Cal4D_t_MouseOverSVGref#"") & ($_t_Day_Cell_Ref#Cal4D_t_MouseOverSVGref))
					$_t_TmpID:=SVG_Get_ID(Cal4D_t_MouseOverSVGref)
					$Cal_d_tempDate:=CAL4D_Cal_DateFromCellID($_t_TmpID)
					Cal4D_Cal_WeekOfDays($Cal_d_tempDate; ->$_al_Ordinals; ->$_ad_CalendarDates)
					For ($_l_MonthNameIndex; 1; 7)
						Case of 
							: ($_ad_CalendarDates{$_l_MonthNameIndex}=$_d_Today)
								$_t_TmpID:=String:C10($_al_Ordinals{$_l_MonthNameIndex})+"_Cell_Today"
								
							: ($_l_Month=Month of:C24($_ad_CalendarDates{$_l_MonthNameIndex}))
								$_t_TmpID:=String:C10($_al_Ordinals{$_l_MonthNameIndex})+"_Cell_Day"
								
							Else 
								$_t_TmpID:=String:C10($_al_Ordinals{$_l_MonthNameIndex})+"_Cell_Day"
								
						End case 
						
						$_t_Day_Cell_Ref:=SVG_Find_ID(SVG_t_XMLDateWigetRef; $_t_TmpID)
						
						Case of 
							: ($_ad_CalendarDates{$_l_MonthNameIndex}=Cal4D_Cal_SelectedDate)
								SVG_SET_ATTRIBUTES($_t_Day_Cell_Ref; "fill"; Cal4D_Cell_BG_Selected)
							: ($_t_TmpID="@_Cell_Today")
								SVG_SET_ATTRIBUTES($_t_Day_Cell_Ref; "fill"; Cal4D_Cal_Cell_BG("Pop_Today"))
							: ($_t_TmpID="@_Cell_Day")
								SVG_SET_ATTRIBUTES($_t_Day_Cell_Ref; "fill"; Cal4D_Cal_Cell_BG("Main_Day"))
						End case 
					End for 
				End if 
				
				Cal4D_Cal_WeekOfDays($_d_DTPDate; ->$_al_Ordinals; ->$_ad_CalendarDates)
				For ($_l_MonthNameIndex; 1; 7)
					If ($_l_Month=Month of:C24($_ad_CalendarDates{$_l_MonthNameIndex}))
						Case of 
							: ($_ad_CalendarDates{$_l_MonthNameIndex}=$_d_Today)
								$_t_TmpID:=String:C10($_al_Ordinals{$_l_MonthNameIndex})+"_Cell_Today"
							Else 
								$_t_TmpID:=String:C10($_al_Ordinals{$_l_MonthNameIndex})+"_Cell_Day"
						End case 
						
						$_t_Day_Cell_Ref:=SVG_Find_ID(SVG_t_XMLDateWigetRef; $_t_TmpID)
						Case of 
							: ($_ad_CalendarDates{$_l_MonthNameIndex}=Cal4D_Cal_SelectedDate)
								SVG_SET_ATTRIBUTES($_t_Day_Cell_Ref; "fill"; Cal4D_Cell_BG_Selected)
							: ($_ad_CalendarDates{$_l_MonthNameIndex}=$_d_Today)
								SVG_SET_ATTRIBUTES($_t_Day_Cell_Ref; "fill"; Cal4D_Cal_Cell_BG("Pop_Today"))
							Else 
								SVG_SET_ATTRIBUTES($_t_Day_Cell_Ref; "fill"; Cal4D_Cell_BG_WeekOf)
						End case 
					Else 
						
					End if 
				End for 
				
				Cal4D_t_MouseOverSVGref:=SVG_Find_ID(SVG_t_XMLDateWigetRef; $_t_CellID)
				If ($_l_Month=Month of:C24($_d_DTPDate))
					SVG_SET_ATTRIBUTES(Cal4D_t_MouseOverSVGref; "fill"; Cal4D_Cell_BG_MouseOver)
				End if 
				
				$_t_DateString:=DB_GetIndexedString(15002; Day number:C114($_d_DTPDate))+", "+DB_GetIndexedString(14002; Month of:C24($_d_DTPDate))+" "+String:C10(Day of:C23($_d_DTPDate))
				DOM SET XML ELEMENT VALUE:C868(SVG_t_XMLFooterObj; $_t_DateString)
				$_ptr_Self->:=SVG_Export_to_picture(SVG_t_XMLDateWigetRef)
			End if 
			
		: ($_l_FormEvent=On Mouse Leave:K2:34)
			If (Cal4D_t_MouseOverSVGref#"")
				$_t_CellID:=SVG_Get_ID(Cal4D_t_MouseOverSVGref)
				$_d_DTPDate:=CAL4D_Cal_DateFromCellID($_t_CellID)
				
				ARRAY LONGINT:C221($_al_Ordinals; 7)
				ARRAY DATE:C224($_ad_CalendarDates; 7)
				$_d_Today:=Current date:C33
				$_l_Month:=Month of:C24(Cal4D_Cal_SelectedDate)
				Cal4D_Cal_WeekOfDays($_d_DTPDate; ->$_al_Ordinals; ->$_ad_CalendarDates)
				
				For ($_l_MonthNameIndex; 1; 7)
					Case of 
						: ($_ad_CalendarDates{$_l_MonthNameIndex}=$_d_Today)
							$_t_TmpID:=String:C10($_al_Ordinals{$_l_MonthNameIndex})+"_Cell_Today"
							
						: ($_l_Month=Month of:C24($_ad_CalendarDates{$_l_MonthNameIndex}))
							$_t_TmpID:=String:C10($_al_Ordinals{$_l_MonthNameIndex})+"_Cell_Day"
							
						Else 
							$_t_TmpID:=String:C10($_al_Ordinals{$_l_MonthNameIndex})+"_Cell_Day"
							
					End case 
					
					$_t_Day_Cell_Ref:=SVG_Find_ID(SVG_t_XMLDateWigetRef; $_t_TmpID)
					
					Case of 
						: ($_ad_CalendarDates{$_l_MonthNameIndex}=Cal4D_Cal_SelectedDate)
							SVG_SET_ATTRIBUTES($_t_Day_Cell_Ref; "fill"; Cal4D_Cell_BG_Selected)
						: ($_t_TmpID="@_Cell_Today")
							SVG_SET_ATTRIBUTES($_t_Day_Cell_Ref; "fill"; Cal4D_Cal_Cell_BG("Pop_Today"))
						: ($_t_TmpID="@_Cell_Day")
							SVG_SET_ATTRIBUTES($_t_Day_Cell_Ref; "fill"; Cal4D_Cal_Cell_BG("Main_Day"))
					End case 
				End for 
				
				$_t_DateString:=Get indexed string:C510(15002; Day number:C114($_d_DTPDate))+", "+Get indexed string:C510(14002; Month of:C24($_d_DTPDate))+" "+String:C10(Day of:C23($_d_DTPDate))
				DOM SET XML ELEMENT VALUE:C868(SVG_t_XMLFooterObj; $_t_DateString)
				
				$_ptr_Self->:=SVG_Export_to_picture(SVG_t_XMLDateWigetRef)
				Cal4D_t_MouseOverSVGref:=""
			End if 
			
	End case 
	//========================    Clean up and Exit    =================================
	
End if 
ERR_MethodTrackerReturn("Cal4D_OM_DateWidget"; $_t_oldMethodName)