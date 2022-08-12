//%attributes = {"invisible":true,"shared":true}
If (False:C215)
	//Project Method Name:      Cal4D_OM_FullCalendar
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/12/2009 15:00
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY TEXT:C222($_at_Names; 0)
	ARRAY TEXT:C222($_at_Refs; 0)
	ARRAY TEXT:C222($_at_Types; 0)
	//ARRAY TEXT(SD2_at_Names;0)
	//ARRAY TEXT(SD2_at_Refs;0)
	C_BOOLEAN:C305($_bo_ClickedOnEvt)
	C_DATE:C307($_d_Date)
	C_LONGINT:C283($_l_Bottom; $_l_FormEvent; $_l_MouseX; $_l_MouseY; $_l_ObjectLeft; $_l_ObjectRight; $_l_ObjectTop; $_l_RefIDRow; $2; $3; $4)
	C_POINTER:C301($_ptr_Self; $1)
	C_TEXT:C284($_t_Day_Cell_Ref; $_t_Day_Cell_Sym; $_t_Day_Rect_Ref; $_t_MethodName; $_t_Mini_Ref; $_t_oldMethodName; $_t_RefID; $_t_TmpID; $Cal_t_SelectedEventRef; Cal_t_SelectedCellRef; Cal_t_SelectedEventRef)
	C_TEXT:C284(Cal_t_SelectedEventUID; CAL_t_SVGref)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cal4D_OM_FullCalendar")


$_ptr_Self:=$1
$_l_FormEvent:=$2
$_l_MouseX:=$3
$_l_MouseY:=$4

////  Get the ID to the Cell just clicked on
//{
$_t_RefID:=SVG Find element ID by coordinates:C1054($_ptr_Self->; $_l_MouseX; $_l_MouseY)
//}
ARRAY TEXT:C222($_at_Refs; 0)
ARRAY TEXT:C222($_at_Names; 0)
ARRAY TEXT:C222($_at_Types; 0)
SVG_ELEMENTS_TO_ARRAYS(CAL_t_SVGref; ->$_at_Refs; ->$_at_Types; ->$_at_Names)

//========================    Method Actions    ==================================

Case of 
	: ($_l_FormEvent=On Mouse Move:K2:35)
		////  Set cursor feedback
		//{
		Case of 
				//……………………………………………………………
			: (($_t_RefID="@_Day") | ($_t_RefID="@_Today") | ($_t_RefID="@_Evt_@"))
				SET CURSOR:C469(9000)  //Within the month
				//……………………………………………………………
			Else 
				SET CURSOR:C469  //outside the month
				//……………………………………………………………
		End case 
		//}
		
	: ($_l_FormEvent=On Double Clicked:K2:5)
		If ($_t_RefID="@_Evt_@")
			Cal4D_Event_Edit(Cal4D_Cal_GetSelectedEvent)
			
		Else 
			If (($_t_RefID="@_Text_Today") | ($_t_RefID="@_Text_Day"))
				$_t_RefID:=Replace string:C233($_t_RefID; "_Text_"; "_Cell_")
			End if 
			$_d_Date:=CAL4D_Cal_DateFromCellID($_t_RefID)
			If (Month of:C24($_d_Date)=Month of:C24(Cal4D_Cal_SelectedDate))
				Cal4D_Event_Edit(New record:K29:1)
			End if 
			
		End if 
		
	: ($_l_FormEvent=On Clicked:K2:4)
		////  Reset the event background to Unselected
		//{
		If (Cal_t_SelectedEventUID#"")
			SVG_SET_OPACITY(Cal_t_SelectedEventRef; 10; 0)
		End if 
		//}
		
		////  Get the XML reference to the Cell just clicked on
		//{
		Case of 
			: (($_t_RefID="@_Text_Today") | ($_t_RefID="@_Text_Day"))
				$_t_RefID:=Replace string:C233($_t_TmpID; "_Text_"; "_Cell_")
				
			: ($_t_RefID="@_Evt_@")
				////  Highlight the event the user clicked on
				//{
				$_bo_ClickedOnEvt:=True:C214
				$Cal_t_SelectedEventRef:=$_t_RefID
				Cal_t_SelectedEventUID:=Substring:C12($_t_RefID; Position:C15("_Evt_"; $_t_RefID)+5)
				
				$_t_RefID:=Substring:C12($_t_RefID; 1; Position:C15("_"; $_t_RefID))
				$_l_RefIDRow:=Find in array:C230(SD2_at_Names; $_t_RefID+"Cell_@")
				$_t_RefID:=SD2_at_Names{$_l_RefIDRow}
				
				$_l_RefIDRow:=Find in array:C230(SD2_at_Names; $Cal_t_SelectedEventRef)
				Cal_t_SelectedEventRef:=SD2_at_Refs{$_l_RefIDRow}
				SVG_SET_ATTRIBUTES(Cal_t_SelectedEventRef; "fill"; Cal4D_Cal_Cell_BG("Evt_Selected"))
				SVG_SET_OPACITY(Cal_t_SelectedEventRef; 100; 0)
				//}
		End case 
		$_t_Day_Cell_Ref:=SVG_Find_ID(CAL_t_SVGref; $_t_RefID)
		//}
		
		////  Is the click on a non selected cell or Event?
		//{
		If (($_t_Day_Cell_Ref#Cal_t_SelectedCellRef) | $_bo_ClickedOnEvt)
			////  Return the old selected cell to it's original color
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
			
			////  Make sure we're working with the rect and not the text
			//{
			Case of 
				: (($_t_RefID="@_Text_Today") | ($_t_RefID="@_Text_Day"))
					$_t_RefID:=Replace string:C233($_t_RefID; "_Text_"; "_Cell_")
			End case 
			//}
			
			////  Set the background color of the selected cell & refresh the picture
			//{
			Cal_t_SelectedCellRef:=SVG_Find_ID(CAL_t_SVGref; $_t_RefID)
			SVG_SET_ATTRIBUTES(Cal_t_SelectedCellRef; "fill"; Cal4D_Cal_Cell_BG("Main_Selected"))
			
			$_ptr_Self->:=SVG_Export_to_picture(CAL_t_SVGref)
			//}
		End if 
		//}
		//--------------------------------------------------------------------------------
End case 
ERR_MethodTrackerReturn("Cal4D_OM_FullCalendar"; $_t_oldMethodName)