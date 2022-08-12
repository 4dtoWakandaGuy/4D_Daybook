//%attributes = {}
If (False:C215)
	//Project Method Name:      SCPT_XL_range_set_border
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 28/06/2013 06:39
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($4; $5; $6; $7)
	C_TEXT:C284($_t_oldMethodName; $1; $2; $3)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SCPT_XL_range_set_border")


SCPT_XL_SetParameter("XCEL_WORKBOOK_NAME"; $1)
SCPT_XL_SetParameter("XCEL_SHEET_NAME"; $2)
SCPT_XL_SetParameter("XCEL_RANGE"; $3)
SCPT_XL_SetParameter("XCEL_RANGE_BORDER_TYPE"; String:C10($4))
SCPT_XL_SetParameter("XCEL_RANGE_BORDER_LINE_STYLE"; String:C10($5))
SCPT_XL_SetParameter("XCEL_RANGE_BORDER_WEIGHT"; String:C10($6))
SCPT_XL_SetParameter("XCEL_RANGE_BORDER_COLOR"; String:C10($7))

SCPT_XL("range_set_border")
ERR_MethodTrackerReturn("SCPT_XL_range_set_border"; $_t_oldMethodName)