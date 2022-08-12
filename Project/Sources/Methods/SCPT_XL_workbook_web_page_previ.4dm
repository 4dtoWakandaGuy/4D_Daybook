//%attributes = {}
If (False:C215)
	//Project Method Name:      SCPT_XL_workbook_web_page_previ
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 27/06/2013 16:38
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

$_t_oldMethodName:=ERR_MethodTracker("SCPT_XL_workbook_web_page_previ")


SCPT_XL_SetParameter("XCEL_WORKBOOK_NAME"; $1)

$0:=SCPT_XL("workbook_web_page_preview")
ERR_MethodTrackerReturn("SCPT_XL_workbook_web_page_previ"; $_t_oldMethodName)