//%attributes = {}
If (False:C215)
	//Project Method Name:      SCPT_XL_shape_set_placement
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 27/06/2013 16:36
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($4)
	C_TEXT:C284($_t_oldMethodName; $1; $2; $3)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SCPT_XL_shape_set_placement")


SCPT_XL_SetParameter("XCEL_WORKBOOK_NAME"; $1)
SCPT_XL_SetParameter("XCEL_SHEET_NAME"; $2)
SCPT_XL_SetParameter("XCEL_SHAPE_NAME"; $3)
SCPT_XL_SetParameter("XCEL_SHAPE_PLACEMENT"; String:C10($4))

SCPT_XL("sheet_shape_set_placement")
ERR_MethodTrackerReturn("SCPT_XL_shape_set_placement"; $_t_oldMethodName)