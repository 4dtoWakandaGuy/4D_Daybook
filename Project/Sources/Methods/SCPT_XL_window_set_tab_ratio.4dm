//%attributes = {}
If (False:C215)
	//Project Method Name:      SCPT_XL_window_set_tab_ratio
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 27/06/2013 16:27
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

$_t_oldMethodName:=ERR_MethodTracker("SCPT_XL_window_set_tab_ratio")


SCPT_XL_SetParameter("XCEL_WORKBOOK_NAME"; $1)
SCPT_XL_SetParameter("XCEL_WINDOW_CAPTION"; $2)
SCPT_XL_SetParameter("XCEL_WINDOW_TAB_RATIO"; String:C10($3))

SCPT_XL("window_set_tab_ratio")
ERR_MethodTrackerReturn("SCPT_XL_window_set_tab_ratio"; $_t_oldMethodName)