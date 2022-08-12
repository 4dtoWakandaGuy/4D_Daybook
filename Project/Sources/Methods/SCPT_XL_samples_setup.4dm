//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      SCPT_XL_samples_setup
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
	C_BOOLEAN:C305($_bo_Draft)
	C_LONGINT:C283($_l_Count; $_l_FirstPageNumber; $_l_fittopagestall; $_l_fittopagesWide; $_l_Orientation; $_l_PageOrientationLandscape; $_l_PageOrientationPortrait; $_l_RightMargin)
	C_REAL:C285($_r_BottomMargin; $_r_FooterMargin; $_r_HeaderMargin; $_r_LeftMargin; $_r_TopMargin; $_r_Zoom)
	C_TEXT:C284($_t_oldMethodName; $_t_WorkBook; $_t_WorkSheet)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SCPT_XL_samples_setup")

//properties:
//http://msdn.microsoft.com/en-us/library/bb258982(v=office.12).aspx

SCPT_XL_workbook_close_all
$_t_WorkBook:=SCPT_XL_workbook_create
SCPT_XL_APPLICATION("show")

$_l_Count:=SCPT_XL_sheet_count($_t_WorkBook)

SCPT_XL_sheet_set_name($_t_WorkBook; 1; "Page Setup Example")
$_t_WorkSheet:=SCPT_XL_sheet_get_name($_t_WorkBook; 1)

//you can get/set the following page setup properties.

//note that page setup is a property of a worksheet;
//therefore you need to specify the workbook name and worksheet name,
//to call any of these functions.

//FitToPagesTall
//http://msdn.microsoft.com/en-us/library/bb208514(v=office.12).aspx
SCPT_XL_setup_set_fit_pages_tal($_t_WorkBook; $_t_WorkSheet; 2)
$_l_fittopagestall:=SCPT_XL_setup_get_fit_pages_tal($_t_WorkBook; $_t_WorkSheet)
SCPT_XL_range_set_value($_t_WorkBook; $_t_WorkSheet; "A1"; "FitToPagesTall")
SCPT_XL_range_set_value($_t_WorkBook; $_t_WorkSheet; "B1"; String:C10($_l_fittopagestall))

//FitToPagesWide
//http://msdn.microsoft.com/en-us/library/bb208515(v=office.12).aspx
SCPT_XL_setup_set_fit_pages_wid($_t_WorkBook; $_t_WorkSheet; 3)
$_l_fittopagesWide:=SCPT_XL_setup_get_fit_pages_wid($_t_WorkBook; $_t_WorkSheet)
SCPT_XL_range_set_value($_t_WorkBook; $_t_WorkSheet; "A2"; "FitToPagesWide")
SCPT_XL_range_set_value($_t_WorkBook; $_t_WorkSheet; "B2"; String:C10($_l_fittopagesWide))

//note: 'FitToPages___' on Windows, the propery is variant, in that it can be boolean as well as integer.
//for cross platform compatibility we will only support interger.

//Zoom
//http://msdn.microsoft.com/en-us/library/bb214929(v=office.12).aspx
SCPT_XL_setup_set_zoom($_t_WorkBook; $_t_WorkSheet; 200)
$_r_Zoom:=SCPT_XL_setup_get_zoom($_t_WorkBook; $_t_WorkSheet)
SCPT_XL_range_set_value($_t_WorkBook; $_t_WorkSheet; "A3"; "Zoom")
SCPT_XL_range_set_value($_t_WorkBook; $_t_WorkSheet; "B3"; String:C10($_r_Zoom))

//note: 'Zoom' is variant on both platforms, it can be boolean as well as numeric percentages between 10 and 400.
//for simplicity we will only support real.

//FirstPageNumber
//http://msdn.microsoft.com/en-us/library/bb208512(v=office.12).aspx
SCPT_XL_setup_set_1st_page_num($_t_WorkBook; $_t_WorkSheet; 4)
$_l_FirstPageNumber:=SCPT_XL_setup_get_1st_page_num($_t_WorkBook; $_t_WorkSheet)
SCPT_XL_range_set_value($_t_WorkBook; $_t_WorkSheet; "A4"; "FirstPageNumber")
SCPT_XL_range_set_value($_t_WorkBook; $_t_WorkSheet; "B4"; String:C10($_l_FirstPageNumber))

//Orientation
//http://msdn.microsoft.com/en-us/library/bb213219(v=office.12).aspx
//constant xlLandscape (2)
SCPT_XL_setup_set_orientation($_t_WorkBook; $_t_WorkSheet; $_l_PageOrientationLandscape)
$_l_Orientation:=SCPT_XL_setup_get_orientation($_t_WorkBook; $_t_WorkSheet)
SCPT_XL_range_set_value($_t_WorkBook; $_t_WorkSheet; "A5"; "Orientation")
SCPT_XL_range_set_value($_t_WorkBook; $_t_WorkSheet; "B5"; String:C10($_l_Orientation))
//constant xlPortrait (1)
SCPT_XL_setup_set_orientation($_t_WorkBook; $_t_WorkSheet; $_l_PageOrientationPortrait)
$_l_Orientation:=SCPT_XL_setup_get_orientation($_t_WorkBook; $_t_WorkSheet)
SCPT_XL_range_set_value($_t_WorkBook; $_t_WorkSheet; "A6"; "Orientation")
SCPT_XL_range_set_value($_t_WorkBook; $_t_WorkSheet; "B6"; String:C10($_l_Orientation))

