//%attributes = {}
If (False:C215)
	//Project Method Name:      SCPT_XL_workbook_save
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 28/06/2013 06:25
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName; $1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SCPT_XL_workbook_save")


SCPT_XL_SetParameter("XCEL_WORKBOOK_NAME"; $1)

SCPT_XL("workbook_save")
ERR_MethodTrackerReturn("SCPT_XL_workbook_save"; $_t_oldMethodName)