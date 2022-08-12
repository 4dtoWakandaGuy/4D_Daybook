//%attributes = {}
If (False:C215)
	//Project Method Name:      SCPT_XL_workbook_create
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 28/06/2013 06:28
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName; $0)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SCPT_XL_workbook_create")

//by default, "sheet{n}" on Mac, "Book{n}" on PC

//creates a new workbook and returns its name.
//the name can be used to later reference an open workbook.
//on Mac, the application is immediately visible; on PC it is hidden by default.

$0:=SCPT_XL("workbook_add")
ERR_MethodTrackerReturn("SCPT_XL_workbook_create"; $_t_oldMethodName)