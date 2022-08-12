//%attributes = {}
If (False:C215)
	//Project Method Name:      SCPT_XL_shape_set_rect
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 27/06/2013 16:36
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_REAL:C285($4; $5; $6; $7)
	C_TEXT:C284($_t_oldMethodName; $1; $2; $3)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SCPT_XL_shape_set_rect")


SCPT_XL_SetParameter("XCEL_WORKBOOK_NAME"; $1)
SCPT_XL_SetParameter("XCEL_SHEET_NAME"; $2)
SCPT_XL_SetParameter("XCEL_SHAPE_NAME"; $3)
SCPT_XL_SetParameter("XCEL_SHAPE_LEFT"; String:C10($4))
SCPT_XL_SetParameter("XCEL_SHAPE_TOP"; String:C10($5))
SCPT_XL_SetParameter("XCEL_SHAPE_WIDTH"; String:C10($6))
SCPT_XL_SetParameter("XCEL_SHAPE_HEIGHT"; String:C10($7))

SCPT_XL("sheet_shape_set_rect")
ERR_MethodTrackerReturn("SCPT_XL_shape_set_rect"; $_t_oldMethodName)