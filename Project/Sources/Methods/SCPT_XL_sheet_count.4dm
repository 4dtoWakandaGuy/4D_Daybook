//%attributes = {}
If (False:C215)
	//Project Method Name:      SCPT_XL_sheet_count
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
	C_LONGINT:C283($0)
	C_TEXT:C284($_t_oldMethodName; $1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SCPT_XL_sheet_count")


SCPT_XL_SetParameter("XCEL_WORKBOOK_NAME"; $1)

$0:=Num:C11(SCPT_XL("sheet_count"))
ERR_MethodTrackerReturn("SCPT_XL_sheet_count"; $_t_oldMethodName)