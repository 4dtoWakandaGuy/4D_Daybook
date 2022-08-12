//%attributes = {}
If (False:C215)
	//Project Method Name:      SCPT_XL_workbook_save_as_sylk
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
	C_TEXT:C284($_t_oldMethodName; $0; $1; $2)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SCPT_XL_workbook_save_as_sylk")


SCPT_XL_SetParameter("XCEL_WORKBOOK_NAME"; $1)
SCPT_XL_SetParameter("XCEL_DOCUMENT_PATH"; $2)

$0:=SCPT_XL("workbook_save_as_sylk")
ERR_MethodTrackerReturn("SCPT_XL_workbook_save_as_sylk"; $_t_oldMethodName)