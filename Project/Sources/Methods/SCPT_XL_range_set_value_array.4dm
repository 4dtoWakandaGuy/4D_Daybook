//%attributes = {}
If (False:C215)
	//Project Method Name:      SCPT_XL_range_set_value_array
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 28/06/2013 06:43
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($i)
	C_POINTER:C301($4)
	C_TEXT:C284($_t_oldMethodName; $1; $2; $3)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SCPT_XL_range_set_value_array")


SCPT_XL_SetParameter("XCEL_WORKBOOK_NAME"; $1)
SCPT_XL_SetParameter("XCEL_SHEET_NAME"; $2)
SCPT_XL_SetParameter("XCEL_RANGE"; $3)


For ($i; 1; Size of array:C274($4->))
	SCPT_XL_SetParameter("XCEL_VALUE"+String:C10($i); $4->{$i})
End for 

SCPT_XL("range_set_value_array")
ERR_MethodTrackerReturn("SCPT_XL_range_set_value_array"; $_t_oldMethodName)