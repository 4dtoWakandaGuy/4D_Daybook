//%attributes = {}
If (False:C215)
	//Project Method Name:      SCPT_XL_ApplicationExamples
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 03/07/2013 22:59
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_FullScreen)
	C_LONGINT:C283($_l_Count)
	C_REAL:C285($_r_height; $_r_left; $_r_top; $_r_width)
	C_TEXT:C284($_t_oldMethodName; $_t_workbook; $_t_Worksheet)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SCPT_XL_ApplicationExamples")

//methods:
//http://msdn.microsoft.com/en-us/library/bb149134(v=office.12).aspx
//properties:
//http://msdn.microsoft.com/en-us/library/dd787731(v=office.12).aspx

SCPT_XL_workbook_close_all
$_t_workbook:=SCPT_XL_workbook_create
SCPT_XL_APPLICATION("show")

$_l_Count:=SCPT_XL_sheet_count($_t_workbook)

SCPT_XL_sheet_set_name($_t_workbook; 1; "Application Example")
$_t_Worksheet:=SCPT_XL_sheet_get_name($_t_workbook; 1)

//DisplayFullScreen
//http://msdn.microsoft.com/en-us/library/bb177506(v=office.12).aspx
SCPT_XL_APPLICATION("set_fullscreen"; 1)
$_bo_FullScreen:=(SCPT_XL_APPLICATION_GET("get_fullscreen")="Yes")

SCPT_XL_range_set_value($_t_workbook; $_t_Worksheet; "A1"; "DisplayFullScreen")
SCPT_XL_range_set_value($_t_workbook; $_t_Worksheet; "B1"; String:C10($_bo_FullScreen))

//Left
//http://msdn.microsoft.com/en-us/library/bb179255(v=office.12).aspx
//Top
//http://msdn.microsoft.com/en-us/library/bb214199(v=office.12).aspx
//Width
//http://msdn.microsoft.com/en-us/library/bb214430(v=office.12).aspx
//Height
//http://msdn.microsoft.com/en-us/library/bb179253(v=office.12).aspx
SCPT_XL_APPLICATION("set_rect"; 10; 10; 300; 400)
SCPT_XL_APPLICATION_GET("get_rect"; ->$_r_left; ->$_r_top; ->$_r_width; ->$_r_height)

SCPT_XL_range_set_value($_t_workbook; $_t_Worksheet; "A2"; "Left")
SCPT_XL_range_set_value($_t_workbook; $_t_Worksheet; "B2"; String:C10($_r_left))
SCPT_XL_range_set_value($_t_workbook; $_t_Worksheet; "A3"; "Top")
SCPT_XL_range_set_value($_t_workbook; $_t_Worksheet; "B3"; String:C10($_r_top))
SCPT_XL_range_set_value($_t_workbook; $_t_Worksheet; "A4"; "Right")
SCPT_XL_range_set_value($_t_workbook; $_t_Worksheet; "B4"; String:C10($_r_width))
SCPT_XL_range_set_value($_t_workbook; $_t_Worksheet; "A5"; "Height")
SCPT_XL_range_set_value($_t_workbook; $_t_Worksheet; "B5"; String:C10($_r_height))

//note:  the main application on Windows, the active window on Mac

//TRACE

SCPT_XL_workbook_close($_t_workbook)
SCPT_XL_APPLICATION("hide")


//test on both Mac and PC
ERR_MethodTrackerReturn("SCPT_XL_ApplicationExamples"; $_t_oldMethodName)
