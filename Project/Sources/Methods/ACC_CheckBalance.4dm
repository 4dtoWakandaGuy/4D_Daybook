//%attributes = {}
If (False:C215)
	//Project Method Name:      ACC_CheckBalance
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 26/12/2009 16:32
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>Email_bo_Enabled; <>Email_bo_PersonInited; $_bo_Delays; $_bo_OK; $_bo_Update; $_bo_UpdatePeriod; $2; ACC_bo_Delays; ACC_bo_ReportPrefsLoaded)
	C_DATE:C307(ACC_D_EDate)
	C_LONGINT:C283($_l_Delays; $_l_Repeats; $1; ACC_l_CBFixAccountB; ACC_l_CBFixAccountV)
	C_REAL:C285($_r_Balance; $0)
	C_TEXT:C284(<>DB_t_ErrorReportAddress; <>DB_t_ErrorReportPerson; <>EMAIL_t_DefaultReplyToAddress; <>PER_t_CurrentEmailFrom; <>PER_t_CurrentUserInitials; <>PER_t_CurrentUserName; $_t_EmailAttachment; $_t_EmailID; $_t_EmailSentTo; $_t_EmailText; $_t_oldMethodName)
	C_TEXT:C284($_t_TaxQuery; $_t_UniqueIdentity; EMAIL_t_SendCalledFrom)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("ACC_CheckBalance")
DB_ErrorReportSettings
//this method which can be run every time a balance
//is updated will check if the balance is correct
//this will be passed the ID of the balance to check
If (ACC_bo_Delays)
	$_bo_Delays:=False:C215
Else 
	$_bo_Delays:=False:C215
End if 
$0:=0
If (Not:C34(ACC_bo_ReportPrefsLoaded))
	ACC_ReportingPrefs