//TopMargin
//http://msdn.microsoft.com/en-us/library/bb221846(v=office.12).aspx
SCPT_XL_setup_set_top_margin_cm($_t_WorkBook; $_t_WorkSheet; 2.54)
$_r_TopMargin:=SCPT_XL_setup_get_top_mar($_t_WorkBook; $_t_WorkSheet; 1)
SCPT_XL_range_set_value($_t_WorkBook; $_t_WorkSheet; "A7"; "TopMargin")
SCPT_XL_range_set_value($_t_WorkBook; $_t_WorkSheet; "B7"; String:C10($_r_TopMargin))
SCPT_XL_setup_set_top_margin_in($_t_WorkBook; $_t_WorkSheet; 1)
$_r_TopMargin:=SCPT_XL_setup_get_top_mar($_t_WorkBook; $_t_WorkSheet; 1)
SCPT_XL_range_set_value($_t_WorkBook; $_t_WorkSheet; "A8"; "TopMargin")
SCPT_XL_range_set_value($_t_WorkBook; $_t_WorkSheet; "B8"; String:C10($_r_TopMargin))

//note: margins can be set by centimeters or inches, but be aware that the internal format is always points
//1 inch is 72 points on a 72 dpi environment
//1 inch is 2.54 centimeters, hence 1 centimeter is (2.54*72) points.
//however there ican be a margin of error (no pun intended) if you set decimal centimeters

//LeftMargin
//http://msdn.microsoft.com/en-us/library/bb177853(v=office.12).aspx
SCPT_XL_setup_set_left_mar_cm($_t_WorkBook; $_t_WorkSheet; 2.54)
$_r_LeftMargin:=SCPT_XL_setup_get_left_margin($_t_WorkBook; $_t_WorkSheet; 1)
SCPT_XL_range_set_value($_t_WorkBook; $_t_WorkSheet; "A9"; "LeftMargin")
SCPT_XL_range_set_value($_t_WorkBook; $_t_WorkSheet; "B9"; String:C10($_r_LeftMargin))
SCPT_XL_setup_set_left_mar_in($_t_WorkBook; $_t_WorkSheet; 1)
$_r_LeftMargin:=SCPT_XL_setup_get_left_margin($_t_WorkBook; $_t_WorkSheet; 1)
SCPT_XL_range_set_value($_t_WorkBook; $_t_WorkSheet; "A10"; "LeftMargin")
SCPT_XL_range_set_value($_t_WorkBook; $_t_WorkSheet; "B10"; String:C10($_r_LeftMargin))

//RightMargin
//http://msdn.microsoft.com/en-us/library/bb209175(v=office.12).aspx
SCPT_XL_setup_set_right_mar_cm($_t_WorkBook; $_t_WorkSheet; 2.54)
$_l_RightMargin:=SCPT_XL_setup_get_right_mar($_t_WorkBook; $_t_WorkSheet; 1)
SCPT_XL_range_set_value($_t_WorkBook; $_t_WorkSheet; "A11"; "RightMargin")
SCPT_XL_range_set_value($_t_WorkBook; $_t_WorkSheet; "B11"; String:C10($_l_RightMargin))
SCPT_XL_setup_set_right_margin_($_t_WorkBook; $_t_WorkSheet; 1)
$_l_RightMargin:=SCPT_XL_setup_get_right_mar($_t_WorkBook; $_t_WorkSheet; 1)
SCPT_XL_range_set_value($_t_WorkBook; $_t_WorkSheet; "A12"; "RightMargin")
SCPT_XL_range_set_value($_t_WorkBook; $_t_WorkSheet; "B12"; String:C10($_l_RightMargin))

//BottomMargin
//http://msdn.microsoft.com/en-us/library/bb220892(v=office.12).aspx
SCPT_XL_setup_set_bottom_mar_cm($_t_WorkBook; $_t_WorkSheet; 2.54)
$_r_BottomMargin:=SCPT_XL_setup_get_bottom_mar($_t_WorkBook; $_t_WorkSheet; 1)
SCPT_XL_range_set_value($_t_WorkBook; $_t_WorkSheet; "A13"; "BottomMargin")
SCPT_XL_range_set_value($_t_WorkBook; $_t_WorkSheet; "B13"; String:C10($_r_BottomMargin))
SCPT_XL_setup_set_bottom_margin($_t_WorkBook; $_t_WorkSheet; 1)  //Inches
SCPT_XL_setup_set_bottom_mar_cm($_t_WorkBook; $_t_WorkSheet; 2.54)
SCPT_XL_range_set_value($_t_WorkBook; $_t_WorkSheet; "A14"; "BottomMargin")
SCPT_XL_range_set_value($_t_WorkBook; $_t_WorkSheet; "B14"; String:C10($_r_BottomMargin))

