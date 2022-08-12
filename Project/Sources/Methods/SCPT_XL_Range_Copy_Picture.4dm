//%attributes = {}
If (False:C215)
	//Project Method Name:      SCPT_XL_Range_Copy_Picture
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 27/06/2013 16:05
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($4; $5)
	C_TEXT:C284($_t_oldMethodName; $1; $2; $3)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SCPT_XL_Range_Copy_Picture")

//set the range as picture to pasteboard
SCPT_XL_SetParameter("XCEL_WORKBOOK_NAME"; $1)
SCPT_XL_SetParameter("XCEL_SHEET_NAME"; $2)
SCPT_XL_SetParameter("XCEL_RANGE"; $3)
SCPT_XL_SetParameter("XCEL_PICTURE_APPEARANCE"; String:C10($4))
SCPT_XL_SetParameter("XCEL_PICTURE_FORMAT"; String:C10($5))

SCPT_XL("range_copy_picture")
ERR_MethodTrackerReturn("SCPT_XL_Range_Copy_Picture"; $_t_oldMethodName)