If (False:C215)
	//object Name: [COMPANIES]Company_In.REP_at_DocReportTo1
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:06
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
	C_TEXT:C284($_t_oldMethodName; DOC_t_DocEmailFrom; DOC_t_DocumentName; DOC_t_EmailBodyReport; DOC_t_EmailSubject; DOC_t_TemplateCode; EMAIL_t_DocEmailRoletoText; REP_t_CurrentSRDocReport; Rep_t_docEmailToTxt)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [COMPANIES].Company_In.REP_at_DocReportTo1"; Form event code:C388)

Case of 
	: (Form event code:C388=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		
		
		ARRAY TEXT:C222(REP_at_DocReportTo; 0)
		//User_SREdit (True)
		User_SREdit(True:C214; True:C214)  //26/11/08 v631b120i -kmw (changed to hide disabled super reports)
		
		If (Records in selection:C76([DOCUMENTS:7])>0)
			ORDER BY:C49([DOCUMENTS:7]; [DOCUMENTS:7]Document_Code:1)
			SELECTION TO ARRAY:C260([DOCUMENTS:7]Document_Code:1; REP_at_DocReportTo)
			REDUCE SELECTION:C351([DOCUMENTS:7]; 0)
			REP_at_DocReportTo:=1
		Else 
			REP_at_DocReportTo:=0
		End if 
		DocReportEmailResetValues(REP_at_DocReportTo{REP_at_DocReportTo}; ->DOC_t_TemplateCode; ->DOC_l_DocDoPrint; ->DOC_l_docDoPdf; ->DOC_l_docDoEmail; ->DOC_l_CopyToPrinter; ->DOC_t_DocumentName; ->DOC_t_DocEmailFrom; ->DOC_t_EmailSubject; ->DOC_t_EmailBodyReport; ->Rep_t_docEmailToTxt; ->EMAIL_t_DocEmailRoletoText)
		
		
	: ((Form event code:C388=On Data Change:K2:15) | (Form event code:C388=On Clicked:K2:4))
		
		
		
		//NOTE -kmw - as at 17/11/08 v631b120i -There is a limitation in functionality in that changes to reprots are saved even if user cancels out of prefernces - needs to be dealt with at some stage.
		
		
		
		Companies_SaveDocOptions(False:C215)
		
		//DocReportEmailResetValues (not really needed as we are only using for certain arrays to be availabel when we check defaults)
		REP_t_CurrentSRDocReport:=REP_at_DocReportTo{REP_at_DocReportTo}  //Added 19/11/08 v631b120i -kmw
		
		
		Companies_DisplayDocOptions(False:C215)
		
		
	Else 
End case 

ERR_MethodTrackerReturn("OBJ [COMPANIES].Company_In.REP_at_DocReportTo1"; $_t_oldMethodName)
