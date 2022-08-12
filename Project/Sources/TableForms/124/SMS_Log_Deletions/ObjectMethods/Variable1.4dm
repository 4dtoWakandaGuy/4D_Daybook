If (False:C215)
	//object Name: [SMS_Log]SMS Log Deletions.Variable1
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
	//ARRAY TEXT(SMS_at_DeletePeriods;0)
	C_DATE:C307($_d_Date)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [SMS_Log].SMS Log Deletions.Variable1"; Form event code:C388)
Case of 
	: (Form event code:C388=On Clicked:K2:4)
		Case of 
			: (SMS_at_DeletePeriods{SMS_at_DeletePeriods}="over one week old")
				$_d_Date:=Current date:C33(*)-7
				QUERY:C277([SMS_Log:124]; [SMS_Log:124]DateSent:1<$_d_Date)
			: (SMS_at_DeletePeriods{SMS_at_DeletePeriods}="over one month old")
				$_d_Date:=Current date:C33(*)-30
				QUERY:C277([SMS_Log:124]; [SMS_Log:124]DateSent:1<$_d_Date)
			: (SMS_at_DeletePeriods{SMS_at_DeletePeriods}="over six months old")
				$_d_Date:=Current date:C33(*)-180
				QUERY:C277([SMS_Log:124]; [SMS_Log:124]DateSent:1<$_d_Date)
			: (SMS_at_DeletePeriods{SMS_at_DeletePeriods}="over one year old")
				$_d_Date:=Current date:C33(*)-365
				QUERY:C277([SMS_Log:124]; [SMS_Log:124]DateSent:1<$_d_Date)
			: (SMS_at_DeletePeriods{SMS_at_DeletePeriods}="All records")
				ALL RECORDS:C47([SMS_Log:124])
		End case 
		If (Records in selection:C76([SMS_Log:124])=0)
			ALERT:C41("There are no log records of that age to delete.")
			Gen_Alert("There are no log records of that age to delete.")
		Else 
			DELETE SELECTION:C66([SMS_Log:124])
			FLUSH CACHE:C297
		End if 
End case 
ERR_MethodTrackerReturn("OBJ [SMS_Log].SMS Log Deletions.Variable1"; $_t_oldMethodName)
