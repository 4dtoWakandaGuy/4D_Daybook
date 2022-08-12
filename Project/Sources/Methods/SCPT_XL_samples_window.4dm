//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      SCPT_XL_samples_window
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
	C_BOOLEAN:C305($_bo_EnableResize; $_bo_FreezePanes; $_bo_Gridlines; $_bo_Headings; $_bo_Outline; $_bo_ScrollHorizontal; $_bo_ScrollVertical; $_bo_Tabs; $_bo_Visible; $_bo_Zoom)
	C_LONGINT:C283($_l_Count; $_l_GridlineColor; $_l_Row; $_l_SplitColumn; $_l_TabRatio; $_l_View; XL_l_ArrangeStyleCascade; XL_l_ArrangeStyleHorizontal; XL_l_ArrangeStyleTiles; XL_l_ArrangeStyleVertical; XL_l_ViewNormal)
	C_LONGINT:C283(XL_l_ViewPageLayout)
	C_REAL:C285($_l_Height; $_l_Left; $_l_Right; $_l_Width)
	C_TEXT:C284($_t_oldMethodName; $_t_WindowTitle; $_t_Workbook)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SCPT_XL_samples_window")

//methods:
//http://msdn.microsoft.com/en-us/library/bb245598(v=office.12).aspx
//properties:
//http://msdn.microsoft.com/en-us/library/bb245593(v=office.12).aspx

SCPT_XL_workbook_close_all
$_t_Workbook:=SCPT_XL_workbook_create
SCPT_XL_APPLICATION("show")


$_l_Count:=SCPT_XL_win_count($_t_Workbook)
SCPT_XL_win_set_caption($_t_Workbook; 1; "new window")
$_t_WindowTitle:=SCPT_XL_win_get_caption($_t_Workbook; 1)

SCPT_XL_window_set_visible($_t_Workbook; $_t_WindowTitle; False:C215)
$_bo_Visible:=SCPT_XL_win_get_visible($_t_Workbook; $_t_WindowTitle)

SCPT_XL_window_set_zoom($_t_Workbook; $_t_WindowTitle; 200)
$_bo_Zoom:=SCPT_XL_win_get_zoom($_t_Workbook; $_t_WindowTitle)

SCPT_XL_window_set_view($_t_Workbook; $_t_WindowTitle; XL_l_ViewNormal)
SCPT_XL_window_set_view($_t_Workbook; $_t_WindowTitle; XL_l_ViewPageLayout)
$_l_View:=SCPT_XL_win_get_view($_t_Workbook; $_t_WindowTitle)

SCPT_XL_win_set_enable_resize($_t_Workbook; $_t_WindowTitle; True:C214)
$_bo_EnableResize:=SCPT_XL_win_get_enable_resize($_t_Workbook; $_t_WindowTitle)

SCPT_XL_win_set_freeze_panes($_t_Workbook; $_t_WindowTitle; True:C214)
$_bo_FreezePanes:=SCPT_XL_win_get_freeze_panes($_t_Workbook; $_t_WindowTitle)

SCPT_XL_win_set_gridline_color($_t_Workbook; $_t_WindowTitle; 5)
$_l_GridlineColor:=SCPT_XL_win_get_gridline_color($_t_Workbook; $_t_WindowTitle)

SCPT_XL_window_set_rect($_t_Workbook; $_t_WindowTitle; 0; 0; 100; 100)
SCPT_XL_win_get_rect($_t_Workbook; $_t_WindowTitle; ->$_l_Left; ->$_l_Right; ->$_l_Width; ->$_l_Height)

SCPT_XL_window_set_show_gridlin($_t_Workbook; $_t_WindowTitle; True:C214)
$_bo_Gridlines:=SCPT_XL_win_get_show_gridlines($_t_Workbook; $_t_WindowTitle)

SCPT_XL_window_set_show_heading($_t_Workbook; $_t_WindowTitle; True:C214)
$_bo_Headings:=SCPT_XL_win_get_show_headings($_t_Workbook; $_t_WindowTitle)

SCPT_XL_win_set_show_outline($_t_Workbook; $_t_WindowTitle; True:C214)
$_bo_Outline:=SCPT_XL_win_get_show_outline($_t_Workbook; $_t_WindowTitle)

SCPT_XL_win_set_show_scroll_h($_t_Workbook; $_t_WindowTitle; True:C214)
$_bo_ScrollHorizontal:=SCPT_XL_win_get_show_scroll_h($_t_Workbook; $_t_WindowTitle)

SCPT_XL_window_set_show_scroll_($_t_Workbook; $_t_WindowTitle; True:C214)
$_bo_ScrollVertical:=SCPT_XL_win_get_show_scroll_h($_t_Workbook; $_t_WindowTitle)

SCPT_XL_window_set_show_tabs($_t_Workbook; $_t_WindowTitle; True:C214)
$_bo_Tabs:=SCPT_XL_win_get_show_tabs($_t_Workbook; $_t_WindowTitle)

SCPT_XL_window_set_split_column($_t_Workbook; $_t_WindowTitle; 10)
$_l_SplitColumn:=SCPT_XL_win_get_split_column($_t_Workbook; $_t_WindowTitle)

SCPT_XL_window_set_split_row($_t_Workbook; $_t_WindowTitle; 10)
$_l_Row:=SCPT_XL_win_get_split_row($_t_Workbook; $_t_WindowTitle)

SCPT_XL_window_set_tab_ratio($_t_Workbook; $_t_WindowTitle; 10)
$_l_TabRatio:=SCPT_XL_win_get_tab_ratio($_t_Workbook; $_t_WindowTitle)

SCPT_XL_APPLICATION("arrange_window"; XL_l_ArrangeStyleCascade)
SCPT_XL_APPLICATION("arrange_window"; XL_l_ArrangeStyleHorizontal)
SCPT_XL_APPLICATION("arrange_window"; XL_l_ArrangeStyleTiles)
SCPT_XL_APPLICATION("arrange_window"; XL_l_ArrangeStyleVertical)
ERR_MethodTrackerReturn("SCPT_XL_samples_window"; $_t_oldMethodName)