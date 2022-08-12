If (False:C215)
	//object Name: [EW_ExportProjects]Entry.AutoReportCheck Box1
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:46
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(cSMS)
	C_REAL:C285(SMS_AvgMsgCredits; SMS_Credits)
	C_TEXT:C284($_t_Message; $_t_oldMethodName; SMS_AccountName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [EW_ExportProjects].Entry.AutoReportCheck Box1"; Form event code:C388)
If (cSMS=1)
	SMS_LoadVariables  // yes this does need to be loaded fresh each time
	Case of 
		: (SMS_AccountName="")
			$_t_Message:="You must set up an SMS account before you can use this feature. "+"Please open the Preferences screen "
			$_t_Message:=$_t_Message+"and go to the SMS page to set up your account."
			//      ALERT($_t_Message)
			Gen_Alert($_t_Message)
			cSMS:=0
		: ((SMS_Credits/SMS_AvgMsgCredits)<2)
			//     ALERT("You do not have sufficient credits available to send any SMS message
			Gen_Alert("You do not have sufficient credits available to send any SMS messages.")
			cSMS:=0
	End case 
Else 
	[EW_ExportProjects:117]ErrorReportMobileNumber:19:=SMS_IntlPhoneNumber(->[EW_ExportProjects:117]ErrorReportMobileNumber:19)
End if 
EW_ErrorReportFlags
ERR_MethodTrackerReturn("OBJ [EW_ExportProjects].Entry.AutoReportCheck Box1"; $_t_oldMethodName)
