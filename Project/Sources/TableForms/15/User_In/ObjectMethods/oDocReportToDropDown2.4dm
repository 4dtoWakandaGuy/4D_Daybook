If (False:C215)
	//object Name: [USER]User_In.REP_at_DocReportTo
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/11/2009 18:16
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(REP_at_DocReportTo;0)
	C_BOOLEAN:C305(DB_bo_NoLoad)
	C_LONGINT:C283(DOC_l_CopyToPrinter; DOC_l_docDoEmail; DOC_l_docDoPdf; DOC_l_DocDoPrint)
	C_TEXT:C284($_t_oldMethodName; DOC_t_DocEmailFrom; DOC_t_DocumentName; DOC_t_EmailBodyReport; DOC_t_EmailSubject; DOC_t_TemplateCode; EMAIL_t_DocEmailRoletoText; Rep_t_docEmailToTxt)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].User_In.REP_at_DocReportTo"; Form event code:C388)

Case of 
	: (Form event code:C388=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		ARRAY TEXT:C222(REP_at_DocReportTo; 0)
		//User_SREdit (True)
		User_SREdit(True:C214; True:C214)  //26/11/08 v631b120i -kmw (changed to hide disabled super reports)
		ORDER BY:C49([DOCUMENTS:7]; [DOCUMENTS:7]Document_Code:1)
		SELECTION TO ARRAY:C260([DOCUMENTS:7]Document_Code:1; REP_at_DocReportTo)
		REDUCE SELECTION:C351([DOCUMENTS:7]; 0)
		If (Size of array:C274(REP_at_DocReportTo)>0)
			REP_at_DocReportTo:=1
		End if 
		DocReportEmailResetValues(REP_at_DocReportTo{REP_at_DocReportTo}; ->DOC_t_TemplateCode; ->DOC_l_DocDoPrint; ->DOC_l_docDoPdf; ->DOC_l_docDoEmail; ->DOC_l_CopyToPrinter; ->DOC_t_DocumentName; ->DOC_t_DocEmailFrom; ->DOC_t_EmailSubject; ->DOC_t_EmailBodyReport; ->Rep_t_docEmailToTxt; ->EMAIL_t_DocEmailRoletoText)
		
		
	: ((Form event code:C388=On Data Change:K2:15) | (Form event code:C388=On Clicked:K2:4))
		DocReportEmailResetValues(REP_at_DocReportTo{REP_at_DocReportTo}; ->DOC_t_TemplateCode; ->DOC_l_DocDoPrint; ->DOC_l_docDoPdf; ->DOC_l_docDoEmail; ->DOC_l_CopyToPrinter; ->DOC_t_DocumentName; ->DOC_t_DocEmailFrom; ->DOC_t_EmailSubject; ->DOC_t_EmailBodyReport; ->Rep_t_docEmailToTxt; ->EMAIL_t_DocEmailRoletoText)
		
	Else 
End case 

ERR_MethodTrackerReturn("OBJ [USER].User_In.REP_at_DocReportTo"; $_t_oldMethodName)
