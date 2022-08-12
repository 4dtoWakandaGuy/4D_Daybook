//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Cal4D_Cal_SetWeekdayCell_BG
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/12/2009 10:48
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_Index)
	C_POINTER:C301(CAL_ptr_4DCalendarWeek)
	C_TEXT:C284($_t_CellID; $_t_MethodName; $_t_Msg; $_t_oldMethodName; $_t_Ordinal; $1; $2; SVG_t_Ref_Week)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cal4D_Cal_SetWeekdayCell_BG")


$_t_Ordinal:=$1
$_t_Msg:=$2


Case of 
	: ($_t_Msg="default")
		If (Cal4D_Cal_SelectedDate#Current date:C33)
			For ($_l_Index; 0; 23)
				$_t_CellID:=SVG_Find_ID(SVG_t_Ref_Week; $_t_Ordinal+"_"+String:C10($_l_Index; "00"))
				If (($_l_Index<8) | ($_l_Index>17))
					SVG_SET_ATTRIBUTES($_t_CellID; "fill"; SVG_Color_grey(3))
				Else 
					SVG_SET_ATTRIBUTES($_t_CellID; "fill"; "white")
				End if 
			End for 
			
		Else 
			For ($_l_Index; 0; 23)
				$_t_CellID:=SVG_Find_ID(SVG_t_Ref_Week; $_t_Ordinal+"_"+String:C10($_l_Index; "00"))
				If (($_l_Index<8) | ($_l_Index>17))
					SVG_SET_ATTRIBUTES($_t_CellID; "fill"; "beige")
				Else 
					SVG_SET_ATTRIBUTES($_t_CellID; "fill"; Cal4D_Cal_Cell_BG("Main_Today"))
				End if 
			End for 
			
		End if 
		
	: ($_t_Msg="select")
		For ($_l_Index; 0; 23)
			$_t_CellID:=SVG_Find_ID(SVG_t_Ref_Week; $_t_Ordinal+"_"+String:C10($_l_Index; "00"))
			SVG_SET_ATTRIBUTES($_t_CellID; "fill"; Cal4D_Cal_Cell_BG("Main_Selected"))
		End for 
		
End case 

//========================    Clean up and Exit    =================================

CAL_ptr_4DCalendarWeek->:=SVG_Export_to_picture(SVG_t_Ref_Week)
ERR_MethodTrackerReturn("Cal4D_Cal_SetWeekdayCell_BG"; $_t_oldMethodName)