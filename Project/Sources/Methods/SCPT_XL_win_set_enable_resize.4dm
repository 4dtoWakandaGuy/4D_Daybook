//%attributes = {}
If (False:C215)
	//Project Method Name:      SCPT_XL_win_set_enable_resize
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 27/06/2013 16:29
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($3)
	C_TEXT:C284($_t_oldMethodName; $1; $2)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SCPT_XL_win_set_enable_resize")


SCPT_XL_SetParameter("XCEL_WORKBOOK_NAME"; $1)
SCPT_XL_SetParameter("XCEL_WINDOW_CAPTION"; $2)
SCPT_XL_SetParameter("XCEL_WINDOW_ENABLE_RESIZE"; Choose:C955($3; "True"; "False"))

SCPT_XL("window_set_enable_resize")
ERR_MethodTrackerReturn("SCPT_XL_win_set_enable_resize"; $_t_oldMethodName)