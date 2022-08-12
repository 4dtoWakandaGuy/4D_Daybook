//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Jobs_PPQtnF
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 13/11/2009 14:00
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(SR_bo_Validated)
	C_LONGINT:C283($_l_Printed)
	C_TEXT:C284($_t_CurrentWindowTitle; $_t_DocumentName; $_t_Nul; $_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Jobs_PPQtnF")
SR_bo_Validated:=False:C215
Menu_Record("Jobs_PPQtnF"; "Quotation Form")
Jobs_PPBef
//Gen_PPSingle (->[JOBS];"Form";"Jobs Out";"Qtn";"JOB QTN";"Jobs_PPFormL2")
$_t_Nul:=""  // 05/04/04 pb
$_t_DocumentName:="Job "+[JOBS:26]Job_Code:1
$_t_CurrentWindowTitle:=Get window title:C450
SET WINDOW TITLE:C213($_t_DocumentName)
$_l_Printed:=Gen_PPSingle(->[JOBS:26]; "Form"; "Jobs Out"; "Qtn"; "JOB QTN"; "Jobs_PPFormL2"; 0; ->$_t_Nul; ""; ""; False:C215; $_t_DocumentName)  // 05/04/04 pb
SET WINDOW TITLE:C213($_t_CurrentWindowTitle)
ERR_MethodTrackerReturn("Jobs_PPQtnF"; $_t_oldMethodName)