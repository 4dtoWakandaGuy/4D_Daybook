//%attributes = {}
If (False:C215)
	
	
	// ----------------------------------------------------
	//Creator: Nigel Greenlee
	//Date & time: 21/01/2010 18:09
	//Method Name: Error_ExtendedReport
	//Description
	
	//Parameters
	//Declarations
	// ----------------------------------------------------
	//Project method Amendments
	//End Project method Amendments
	
End if 
C_LONGINT:C283(ERR_l_ReportAction)
C_TEXT:C284(Err_T_UserText; Err_T_DetailText; Err_T_InfoText)
DB_ErrorReportSettings
If (Count parameters:C259>=3)
	Err_T_InfoText:=$1
	Err_T_DetailText:=$2
	Err_T_UserText:=$3
	If (Count parameters:C259>=4)
		$_l_WindowType:=$4
	Else 
		$_l_WindowType:=1
	End if 
	If (Count parameters:C259>=6)
		$EmailFromPerson:=$5
		$EmailFromAddress:=$6
	End if 
Else 
	C_BOOLEAN:C305(<>Email_bo_PersonInited)
	While (Semaphore:C143("InitEmail"))
		DelayTicks(2)
	End while 
	If (<>Email_bo_PersonInited=False:C215)
		LOGIN_SetEmail
	End if 
	CLEAR SEMAPHORE:C144("InitEmail")
	
	
	Err_T_InfoText:="INFO"
	Err_T_DetailText:="DETAIL"
	Err_T_UserText:=""
	Case of   //Sender Address
		: (<>Per_at_PersonnelNames_EmailFrom#"")
			$EmailFromAddress:=<>Per_at_PersonnelNames_EmailFrom
		: (<>DB_t_UserGrEmailSMTP#"")
			$EmailFromAddress:=<>DB_t_UserGrEmailFrom
		Else 
			$EmailFromAddress:=<>EMAIL_t_DefaultReplyToAddress
	End case 
	$EmailFromPerson:=DB_GetOrganisation
End if 
ARRAY TEXT:C222(Err_at_aAttachements; 0)
ARRAY TEXT:C222(Err_at_aAttachementsPATH; 0)
$_l_ScreenCentreVertical:=Screen width:C187/2
$_t_ErrorHandlingMethod:=Method called on error:C704
ON ERR CALL:C155("")
C_LONGINT:C283(WIN_l_CurrentWinRef; WIN_l_CurrentWinRefOLD)
$_l_CurrentWinRefOLD:=WIN_l_CurrentWinRef
WIN_l_CurrentWinRef:=Open window:C153($_l_ScreenCentreVertical; 110; $_l_ScreenCentreVertical; 110; $_l_WindowType)
DIALOG:C40([USER:15]; "Error_Report")
CLOSE WINDOW:C154
WIN_l_CurrentWinRef:=$_l_CurrentWinRefOLD


Case of 
	: (ERR_l_ReportAction=1)
		$_t_ErrorHandlingMethod:=Method called on error:C704
		ON ERR CALL:C155("")
		
		$_t_EmailText:=DB_GetOrganisation+Char:C90(13)+<>PER_t_CurrentUserInitials+" "+<>PER_t_CurrentUserName+Char:C90(13)+Err_T_InfoText+Char:C90(13)+Err_T_DetailText+Char:C90(13)+Err_T_UserText
		//Need to add attackments list here
		$_t_EmailSentTo:="To"
		If ($_t_EmailText="")
			$_t_EmailText:="Here-from Error_ExtendedReport   a blank email"
			
		End if 
		If (Err_T_UserText#"")
			EMAIL_t_SendCalledFrom:="Error_ExtendedReport(1)"
			$_t_EmailID:=Email_Send(->$_t_EmailSentTo; -><>DB_t_ErrorReportPerson; -><>DB_t_ErrorReportAddress; $EmailFromPerson; $EmailFromAddress; $EmailFromAddress; "Daybook Error Auto Report-user comment added"; ->Err_at_aAttachementsPATH; ->$_t_EmailText; False:C215)
		Else 
			EMAIL_t_SendCalledFrom:="Error_ExtendedReport(2)"
			$_t_EmailID:=Email_Send(->$_t_EmailSentTo; -><>DB_t_ErrorReportPerson; -><>DB_t_ErrorReportAddress; $EmailFromPerson; $EmailFromAddress; $EmailFromAddress; "Daybook Error Auto Report"; ->Err_at_aAttachementsPATH; ->$_t_EmailText; False:C215)
		End if 
End case 
If ($_t_ErrorHandlingMethod#"")
	ON ERR CALL:C155($_t_ErrorHandlingMethod)
End if 
