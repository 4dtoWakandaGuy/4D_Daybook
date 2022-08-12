//%attributes = {}
If (False:C215)
	//Project Method Name:      SCPT_XL_setup_set_right_mar_cm
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 28/06/2013 06:47
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_REAL:C285($3)
	C_TEXT:C284($_t_oldMethodName; $1; $2)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SCPT_XL_setup_set_right_mar_cm")


SCPT_XL_SetParameter("XCEL_WORKBOOK_NAME"; $1)
SCPT_XL_SetParameter("XCEL_SHEET_NAME"; $2)
SCPT_XL_SetParameter("XCEL_PAGE_SETUP_RIGHT_MARGIN"; String:C10($3))

SCPT_XL("setup_set_right_margin_cm")
ERR_MethodTrackerReturn("SCPT_XL_setup_set_right_mar_cm"; $_t_oldMethodName)