//HeaderMargin
//http://msdn.microsoft.com/en-us/library/bb208664(v=office.12).aspx
SCPT_XL_setup_set_header_mar_cm($_t_WorkBook; $_t_WorkSheet; 2.54)
$_r_HeaderMargin:=SCPT_XL_setup_get_header_margin($_t_WorkBook; $_t_WorkSheet; 1)
SCPT_XL_range_set_value($_t_WorkBook; $_t_WorkSheet; "A15"; "HeaderMargin")
SCPT_XL_range_set_value($_t_WorkBook; $_t_WorkSheet; "B15"; String:C10($_r_HeaderMargin))
SCPT_XL_setup_set_header_mar_in($_t_WorkBook; $_t_WorkSheet; 1)
SCPT_XL_range_set_value($_t_WorkBook; $_t_WorkSheet; "A16"; "HeaderMargin")
SCPT_XL_range_set_value($_t_WorkBook; $_t_WorkSheet; "B16"; String:C10($_r_HeaderMargin))

//FooterMargin
//http://msdn.microsoft.com/en-us/library/bb208526(v=office.12).aspx
SCPT_XL_setup_set_footer_mar_cm($_t_WorkBook; $_t_WorkSheet; 2.54)
$_r_FooterMargin:=SCPT_XL_setup_get_footer_margin($_t_WorkBook; $_t_WorkSheet; 1)
SCPT_XL_range_set_value($_t_WorkBook; $_t_WorkSheet; "A17"; "FooterMargin")
SCPT_XL_range_set_value($_t_WorkBook; $_t_WorkSheet; "B17"; String:C10($_r_FooterMargin))
SCPT_XL_setup_set_footer_mar_in($_t_WorkBook; $_t_WorkSheet; 1)
SCPT_XL_range_set_value($_t_WorkBook; $_t_WorkSheet; "A18"; "FooterMargin")
SCPT_XL_range_set_value($_t_WorkBook; $_t_WorkSheet; "B18"; String:C10($_r_FooterMargin))

//BlackAndWhite
//http://msdn.microsoft.com/en-us/library/bb220890(v=office.12).aspx
//SCPT_XL_setup_set_bo_and_w($_t_WorkBook;$_t_WorkSheet;True)
//$black_and_white_b:=SCPT_XL_setup_get_bo_and_w($_t_WorkBook;$_t_WorkSheet;1)
//SCPT_XL_setup_ge
SCPT_XL_range_set_value($_t_WorkBook; $_t_WorkSheet; "A19"; "BlackAndWhite")
//SCPT_XL_range_set_value ($_t_WorkBook;$_t_WorkSheet;"B19";String(Num($black_and_white_b);"True;;False"))
//SCPT_XL_setup_set_bo_and_w($_t_WorkBook;$_t_WorkSheet;False)
//$black_and_white_b:=SCPT_XL_setup_get_bo_and_w($_t_WorkBook;$_t_WorkSheet;1)
SCPT_XL_range_set_value($_t_WorkBook; $_t_WorkSheet; "A20"; "BlackAndWhite")
//SCPT_XL_range_set_value ($_t_WorkBook;$_t_WorkSheet;"B20";String(Num($black_and_white_b);"True;;False"))

//note: although defined as bool, the 'BlackAndWhite' property must be explicitly cast on Windows

//Draft
//http://msdn.microsoft.com/en-us/library/bb221052(v=office.12).aspx
SCPT_XL_setup_set_draft($_t_WorkBook; $_t_WorkSheet; True:C214)
$_bo_Draft:=SCPT_XL_setup_get_draft($_t_WorkBook; $_t_WorkSheet; 1)
SCPT_XL_range_set_value($_t_WorkBook; $_t_WorkSheet; "A21"; "Draft")
SCPT_XL_range_set_value($_t_WorkBook; $_t_WorkSheet; "B21"; String:C10(Num:C11($_bo_Draft); "True;;False"))
SCPT_XL_setup_set_draft($_t_WorkBook; $_t_WorkSheet; False:C215)
$_bo_Draft:=SCPT_XL_setup_get_draft($_t_WorkBook; $_t_WorkSheet; 1)
SCPT_XL_range_set_value($_t_WorkBook; $_t_WorkSheet; "A22"; "Draft")
SCPT_XL_range_set_value($_t_WorkBook; $_t_WorkSheet; "B22"; String:C10(Num:C11($_bo_Draft); "True;;False"))

//TRACE

SCPT_XL_workbook_close($_t_WorkBook)

//test on both Mac and PC
ERR_MethodTrackerReturn("SCPT_XL_samples_setup"; $_t_oldMethodName)