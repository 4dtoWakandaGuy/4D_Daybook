//%attributes = {}
If (False:C215)
	//Project Method Name:      SCPT_XL_setup_get_footer_margin
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 28/06/2013 06:44
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_REAL:C285($0)
	C_TEXT:C284($_t_oldMethodName; $1; $2)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SCPT_XL_setup_get_footer_margin")


SCPT_XL_SetParameter("XCEL_WORKBOOK_NAME"; $1)
SCPT_XL_SetParameter("XCEL_SHEET_NAME"; $2)

$0:=Num:C11(SCPT_XL("setup_get_footer_margin"))
ERR_MethodTrackerReturn("SCPT_XL_setup_get_footer_margin"; $_t_oldMethodName)