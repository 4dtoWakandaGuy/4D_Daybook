//%attributes = {}
If (False:C215)
	//Project Method Name:      SCPT_XL_sheet_create
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 27/06/2013 16:37
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

$_t_oldMethodName:=ERR_MethodTracker("SCPT_XL_sheet_create")


SCPT_XL_SetParameter("XCEL_WORKBOOK_NAME"; $1)

$0:=SCPT_XL("sheet_add")
ERR_MethodTrackerReturn("SCPT_XL_sheet_create"; $_t_oldMethodName)