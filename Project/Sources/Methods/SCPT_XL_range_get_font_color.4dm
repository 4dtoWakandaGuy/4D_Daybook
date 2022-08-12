//%attributes = {}
If (False:C215)
	//Project Method Name:      SCPT_XL_range_get_font_color
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 04/07/2013 11:33
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($0)
	C_TEXT:C284($_t_oldMethodName; $_t_result; $1; $2; $3)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SCPT_XL_range_get_font_color")


SCPT_XL_SetParameter("XCEL_WORKBOOK_NAME"; $1)
SCPT_XL_SetParameter("XCEL_SHEET_NAME"; $2)
SCPT_XL_SetParameter("XCEL_RANGE"; $3)

$_t_result:=SCPT_XL("range_get_font_color")

$0:=Num:C11($_t_result)
ERR_MethodTrackerReturn("SCPT_XL_range_get_font_color"; $_t_oldMethodName)
