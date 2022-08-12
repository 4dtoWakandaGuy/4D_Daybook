//%attributes = {}
If (False:C215)
	//Project Method Name:      SCPT_XL_workbook_print_out
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 28/06/2013 06:27
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($2)
	C_TEXT:C284($_t_oldMethodName; $1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SCPT_XL_workbook_print_out")


SCPT_XL_SetParameter("XCEL_WORKBOOK_NAME"; $1)
SCPT_XL_SetParameter("XCEL_NUMBER_OF_COPIES"; String:C10($2))

SCPT_XL("workbook_print_out")
ERR_MethodTrackerReturn("SCPT_XL_workbook_print_out"; $_t_oldMethodName)