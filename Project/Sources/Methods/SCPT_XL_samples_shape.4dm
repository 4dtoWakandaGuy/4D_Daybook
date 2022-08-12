//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      SCPT_XL_samples_shape
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
	C_BOOLEAN:C305($_bo_LockAspectRatio)
	C_LONGINT:C283($_l_Count; $_l_Placement; $_l_PlacementMove)
	C_REAL:C285($_r_height; $_r_left; $_r_Rotation; $_r_top; $_r_width)
	C_TEXT:C284($_t_ImagePath; $_t_oldMethodName; $_t_Picture; $_t_sheet; $_t_workbook)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SCPT_XL_samples_shape")

//methods:
//http://msdn.microsoft.com/en-us/library/bb259321(v=office.12).aspx
//properties:
//http://msdn.microsoft.com/en-us/library/bb259311(v=office.12).aspx

$_t_ImagePath:=Get 4D folder:C485(Current resources folder:K5:16)+"4D.png"

SCPT_XL_workbook_close_all
$_t_workbook:=SCPT_XL_workbook_create
SCPT_XL_APPLICATION("show")


SCPT_XL_sheet_set_name($_t_workbook; 1; "shape demo")
$_t_sheet:=SCPT_XL_sheet_get_name($_t_workbook; 1)

//the 'shape' class represent any shape object in Excel
//note that 'picture' is a sub-class of shape;
//all shape functions work with pictures too.

$_t_Picture:=SCPT_XL_PictureCreate($_t_workbook; $_t_sheet; $_t_ImagePath; 100; 100; 128; 128)
$_l_Count:=SCPT_XL_shape_count($_t_workbook; $_t_sheet)
SCPT_XL_shape_set_name($_t_workbook; $_t_sheet; 1; "new picture")
$_t_Picture:=SCPT_XL_shape_get_name($_t_workbook; $_t_sheet; 1)

SCPT_XL_shape_set_rotation($_t_workbook; $_t_sheet; $_t_Picture; 45)
$_r_Rotation:=SCPT_XL_shape_get_rotation($_t_workbook; $_t_sheet; $_t_Picture)

//chart picture placement enumeration
//http://msdn.microsoft.com/en-us/library/bb241002(v=office.12).aspx
SCPT_XL_shape_set_placement($_t_workbook; $_t_sheet; $_t_Picture; $_l_PlacementMove)
$_l_Placement:=SCPT_XL_shape_get_placement($_t_workbook; $_t_sheet; $_t_Picture)

SCPT_XL_shape_set_lock_ratio($_t_workbook; $_t_sheet; $_t_Picture; True:C214)
$_bo_LockAspectRatio:=SCPT_XL_shape_get_lock_ratio($_t_workbook; $_t_sheet; $_t_Picture)

SCPT_XL_shape_set_rect($_t_workbook; $_t_sheet; $_t_Picture; 10; 10; 64; 64)
SCPT_XL_shape_get_rect($_t_workbook; $_t_sheet; $_t_Picture; ->$_r_left; ->$_r_top; ->$_r_width; ->$_r_height)

SCPT_XL_workbook_close($_t_workbook)

//tested on Mac: OK
//tested on Win: OK

//TRACE
ERR_MethodTrackerReturn("SCPT_XL_samples_shape"; $_t_oldMethodName)
