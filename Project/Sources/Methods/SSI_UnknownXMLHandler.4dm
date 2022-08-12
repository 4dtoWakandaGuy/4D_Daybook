//%attributes = {}
If (False:C215)
	//Project Method Name:      SSI_UnknownXMLHandler
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 21/01/2010 18:09
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>Email_bo_PersonInited; $_bo_SendEmail)
	C_LONGINT:C283($1)
	C_POINTER:C301($3)
	C_TEXT:C284(<>EMAIL_t_DefaultReplyToAddress; <>PER_t_CurrentEmailFrom; $_t_EmailID; $_t_oldMethodName; $2; EMAIL_t_SendCalledFrom; SSI_t_Attachment; SSI_T_EmailAdmin; SSI_T_EmailText; SSI_t_EmailTo; SSI_t_SentTo)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SSI_UnknownXMLHandler")
//When XML data is received from a source the where the config is unknown the Data cannot be handled so we have to store it
//we will then send an email to the administrator to tell them to set the config up.
//Note that this may be called on receipt of the unkown XML or because the XML does not validate against the Config.
If (Count parameters:C259>=3)
	If ($2#"")
		$_bo_SendEmail:=True:C214
		QUERY:C277([PROCESSES_TO_HANDLE:115]; [PROCESSES_TO_HANDLE:115]ServiceType:6="XMLCONFIG"; *)
		QUERY:C277([PROCESSES_TO_HANDLE:115];  & ; [PROCESSES_TO_HANDLE:115]Data1Longint:8=$1; *)
		QUERY:C277([PROCESSES_TO_HANDLE:115];  & ; [PROCESSES_TO_HANDLE:115]Comments:3=$2)
		If (Records in selection:C76([PROCESSES_TO_HANDLE:115])>0)
			$_bo_SendEmail:=False:C215
			//this to stop sending multiple messages to set up the config.
		End if 
		CREATE RECORD:C68([PROCESSES_TO_HANDLE:115])
		[PROCESSES_TO_HANDLE:115]Data5Blob:12:=$3->
		[PROCESSES_TO_HANDLE:115]ServiceType:6:="XMLCONFIG"
		[PROCESSES_TO_HANDLE:115]Data1Longint:8:=$1
		[PROCESSES_TO_HANDLE:115]TimeCreated:5:=Current time:C178(*)
		[PROCESSES_TO_HANDLE:115]DateCreated:4:=Current date:C33(*)
		[PROCESSES_TO_HANDLE:115]Comments:3:=$2
		DB_SaveRecord(->[PROCESSES_TO_HANDLE:115]; False:C215)
		While (Semaphore:C143("InitEmail"))
			DelayTicks(2)
		End while 
		If (<>Email_bo_PersonInited=False:C215)
			LOGIN_SetEmail
		End if 
		CLEAR SEMAPHORE:C144("InitEmail")
		
		If ($_bo_SendEmail)
			SSI_LoadPrefs
			If (SSI_T_EmailAdmin#"")  //the email address of the soap interface administrator
				//Send an email
				SSI_t_SentTo:="To"
				SSI_t_EmailTo:="SOAP Admin"
				SSI_t_Attachment:=""
				SSI_T_EmailText:="There is reveived XML Data received via the SOAP interface requiring your attenti"+"on. Please access the configuration manager to set up your system to handle this "+"data"
				EMAIL_t_SendCalledFrom:="SSI_UnknownXMLHandler"
				$_t_EmailID:=Email_Send(->SSI_t_SentTo; ->SSI_t_EmailTo; ->SSI_T_EmailAdmin; <>PER_t_CurrentEmailFrom; <>EMAIL_t_DefaultReplyToAddress; <>EMAIL_t_DefaultReplyToAddress; "Unkown XML Data Received"; ->SSI_t_Attachment; ->SSI_T_EmailText; False:C215)
				
			End if 
			
			
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("SSI_UnknownXMLHandler"; $_t_oldMethodName)
