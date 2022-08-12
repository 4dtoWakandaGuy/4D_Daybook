//%attributes = {}
If (False:C215)
	//Project Method Name:      SCPT_XL_range_set_number_format
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 28/06/2013 06:41
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName; $1; $2; $3; $4)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SCPT_XL_range_set_number_format")


SCPT_XL_SetParameter("XCEL_WORKBOOK_NAME"; $1)
SCPT_XL_SetParameter("XCEL_SHEET_NAME"; $2)
SCPT_XL_SetParameter("XCEL_RANGE"; $3)
SCPT_XL_SetParameter("XCEL_RANGE_NUMBER_FORMAT"; $4)

SCPT_XL("range_set_number_format")
ERR_MethodTrackerReturn("SCPT_XL_range_set_number_format"; $_t_oldMethodName)