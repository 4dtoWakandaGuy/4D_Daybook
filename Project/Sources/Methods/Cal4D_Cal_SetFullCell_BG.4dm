//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Cal4D_Cal_SetFullCell_BG
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 08/01/2010 18:56
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_POINTER:C301(CAL_ptr_4DFullCalendar)
	C_TEXT:C284($_t_CellID; $_t_MethodName; $_t_Msg; $_t_oldMethodName; $_t_Ordinal; $1; $2; Cal_t_SelectedCellRef; CAL_t_SVGref)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cal4D_Cal_SetFullCell_BG")
$_t_Ordinal:=$1
$_t_Msg:=$2

Case of 
	: ($_t_Msg="default")
		If (Cal4D_Cal_SelectedDate#Current date:C33)
			$_t_CellID:=SVG_Find_ID(CAL_t_SVGref; $_t_Ordinal+"_Cell_Day")
			SVG_SET_ATTRIBUTES($_t_CellID; "fill"; Cal4D_Cal_Cell_BG("Main_Day"))
			
		Else 
			$_t_CellID:=SVG_Find_ID(CAL_t_SVGref; $_t_Ordinal+"_Cell_Today")
			SVG_SET_ATTRIBUTES($_t_CellID; "fill"; Cal4D_Cal_Cell_BG("Main_Today"))
			
		End if 
		
	: ($_t_Msg="select")
		If (Cal4D_Cal_SelectedDate#Current date:C33)
			Cal_t_SelectedCellRef:=SVG_Find_ID(CAL_t_SVGref; $_t_Ordinal+"_Cell_Day")
			
		Else 
			Cal_t_SelectedCellRef:=SVG_Find_ID(CAL_t_SVGref; $_t_Ordinal+"_Cell_Today")
			
		End if 
		SVG_SET_ATTRIBUTES(Cal_t_SelectedCellRef; "fill"; Cal4D_Cal_Cell_BG("Main_Selected"))
		
End case 

//========================    Clean up and Exit    =================================

////  Tranlate the SVG object to the Picture variable
//{
CAL_ptr_4DFullCalendar->:=SVG_Export_to_picture(CAL_t_SVGref)
//}
ERR_MethodTrackerReturn("Cal4D_Cal_SetFullCell_BG"; $_t_oldMethodName)