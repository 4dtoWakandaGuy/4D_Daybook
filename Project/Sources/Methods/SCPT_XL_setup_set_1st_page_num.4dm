//%attributes = {}
If (False:C215)
	//Project Method Name:      SCPT_XL_setup_set_1st_page_num
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
	C_LONGINT:C283($3)
	C_TEXT:C284($_t_oldMethodName; $1; $2)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SCPT_XL_setup_set_1st_page_num")


SCPT_XL_SetParameter("XCEL_WORKBOOK_NAME"; $1)
SCPT_XL_SetParameter("XCEL_SHEET_NAME"; $2)
SCPT_XL_SetParameter("XCEL_PAGE_SETUP_FIRST_PAGE_NUMBER"; String:C10($3))

SCPT_XL("setup_set_first_page_number")
ERR_MethodTrackerReturn("SCPT_XL_setup_set_1st_page_num"; $_t_oldMethodName)