//%attributes = {}
If (False:C215)
	//Project Method Name:      SCPT_Range_GetFontColor
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 27/06/2013 15:44
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($0)
	C_TEXT:C284($_t_oldMethodName; $_t_Result; $1; $2; $3)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SCPT_Range_GetFontColor")


SCPT_XL_SetParameter("XCEL_WORKBOOK_NAME"; $1)
SCPT_XL_SetParameter("XCEL_SHEET_NAME"; $2)
SCPT_XL_SetParameter("XCEL_RANGE"; $3)

$_t_Result:=SCPT_XL("range_get_font_color")

$0:=Num:C11($_t_Result)
ERR_MethodTrackerReturn("SCPT_Range_GetFontColor"; $_t_oldMethodName)
