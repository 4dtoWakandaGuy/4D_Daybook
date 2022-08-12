//%attributes = {}
If (False:C215)
	//Project Method Name:      UserIn13_document_setInterface
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/11/2009`Method: UserIn13_document_setInterface
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(DOC_at_Prefix1;0)
	//ARRAY TEXT(DOC_at_Prefix2;0)
	C_BOOLEAN:C305($_bo_IsMacintosh)
	C_LONGINT:C283(bSetTarget; DOC_l_docDoEmail; DOC_l_docDoPdf; SYS_btn_OutFolder)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("UserIn13_document_setInterface")

$_bo_IsMacintosh:=Is macOS:C1572

//SET ENTERABLE(*;"@";DOC_l_docDoEmail=1)
OBJECT SET ENTERABLE:C238(*; "IR_EmailPrintOptionOth@"; ((DOC_l_docDoPdf=1) & (DOC_l_docDoEmail=1)))


If (DOC_l_docDoPdf=1) & (DOC_l_docDoEmail=1)
	OBJECT SET ENABLED:C1123(bSetTarget; True:C214)
	OBJECT SET ENABLED:C1123(DOC_at_Prefix1; True:C214)
	OBJECT SET ENABLED:C1123(DOC_at_Prefix2; True:C214)
	OBJECT SET ENABLED:C1123(SYS_btn_OutFolder; True:C214)
	
	OBJECT SET VISIBLE:C603(*; "IR_EmailPrintOptionOth@"; True:C214)
	
Else 
	OBJECT SET ENABLED:C1123(bSetTarget; False:C215)
	OBJECT SET ENABLED:C1123(DOC_at_Prefix1; False:C215)
	OBJECT SET ENABLED:C1123(DOC_at_Prefix2; False:C215)
	OBJECT SET ENABLED:C1123(SYS_btn_OutFolder; False:C215)
	
	OBJECT SET VISIBLE:C603(*; "IR_EmailPrintOptionOth@"; False:C215)
End if 

If ($_bo_IsMacintosh)
	OBJECT SET ENABLED:C1123(bSetTarget; False:C215)
End if 
//SET ENTERABLE(*;"f_s80_filePrefix";DOC_l_DocDoPrint=0)

ERR_MethodTrackerReturn("UserIn13_document_setInterface"; $_t_oldMethodName)
