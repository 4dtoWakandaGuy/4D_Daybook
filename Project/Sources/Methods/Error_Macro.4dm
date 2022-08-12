//%attributes = {}
If (False:C215)
	
	
	// ----------------------------------------------------
	//Creator: Nigel Greenlee
	//Date & time: 21/01/2010 18:09
	//Method Name: Error_Macro
	//Description
	
	//Parameters
	//Declarations
	// ----------------------------------------------------
	//Project method Amendments
	//End Project method Amendments
	
End if 
$noEmail:=False:C215
DB_ErrorReportSettings
//Error_Macro
//TRACE
C_TEXT:C284($_t_Text)
C_TEXT:C284(<>vMacroCode)
C_BOOLEAN:C305(<>Err_bo_HandlerInited)

C_BOOLEAN:C305(SYS_bo_NoTrack; $_bo_NoTrack)  //11/03/09 v631b120p -kmw
C_TEXT:C284(Mac_T_MacroName)
If (Mac_T_MacroName="")
	Mac_T_MacroName:="Formula"
End if 

C_LONGINT:C283(SMC_l_OwnerID)  //added 05/08/08 -kmw, in case running interpretted (it being undefined was causing infite recursive error calls)
C_TEXT:C284(Mac_T_rErrorLineString)
$_t_Text:="Error executing Macro Line: "+Mac_T_rErrorLineString+Char:C90(13)
If (Mac_T_MacroName#"")
	$_t_Text:=$_t_Text+"macro: "+Mac_T_MacroName+Char:C90(13)
End if 
$_t_Text:=$_t_Text+"Line: "+vMTitle2+Char:C90(13)+Char:C90(13)
Case of 
	: (Error=1)
		$_t_Text:=$_t_Text+"'(' expected."+Char:C90(13)+" Please  have this macro fixed by your administrator."
	: (Error=2)
		$_t_Text:=$_t_Text+"Field expected."+Char:C90(13)+" Please  have this macro fixed by your administrator."
	: (Error=3)
		$_t_Text:=$_t_Text+"Subtable field expected."+Char:C90(13)+" Please  have this macro fixed by your administrator."
	: (Error=4)
		$_t_Text:=$_t_Text+"Parameters must be of the same type."+Char:C90(13)+" Please  have this macro fixed by your administrator."
	: (Error=5)
		$_t_Text:=$_t_Text+"Table expected."+Char:C90(13)+" Please  have this macro fixed by your administrator."
	: (Error=6)
		$_t_Text:=$_t_Text+"Sutable expected."+Char:C90(13)+" Please  have this macro fixed by your administrator."
	: (Error=7)
		$_t_Text:=$_t_Text+"Numeric argument expected."+Char:C90(13)+" Please  have this macro fixed by your administrator."
	: (Error=8)
		$_t_Text:=$_t_Text+"Alphanumeric argument expected."+Char:C90(13)+" Please  have this macro fixed by your administrator."
	: (Error=9)
		$_t_Text:=$_t_Text+"Boolean expected."+Char:C90(13)+" Please  have this macro fixed by your administrator."
	: (Error=10)
		$_t_Text:=$_t_Text+"Command cannot be applied to this field type."+Char:C90(13)+" Please  have this macro fixed by your administrator."
	: (Error=11)
		$_t_Text:=$_t_Text+"Command cannot be applied between two conditional tests."+Char:C90(13)+" Please  have this macro fixed by your administrator."
	: (Error=12)
		$_t_Text:=$_t_Text+"Command cannot be applied between two numeric arguments."+Char:C90(13)+" Please  have this macro fixed by your administrator."
	: (Error=13)
		$_t_Text:=$_t_Text+"Command cannot be applied between two alphanumeric arguments."+Char:C90(13)+" Please  have this macro fixed by your administrator."
	: (Error=14)
		$_t_Text:=$_t_Text+"Command cannot be applied between two date arguments."+Char:C90(13)+" Please  have this macro fixed by your administrator."
	: (Error=15)
		$_t_Text:=$_t_Text+"The operation is not compatible with the two arguments."+Char:C90(13)+" Please  have this macro fixed by your administrator."
	: (Error=16)
		$_t_Text:=$_t_Text+"The field has no relation."+Char:C90(13)+" Please  have this macro fixed by your administrator."
	: (Error=17)
		$_t_Text:=$_t_Text+"Table expected."+Char:C90(13)+" Please  have this macro fixed by your administrator."
	: (Error=18)
		$_t_Text:=$_t_Text+"Field types are incompatible."+Char:C90(13)+" Please  have this macro fixed by your administrator."
	: (Error=19)
		$_t_Text:=$_t_Text+"The field is not indexed"
	: (Error=20)
		$_t_Text:=$_t_Text+"'=' expected."+Char:C90(13)+" Please  have this macro fixed by your administrator."
	: (Error=21)
		$_t_Text:=$_t_Text+"The procedure does not exist."+Char:C90(13)+" Please  have this macro fixed by your administrator."
	: (Error=22)
		$_t_Text:=$_t_Text+"Same Tables expected."+Char:C90(13)+" Please  have this macro fixed by your administrator."
	: (Error=23)
		$_t_Text:=$_t_Text+"'<' or'>' expected."+Char:C90(13)+" Please  have this macro fixed by your administrator."
	: (Error=24)
		$_t_Text:=$_t_Text+"';' expected."+Char:C90(13)+" Please  have this macro fixed by your administrator."
	: (Error=30)
		$_t_Text:=$_t_Text+"Variable expected."+Char:C90(13)+" Please  have this macro fixed by your administrator."
	: (Error=32)
		$_t_Text:=$_t_Text+"Date expected."+Char:C90(13)+" Please  have this macro fixed by your administrator."
	: (Error=35)
		$_t_Text:=$_t_Text+"The sets are from different Tables."+Char:C90(13)+" Please  have this macro fixed by your administrator."
	: (Error=36)
		$_t_Text:=$_t_Text+"The tablename is bad."+Char:C90(13)+" Please  have this macro fixed by your administrator."
	: (Error=37)
		$_t_Text:=$_t_Text+"':=' expected."+Char:C90(13)+" Please  have this macro fixed by your administrator."
	: (Error=39)
		$_t_Text:=$_t_Text+"The set does not exist."+Char:C90(13)+" Please  have this macro fixed by your administrator."
	: (Error=40)
		$_t_Text:=$_t_Text+"This is a function, not a command."+Char:C90(13)+" Please  have this macro fixed by your administrator."
	: (Error=45)
		$_t_Text:=$_t_Text+"Field or variable expected."+Char:C90(13)+" Please  have this macro fixed by your administrator."
	: (Error=46)
		$_t_Text:=$_t_Text+"Numeric or alphanumeric argument expected"
	: (Error=48)
		$_t_Text:=$_t_Text+"Syntax error."+Char:C90(13)+" Please  have this macro fixed by your administrator."
	: (Error=50)
		$_t_Text:=$_t_Text+"These operators cannot be used together."+Char:C90(13)+" Please  have this macro fixed by your administrator."
	: (Error=52)
		$_t_Text:=$_t_Text+"Array expected."+Char:C90(13)+" Please  have this macro fixed by your administrator."
	: (Error=53)
		$_t_Text:=$_t_Text+"Array indice out of range."+Char:C90(13)+" Please  have this macro fixed by your administrator."
	: (Error=54)
		$_t_Text:=$_t_Text+"Argument types are incompatible."+Char:C90(13)+" Please  have this macro fixed by your administrator."
	: (Error=55)
		$_t_Text:=$_t_Text+"Boolean argument expected."+Char:C90(13)+" Please  have this macro fixed by your administrator."
	: (Error=56)
		$_t_Text:=$_t_Text+"Field, variable or table expected."+Char:C90(13)+" Please  have this macro fixed by your administrator."
	: (Error=57)
		$_t_Text:=$_t_Text+"Operator expected."+Char:C90(13)+" Please  have this macro fixed by your administrator."
	: (Error=58)
		$_t_Text:=$_t_Text+"')' expected."+Char:C90(13)+" Please  have this macro fixed by your administrator."
	: (Error=60)
		$_t_Text:=$_t_Text+"Parameters and local variables cannot be used in macros."+Char:C90(13)+" Please  have this macro fixed by your administrator."
	: (Error=61)
		$_t_Text:=$_t_Text+"The type of a Daybook array cannot be modified."+Char:C90(13)+" Please  have this macro fixed by your administrator."
	: (Error=62)
		$_t_Text:=$_t_Text+"This command cannot be aplied to a subtable."+Char:C90(13)+" Please  have this macro fixed by your administrator."
	: (Error=63)
		$_t_Text:=$_t_Text+"The field is not indexed"
		
	: (Error=1006)
		$_t_Text:=""
		
	: ((Error<-32) & (Error>-85))
		//$Text:=$Text+"table access error"
		$_t_Text:=$_t_Text+"File access error"  //Corrected description 06/08/08 -kmw
		
	: (Error=-27)
		$noEmail:=True:C214
		$_t_Text:=$_t_Text+"Problem opening or closing connection with printer."+Char:C90(13)+" Please  Check your printer."
	: (Error=-128)
		$noEmail:=True:C214
		$_t_Text:=$_t_Text+"Printing interrupted by the user"
	: ((Error=-193) | (Error=-4100) | (Error=-4101) | (Error=-4101) | (Error=-4101))
		$noEmail:=True:C214
		$_t_Text:=$_t_Text+"Printer problem"
		
	: (Error=-9949)
		$noEmail:=True:C214
		$_t_Text:=$_t_Text+"You do not have access to 4D Write."+"  Try Quitting and logging on again as a WP user."
	: (Error=-9997)
		$_t_Text:=$_t_Text+"The maximum number of records has been reached"
	: (Error=-9998)
		$_t_Text:="The record from a local script cannot be saved because another already"+" exists with an identical Unique Code"
	: (Error=-9999)
		$_t_Text:=$_t_Text+"No more room to save the record."+Char:C90(13)+" Please  contact your administrator to add a datasegment URGENTLY."
	: (Error=-10000)
		$_t_Text:=$_t_Text+"Invalid record address (the data file needs to be repaired)."+Char:C90(13)+" Please  contact your administrator to resolve this URGENTLY."
	: (Error=-10001)
		$_t_Text:=$_t_Text+"Invalid index page (the data file needs to be repaired)."+Char:C90(13)+" Please  contact your administrator to resolve this URGENTLY."
	: (Error=-10002)
		$_t_Text:=$_t_Text+"Invalid record structure (the data file needs to be repaired)."+Char:C90(13)+" Please  contact your administrator to resolve this URGENTLY."
	: (Error=-10003)
		$_t_Text:=$_t_Text+"Record # is out of range (the data file needs to be repaired)."+Char:C90(13)+" Please  contact your administrator to resolve this URGENTLY."
	: (Error=-10004)
		$_t_Text:=$_t_Text+"Index page # is out of range (the data file needs to be repaired)."+Char:C90(13)+" Please  contact your administrator to resolve this URGENTLY."
		
	Else 
		$_t_Text:=$_t_Text+""
End case 
If ($_t_Text#"")
	//TRACE
	$_bo_NoTrack:=SYS_bo_NoTrack  //11/03/09 v631b120p -kmw
	SYS_bo_NoTrack:=True:C214  //11/03/09 v631b120p -kmw
	If (<>Err_bo_HandlerInited)
		//SYS_bo_NoTrack:=True
		
		
		
		If (<>Email_bo_Enabled)
			If (Not:C34($noEmail))
				$_t_EmailSentTo:="To"
				$_t_EmailAttachment:=""
				$errTrackText:=ERR_GetTracking
				$DataChange:=ERR_GetDataChanges
				//``
				$EmailSent:=False:C215
				$_t_EmailText:=DB_GetOrganisation+Char:C90(13)+<>PER_t_CurrentUserInitials+" "+<>PER_t_CurrentUserName+Char:C90(13)+$_t_Text+Char:C90(13)+$errTrackText+Char:C90(13)+$dataChange+Char:C90(13)+$DataChange
				BLOB TO VARIABLE:C533([SCRIPTS:80]Modified_Info:14; SMC_l_OwnerID; $_l_offset)
				If ([SCRIPTS:80]Script_status:13=Active in Testing)
					
					Gen_Alert($_t_Text; "Cancel")
					//macros is being written so
					$_l_offset:=0
					
					If (SMC_l_OwnerID>0)
						C_BOOLEAN:C305(<>Email_bo_PersonInited)
						While (Semaphore:C143("InitEmail"))
							DelayTicks(2)
						End while 
						If (<>Email_bo_PersonInited=False:C215)
							LOGIN_SetEmail
						End if 
						CLEAR SEMAPHORE:C144("InitEmail")
						
						
						READ ONLY:C145([PERSONNEL:11])
						QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Personnel_ID:48=SMC_l_OwnerID)
						$OwnerName:=[PERSONNEL:11]Name:2
						If ($ownerName#"")
							$_t_EmailText:=Replace string:C233($_t_EmailText; "your administrator"; $OwnerName)
						End if 
						EMAIL_t_EmailTo:=[PERSONNEL:11]Name:2
						EmailAddress:=[PERSONNEL:11]Email_Address:36
						If (EmailAddress#"")
							$EmailSent:=True:C214
							$_t_EmailText:=DB_GetDebugInfo+$_t_EmailText
							If ($_t_EmailText="")
								$_t_EmailText:="Here-from Error_Macro a blank email"
								
							End if 
							EMAIL_t_SendCalledFrom:="Error_Macro (1)"
							$_t_EmailID:=Email_Send(->$_t_EmailSentTo; ->EMAIL_t_EmailTo; ->EmailAddress; <>PER_t_CurrentEmailFrom; <>EMAIL_t_DefaultReplyToAddress; <>EMAIL_t_DefaultReplyToAddress; "Daybook Error Auto Report"; ->$_t_EmailAttachment; ->$_t_EmailText; False:C215)
						End if 
						
					End if 
				End if 
				C_BOOLEAN:C305(<>Email_bo_PersonInited)
				While (Semaphore:C143("InitEmail"))
					DelayTicks(2)
				End while 
				If (<>Email_bo_PersonInited=False:C215)
					LOGIN_SetEmail
				End if 
				CLEAR SEMAPHORE:C144("InitEmail")
				
				
				If ($EmailSent=False:C215)  //``send to owner as well
					Case of   //Sender Address
						: (<>Per_at_PersonnelNames_EmailFrom#"")
							$_t_EmailFromAddress:=<>Per_at_PersonnelNames_EmailFrom
						: (<>DB_t_UserGrEmailSMTP#"")
							$_t_EmailFromAddress:=<>DB_t_UserGrEmailFrom
						Else 
							$_t_EmailFromAddress:=<>EMAIL_t_DefaultReplyToAddress
					End case 
					
					If (<>PER_t_CurrentUserName#"")
						If (Application type:C494#4D Server:K5:6)
							$_t_EmailText:=DB_GetDebugInfo+DB_GetOrganisation+Char:C90(13)+<>PER_t_CurrentUserInitials+" "+<>PER_t_CurrentUserName+Char:C90(13)+$errTrackText+Char:C90(13)+$DataChange
							Error_ExtendedReport($_t_Text; $_t_EmailText; ""; 1; <>PER_t_CurrentUserName; $_t_EmailFromAddress; $_t_EmailFromAddress)
						Else 
							$_t_EmailText:=DB_GetDebugInfo+$_t_EmailText
							If ($_t_EmailText="")
								$_t_EmailText:="Here-from Error_Macro a blank email(2)"
								
							End if 
							EMAIL_t_SendCalledFrom:="Error_Macro(2)"
							$_t_EmailID:=Email_Send(->$_t_EmailSentTo; -><>DB_t_ErrorReportPerson; -><>DB_t_ErrorReportAddress; <>PER_t_CurrentEmailFrom; <>EMAIL_t_DefaultReplyToAddress; <>EMAIL_t_DefaultReplyToAddress; "Daybook Error Auto Report"; ->$_t_EmailAttachment; ->$_t_EmailText; False:C215)
							
						End if 
					Else 
						$_t_EmailText:=DB_GetDebugInfo+$_t_EmailText
						If ($_t_EmailText="")
							$_t_EmailText:="Here-from Error_Macro a blank emai(3)l"
							
						End if 
						EMAIL_t_SendCalledFrom:="Error_Macro(3)"
						$_t_EmailID:=Email_Send(->$_t_EmailSentTo; -><>DB_t_ErrorReportPerson; -><>DB_t_ErrorReportAddress; <>PER_t_CurrentEmailFrom; <>EMAIL_t_DefaultReplyToAddress; <>EMAIL_t_DefaultReplyToAddress; "Daybook Error Auto Report"; ->$_t_EmailAttachment; ->$_t_EmailText; False:C215)
					End if 
					
					If (SMC_l_OwnerID>0)
						READ ONLY:C145([PERSONNEL:11])
						QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Personnel_ID:48=SMC_l_OwnerID)
						$OwnerName:=[PERSONNEL:11]Name:2
						If ($ownerName#"")
							$_t_EmailText:=Replace string:C233($_t_EmailText; "your administrator"; $OwnerName)
						End if 
						EMAIL_t_EmailTo:=[PERSONNEL:11]Name:2
						EmailAddress:=[PERSONNEL:11]Email_Address:36
						If (EmailAddress#"")
							$EmailSent:=True:C214
							If ($_t_EmailText="")
								$_t_EmailText:="Here-from Error_Macro a blank email(4)"
								
							End if 
							EMAIL_t_SendCalledFrom:="Error_Macro(4)"
							$_t_EmailID:=Email_Send(->$_t_EmailSentTo; ->EMAIL_t_EmailTo; ->EmailAddress; <>PER_t_CurrentEmailFrom; <>EMAIL_t_DefaultReplyToAddress; <>EMAIL_t_DefaultReplyToAddress; "Daybook Error Auto Report"; ->$_t_EmailAttachment; ->$_t_EmailText; False:C215)
						End if 
					End if 
					
				End if 
			Else 
				Gen_Alert($_t_Text; "Cancel")
			End if 
		Else 
			Gen_Alert($_t_Text; "Cancel")
		End if 
		
		
	Else 
		Error_MessIM($_t_Text; Error)
	End if 
	SYS_bo_NoTrack:=$_bo_NoTrack
	OK:=0
	<>SYS_l_CancelProcess:=Current process:C322
End if 
//ABORT