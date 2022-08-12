//%attributes = {}
If (False:C215)
	//Project Method Name:      Reports_SetPrefInterface
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/11/2009`Method: Reports_SetPrefInterface
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_GeneratePDF; $_bo_PrintCOpy; $1)
	C_LONGINT:C283(DOC_l_docDoEmail_copy; DOC_l_DocDoPDFcopy; DOC_l_DoPrintCopy; SYS_btn_OutFolder)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Reports_SetPrefInterface")

If (Count parameters:C259>0)
	$_bo_GeneratePDF:=$1
Else 
	$_bo_GeneratePDF:=False:C215
End if 
If (Count parameters:C259>=2)
	$_bo_PrintCOpy:=$1
Else 
	$_bo_PrintCOpy:=(DOC_l_DoPrintCopy=1)
End if 

If ($_bo_PrintCOpy)  //if ptint report (default is set) uncheck email
	DOC_l_docDoEmail_copy:=0
End if 
OBJECT SET VISIBLE:C603(*; "oCopyToPrinter@"; False:C215)

Case of 
	: (($_bo_GeneratePDF) & (Not:C34($_bo_PrintCOpy)))  //report is set to generate PDF and NOT attach to email
		DOC_l_docDoEmail_copy:=1
		OBJECT SET ENTERABLE:C238(*; "f_@"; True:C214)
		OBJECT SET ENTERABLE:C238(*; "oEmailBodyReport"; True:C214)
		OBJECT SET ENABLED:C1123(SYS_btn_OutFolder; True:C214)
		//_O_ENABLE BUTTON(SYS_btn_OutFolder)
		OBJECT SET ENTERABLE:C238(*; "oOutputFolderPath"; True:C214)
		
	: ((DOC_l_docDoEmail_copy=1) & (Not:C34($_bo_PrintCOpy)))  //report is set to generate PDF and attach to email
		
		OBJECT SET ENTERABLE:C238(*; "f_@"; True:C214)
		OBJECT SET ENTERABLE:C238(*; "oEmailBodyReport"; True:C214)
		//_O_ENABLE BUTTON(SYS_btn_OutFolder)
		OBJECT SET ENABLED:C1123(SYS_btn_OutFolder; True:C214)
		
		OBJECT SET ENTERABLE:C238(*; "oOutputFolderPath"; True:C214)
		OBJECT SET VISIBLE:C603(*; "oCopyToPrinter@"; True:C214)
	Else   //report is set to print only
		OBJECT SET ENTERABLE:C238(*; "f_@"; False:C215)
		OBJECT SET ENTERABLE:C238(*; "oEmailBodyReport"; False:C215)
		If (DOC_l_DocDoPDFcopy=1)
			//_O_ENABLE BUTTON(SYS_btn_OutFolder)
			OBJECT SET ENABLED:C1123(SYS_btn_OutFolder; True:C214)
			
			OBJECT SET ENTERABLE:C238(*; "oOutputFolderPath"; True:C214)
		Else 
			//_O_DISABLE BUTTON(SYS_btn_OutFolder)
			OBJECT SET ENABLED:C1123(SYS_btn_OutFolder; False:C215)
			OBJECT SET ENTERABLE:C238(*; "oOutputFolderPath"; False:C215)
		End if 
		
End case 

ERR_MethodTrackerReturn("Reports_SetPrefInterface"; $_t_oldMethodName)
