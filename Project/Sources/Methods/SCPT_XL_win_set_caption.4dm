//%attributes = {}
If (False:C215)
	//Project Method Name:      SCPT_XL_win_set_caption
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
	C_LONGINT:C283($2)
	C_TEXT:C284($_t_oldMethodName; $1; $3)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SCPT_XL_win_set_caption")


SCPT_XL_SetParameter("XCEL_WORKBOOK_NAME"; $1)
SCPT_XL_SetParameter("XCEL_WINDOW_NUMBER"; String:C10($2))
SCPT_XL_SetParameter("XCEL_WINDOW_CAPTION"; $3)

SCPT_XL("window_set_caption")
ERR_MethodTrackerReturn("SCPT_XL_win_set_caption"; $_t_oldMethodName)