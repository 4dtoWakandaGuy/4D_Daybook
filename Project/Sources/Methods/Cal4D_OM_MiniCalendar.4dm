//%attributes = {"invisible":true,"shared":true}
If (False:C215)
	//Project Method Name:      Cal4D_OM_MiniCalendar
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
	C_DATE:C307($_d_Date; Cal_D_TopMiniDate)
	C_LONGINT:C283($_l_Bottom; $_l_FormEvent; $_l_MouseX; $_l_MouseY; $_l_ObjectLeft; $_l_ObjectRight; $_l_ObjectTop; $2; $3; $4)
	C_POINTER:C301($_ptr_Self; $1)
	C_TEXT:C284($_t_CellID; $_t_Day_Cell_Ref; $_t_MethodName; $_t_oldMethodName; $_t_TmpID; Cal_t_SelectedMiniCellRef; Cal_t_SVGRefMini1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cal4D_OM_MiniCalendar")


$_ptr_Self:=$1
$_l_FormEvent:=$2
$_l_MouseX:=$3
$_l_MouseY:=$4

////  Get the ID to the Cell just clicked on
//{
$_t_CellID:=SVG Find element ID by coordinates:C1054($_ptr_Self->; $_l_MouseX; $_l_MouseY)

$_t_CellID:=Replace string:C233($_t_CellID; "_Text_"; "_Cell_")

$_t_Day_Cell_Ref:=SVG_Find_ID(Cal_t_SVGRefMini1; $_t_CellID)
$_d_Date:=CAL4D_Cal_DateFromCellID($_t_CellID)
//}

//========================    Method Actions    ==================================

If (Cal_t_SelectedMiniCellRef#$_t_Day_Cell_Ref)
	
	////  Is there a previously selected Mini cell? If so return it to unselected
	//{
	If (Cal_t_SelectedMiniCellRef#"")
		////  Get the ID, XML Ref, and pointer to Picture Var of the priviously Selected mini cell
		//{
		$_t_TmpID:=SVG_Get_ID(Cal_t_SelectedMiniCellRef)
		//}
		
		////  Reset the background color of the previously selected mini cell
		//{
		Cal4D_Cal_SetMiniCell_BG(Cal_D_TopMiniDate; $_t_TmpID)
		//}
	End if 
	//}
	
End if 

////  Set the background color of the selected mini cell & refresh the picture
//{
Cal_t_SelectedMiniCellRef:=SVG_Find_ID(Cal_t_SVGRefMini1; $_t_CellID)
SVG_SET_ATTRIBUTES(Cal_t_SelectedMiniCellRef; "fill"; Cal4D_Cal_Cell_BG("Mini_Selected"))
$_ptr_Self->:=SVG_Export_to_picture(Cal_t_SVGRefMini1)
//}
ERR_MethodTrackerReturn("Cal4D_OM_MiniCalendar"; $_t_oldMethodName)