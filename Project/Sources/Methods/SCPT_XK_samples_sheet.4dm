//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      SCPT_XK_samples_sheet
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 04/07/2013 11:24
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_Count)
	C_TEXT:C284($_t_ImagePath; $_t_oldMethodName; $_t_sheet; $_t_workbook)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SCPT_XK_samples_sheet")

//methods:
//http://msdn.microsoft.com/en-us/library/bb259445(v=office.12).aspx
//properties:
//http://msdn.microsoft.com/en-us/library/bb259443(v=office.12).aspx

SCPT_XL_workbook_close_all
$_t_workbook:=SCPT_XL_workbook_create
SCPT_XL_APPLICATION("show")

$_l_Count:=SCPT_XL_sheet_count($_t_workbook)

SCPT_XL_sheet_set_name($_t_workbook; 1; "New Sheet")
$_t_sheet:=SCPT_XL_sheet_get_name($_t_workbook; 1)

$_t_sheet:=SCPT_XL_sheet_create($_t_workbook)
SCPT_XL_sheet_set_name($_t_workbook; 2; "Even New Sheet")

$_t_ImagePath:=Get 4D folder:C485(Current resources folder:K5:16)+"Bluehound.gif"
SCPT_XL_sheet_set_background($_t_workbook; $_t_sheet; $_t_ImagePath)
SCPT_XL_workbook_close($_t_workbook)

//tested on Mac: OK
//tested on Win: OK

//TRACE
ERR_MethodTrackerReturn("SCPT_XK_samples_sheet"; $_t_oldMethodName)
