//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      SCPT_XL_samples_workbook
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
	C_TEXT:C284($_t_FullName; $_t_oldMethodName; $_t_workbook)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SCPT_XL_samples_workbook")

//methods:
//http://msdn.microsoft.com/en-us/library/bb225767(v=office.12).aspx
//properties:
//http://msdn.microsoft.com/en-us/library/bb245609(v=office.12).aspx

SCPT_XL_workbook_close_all
$_t_workbook:=SCPT_XL_workbook_create
SCPT_XL_APPLICATION("show")

//SaveAs
//http://msdn.microsoft.com/en-us/library/bb214129(v=office.12).aspx
$_t_workbook:=SCPT_XL_workbook_save_as_xml($_t_workbook; System folder:C487(Desktop:K41:16)+"sample.xml")
$_t_workbook:=SCPT_XL_workbook_save_as_csv($_t_workbook; System folder:C487(Desktop:K41:16)+"sample.csv")
$_t_workbook:=SCPT_XL_workbook_save_as_sylk($_t_workbook; System folder:C487(Desktop:K41:16)+"sample.slk")
$_t_workbook:=SCPT_XL_workbook_save_as_dif($_t_workbook; System folder:C487(Desktop:K41:16)+"sample.dif")
$_t_workbook:=SCPT_XL_workbook_save_as_xls($_t_workbook; System folder:C487(Desktop:K41:16)+"sample.xls")
$_t_workbook:=SCPT_XL_workbook_save_as_xlsx($_t_workbook; System folder:C487(Desktop:K41:16)+"sample.xlsx")

//note: a newly created workbook must be 'saved as', before it can be 'saved'

//for full list of file formats, see;
//http://msdn.microsoft.com/en-us/library/bb241279(v=office.12).aspx

//if the full name is not a document path, the workbook is probably not saved yet
$_t_FullName:=SCPT_XL_workbook_get_full_name($_t_workbook)

//Save
//http://msdn.microsoft.com/en-us/library/bb177993(v=office.12).aspx
SCPT_XL_workbook_save($_t_workbook)

//note: on Mac, the overwrite property is set to True.
//on Windows we suspend alerts to achieve the same effect

//SendForReview
//http://msdn.microsoft.com/en-us/library/bb178022(v=office.12).aspx
SCPT_XL_workbook_send_mail_revi($_t_workbook; "miyako@4d-japan.com"; "test")

//SendMail
//http://msdn.microsoft.com/en-us/library/bb178034(v=office.12).aspx
SCPT_XL_workbook_send_mail($_t_workbook; "miyako@4d-japan.com"; "test")

//on Mac, the send mail method opens Mail with the document attatched;
//the Windows equivalent is SendForReview.
//(SendMail onWindows will send immediately)
//on Windows, the workbook must be saved in 'xlShared (2)' mode for it to be attached to am e-mail

//PrintOut
//http://msdn.microsoft.com/en-us/library/bb179158(v=office.12).aspx
SCPT_XL_workbook_print_out($_t_workbook; 1)

//WebPagePreview
//http://msdn.microsoft.com/en-us/library/bb210042(v=office.12).aspx
SCPT_XL_workbook_web_page_previ($_t_workbook)

//TRACE

//Close
//http://msdn.microsoft.com/en-us/library/bb179153(v=office.12).aspx
SCPT_XL_workbook_close($_t_workbook)

//note: since we have a 'save' method, 'close' will not save any changes.
//as documented, the auto close macros are not fired in this context.

//test on both Mac and PC
ERR_MethodTrackerReturn("SCPT_XL_samples_workbook"; $_t_oldMethodName)
