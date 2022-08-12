If (False:C215)
	//object Name: [DOCUMENTS]Report_in.iReportTabHlist
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:07
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(DB_bo_NoLoad)
	C_LONGINT:C283($_l_CurrentFormPage; $_l_FormEvent; $_l_TabRow; DOC_l_CopyToPrinter; DOC_l_docDoEmail; DOC_l_docDoPdf; DOC_l_DocDoPrint; iReportTabHlist)
	C_TEXT:C284($_t_oldMethodName; DOC_t_DocEmailFrom; DOC_t_DocumentName; DOC_t_EmailBodyReport; DOC_t_EmailSubject; DOC_t_TemplateCode; EMAIL_t_DocEmailRoletoText; Rep_t_docEmailToTxt)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [DOCUMENTS].Report_in.iReportTabHlist"; Form event code:C388)

$_l_FormEvent:=Form event code:C388
Case of 
	: ($_l_FormEvent=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		iReportTabHlist:=Load list:C383("tabDocument")
		//Reports_prefsLoad 
		Reports_prefsLoad([DOCUMENTS:7]Document_Code:1; ->DOC_t_TemplateCode; ->DOC_l_DocDoPrint; ->DOC_l_docDoPdf; ->DOC_l_docDoEmail; ->DOC_l_CopyToPrinter; ->DOC_t_DocumentName; ->DOC_t_DocEmailFrom; ->DOC_t_EmailSubject; ->DOC_t_EmailBodyReport; ->Rep_t_docEmailToTxt; ->EMAIL_t_DocEmailRoletoText)
		
	: ($_l_FormEvent=On Clicked:K2:4)
		$_l_CurrentFormPage:=FORM Get current page:C276
		$_l_TabRow:=Shell_tabHlistGetRef(iReportTabHlist)
		
		If (($_l_TabRow=2) & (Is new record:C668([DOCUMENTS:7])))
			iReportTabHlist:=Load list:C383("tabDocument")  //Added 02/12/08 v631b120i -kmw (Page_1 remined th eone being shown but tab control itself was looking like it shoul dbe displaying page two)
			Gen_Alert("Please save the super report record first before setting the print preferences!")
		Else 
			If ($_l_CurrentFormPage#$_l_TabRow)
				FORM GOTO PAGE:C247($_l_TabRow)
			End if 
		End if 
		
	: ($_l_FormEvent=On Unload:K2:2)
		If (Is a list:C621(iReportTabHlist))
			CLEAR LIST:C377(iReportTabHlist)
		End if 
End case 

ERR_MethodTrackerReturn("OBJ [DOCUMENTS].Report_in.iReportTabHlist"; $_t_oldMethodName)
