//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Cal4D_Cal_SetMiniCell_BG
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 09/01/2010 11:11
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_DATE:C307($_d_ClickedDate; $_d_Date; $1)
	C_LONGINT:C283($_l_CalNavBar; $_l_Week)
	C_TEXT:C284($_t_CellID; $_t_MethodName; $_t_oldMethodName; $2; Cal_t_SelectedMiniCellRef)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cal4D_Cal_SetMiniCell_BG")

$_d_Date:=$1
$_t_CellID:=$2
$_d_ClickedDate:=CAL4D_Cal_DateFromCellID($_t_CellID)

//Cal4D_NavBar_Tab
$_l_CalNavBar:=0
Case of 
	: ($_l_CalNavBar=2)
		If (Current date:C33=$_d_ClickedDate)
			SVG_SET_ATTRIBUTES(Cal_t_SelectedMiniCellRef; "fill"; Cal4D_Cal_Cell_BG("Mini_Today"))
		Else 
			SVG_SET_ATTRIBUTES(Cal_t_SelectedMiniCellRef; "fill"; Cal4D_Cal_Cell_BG("Mini_OutMonth"))
		End if 
		
	: ($_l_CalNavBar=3)
		If (Current date:C33=$_d_ClickedDate)
			SVG_SET_ATTRIBUTES(Cal_t_SelectedMiniCellRef; "fill"; Cal4D_Cal_Cell_BG("Mini_Today"))
		Else 
			$_l_Week:=Cal_ISOWeekNumber(Cal4D_Cal_SelectedDate)
			If ($_l_Week=Cal_ISOWeekNumber($_d_ClickedDate))
				SVG_SET_ATTRIBUTES(Cal_t_SelectedMiniCellRef; "fill"; Cal4D_Cal_Cell_BG("Mini_ThisMonth"))
			Else 
				SVG_SET_ATTRIBUTES(Cal_t_SelectedMiniCellRef; "fill"; Cal4D_Cal_Cell_BG("Mini_OutMonth"))
			End if 
		End if 
		
	: ($_l_CalNavBar=4)
		If (Current date:C33=$_d_Date)
			Case of 
				: ($_t_CellID="@_Cell_Today_Mini")
					SVG_SET_ATTRIBUTES(Cal_t_SelectedMiniCellRef; "fill"; Cal4D_Cal_Cell_BG("Mini_Today"))
				: ($_t_CellID="@_Cell_Day_Mini")
					SVG_SET_ATTRIBUTES(Cal_t_SelectedMiniCellRef; "fill"; Cal4D_Cal_Cell_BG("Mini_ThisMonth"))
				: ($_t_CellID="Selected")
					SVG_SET_ATTRIBUTES(Cal_t_SelectedMiniCellRef; "fill"; Cal4D_Cal_Cell_BG("Mini_Selected"))
			End case 
		Else 
			If ($_d_Date=Cal4D_Cal_SelectedDate)
				SVG_SET_ATTRIBUTES(Cal_t_SelectedMiniCellRef; "fill"; Cal4D_Cal_Cell_BG("Mini_ThisMonth"))
				
			Else 
				SVG_SET_ATTRIBUTES(Cal_t_SelectedMiniCellRef; "fill"; Cal4D_Cal_Cell_BG("Mini_OutMonth"))
				
			End if 
		End if 
End case 

//========================    Clean up and Exit    =================================
ERR_MethodTrackerReturn("Cal4D_Cal_SetMiniCell_BG"; $_t_oldMethodName)