//%attributes = {}
If (False:C215)
	//Project Method Name:      SCPT_XL_ChartSamples
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 04/07/2013 09:04
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_Count; $_l_PictureAppearancePrinter; $_l_PictureFormatPicture; $_l_Type)
	C_TEXT:C284($_t_ChartName; $_t_oldMethodName; $_t_Type; $_t_workbook; $_t_Worksheet)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SCPT_XL_ChartSamples")

SCPT_XL_workbook_close_all
$_t_workbook:=SCPT_XL_workbook_create
SCPT_XL_APPLICATION("show")


$_l_Count:=SCPT_XL_sheet_count($_t_workbook)

SCPT_XL_sheet_set_name($_t_workbook; 1; "Chart Example")
$_t_Worksheet:=SCPT_XL_sheet_get_name($_t_workbook; 1)

SCPT_XL_range_set_value($_t_workbook; $_t_Worksheet; "A1:A5"; "10")
$_t_ChartName:=SCPT_XL_CHART("create"; $_t_workbook; $_t_Worksheet; "A1:A5"; 0; 0; "My Chart"; 10; 200; 400; 250)
$_l_Count:=Num:C11(SCPT_XL_CHART("Count"; $_t_workbook; $_t_Worksheet))

//Name
//http://msdn.microsoft.com/en-us/library/bb179461(v=office.12).aspx
SCPT_XL_CHART("Set_Name"; $_t_workbook; $_t_Worksheet; "new chart"; 0)
$_t_ChartName:=SCPT_XL_CHART("get_name"; $_t_workbook; $_t_Worksheet; ""; 1)
SCPT_XL_range_set_value($_t_workbook; $_t_Worksheet; "A7"; "Name")
SCPT_XL_range_set_value($_t_workbook; $_t_Worksheet; "B7"; $_t_ChartName)

//ChartType
//http://msdn.microsoft.com/en-us/library/bb179424(v=office.12).aspx
SCPT_XL_CHART("set_type"; $_t_workbook; $_t_Worksheet; $_t_ChartName; -4120)
$_t_Type:=SCPT_XL_CHART("get_type"; $_t_workbook; $_t_Worksheet; $_t_ChartName)
SCPT_XL_range_set_value($_t_workbook; $_t_Worksheet; "A8"; "Type")
SCPT_XL_range_set_value($_t_workbook; $_t_Worksheet; "B8"; $_t_Type)

//note: see MSDN documentation for full list of chart types
//http://msdn.microsoft.com/en-us/library/bb241008.aspx

//picture appearance enumerartion
//http://msdn.microsoft.com/en-us/library/bb241413(v=office.12).aspx
//copy picture format enumerartion
//http://msdn.microsoft.com/en-us/library/bb241043(v=office.12).aspx
SCPT_XL_CHART("copy_picture"; $_t_workbook; $_t_Worksheet; $_t_ChartName; $_l_PictureAppearancePrinter; $_l_PictureFormatPicture)
//the chart image is in the pasteboard

//TRACE

SCPT_XL_workbook_close($_t_workbook)
SCPT_XL_APPLICATION("hide")

//test on both Mac and PC
ERR_MethodTrackerReturn("SCPT_XL_ChartSamples"; $_t_oldMethodName)
