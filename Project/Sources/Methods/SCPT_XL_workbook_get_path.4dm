//%attributes = {}
If (False:C215)
	//Project Method Name:      SCPT_XL_workbook_get_path
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
	C_TEXT:C284($_t_oldMethodName; $0; $1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SCPT_XL_workbook_get_path")


SCPT_XL_SetParameter("XCEL_WORKBOOK_NAME"; $1)

$0:=SCPT_XL("workbook_get_path")
ERR_MethodTrackerReturn("SCPT_XL_workbook_get_path"; $_t_oldMethodName)