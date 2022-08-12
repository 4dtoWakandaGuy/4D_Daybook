If (False:C215)
	//object Method Name: Object Name:      [USER].User_In.REP_at_DocReportTo1
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
	//ARRAY POINTER(SR_aptr_PrefsToLoad;0)
	//ARRAY POINTER(SR_aptr_PrefsToSave;0)
	//ARRAY TEXT(REP_at_DocReportTo;0)
	//ARRAY TEXT(SR_at_EmailPrintOption1;0)
	//ARRAY TEXT(SR_at_EmailPrintOption2;0)
	//ARRAY TEXT(SR_at_EmailPrintOption3;0)
	//ARRAY TEXT(SR_at_EmailPrintOption4;0)
	C_BOOLEAN:C305(DB_bo_NoLoad)
	C_LONGINT:C283(DOC_l_CopyToPrinter; DOC_l_docDoEmail; DOC_l_docDoPdf; DOC_l_DocDoPrint; SR_l_CompSettingsOverrideSR; SR_l_CompSettingsUseStandardSR)
	C_TEXT:C284($_t_oldMethodName; DOC_t_DocEmailFrom; DOC_t_DocumentName; DOC_t_EmailBodyReport; DOC_t_EmailSubject; DOC_t_TemplateCode; EMAIL_t_DocEmailRoletoText; REP_t_CurrentSRDocReport; Rep_t_docEmailToTxt; SR_t_EmailPrintOption2Cont; SR_t_EmailPrintOption2Email)
	C_TEXT:C284(SR_t_EmailPrintOption2Pers; SR_t_EmailPrintOption2Role; SR_t_EmailPrintOption3Cont; SR_t_EmailPrintOption3Email; SR_t_EmailPrintOption3Pers; SR_t_EmailPrintOption3Role)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].User_In.REP_at_DocReportTo1"; Form event code:C388)

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
		
		
		//NOTE -kmw - as at 17/11/08 v631b120i -There is a limitation in functionality in that changes to reprots are saved even if user cancels out of prefernces - needs to be dealt with at some stage.
		ARRAY POINTER:C280(SR_aptr_PrefsToSave; 0)
		Reports_BuildArrayofElements(->SR_aptr_PrefsToSave; ->SR_l_CompSettingsUseStandardSR; ->SR_l_CompSettingsOverrideSR; ->SR_at_EmailPrintOption1; ->SR_at_EmailPrintOption2; ->SR_t_EmailPrintOption2Email; ->SR_t_EmailPrintOption2Cont; ->SR_t_EmailPrintOption2Role; ->SR_t_EmailPrintOption2Pers; ->SR_at_EmailPrintOption3; ->SR_t_EmailPrintOption3Email; ->SR_t_EmailPrintOption3Cont; ->SR_t_EmailPrintOption3Role; ->SR_t_EmailPrintOption3Pers; ->SR_at_EmailPrintOption4)
		TRACE:C157
		//save the previously selected report
		//REP_t_CurrentSRDocReport:=Self->{Self->}
		If (REP_t_CurrentSRDocReport#"")
			Reports_PrefsSaveNEW(REP_t_CurrentSRDocReport; "REPORT"; ->SR_aptr_PrefsToSave; Table:C252(->[DOCUMENTS:7]); 0)  //Added 14/11/08 v631b120i -kmw
		End if 
		DocReportEmailResetValues(REP_at_DocReportTo{REP_at_DocReportTo}; ->DOC_t_TemplateCode; ->DOC_l_DocDoPrint; ->DOC_l_docDoPdf; ->DOC_l_docDoEmail; ->DOC_l_CopyToPrinter; ->DOC_t_DocumentName; ->DOC_t_DocEmailFrom; ->DOC_t_EmailSubject; ->DOC_t_EmailBodyReport; ->Rep_t_docEmailToTxt; ->EMAIL_t_DocEmailRoletoText)
		
		REP_t_CurrentSRDocReport:=REP_at_DocReportTo{REP_at_DocReportTo}  //Added 17/11/08 v631b120i -kmw
		ARRAY POINTER:C280(SR_aptr_PrefsToLoad; 0)
		Reports_PrefsLoadNEW(REP_t_CurrentSRDocReport; "REPORT"; ->SR_aptr_PrefsToLoad; False:C215; Table:C252(->[DOCUMENTS:7]); 0)  //Added 02/12/08 v631b120i -kmw
		
		Reports_PrefsSetVisibility(SR_at_EmailPrintOption1; SR_at_EmailPrintOption2; SR_at_EmailPrintOption3)
		
		//Added 14/11/08 v631b120i -kmw
		
	Else 
End case 

ERR_MethodTrackerReturn("OBJ [USER].User_In.REP_at_DocReportTo1"; $_t_oldMethodName)
