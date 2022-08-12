//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Cal4D_OM_PopCalendar
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 08/01/2010 18:25
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY TEXT:C222($_at_NamesArray; 0)
	ARRAY TEXT:C222($_at_NamesValues; 0)
	C_DATE:C307($_d_CalDate; Cal4D_d_Date)
	C_LONGINT:C283($_l_FormEvent; $2)
	C_POINTER:C301($_ptr_Self; $1)
	C_TEXT:C284($_t_CellID; $_t_Day_Cell_Ref; $_t_MethodName; $_t_Mini_Ref; $_t_oldMethodName; $_t_TmpID; $_t_TmpRef; Cal4D_t_MouseOverSVGref; Cal4D_t_PopCalSVGref)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cal4D_OM_PopCalendar")
$_ptr_Self:=$1
$_l_FormEvent:=$2


Case of 
	: ($_l_FormEvent=On Clicked:K2:4)
		$_t_CellID:=SVG Find element ID by coordinates:C1054($_ptr_Self->; MouseX; MouseY)
		$_t_CellID:=Replace string:C233($_t_CellID; "_Text_"; "_Cell_")
		
		$_t_Day_Cell_Ref:=SVG_Find_ID(Cal4D_t_PopCalSVGref; $_t_CellID)
		ARRAY TEXT:C222($_at_NamesArray; 0)
		ARRAY TEXT:C222($_at_NamesValues; 0)
		SVG_GET_ATTRIBUTES($_t_Day_Cell_Ref; ->$_at_NamesArray; ->$_at_NamesValues)
		Cal4D_d_Date:=CAL4D_Cal_DateFromCellID($_t_CellID)
		
		ACCEPT:C269
		
	: ($_l_FormEvent=On Mouse Move:K2:35)
		$_t_CellID:=SVG Find element ID by coordinates:C1054($_ptr_Self->; MouseX; MouseY)
		If ($_t_CellID#"")
			$_t_CellID:=Replace string:C233($_t_CellID; "_Text_"; "_Cell_")
			
			$_t_Day_Cell_Ref:=SVG_Find_ID(Cal4D_t_PopCalSVGref; $_t_CellID)
			If ((Cal4D_t_MouseOverSVGref#"") & ($_t_Day_Cell_Ref#Cal4D_t_MouseOverSVGref))
				$_t_TmpID:=SVG_Get_ID(Cal4D_t_MouseOverSVGref)
				Case of 
					: ($_t_TmpID="@_Cell_Today")
						SVG_SET_ATTRIBUTES(Cal4D_t_MouseOverSVGref; "fill"; Cal4D_Cal_Cell_BG("Pop_Today"))
					: ($_t_TmpID="@_Cell_Day")
						SVG_SET_ATTRIBUTES(Cal4D_t_MouseOverSVGref; "fill"; Cal4D_Cal_Cell_BG("Main_Day"))
				End case 
			End if 
			
			Cal4D_t_MouseOverSVGref:=SVG_Find_ID(Cal4D_t_PopCalSVGref; $_t_CellID)
			SVG_SET_ATTRIBUTES(Cal4D_t_MouseOverSVGref; "fill"; Cal4D_Cal_Cell_BG("Pop_MouseOver"))
			
			$_ptr_Self->:=SVG_Export_to_picture(Cal4D_t_PopCalSVGref)
		End if 
		
	: ($_l_FormEvent=On Mouse Leave:K2:34)
		If (Cal4D_t_MouseOverSVGref#"")
			$_t_TmpID:=SVG_Get_ID(Cal4D_t_MouseOverSVGref)
			Case of 
				: ($_t_TmpID="@_Cell_Today")
					SVG_SET_ATTRIBUTES(Cal4D_t_MouseOverSVGref; "fill"; Cal4D_Cal_Cell_BG("Pop_Today"))
				: ($_t_TmpID="@_Cell_Day")
					SVG_SET_ATTRIBUTES(Cal4D_t_MouseOverSVGref; "fill"; Cal4D_Cal_Cell_BG("Main_Day"))
			End case 
			Cal4D_t_MouseOverSVGref:=""
		End if 
		
		$_ptr_Self->:=SVG_Export_to_picture(Cal4D_t_PopCalSVGref)
		
End case 
ERR_MethodTrackerReturn("Cal4D_OM_PopCalendar"; $_t_oldMethodName)