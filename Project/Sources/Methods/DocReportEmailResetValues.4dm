//%attributes = {}
If (False:C215)
	//Project Method Name:      DocReportEmailResetValues
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 17/11/2009 10:00
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(EMail_at_DocEmailTo;0)
	//ARRAY TEXT(REP_at_DocReportTo;0)
	C_BOOLEAN:C305($_bo_isTextArray; $_bo_LoadEMailSettings; $_bo_NotNilRecipients)
	C_LONGINT:C283($_l_NumberOfRecipients; $_l_ReportRow; DOC_l_CopyToPrinter; DOC_l_docDoEmail; DOC_l_docDoPdf; DOC_l_DocDoPrint)
	C_POINTER:C301($_Ptr_AndPrint; $_ptr_DocEmail; $_ptr_DocPDF; $_Ptr_DocPrint; $_ptr_DocumentName; $_ptr_EmailBody; $_ptr_EmailFrom; $_ptr_EmailTitle; $_ptr_EMailTo; $_ptr_EmailToRole; $_Ptr_TemplateCode)
	C_POINTER:C301($10; $11; $12; $2; $3; $4; $5; $6; $7; $8; $9)
	C_TEXT:C284($_t_DocEMailtoSTR; $_t_oldMethodName; $_t_ReportToEm; $_t_ReportToEmail; $_t_SRReportCode; $1; DOC_t_DocEmailFrom; DOC_t_DocumentName; DOC_t_EmailBodyReport; DOC_t_EmailSubject; DOC_t_TemplateCode)
	C_TEXT:C284(EMAIL_t_DocEmailRoletoText; email_t_Role; Rep_t_docEmailToTxt)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DocReportEmailResetValues")
$_l_ReportRow:=0

Case of 
	: (Undefined:C82(REP_at_DocReportTo))
		ARRAY TEXT:C222(REP_at_DocReportTo; 0)
		
	: (Type:C295(REP_at_DocReportTo)#String array:K8:15) & (Type:C295(REP_at_DocReportTo)#Text array:K8:16)
		ARRAY TEXT:C222(REP_at_DocReportTo; 0)
	Else 
End case 



If (Size of array:C274(REP_at_DocReportTo)>0)
	If (Count parameters:C259>=1)
		//$_l_ReportRow:=$1
		$_t_SRReportCode:=$1
		//$_l_Row:=Find in array(REP_at_DocReportTo;
		//REP_at_DocReportTo{$_l_ReportRow}
		If (Count parameters:C259>=12)
			$_ptr_TemplateCode:=$2
			$_Ptr_DocPrint:=$3
			$_ptr_DocPDF:=$4
			$_ptr_DocEmail:=$5
			$_Ptr_AndPrint:=$6
			$_ptr_DocumentName:=$7
			$_ptr_EmailFrom:=$8
			$_ptr_EmailTitle:=$9
			$_ptr_EmailBody:=$10
			$_ptr_EMailTo:=$11
			$_ptr_EmailToRole:=$12
			$_t_ReportToEmail:=$_ptr_EMailTo->
			$_bo_LoadEMailSettings:=True:C214
		Else 
			
			$_ptr_TemplateCode:=->DOC_t_TemplateCode
			$_Ptr_DocPrint:=->DOC_l_DocDoPrint
			$_ptr_DocPDF:=->DOC_l_docDoPdf
			$_ptr_DocEmail:=->DOC_l_docDoEmail
			$_Ptr_AndPrint:=->DOC_l_CopyToPrinter
			$_ptr_DocumentName:=->DOC_t_DocumentName
			$_ptr_EmailFrom:=->DOC_t_DocEmailFrom
			$_ptr_EmailTitle:=->DOC_t_EmailSubject
			$_ptr_EmailBody:=->DOC_t_EmailBodyReport
			$_ptr_EMailTo:=->Rep_t_docEmailToTxt
			$_ptr_EmailToRole:=->EMAIL_t_DocEmailRoletoText
			
		End if 
		
	Else 
		$_l_ReportRow:=REP_at_DocReportTo
		$_t_SRReportCode:=REP_at_DocReportTo{$_l_ReportRow}
		$_ptr_TemplateCode:=->DOC_t_TemplateCode
		$_Ptr_DocPrint:=->DOC_l_DocDoPrint
		$_ptr_DocPDF:=->DOC_l_docDoPdf
		$_ptr_DocEmail:=->DOC_l_docDoEmail
		$_Ptr_AndPrint:=->DOC_l_CopyToPrinter
		$_ptr_DocumentName:=->DOC_t_DocumentName
		$_ptr_EmailFrom:=->DOC_t_DocEmailFrom
		$_ptr_EmailTitle:=->DOC_t_EmailSubject
		$_ptr_EmailBody:=->DOC_t_EmailBodyReport
		$_ptr_EMailTo:=->Rep_t_docEmailToTxt
		$_ptr_EmailToRole:=->EMAIL_t_DocEmailRoletoText
	End if 
	Reports_prefsLoad($_t_SRReportCode; $_Ptr_TemplateCode; $_Ptr_DocPrint; $_ptr_DocPDF; $_ptr_DocEmail; $_Ptr_AndPrint; $_ptr_DocumentName; $_ptr_EmailFrom; $_ptr_EmailTitle; $_ptr_EmailBody; $_ptr_EMailTo; $_ptr_EmailToRole)
	If ($_bo_LoadEMailSettings)
		Case of 
			: (Undefined:C82(EMail_at_DocEmailTo))
				ARRAY TEXT:C222(EMail_at_DocEmailTo; 0)
				
			: (Type:C295(EMail_at_DocEmailTo)#String array:K8:15) & (Type:C295(EMail_at_DocEmailTo)#Text array:K8:16)
				ARRAY TEXT:C222(EMail_at_DocEmailTo; 0)
			Else 
		End case 
		If ($_t_ReportToEmail#"")
			$_l_ReportRow:=Find in array:C230(EMail_at_DocEmailTo; $_t_ReportToEmail)
		Else 
			
			If ($_l_ReportRow<1)
				If (Size of array:C274(EMail_at_DocEmailTo)>0)
					$_l_ReportRow:=1
					EMail_at_DocEmailTo:=$_l_ReportRow
				End if 
			End if 
		End if 
		
		$_bo_isTextArray:=(Type:C295(EMail_at_DocEmailTo)=String array:K8:15) | (Type:C295(EMail_at_DocEmailTo)=Text array:K8:16)
		$_l_NumberOfRecipients:=Size of array:C274(EMail_at_DocEmailTo)
		$_bo_NotNilRecipients:=($_l_NumberOfRecipients>0)
		
		If ($_bo_NotNilRecipients) & ($_bo_isTextArray)
			If ($_l_NumberOfRecipients>$_l_ReportRow) & ($_l_ReportRow>0)
				$_t_DocEMailtoSTR:=EMail_at_DocEmailTo{$_l_ReportRow}
			End if 
		End if 
		
		email_t_Role:=EMAIL_t_DocEmailRoletoText
		//Doc_t_EMailRoleToText
		Case of 
			: ($_t_DocEMailtoSTR="Contact where Role is")
				OBJECT SET VISIBLE:C603(*; "emailRole@"; True:C214)
				
			Else 
				OBJECT SET VISIBLE:C603(*; "emailRole@"; False:C215)
		End case 
	End if 
End if 
ERR_MethodTrackerReturn("DocReportEmailResetValues"; $_t_oldMethodName)
