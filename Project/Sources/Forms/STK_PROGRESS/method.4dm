
If (False:C215)
	//Database Method Name:      STK_PROGRESS
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  13/07/2019
	//Created BY:  Unknown
	
	//Date Modified: 
	//Modified By: DefaultUser
	//Modification notes
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(Err_at_aAttachementsPATH;0)
	C_BOOLEAN:C305(<>Email_bo_PersonInited; <>STK_bo_AllocationLog)
	C_LONGINT:C283($_l_Event)
	C_TEXT:C284(<>DB_t_UserGrEmailFrom; <>DB_t_UserGrEmailSMTP; <>EMAIL_t_DefaultReplyToAddress; <>Per_at_PersonnelNames_EmailFrom; <>PER_t_CurrentUserName; <>STK_T_AllocLog; $_t_EmailFromAddress; $_t_EmailID; $_t_EmailSentTo; $_t_EmailText; $_t_ErrorReportemail)
	C_TEXT:C284($_t_ErrorReportPerson; $_t_oldMethodName; $_T_ALLOCLOG; EMAIL_t_SendCalledFrom; STK_T_AllocLog; STK_T_AllocLog2)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("FM [projectForm]/STK_PROGRESS/{formMethod}"; Form event code:C388)

$_l_Event:=Form event code:C388
SET TIMER:C645(30)
Case of 
	: ($_l_Event=On Timer:K2:25)
		If (Not:C34(<>STK_bo_AllocationLog))
			While (Semaphore:C143("InitEmail"))
				DelayTicks(2)
			End while 
			If (<>Email_bo_PersonInited=False:C215)
				LOGIN_SetEmail
			End if 
			CLEAR SEMAPHORE:C144("InitEmail")
			$_t_EmailFromAddress:=""
			Case of   //Sender Address
				: (<>Per_at_PersonnelNames_EmailFrom#"")
					$_t_EmailFromAddress:=<>Per_at_PersonnelNames_EmailFrom
				: (<>DB_t_UserGrEmailSMTP#"")
					$_t_EmailFromAddress:=<>DB_t_UserGrEmailFrom
				Else 
					$_t_EmailFromAddress:=<>EMAIL_t_DefaultReplyToAddress
			End case 
			If ($_t_EmailFromAddress#"")
				$_t_EmailText:=<>STK_T_AllocLog
				$_t_EmailSentTo:="To"
				$_t_ErrorReportPerson:="Nigel Greenlee"
				$_t_ErrorReportemail:="Nigel.greenlee@me.com"
				EMAIL_t_SendCalledFrom:="Error_ReporterTool"
				ARRAY TEXT:C222(Err_at_aAttachementsPATH; 0)
				//TRACE
				$_t_EmailID:=Email_Send(->$_t_EmailSentTo; ->$_t_ErrorReportPerson; ->$_t_ErrorReportemail; <>PER_t_CurrentUserName; $_t_EmailFromAddress; $_t_EmailFromAddress; "Daybook Stock Speed"; ->Err_at_aAttachementsPATH; ->$_t_EmailText; False:C215)
			End if 
			CANCEL:C270
		Else 
			$_T_ALLOCLOG:=STK_T_AllocLog
			STK_T_AllocLog:=Replace string:C233(<>STK_T_AllocLog; STK_T_AllocLog2; "")
			If (STK_T_AllocLog#"")
				STK_T_AllocLog:=STK_T_AllocLog+$_T_ALLOCLOG
			End if 
			STK_T_AllocLog2:=<>STK_T_AllocLog
			//OBJECT SET SCROLL POSITION(<>STK_T_AllocLog;32000)
			
		End if 
End case 
ERR_MethodTrackerReturn("FM [projectForm]/STK_PROGRESS/{formMethod}"; $_t_oldMethodName)
