//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      SCPT_XL_samples_range
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 04/07/2013 11:24
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY TEXT:C222($_at_Values; 0)
	C_BOOLEAN:C305($_bo_Bold; $_bo_Italic; $_bo_Locked; $_bo_Outline; $_bo_Shado; $_bo_ShrinktoFit; $_bo_StrikeThrough; $_bo_SubScript; $_bo_Superscript; $_bo_WrapText)
	C_LONGINT:C283($_l_BorderBottom; $_l_BorderLeft; $_l_BorderRight; $_l_BorderStyleDash; $_l_BorderTop; $_l_BorderWeightMedium; $_l_Colour; $_l_CountSheets; $_l_InteriorColour; $_l_Orientation; $_l_PictureAppearancePrinter)
	C_LONGINT:C283($_l_PictureFormatPicture; $_l_Size; $_l_Style; $_l_Underline; $_l_UnderlineDouble; $_l_UnderlineDoubleAccounting; $_l_UnderlineNone; $_l_UnderlineSingle; $_l_UnderlineSingleAccounting; $_l_Weight)
	C_REAL:C285($_l_Height; $_l_Width; $_r_left; $_r_top)
	C_TEXT:C284($_t_FontName; $_t_Formula; $_t_NumberFormat; $_t_oldMethodName; $_t_WorkBookName; $_t_WorksheetName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SCPT_XL_samples_range")

//methods:
//http://msdn.microsoft.com/en-us/library/bb245315(v=office.12).aspx
//properties:
//http://msdn.microsoft.com/en-us/library/bb245304(v=office.12).aspx

SCPT_XL_workbook_close_all
$_t_WorkBookName:=SCPT_XL_workbook_create
SCPT_XL_APPLICATION("show")

$_l_CountSheets:=SCPT_XL_sheet_count($_t_WorkBookName)

SCPT_XL_sheet_set_name($_t_WorkBookName; 1; "Range Example")
$_t_WorksheetName:=SCPT_XL_sheet_get_name($_t_WorkBookName; 1)

//NumberFormat
//http://msdn.microsoft.com/en-us/library/bb213677(v=office.12).aspx
SCPT_XL_range_set_number_format($_t_WorkBookName; $_t_WorksheetName; "A1"; "$#,##0.00_);[Red]($#,##0.00)")
SCPT_XL_range_set_number_format($_t_WorkBookName; $_t_WorksheetName; "A2"; "hh:mm:ss")
$_t_NumberFormat:=SCPT_XL_range_get_number_format($_t_WorkBookName; $_t_WorksheetName; "A1")
$_t_NumberFormat:=SCPT_XL_range_get_number_format($_t_WorkBookName; $_t_WorksheetName; "A2")

//Borders
//http://msdn.microsoft.com/en-us/library/bb213512(v=office.12).aspx
SCPT_XL_range_set_border($_t_WorkBookName; $_t_WorksheetName; "B1:B9"; $_l_BorderBottom; $_l_BorderStyleDash; $_l_BorderWeightMedium; 7)
SCPT_XL_range_set_border($_t_WorkBookName; $_t_WorksheetName; "B1:B9"; $_l_BorderLeft; $_l_BorderStyleDash; $_l_BorderWeightMedium; 7)
SCPT_XL_range_set_border($_t_WorkBookName; $_t_WorksheetName; "B1:B9"; $_l_BorderRight; $_l_BorderStyleDash; $_l_BorderWeightMedium; 7)
SCPT_XL_range_set_border($_t_WorkBookName; $_t_WorksheetName; "B1:B9"; $_l_BorderTop; $_l_BorderStyleDash; $_l_BorderWeightMedium; 7)

SCPT_XL_range_get_rect($_t_WorkBookName; $_t_WorksheetName; "B1:B9"; ->$_r_left; ->$_r_top; ->$_l_Width; ->$_l_Height)


SCPT_XL_Range_Get_Border($_t_WorkBookName; $_t_WorksheetName; "B1"; $_l_BorderBottom; ->$_l_Style; ->$_l_Weight; ->$_l_Colour)

ARRAY TEXT:C222($_at_Values; 5)
$_at_Values{1}:="1"
$_at_Values{2}:="2"
$_at_Values{3}:="3"
$_at_Values{4}:="4"
$_at_Values{5}:="5"

//running individual scripts for each cell can be expensive;
SCPT_XL_range_set_value_array($_t_WorkBookName; $_t_WorksheetName; "A1:A7"; ->$_at_Values)

//Value
//http://msdn.microsoft.com/en-us/library/bb238606(v=office.12).aspx
SCPT_XL_range_set_value($_t_WorkBookName; $_t_WorksheetName; "a1"; "bold")

SCPT_XL_range_set_font_bold($_t_WorkBookName; $_t_WorksheetName; "a1"; True:C214)
$_bo_Bold:=SCPT_XL_Range_Get_Font_Bold($_t_WorkBookName; $_t_WorksheetName; "a1")

SCPT_XL_range_set_value($_t_WorkBookName; $_t_WorksheetName; "a2"; "italic")
SCPT_XL_range_set_font_italic($_t_WorkBookName; $_t_WorksheetName; "a2"; True:C214)
$_bo_Italic:=SCPT_XL_Range_Get_Font_Italic($_t_WorkBookName; $_t_WorksheetName; "a2")

SCPT_XL_range_set_value($_t_WorkBookName; $_t_WorksheetName; "a3"; "color #2")
SCPT_XL_range_set_font_color($_t_WorkBookName; $_t_WorksheetName; "a3"; 3)
$_l_Colour:=SCPT_XL_range_get_font_color($_t_WorkBookName; $_t_WorksheetName; "a3")


SCPT_XL_range_set_value($_t_WorkBookName; $_t_WorksheetName; "a4"; "Courier")
SCPT_XL_range_set_font_name($_t_WorkBookName; $_t_WorksheetName; "a4"; "Courier")
$_t_FontName:=SCPT_XL_Range_Get_Font_Name($_t_WorkBookName; $_t_WorksheetName; "a4")

SCPT_XL_range_set_value($_t_WorkBookName; $_t_WorksheetName; "a5"; "outline")
SCPT_XL_range_set_font_outline($_t_WorkBookName; $_t_WorksheetName; "a5"; True:C214)
$_bo_Outline:=SCPT_XL_Range_Get_Font_Outline($_t_WorkBookName; $_t_WorksheetName; "a5")

SCPT_XL_range_set_value($_t_WorkBookName; $_t_WorksheetName; "a6"; "shadow")
SCPT_XL_range_set_font_shadow($_t_WorkBookName; $_t_WorksheetName; "a6"; True:C214)
$_bo_Shado:=SCPT_XL_Range_Get_Font_Shadow($_t_WorkBookName; $_t_WorksheetName; "a6")

SCPT_XL_range_set_value($_t_WorkBookName; $_t_WorksheetName; "a7"; "size 20")
SCPT_XL_range_set_font_size($_t_WorkBookName; $_t_WorksheetName; "a7"; 20)
$_l_Size:=SCPT_XL_Range_Get_Font_SIze($_t_WorkBookName; $_t_WorksheetName; "a7")

SCPT_XL_range_set_value($_t_WorkBookName; $_t_WorksheetName; "a8"; "strike through")
SCPT_XL_range_set_strike_throug($_t_WorkBookName; $_t_WorksheetName; "a8"; True:C214)
$_bo_StrikeThrough:=SCPT_XL_range_get_strike_throug($_t_WorkBookName; $_t_WorksheetName; "a8")

SCPT_XL_range_set_value($_t_WorkBookName; $_t_WorksheetName; "a9"; "subscript")
SCPT_XL_range_set_subscript($_t_WorkBookName; $_t_WorksheetName; "a9"; True:C214)
$_bo_SubScript:=SCPT_XL_range_get_subscript($_t_WorkBookName; $_t_WorksheetName; "a9")

SCPT_XL_range_set_value($_t_WorkBookName; $_t_WorksheetName; "a10"; "superscript")
SCPT_XL_range_set_superscript($_t_WorkBookName; $_t_WorksheetName; "a10"; True:C214)
$_bo_Superscript:=SCPT_XL_range_get_superscript($_t_WorkBookName; $_t_WorksheetName; "a10")

//actually, 'value' is interpreted as formula, but it is better to set explicitly
SCPT_XL_range_set_formula($_t_WorkBookName; $_t_WorksheetName; "a11"; "=TODAY()")
$_t_Formula:=SCPT_XL_Range_Get_Formula($_t_WorkBookName; $_t_WorksheetName; "a11")

SCPT_XL_range_set_value($_t_WorkBookName; $_t_WorksheetName; "a12"; "height 15")
SCPT_XL_range_set_height($_t_WorkBookName; $_t_WorksheetName; "a12"; 15)
$_l_Height:=SCPT_XL_Range_get_Height($_t_WorkBookName; $_t_WorksheetName; "a12")

SCPT_XL_range_set_value($_t_WorkBookName; $_t_WorksheetName; "a13"; "interior color #5")
SCPT_XL_range_set_interior_colo($_t_WorkBookName; $_t_WorksheetName; "a13"; 5)
$_l_InteriorColour:=SCPT_XL_range_get_interior_colo($_t_WorkBookName; $_t_WorksheetName; "a13")

SCPT_XL_range_set_value($_t_WorkBookName; $_t_WorksheetName; "a14"; "locked")
SCPT_XL_range_set_locked($_t_WorkBookName; $_t_WorksheetName; "a14"; True:C214)
$_bo_Locked:=SCPT_XL_range_get_locked($_t_WorkBookName; $_t_WorksheetName; "a14")

//there are naming rules, suspect the name if command fails
SCPT_XL_range_set_value($_t_WorkBookName; $_t_WorksheetName; "a15"; "4")
SCPT_XL_range_set_name($_t_WorkBookName; $_t_WorksheetName; "a15"; "name")
$_t_WorksheetName:=SCPT_XL_range_get_name($_t_WorkBookName; $_t_WorksheetName; "a15")

SCPT_XL_range_set_value($_t_WorkBookName; $_t_WorksheetName; "a16"; "orientation 45")
SCPT_XL_range_set_orientation($_t_WorkBookName; $_t_WorksheetName; "a16"; 45)
$_l_Orientation:=SCPT_XL_range_get_orientation($_t_WorkBookName; $_t_WorksheetName; "a16")

SCPT_XL_range_set_value($_t_WorkBookName; $_t_WorksheetName; "a19"; "width 20")
SCPT_XL_range_set_width($_t_WorkBookName; $_t_WorksheetName; "a19"; 15)
$_l_Width:=SCPT_XL_range_get_width($_t_WorkBookName; $_t_WorksheetName; "a19")

SCPT_XL_range_set_value($_t_WorkBookName; $_t_WorksheetName; "a20"; "wrap text")
SCPT_XL_range_set_wrap_text($_t_WorkBookName; $_t_WorksheetName; "a20"; True:C214)
$_bo_WrapText:=SCPT_XL_range_get_wrap_text($_t_WorkBookName; $_t_WorksheetName; "a20")

SCPT_XL_range_set_value($_t_WorkBookName; $_t_WorksheetName; "a22"; "shrink to fit")
SCPT_XL_range_set_shrink_to_fit($_t_WorkBookName; $_t_WorksheetName; "a22"; True:C214)
$_bo_ShrinktoFit:=SCPT_XL_range_get_shrink_to_fit($_t_WorkBookName; $_t_WorksheetName; "a22")

//underline style enumeration
//http://msdn.microsoft.com/en-us/library/bb216406(v=office.12).aspx
SCPT_XL_range_set_value($_t_WorkBookName; $_t_WorksheetName; "a23"; "double")
SCPT_XL_range_set_underline($_t_WorkBookName; $_t_WorksheetName; "a23"; $_l_UnderlineDouble)
SCPT_XL_range_set_value($_t_WorkBookName; $_t_WorksheetName; "a24"; "double accounting")
SCPT_XL_range_set_underline($_t_WorkBookName; $_t_WorksheetName; "a24"; $_l_UnderlineDoubleAccounting)
SCPT_XL_range_set_value($_t_WorkBookName; $_t_WorksheetName; "a25"; "single")
SCPT_XL_range_set_underline($_t_WorkBookName; $_t_WorksheetName; "a25"; $_l_UnderlineSingle)
SCPT_XL_range_set_value($_t_WorkBookName; $_t_WorksheetName; "a26"; "single accounting")
SCPT_XL_range_set_underline($_t_WorkBookName; $_t_WorksheetName; "a26"; $_l_UnderlineSingleAccounting)
SCPT_XL_range_set_value($_t_WorkBookName; $_t_WorksheetName; "a27"; "none")
SCPT_XL_range_set_underline($_t_WorkBookName; $_t_WorksheetName; "a27"; $_l_UnderlineNone)
$_l_Underline:=SCPT_XL_range_get_underline($_t_WorkBookName; $_t_WorksheetName; "a27")

SCPT_XL_range_set_value($_t_WorkBookName; $_t_WorksheetName; "a28"; "merge")
SCPT_XL_range_merge($_t_WorkBookName; $_t_WorksheetName; "a28:a30")
SCPT_XL_range_unmerge($_t_WorkBookName; $_t_WorksheetName; "a28:a30")
SCPT_XL_range_merge_across($_t_WorkBookName; $_t_WorksheetName; "a28:c28")

//picture appearance enumerartion
//http://msdn.microsoft.com/en-us/library/bb241413(v=office.12).aspx
//copy picture format enumerartion
//http://msdn.microsoft.com/en-us/library/bb241043(v=office.12).aspx
SCPT_XL_Range_Copy_Picture($_t_WorkBookName; $_t_WorksheetName; "a1:a5"; $_l_PictureAppearancePrinter; $_l_PictureFormatPicture)
SCPT_XL_workbook_close($_t_WorkBookName)

//tested on Mac: OK
//tested on Win: OK
ERR_MethodTrackerReturn("SCPT_XL_samples_range"; $_t_oldMethodName)
