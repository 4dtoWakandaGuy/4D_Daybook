//%attributes = {"invisible":true}
If (False:C215)
	
	
	// ----------------------------------------------------
	// Creator: Nigel Greenlee
	//Date & time: 12/12/2009 20:57`Method: Error Proc
	//Description
	
	//Parameters
	// ----------------------------------------------------
	//Project method Amendments
	//End Project method Amendments
	
End if 
$_bo_NoTrack:=SYS_bo_NoTrack  //11/03/09 v631b120p -kmw
SYS_bo_NoTrack:=True:C214
DB_ErrorReportSettings
SYS_bo_NoTrack:=$_bo_NoTrack
C_BOOLEAN:C305(DB_bo_SendingEmail)
C_BOOLEAN:C305(<>Err_bo_PrefShowChainInErrorMess)
C_BOOLEAN:C305(<>Err_bo_PrefShowChainInErrorEmai)
C_BOOLEAN:C305(<>Email_bo_PersonInited)
C_LONGINT:C283(<>Err_l_NoError)
C_BOOLEAN:C305(<>Err_bo_HandlerInited)
C_BOOLEAN:C305(<>Err_bo_ManualHandler)
C_BOOLEAN:C305(<>ERR_bo_NoErrDialog)
C_LONGINT:C283(<>DB_l_TestingMode)
C_BOOLEAN:C305(<>DB_bo_TestModeInited)
C_TEXT:C284($_t_NonCallChainText)
C_BOOLEAN:C305(DB_bo_NoEmailInfo)
C_BOOLEAN:C305(SYS_bo_NoTrack; $_bo_NoTrack)
C_TEXT:C284(DB_t_TrackingMethodName)
C_TEXT:C284($_t_CallChainText)
C_TEXT:C284($_t_NonCallChainText)
C_TEXT:C284(DB_t_ErrTrackingStack)  //"stack" var

$_bo_NoEmail:=False:C215  //to comment out some errors
$_l_noError:=0
$_t_ErrorinMethodName:=error method
$_l_ErroratLineNumber:=error line

