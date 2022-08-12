//%attributes = {}
If (False:C215)
	
	
	// ----------------------------------------------------
	//Creator: Nigel Greenlee
	//Date & time: 21/01/2010 18:09
	//Method Name: Error_MessIM
	//Description
	
	//Parameters
	//Declarations
	// ----------------------------------------------------
	//Project method Amendments
	//End Project method Amendments
	
End if 

//Error_MessIM
DB_ErrorReportSettings
C_TEXT:C284(<>MAIL_t_SMTPServer)
C_TEXT:C284($1; $_t_Text)
C_LONGINT:C283($_l_Mod; $_l_Error; $_l_Result; $2)
C_BOOLEAN:C305(<>Err_bo_HandlerInited)
C_TEXT:C284(<>IWEBMASTER)
$_l_Mod:=Mod:C98((Num:C11(<>Err_bo_HandlerInited)); 2)

$_l_Error:=(Num:C11(<>Err_bo_HandlerInited))-$_l_Mod
If (<>Err_bo_HandlerInited)
	Gen_Alert($1; "Cancel")
End if 
QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Initials:1=<>iWebMaster)
C_BOOLEAN:C305(<>Email_bo_PersonInited)
While (Semaphore:C143("InitEmail"))
	DelayTicks(2)
End while 
If (<>Email_bo_PersonInited=False:C215)
	LOGIN_SetEmail
End if 
CLEAR SEMAPHORE:C144("InitEmail")


$_l_Mod:=Int:C8($_l_Error/8)
//If ($_l_Mod=1)  `email
If (($_l_Mod=1) & (<>MAIL_t_SMTPServer#""))  //email 22/04/02 pb
	$_l_Error:=$_l_Error-8
	
	//    IME_SetMailOpts(◊SMTPServer;[PERSONNEL]Email Address) out 22/04/02 pb
	$_t_Text:="An error occurred at "+String:C10(Current time:C178)+" on "+String:C10(Current date:C33)+":"+Char:C90(13)+Char:C90(13)+$1+Char:C90(13)+Char:C90(13)+"viSearch: "+viSearch
	If ([ORDERS:24]Order_Code:3#"")
		$_t_Text:=$_t_Text+Char:C90(13)+"Order Code: "+[ORDERS:24]Order_Code:3+Char:C90(13)+"Company Code: "+[ORDERS:24]Company_Code:1+Char:C90(13)+"Contact Code: "+[ORDERS:24]Contact_Code:2
	End if 
	//    $res:=IME SendMail([PERSONNEL]Email Address;"Daybook IM Error";$text;0)
	EMAIL_t_EmailType:="To"  // 22/04/02 pb
	$_t_EmailSentTo:="To"
	$_t_EmailAttachment:=""
	$errTrackText:=ERR_GetTracking
	$DataChange:=ERR_GetDataChanges
	
	$_t_EmailText:=DB_GetOrganisation+Char:C90(13)+<>PER_t_CurrentUserName+Char:C90(13)+$_t_Text+Char:C90(13)+$errTrackText+Char:C90(13)+$DataChange
	If ($_t_EmailText="")
		$_t_EmailText:="Here-from Error_MessIM  a blank email"
		
	End if 
	EMAIL_t_SendCalledFrom:="Error_MessIM"
	$_t_EmailID:=Email_Send(->$_t_EmailSentTo; -><>DB_t_ErrorReportPerson; -><>DB_t_ErrorReportAddress; <>PER_t_CurrentEmailFrom; <>EMAIL_t_DefaultReplyToAddress; <>EMAIL_t_DefaultReplyToAddress; "Daybook Error Auto Report(IME)"; ->$_t_EmailAttachment; ->$_t_EmailText; False:C215)
	
	
End if 

$_l_Mod:=Int:C8($_l_Error/4)
If ($_l_Mod=1)  //diary
	$_l_Error:=$_l_Error-4
	READ WRITE:C146([DIARY:12])
	CREATE RECORD:C68([DIARY:12])
	DiarySetCode
	[DIARY:12]Person:8:=<>iWebMaster
	[DIARY:12]Originator:23:=<>PER_t_CurrentUserInitials
	[DIARY:12]Action_Code:9:="WERR"
	[DIARY:12]Action_Details:10:=$1+Char:C90(13)+Char:C90(13)+"viSearch: "+viSearch
	[DIARY:12]Date_Do_From:4:=Current date:C33
	[DIARY:12]Date_Do_To:33:=[DIARY:12]Date_Do_From:4
	[DIARY:12]Time_Do_From:6:=Current time:C178
	[DIARY:12]Time_Do_To:35:=[DIARY:12]Time_Do_From:6
	[DIARY:12]Value:16:=$2
	[DIARY:12]Company_Code:1:=[ORDERS:24]Company_Code:1
	[DIARY:12]Contact_Code:2:=[ORDERS:24]Contact_Code:2
	[DIARY:12]Order_Code:26:=[ORDERS:24]Order_Code:3
	Diary_PersPrior
	DB_SaveRecord(->[DIARY:12])
	AA_CheckFileUnlocked(->[DIARY:12]x_ID:50)
	UNLOAD RECORD:C212([DIARY:12])
End if 

$_l_Mod:=Int:C8($_l_Error/2)
If (($_l_Mod=1) & (DB_GetModuleSettingByNUM(Module_IntServer)>1))  //html
	
	//IME_Reply ("<HTML><BODY><B>"+IME CRtoBR ($1)+"</B></BODY></HTML>")
	// vText:=IME CRtoBR($1)
	vText:=Replace string:C233($1; Char:C90(13); Char:C90(13)+"<BR>")  // 22/04/02 pb
	Macro2("IMA Error4")
End if 