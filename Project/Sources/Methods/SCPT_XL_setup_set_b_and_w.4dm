//%attributes = {}
If (False:C215)
	//Project Method Name:      SCPT_XL_setup_set_bo_and_w
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 28/06/2013 06:46
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

$_t_oldMethodName:=ERR_MethodTracker("SCPT_XL_setup_set_bo_and_w")


SCPT_XL_SetParameter("XCEL_WORKBOOK_NAME"; $1)
SCPT_XL_SetParameter("XCEL_SHEET_NAME"; $2)
SCPT_XL_SetParameter("XCEL_PAGE_SETUP_BLACK_AND_WHITE"; Choose:C955($3; "True"; "False"))

SCPT_XL("setup_set_black_and_white")
ERR_MethodTrackerReturn("SCPT_XL_setup_set_bo_and_w"; $_t_oldMethodName)