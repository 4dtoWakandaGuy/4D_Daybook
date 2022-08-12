If (False:C215)
	//object Name: [USER]User_In.EMail_at_DocEmailTo
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
	//ARRAY TEXT(EMail_at_DocEmailTo;0)
	//ARRAY TEXT(REP_at_DocReportTo;0)
	C_BOOLEAN:C305(DB_bo_NoLoad)
	C_LONGINT:C283(DOC_l_CopyToPrinter; DOC_l_docDoEmail; DOC_l_docDoPdf; DOC_l_DocDoPrint)
	C_TEXT:C284($_t_DocEmailtoSTR; $_t_oldMethodName; DOC_t_DocEmailFrom; DOC_t_DocumentName; DOC_t_EmailBodyReport; DOC_t_EmailSubject; DOC_t_TemplateCode; EMAIL_t_DocEmailRoletoText; Rep_t_docEmailToTxt)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].User_In.EMail_at_DocEmailTo"; Form event code:C388)

Case of 
	: (Form event code:C388=On Load:K2:1) & (Not:C34(DB_bo_NoLoad))
		ARRAY TEXT:C222(EMail_at_DocEmailTo; 4)
		EMail_at_DocEmailTo{1}:="Contact"
		EMail_at_DocEmailTo{2}:="Contact where Role is"
		EMail_at_DocEmailTo{3}:="Accounts payable email"
		EMail_at_DocEmailTo{4}:="Accounts receivable email"
		
		DocReportEmailResetValues(REP_at_DocReportTo{REP_at_DocReportTo}; ->DOC_t_TemplateCode; ->DOC_l_DocDoPrint; ->DOC_l_docDoPdf; ->DOC_l_docDoEmail; ->DOC_l_CopyToPrinter; ->DOC_t_DocumentName; ->DOC_t_DocEmailFrom; ->DOC_t_EmailSubject; ->DOC_t_EmailBodyReport; ->Rep_t_docEmailToTxt; ->EMAIL_t_DocEmailRoletoText)
		
		
	: ((Form event code:C388=On Data Change:K2:15) | (Form event code:C388=On Clicked:K2:4))
		
		$_t_DocEmailtoSTR:=EMail_at_DocEmailTo{EMail_at_DocEmailTo}
		
		Case of 
			: ($_t_DocEmailtoSTR="Contact where Role is")
				OBJECT SET VISIBLE:C603(*; "emailRole@"; True:C214)
				
				
				
			Else 
				OBJECT SET VISIBLE:C603(*; "emailRole@"; False:C215)
				
		End case 
		
	Else 
End case 

ERR_MethodTrackerReturn("OBJ [USER].User_In.EMail_at_DocEmailTo"; $_t_oldMethodName)
