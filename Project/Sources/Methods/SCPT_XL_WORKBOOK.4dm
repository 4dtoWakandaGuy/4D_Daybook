//%attributes = {}
If (False:C215)
	//Project Method Name:      SCPT_XL_WORKBOOK
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 27/06/2013 06:21
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

$_t_oldMethodName:=ERR_MethodTracker("SCPT_XL_WORKBOOK")
If (Count parameters:C259>=1)
	Case of 
		: ($1="CLOSE_ALL")
			SCPT_XL("workbook_close_all")
			
		: ($1="ADD")
			SCPT_XL("workbook_add")
			
	End case 
End if 
ERR_MethodTrackerReturn("SCPT_XL_WORKBOOK"; $_t_oldMethodName)