End if 
If (ACC_l_CBFixAccountV=1)
	If ([ACCOUNT_BALANCES:34]x_ID:7#$1)
		QUERY:C277([ACCOUNT_BALANCES:34]; [ACCOUNT_BALANCES:34]x_ID:7=$1)
		$_l_Repeats:=0
		$_l_Delays:=1
		Repeat 
			$_l_Repeats:=$_l_Repeats+1
			$_bo_OK:=Check_Locked(->[ACCOUNT_BALANCES:34]; 1)
			If (Not:C34($_bo_OK))
				//IDLE
				If (($_l_Repeats/10)=(Int:C8($_l_Repeats/10)))
					//only increase every 10 tries
					$_l_Delays:=$_l_Delays+1  //increase the delay factor by 1
				End if 
				DelayTicks(2*$_l_Delays)
				//Delayticks(2*$_l_Delays)
			End if 
		Until ($_bo_OK=True:C214)
	End if 
	If (Not:C34([ACCOUNT_BALANCES:34]NoBalanceCheck:9=-1))
		//the flag for balance check will be set on all the balances which do not match
		//when we update ALSO it will be set if the transactions are deleted
		//now find the transactions
		Case of 
			: ([ACCOUNT_BALANCES:34]Account_Code:2=DB_GetLedgerVatInputACC)
				$_t_TaxQuery:=ACC_Buildunique(""; [ACCOUNT_BALANCES:34]Analysis_Code:1; [ACCOUNT_BALANCES:34]Period_Code:4; [ACCOUNT_BALANCES:34]Layer_Code:5; [ACCOUNT_BALANCES:34]Currency_Code:6)
				QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Unique_StringIdentTAX:29=$_t_TaxQuery)
				CREATE SET:C116([TRANSACTIONS:29]; "$T1")
				
				QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]IO:18#"OS")
				CREATE SET:C116([TRANSACTIONS:29]; "$T2")
				INTERSECTION:C121("$T1"; "$T2"; "$T1")
				
				QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]IO:18#"IS")
				CREATE SET:C116([TRANSACTIONS:29]; "$T2")
				INTERSECTION:C121("$T1"; "$T2"; "$T1")
				
				QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Account_Code:3#DB_GetLedgerVatInputACC)
				CREATE SET:C116([TRANSACTIONS:29]; "$T2")
				INTERSECTION:C121("$T1"; "$T2"; "$T1")
				USE SET:C118("$T1")
				$_r_Balance:=Gen_Round((Sum:C1([TRANSACTIONS:29]Tax_Amount:16)); 2; 2)
				$_t_UniqueIdentity:=ACC_Buildunique(DB_GetLedgerVatInputACC; [ACCOUNT_BALANCES:34]Analysis_Code:1; [ACCOUNT_BALANCES:34]Period_Code:4; [ACCOUNT_BALANCES:34]Layer_Code:5; [ACCOUNT_BALANCES:34]Currency_Code:6)
				QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Unique_StringIdent:28=$_t_UniqueIdentity)
				CREATE SET:C116([TRANSACTIONS:29]; "$T1")
				QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]IO:18#"OS")
				
				CREATE SET:C116([TRANSACTIONS:29]; "$T2")
				INTERSECTION:C121("$T1"; "$T2"; "$T1")
				
				QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]IO:18#"IS")
				CREATE SET:C116([TRANSACTIONS:29]; "$T2")
				INTERSECTION:C121("$T1"; "$T2"; "$T1")
				USE SET:C118("$T1")
				$_r_Balance:=Gen_Round(($_r_Balance+Sum:C1([TRANSACTIONS:29]Total:17)); 2; 2)
				If ($_bo_Delays)
					DelayTicks(60)
				End if 
			: ([ACCOUNT_BALANCES:34]Account_Code:2=DB_GetLedgerCashvatACC) & (DB_GetLedgerCashvatACC#"")
				$_t_TaxQuery:=ACC_Buildunique(""; [ACCOUNT_BALANCES:34]Analysis_Code:1; [ACCOUNT_BALANCES:34]Period_Code:4; [ACCOUNT_BALANCES:34]Layer_Code:5; [ACCOUNT_BALANCES:34]Currency_Code:6)
				QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]IO:18="OC")
				CREATE SET:C116([TRANSACTIONS:29]; "$T1")
				QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]IO:18="IC")
				CREATE SET:C116([TRANSACTIONS:29]; "$T2")
				UNION:C120("$T1"; "$T2"; "$T1")
				
				QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Unique_StringIdentTAX:29=$_t_TaxQuery)
				CREATE SET:C116([TRANSACTIONS:29]; "$T2")
				INTERSECTION:C121("$T1"; "$T2"; "$T1")
				
				QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Account_Code:3#DB_GetLedgerCashvatACC)
				CREATE SET:C116([TRANSACTIONS:29]; "$T2")
				UNION:C120("$T1"; "$T2"; "$T1")
				USE SET:C118("$T1")
				$_r_Balance:=Gen_Round((0-Sum:C1([TRANSACTIONS:29]Tax_Amount:16)); 2; 2)
				QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]IO:18="OS"; *)
				QUERY:C277([TRANSACTIONS:29];  | ; [TRANSACTIONS:29]IO:18="IS")
				CREATE SET:C116([TRANSACTIONS:29]; "$T1")
				QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Unique_StringIdentTAX:29=$_t_TaxQuery)
				CREATE SET:C116([TRANSACTIONS:29]; "$T2")
				INTERSECTION:C121("$T1"; "$T2"; "$T1")
				
				QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Account_Code:3#DB_GetLedgerCashvatACC)
				CREATE SET:C116([TRANSACTIONS:29]; "$T2")
				INTERSECTION:C121("$T1"; "$T2"; "$T1")
				USE SET:C118("$T1")
				$_r_Balance:=Gen_Round(($_r_Balance+Sum:C1([TRANSACTIONS:29]Tax_Amount:16)); 2; 2)
				$_t_UniqueIdentity:=ACC_Buildunique(DB_GetLedgerCashvatACC; [ACCOUNT_BALANCES:34]Analysis_Code:1; [ACCOUNT_BALANCES:34]Period_Code:4; [ACCOUNT_BALANCES:34]Layer_Code:5; [ACCOUNT_BALANCES:34]Currency_Code:6)
				QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Unique_StringIdent:28=$_t_UniqueIdentity)
				$_r_Balance:=Gen_Round(($_r_Balance+Sum:C1([TRANSACTIONS:29]Total:17)); 2; 2)
				If ($_bo_Delays)
					DelayTicks(60)
				End if 
				
			Else 
				QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Unique_StringIdent:28=[ACCOUNT_BALANCES:34]Unique_StringIdent:8)
				$_r_Balance:=Gen_Round((Sum:C1([TRANSACTIONS:29]Amount:6)); 2; 2)
				QUERY SELECTION:C341([TRANSACTIONS:29]; [TRANSACTIONS:29]IO:18="@C")
				If (Records in selection:C76([TRANSACTIONS:29])>0)
					$_r_Balance:=Gen_Round(($_r_Balance+Sum:C1([TRANSACTIONS:29]Tax_Amount:16)); 2; 2)
				End if 
				If ($_bo_Delays)
					DelayTicks(60)
				End if 
				
		End case 
		If ($_r_Balance#[ACCOUNT_BALANCES:34]Balance:3)
			
			If ([ACCOUNT_BALANCES:34]Balance:3#0)
				//we are going to change it
			End if 
			If (Count parameters:C259>=2)
				$_bo_Update:=$2
			Else 
				$_bo_Update:=True:C214
			End if 
			$_bo_UpdatePeriod:=True:C214
			UNLOAD RECORD:C212([PERIODS:33])
			READ ONLY:C145([PERIODS:33])
			QUERY:C277([PERIODS:33]; [PERIODS:33]Period_Code:1=[ACCOUNT_BALANCES:34]Period_Code:4)
			If ($_bo_Delays)
				DelayTicks(60)
			End if 
			
			If ([PERIODS:33]From_Date:3<ACC_D_EDate)  //Read from acc_reportingPrefs
				$_bo_UpdatePeriod:=False:C215
			End if 
			If ($_bo_Update)
				If ([ACCOUNT_BALANCES:34]Balance:3#0)
					//we are going to change it
					//C_TEXT($_t_EmailSentTo;◊ErrorReportPerson;◊ErrorReportAddress;$_t_EmailAttachment;$_t_EmailText)
					If (<>Email_bo_Enabled) & (False:C215)
						While (Semaphore:C143("InitEmail"))
							DelayTicks(2)
						End while 
						If (<>Email_bo_PersonInited=False:C215)
							LOGIN_SetEmail
						End if 
						CLEAR SEMAPHORE:C144("InitEmail")
						
						$_t_EmailSentTo:="To"
						$_t_EmailAttachment:=""
						EMAIL_t_SendCalledFrom:="ACC_CheckBalance"
						$_t_EmailText:=DB_GetOrganisation+Char:C90(13)+<>PER_t_CurrentUserInitials+" "+<>PER_t_CurrentUserName+Char:C90(13)+"Account balance update"+Char:C90(9)+[ACCOUNT_BALANCES:34]Unique_StringIdent:8+Char:C90(9)+"OLD BALANCE: "+Char:C90(9)+String:C10([ACCOUNT_BALANCES:34]Balance:3)+Char:C90(9)+"NEW BALANCE: "+Char:C90(9)+String:C10($_r_Balance)
						$_t_EmailID:=Email_Send(->$_t_EmailSentTo; -><>DB_t_ErrorReportPerson; -><>DB_t_ErrorReportAddress; <>PER_t_CurrentEmailFrom; <>EMAIL_t_DefaultReplyToAddress; <>EMAIL_t_DefaultReplyToAddress; "Daybook Error Auto Report"; ->$_t_EmailAttachment; ->$_t_EmailText; False:C215)
					Else 
					End if 
				End if 
				Case of 
					: ([ACCOUNT_BALANCES:34]NoBalanceCheck:9=0)
						If (ACC_l_CBFixAccountB=1) & ($_bo_UpdatePERIOD)
							[ACCOUNT_BALANCES:34]Balance:3:=$_r_Balance
							[ACCOUNT_BALANCES:34]NoBalanceCheck:9:=1
							$0:=$_r_Balance
							ACC_REPORTBALANCEERROR([ACCOUNT_BALANCES:34]Unique_StringIdent:8; [ACCOUNT_BALANCES:34]Balance:3; $_r_Balance; 1)
							
						Else 
							[ACCOUNT_BALANCES:34]NoBalanceCheck:9:=-1
							ACC_REPORTBALANCEERROR([ACCOUNT_BALANCES:34]Unique_StringIdent:8; [ACCOUNT_BALANCES:34]Balance:3; $_r_Balance; -1)
							$0:=$_r_Balance
						End if 
						
					: ([ACCOUNT_BALANCES:34]NoBalanceCheck:9=1)
						If (ACC_l_CBFixAccountB=1) & ($_bo_UpdatePERIOD)
							ACC_REPORTBALANCEERROR([ACCOUNT_BALANCES:34]Unique_StringIdent:8; [ACCOUNT_BALANCES:34]Balance:3; $_r_Balance; 1)
							[ACCOUNT_BALANCES:34]Balance:3:=$_r_Balance
							[ACCOUNT_BALANCES:34]NoBalanceCheck:9:=1
							$0:=$_r_Balance
						Else 
							ACC_REPORTBALANCEERROR([ACCOUNT_BALANCES:34]Unique_StringIdent:8; [ACCOUNT_BALANCES:34]Balance:3; $_r_Balance; -1)
							[ACCOUNT_BALANCES:34]NoBalanceCheck:9:=1
							$0:=$_r_Balance
							
						End if 
				End case 
				
				DB_SaveRecord(->[ACCOUNT_BALANCES:34])
				AA_CheckFileUnlocked(->[ACCOUNT_BALANCES:34]x_ID:7)
			Else 
				$0:=$_r_Balance
			End if 
		Else 
			If (Count parameters:C259>=2)
				$_bo_Update:=$2
			Else 
				$_bo_Update:=True:C214
			End if 
			If (Not:C34($_bo_Update))
				$0:=$_r_Balance
			End if 
		End if 
		
		
	End if 
End if 
ERR_MethodTrackerReturn("ACC_CheckBalance"; $_t_oldMethodName)