<>Err_bo_InErrorHandler:=True:C214
<>Err_bo_ManualHandler:=False:C215
SHOW PROCESS:C325(Current process:C322)  //hidden Process_No see the error!!
BRING TO FRONT:C326(Current process:C322)
$_bo_Trace:=False:C215
If (<>Err_l_NoError#0)
	$_l_noError:=<>Err_l_NoError
	<>Err_bo_ManualHandler:=True:C214
	<>Err_l_NoError:=0
End if 

$_bo_NoErroDialog:=<>ERR_bo_NoErrDialog
If (<>ERR_bo_NoErrDialog#False:C215)
	<>ERR_bo_NoErrDialog:=False:C215
End if 
$_col_CallChain:=Get call chain:C1662
$_col_CallChain.remove(0)

If (User in group:C338(Current user:C182; "Designer")) & (Not:C34(Application type:C494=4D Server:K5:6)) & (Not:C34(Is compiled mode:C492))
	
	// /this section is only seen in the development test-uncompiled code logged in user is designer and we are not on the server!
	
	If (<>Err_l_NoError#0)
		If (<>Err_l_NoError=Error)
		End if 
		$_l_noError:=<>Err_l_NoError
		<>Err_bo_ManualHandler:=True:C214
		<>Err_l_NoError:=0
	End if 
	$_t_CallChainText:="Error No: "+String:C10(Error)+":"+Char:C90(13)
	$_bo_NoTrack:=SYS_bo_NoTrack
	SYS_bo_NoTrack:=True:C214
	$_t_ErrTrackingStack:=""
	TRACE:C157
	$_l_Item:=0
	$_t_Type:=""
	$_t_Name:=""
	$_l_Line:=0
	$_t_Database:=""
	C_OBJECT:C1216($_obj_Item)
	
	For each ($_obj_Item; $_col_CallChain)
		$_t_Type:=$_obj_Item.type
		$_t_Name:=$_obj_Item.name
		$_l_Line:=$_obj_Item.line
		$_t_Database:=$_obj_Item.database
		If ($_t_ErrTrackingStack#"")
			
			$_t_ErrTrackingStack:=($_t_Type)+" "+($_t_Name)+" "+String:C10($_l_Line)+" "+($_t_Database)+Char:C90(13)+$_t_ErrTrackingStack
		Else 
			$_t_ErrTrackingStack:=($_t_Type)+" "+($_t_Name)+" "+String:C10($_l_Line)+" "+($_t_Database)
		End if 
	End for each 
	PROCESS PROPERTIES:C336(Current process:C322; $_t_ProcessName; $_l_ProcessState; $_l_ProcessTime; $_bo_ProcessVisible; $_l_ProcessUID; $_l_ProcessOrigin)
	Case of 
		: ($_l_ProcessOrigin=-11)
			$_t_Origin:="Web Process with Context "
		: ($_l_ProcessOrigin=-10)
			$_t_Origin:="Other 4D Process"
		: ($_l_ProcessOrigin=-9)
			$_t_Origin:="External Task"
		: ($_l_ProcessOrigin=-8)
			$_t_Origin:="Event Manager"
		: ($_l_ProcessOrigin=-7)
			$_t_Origin:="Apple Event Manager"
		: ($_l_ProcessOrigin=-6)
			$_t_Origin:="Serial Port Manager"
		: ($_l_ProcessOrigin=-5)
			$_t_Origin:="Indexing Process Longint"
		: ($_l_ProcessOrigin=-4)
			$_t_Origin:="Cache Manager Longint"
		: ($_l_ProcessOrigin=-3)
			$_t_Origin:="Web Process with no Context "
		: ($_l_ProcessOrigin=-2)
			$_t_Origin:="Design Process Longint"
		: ($_l_ProcessOrigin=-1)
			$_t_Origin:="User or Custom Menus Process "
		: ($_l_ProcessOrigin=0)
			$_t_Origin:="None"
		: ($_l_ProcessOrigin=1)
			$_t_Origin:="Created from Programming"
		: ($_l_ProcessOrigin=2)
			$_t_Origin:="Created from Menu Command"
		: ($_l_ProcessOrigin=3)
			$_t_Origin:="Created from User_Mode"
		: ($_l_ProcessOrigin=4)
			$_t_Origin:="Other User Process"
		Else 
			$_t_Origin:="Unknown origin"
	End case 
	$_t_ErrTrackingStack:="Process_Name: "+$_t_ProcessName+" "+"Process Origin "+$_t_Origin+$_t_ErrTrackingStack
	
	//DB_t_ErrTrackingStack:=
	//For each ($_col_CallChain)
	
	//End for each 
	
	
	ErrorProcSpecial(->$_t_CallChainText; ->$_bo_NoEmail; ->$_t_ErrorinMethodName)  //now called when uncompiled as well, 04/04/08 -kmw
	SYS_bo_NoTrack:=$_bo_NoTrack
	$_t_NonCallChainText:=$_t_CallChainText  //added 26/10/07 -kmw
	If (DB_t_ErrTrackingStack="")
		$_t_CallChainText:=$_t_CallChainText+"Call Chain: "+"(No Call Chain Info Found)"
	Else 
		$_t_CallChainText:=$_t_CallChainText+"Call Chain: "+Substring:C12($_t_ErrTrackingStack; 1; 100)+". . ."  //altered to use trunctext 26/10/07 -kmw
	End if 
	$_bo_NoTrack:=SYS_bo_NoTrack  //11/03/09 v631b120p -kmw
	SYS_bo_NoTrack:=True:C214
	C_BOOLEAN:C305(DB_NoConfirm)
	If (Not:C34(DB_NoConfirm))
		If (error#$_l_noError)
			If (<>Err_bo_PrefShowChainInErrorMess)
				CONFIRM:C162($_t_CallChainText; "Continue"; "Trace")
			Else 
				CONFIRM:C162($_t_NonCallChainText; "Continue"; "Trace")
			End if 
			If (OK=0)
				$_bo_Trace:=True:C214
			End if 
		End if 
	End if 
	OK:=1
	SYS_bo_NoTrack:=$_bo_NoTrack
Else 
	//this is the normal error handling
	C_TEXT:C284($_t_CallChainText)
	$_t_CallChainText:="Error No: "+String:C10(Error)+" at Line number"+String:C10($_l_ErroratLineNumber)+Char:C90(13)
	If (Error=<>Err_l_NoError)
		$_bo_NoEmail:=True:C214  //dont want to know about this
		$_t_CallChainText:=""
		<>Err_bo_ManualHandler:=True:C214
		<>Err_l_NoError:=0  //always clear it-its always for a one off
	Else 
		$_bo_NoTrack:=SYS_bo_NoTrack
		SYS_bo_NoTrack:=True:C214
		ErrorProcSpecial(->$_t_CallChainText; ->$_bo_NoEmail; ->$_t_ErrorinMethodName)
		SYS_bo_NoTrack:=$_bo_NoTrack
	End if 
	
	$_l_Item:=0
	For each ($_l_Item; $_col_CallChain)
		If ($_t_ErrTrackingStack#"")
			
			$_t_ErrTrackingStack:=($_col_CallChain[$_l_Item].Type)+" "+($_col_CallChain[$_l_Item].Name)+" "+String:C10(($_col_CallChain[$_l_Item].line))+" "+($_col_CallChain[$_l_Item].database)+Char:C90(13)+$_t_ErrTrackingStack
		Else 
			$_t_ErrTrackingStack:=($_col_CallChain[$_l_Item].Type)+" "+($_col_CallChain[$_l_Item].Name)+" "+String:C10(($_col_CallChain[$_l_Item].line))+" "+($_col_CallChain[$_l_Item].database)
		End if 
	End for each 
	PROCESS PROPERTIES:C336(Current process:C322; $_t_ProcessName; $_l_ProcessState; $_l_ProcessTime; $_bo_ProcessVisible; $_l_ProcessUID; $_l_ProcessOrigin)
	Case of 
		: ($_l_ProcessOrigin=-11)
			$_t_Origin:="Web Process with Context "
		: ($_l_ProcessOrigin=-10)
			$_t_Origin:="Other 4D Process"
		: ($_l_ProcessOrigin=-9)
			$_t_Origin:="External Task"
		: ($_l_ProcessOrigin=-8)
			$_t_Origin:="Event Manager"
		: ($_l_ProcessOrigin=-7)
			$_t_Origin:="Apple Event Manager"
		: ($_l_ProcessOrigin=-6)
			$_t_Origin:="Serial Port Manager"
		: ($_l_ProcessOrigin=-5)
			$_t_Origin:="Indexing Process Longint"
		: ($_l_ProcessOrigin=-4)
			$_t_Origin:="Cache Manager Longint"
		: ($_l_ProcessOrigin=-3)
			$_t_Origin:="Web Process with no Context "
		: ($_l_ProcessOrigin=-2)
			$_t_Origin:="Design Process Longint"
		: ($_l_ProcessOrigin=-1)
			$_t_Origin:="User or Custom Menus Process "
		: ($_l_ProcessOrigin=0)
			$_t_Origin:="None"
		: ($_l_ProcessOrigin=1)
			$_t_Origin:="Created from Programming"
		: ($_l_ProcessOrigin=2)
			$_t_Origin:="Created from Menu Command"
		: ($_l_ProcessOrigin=3)
			$_t_Origin:="Created from User_Mode"
		: ($_l_ProcessOrigin=4)
			$_t_Origin:="Other User Process"
		Else 
			$_t_Origin:="Unknown origin"
	End case 
	$_t_ErrTrackingStack:="Process_Name: "+$_t_ProcessName+" "+"Process Origin "+$_t_Origin+$_t_ErrTrackingStack
	
	
	//
	
	If ($_t_CallChainText#"") & (error#$_l_noError)
		$_t_NonCallChainText:=$_t_CallChainText
		
		If (<>Err_bo_PrefShowChainInErrorMess)  //added call chain recording/reporting 18/10/7-kmw
			
			If (DB_t_ErrTrackingStack="")
				$_t_CallChainText:=$_t_CallChainText+"Call Chain: "+"(No Call Chain Info Found)"
			Else 
				$_t_CallChainText:=$_t_CallChainText+"Call Chain: "+$_t_ErrTrackingStack+". . ."
				
			End if 
		End if 
		//*********************************************
		
		
		If (<>Err_bo_HandlerInited)
			$_bo_NoTrack:=SYS_bo_NoTrack
			If (<>Email_bo_Enabled)
				While (Semaphore:C143("InitEmail"))
					DelayTicks(2)
				End while 
				If (<>Email_bo_PersonInited=False:C215)
					$_bo_NoTrack:=SYS_bo_NoTrack  //11/03/09 v631b120p -kmw
					SYS_bo_NoTrack:=True:C214
					While (Semaphore:C143("InitEmail"))
						DelayTicks(2)
					End while 
					
					LOGIN_SetEmail
					
					
					SYS_bo_NoTrack:=$_bo_NoTrack
				End if 
				CLEAR SEMAPHORE:C144("InitEmail")
				
				If ($_bo_NoEmail=False:C215)  //dont want to know about this
					Case of   //Sender Address
						: (<>Per_at_PersonnelNames_EmailFrom#"")
							$_t_EmailFromAddress:=<>Per_at_PersonnelNames_EmailFrom
						: (<>DB_t_UserGrEmailSMTP#"")
							$_t_EmailFromAddress:=<>DB_t_UserGrEmailFrom
						Else 
							$_t_EmailFromAddress:=<>EMAIL_t_DefaultReplyToAddress
					End case 
					If ($_t_EmailFromAddress#"") & (Not:C34(DB_bo_SendingEmail))
						EMAIL_t_EmailType:="To"  // 22/04/02 pb
						$_t_EmailSentTo:="To"
						$_t_EmailAttachment:=""
						$_bo_NoTrack:=SYS_bo_NoTrack  //11/03/09 v631b120p -kmw
						SYS_bo_NoTrack:=True:C214
						$_t_ErrTrackingText:=ERR_GetTracking
						$_t_DataChanges:=ERR_GetDataChanges
						SYS_bo_NoTrack:=$_bo_NoTrack
						
						If (<>DB_l_TestingMode=1)  //we are unit testing so get the last elements from the array?
							If (<>DB_bo_TestModeInited)
								If (Not:C34(DB_bo_NoEmailInfo))
									$_l_Retries:=0
									While (Semaphore:C143("Apendtestarray"))
										$_l_Retries:=$_l_Retries+1
										DelayTicks(2*$_l_Retries)
									End while 
									$_t_EmailData:=""
									$_l_NestedFunctionsCount:=Size of array:C274(<>DB_at_TestedFunctions)
									For ($i; <>DB_l_FirstElement; $_l_NestedFunctionsCount)
										$_t_EmailData:=$_t_EmailData+<>DB_at_TestedFunctions{$i}+Char:C90(13)
									End for 
									CLEAR SEMAPHORE:C144("Apendtestarray")
									$_t_ErrTrackingText:=$_t_ErrTrackingText+Char:C90(13)+$_t_EmailData
								End if 
							End if 
						End if 
						
						$_bo_NoTrack:=SYS_bo_NoTrack  //11/03/09 v631b120p -kmw
						SYS_bo_NoTrack:=True:C214
						If (<>PER_t_CurrentUserName#"")
							If (Application type:C494#4D Server:K5:6)
								If (<>Err_bo_PrefShowChainInErrorEmai)  //added 26/10/07 -kmw
									$_t_EmailText:=DB_GetDebugInfo+DB_GetOrganisation+Char:C90(13)+<>PER_t_CurrentUserInitials+" "+<>PER_t_CurrentUserName+Char:C90(13)+$_t_CallChainText+Char:C90(13)+$_t_ErrTrackingText+Char:C90(13)+$_t_DataChanges
								Else   //added 26/10/07 -kmw
									$_t_EmailText:=DB_GetDebugInfo+DB_GetOrganisation+Char:C90(13)+<>PER_t_CurrentUserInitials+" "+<>PER_t_CurrentUserName+Char:C90(13)+$_t_NonCallChainText+Char:C90(13)+$_t_ErrTrackingText+Char:C90(13)+$_t_DataChanges
								End if   //added 26/10/07 -kmw
								
								If ($_bo_NoErroDialog=False:C215)  //added no error dialog functionality 04/04/08 -kmw
									Error_ExtendedReport($_t_CallChainText; $_t_EmailText; ""; 1; <>PER_t_CurrentUserName; $_t_EmailFromAddress; $_t_EmailFromAddress)
								Else   //added 04/04/08 -kmw
									$_t_EmailID:=Email_Send(->$_t_EmailSentTo; -><>DB_t_ErrorReportPerson; -><>DB_t_ErrorReportAddress; <>PER_t_CurrentUserName; $_t_EmailFromAddress; $_t_EmailFromAddress; "Daybook Error Auto Report"; ->$_t_EmailAttachment; ->$_t_EmailText; False:C215)  //added 04/04/08 -kmw
								End if   //added 04/04/08 -kmw
							Else 
								If (<>Err_bo_PrefShowChainInErrorEmai)  //added 05/09/08 -ng & kmw
									$_t_EmailText:=DB_GetDebugInfo+DB_GetOrganisation+Char:C90(13)+<>PER_t_CurrentUserInitials+" "+<>PER_t_CurrentUserName+Char:C90(13)+$_t_CallChainText+Char:C90(13)+$_t_ErrTrackingText+Char:C90(13)+$_t_DataChanges  //added 05/09/08 -ng & kmw
								Else   //added 05/09/08 -ng & kmw
									$_t_EmailText:=DB_GetDebugInfo+DB_GetOrganisation+Char:C90(13)+<>PER_t_CurrentUserInitials+" "+<>PER_t_CurrentUserName+Char:C90(13)+$_t_NonCallChainText+Char:C90(13)+$_t_ErrTrackingText+Char:C90(13)+$_t_DataChanges  //added 05/09/08 -ng & kmw
								End if   //added 05/09/08 -ng & kmw
								$_t_EmailID:=Email_Send(->$_t_EmailSentTo; -><>DB_t_ErrorReportPerson; -><>DB_t_ErrorReportAddress; <>PER_t_CurrentUserName; $_t_EmailFromAddress; $_t_EmailFromAddress; "Daybook Error Auto Report"; ->$_t_EmailAttachment; ->$_t_EmailText; False:C215)
							End if 
						Else 
							If (<>Err_bo_PrefShowChainInErrorEmai)  //added 05/09/08 -ng & kmw
								$_t_EmailText:=DB_GetDebugInfo+DB_GetOrganisation+Char:C90(13)+<>PER_t_CurrentUserInitials+" "+<>PER_t_CurrentUserName+Char:C90(13)+$_t_CallChainText+Char:C90(13)+$_t_ErrTrackingText+Char:C90(13)+$_t_DataChanges  //added 05/09/08 -ng & kmw
							Else   //added 05/09/08 -ng & kmw
								$_t_EmailText:=DB_GetDebugInfo+DB_GetOrganisation+Char:C90(13)+<>PER_t_CurrentUserInitials+" "+<>PER_t_CurrentUserName+Char:C90(13)+$_t_NonCallChainText+Char:C90(13)+$_t_ErrTrackingText+Char:C90(13)+$_t_DataChanges  //added 05/09/08 -ng & kmw
							End if   //added 05/09/08 -ng & kmw
							$_t_EmailID:=Email_Send(->$_t_EmailSentTo; -><>DB_t_ErrorReportPerson; -><>DB_t_ErrorReportAddress; <>PER_t_CurrentUserName; $_t_EmailFromAddress; $_t_EmailFromAddress; "Daybook Error Auto Report"; ->$_t_EmailAttachment; ->$_t_EmailText; False:C215)
						End if 
						SYS_bo_NoTrack:=$_bo_NoTrack
						
					Else 
						$_bo_NoTrack:=SYS_bo_NoTrack  //11/03/09 v631b120p -kmw
						SYS_bo_NoTrack:=True:C214
						ALERT:C41($_t_CallChainText; "Cancel")
						SYS_bo_NoTrack:=$_bo_NoTrack
					End if 
				Else 
					SYS_bo_NoTrack:=SYS_bo_NoTrack  //11/03/09 v631b120p -kmw
					SYS_bo_NoTrack:=True:C214
					ALERT:C41($_t_CallChainText; "Cancel")
					SYS_bo_NoTrack:=$_bo_NoTrack
				End if 
			Else 
				$_bo_NoTrack:=SYS_bo_NoTrack  //11/03/09 v631b120p -kmw
				SYS_bo_NoTrack:=True:C214
				ALERT:C41($_t_CallChainText; "Cancel")
				SYS_bo_NoTrack:=$_bo_NoTrack
			End if 
		Else 
			$_bo_NoTrack:=SYS_bo_NoTrack  //11/03/09 v631b120p -kmw
			SYS_bo_NoTrack:=True:C214
			If (<>Err_bo_PrefShowChainInErrorEmai)  //added 26/10/07 -kmw
				Error_MessIM($_t_CallChainText; Error)
			Else   //added 26/10/07 -kmw
				Error_MessIM($_t_NonCallChainText; Error)
			End if   //added 26/10/07 -kmw
			SYS_bo_NoTrack:=$_bo_NoTrack
		End if 
		
		OK:=0
		<>SYS_l_CancelProcess:=Current process:C322
	End if 
End if 
If ($_bo_Trace)
	TRACE:C157
End if 
<>Err_l_NoError:=0
<>Err_bo_InErrorHandler:=False:C215