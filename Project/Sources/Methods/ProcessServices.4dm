//%attributes = {}

//Database Method Name:      ProcessServices
//------------------ Method Notes ------------------
//ProcessServices
//16/4/2
//  Stored proc that runs each time 4D Server starts up
// Runs various methods that are called from triggers
// in certain tables when records are saved
// and also cecks for other things that need to be done
// Flags in [ProcessesToHandle]Status:
//             1 = waiting to be processed
//              2 = processed successfully
//             3 = error
//------------------ Revision Control ----------------
//Date Created:  02/10/2017
//Created BY:  Unknown
//Date Modified:
//Modified By: DefaultUser
//Modification notes
//Variable Declarations
If (True:C214)
	ARRAY LONGINT:C221($_al_PropertyTypes; 0)
	ARRAY LONGINT:C221($_al_TablesAccessed; 0)
	//ARRAY LONGINT(ACC_al_Batches;0)
	ARRAY POINTER:C280($_aptr_FieldPointerArray; 0)
	ARRAY TEXT:C222($_at_PropertyNames; 0)
	C_BOOLEAN:C305(<>DB_bo_NoServicesPlease; <>Email_bo_Enabled; <>Email_bo_PersonInited; <>ProcessServicesActive; <>SYS_bo_QuitCalled; $_bo_Flush; $_Bo_IsOK; $_bo_Longint4; $_bo_MoreToHandle; $_bo_OK; $_bo_Parameter1)
	C_BOOLEAN:C305($_bo_ProcessToRun; BP_bo_BackGrounderInited; DB_bo_NotFound; JC_bo_ActivateProcessServices; JC_bo_Prefs2Loaded; vHideMessages)
	C_DATE:C307($_d_Date; vLastProcessServiceCorruption)
	C_LONGINT:C283(<>ProcessServicesActiveCount; $_bo_Unload; $_l_BlobOffset; $_l_BufferFlush; $_l_CheckDelay; $_l_DataExportIndexCount; $_l_DelayCount; $_l_End; $_l_FieldNumber; $_l_IndecesDone; $_l_index)
	C_LONGINT:C283($_l_IndexRef; $_l_Longint1; $_l_Longint2; $_l_Longint3; $_l_Longint4; $_l_ManageTable; $_l_Process; $_l_RecordID; $_l_RecordNumber; $_l_RecordNumber2; $_l_RecordsProcessed)
	C_LONGINT:C283($_l_RecordStatus; $_l_TableCount; $_l_TableNumber; $_l_TableToCreateMirrorFrom; $_l_Time; $1; iSMS_Msgs_Sent)
	C_OBJECT:C1216($_Obj_RecordInformation)
	C_POINTER:C301($_ptr_Field; $_Ptr_MasterTable; $_Ptr_TablePointer)
	C_REAL:C285(lCredits; SMS_AvgMsgCredits; SMS_Credits; SMS_rCreditsUsed)
	C_TEXT:C284(<>DB_t_ErrorReportAddress; <>DB_t_ErrorReportPerson; <>EMAIL_t_DefaultReplyToAddress; <>PER_t_CurrentEmailFrom; $_t_EmailAttachment; $_t_EmailID; $_t_EmailSentTo; $_t_EmailText; $_t_FieldName; $_t_IndexName; $_t_LasteditorName)
	C_TEXT:C284($_t_OldMethodName; $_t_ServiceType; $_t_tab; $_t_tableName; $_t_Text; $_t_TimeString; $_T_UUID_RecordToCreateMirrorF; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; DB_t_error)
	C_TEXT:C284(EMAIL_t_EmailType; EMAIL_t_SendCalledFrom)
	C_TIME:C306($_ti_2Hours; $_ti_CurrentTime; $_ti_DocReference; $_ti_LastActivityTime)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("ProcessServices")



While (Semaphore:C143("InitEmail"))
	DelayTicks(2)
End while 
If (<>Email_bo_PersonInited=False:C215)
	LOGIN_SetEmail
End if 


CLEAR SEMAPHORE:C144("InitEmail")
UNLOAD RECORD:C212([PERSONNEL:11])
If (Count parameters:C259>=1)
	$_l_ManageTable:=$1
Else 
	$_l_ManageTable:=0
End if 
If (<>DB_bo_NoServicesPlease)
	Repeat 
		DelayTicks(60*60)
	Until (Not:C34(<>DB_bo_NoServicesPlease))
End if 


Start_Process  //added 12/03/07 -kmw


DB_t_CurrentFormUsage2:="NWin"  //added 12/03/07 -kmw (don't Open_Any_Windows...e.g...when posting transactions)
vHideMessages:=True:C214  //added 12/03/07 -kmw (don't show messages...e.g...when posting transactions)



JC_LoadPrefs2  //added 12/04/08 -kmw (sets JC_bo_ActivateProcessServices)
<>ProcessServicesActive:=False:C215  // this will be checked in On Shutdown
READ ONLY:C145([PROCESSES_TO_HANDLE:115])

$_bo_Parameter1:=True:C214
QUERY:C277([PROCESSES_TO_HANDLE:115]; [PROCESSES_TO_HANDLE:115]Status:2=2)
If (Records in selection:C76([PROCESSES_TO_HANDLE:115])>0) & ($_l_ManageTable=0)
	$_l_Process:=New process:C317("ProcessServices_Cleanup"; 256000; "CLEAN UP"; $_bo_Parameter1; *)
End if 
READ WRITE:C146([PROCESSES_TO_HANDLE:115])

$_l_CheckDelay:=60*5  // no. of ticks between checking 8/05/02 pb
$_ti_2Hours:=?02:00:00?
$_l_DataExportIndexCount:=120  // no. of loops before checking for Export Wizard exports to do
$_l_IndecesDone:=0
$_ti_LastActivityTime:=Current time:C178(*)
$_l_End:=0
// first check to see if there are any processes waiting to run
//TRACE
If (Records in table:C83([PROCESSES_TO_HANDLE:115])>1000000)
	
	SCAN INDEX:C350([PROCESSES_TO_HANDLE:115]Status:2; 1001; >)
	If ($_l_ManageTable>0)
		QUERY SELECTION:C341([PROCESSES_TO_HANDLE:115]; [PROCESSES_TO_HANDLE:115]TableNumber:1=$_l_ManageTable)
	Else 
		QUERY SELECTION:C341([PROCESSES_TO_HANDLE:115]; [PROCESSES_TO_HANDLE:115]TableNumber:1#0)
	End if 
Else 
	QUERY:C277([PROCESSES_TO_HANDLE:115]; [PROCESSES_TO_HANDLE:115]Status:2=1)
	If ($_l_ManageTable>0)
		QUERY SELECTION:C341([PROCESSES_TO_HANDLE:115]; [PROCESSES_TO_HANDLE:115]TableNumber:1=$_l_ManageTable)
	Else 
		QUERY SELECTION:C341([PROCESSES_TO_HANDLE:115]; [PROCESSES_TO_HANDLE:115]TableNumber:1#0)
	End if 
	If (Records in selection:C76([PROCESSES_TO_HANDLE:115])>0) & ([PROCESSES_TO_HANDLE:115]Status:2#1) & ($_l_ManageTable=0)  //added 15/03/07 -kmw, temp fix, checks for corrupt index - still having some issues with corrupt index causing processes to handle to remain forever
		SET INDEX:C344([PROCESSES_TO_HANDLE:115]Status:2; False:C215)
		$_l_TableNumber:=Table:C252(->[PROCESSES_TO_HANDLE:115])
		$_l_FieldNumber:=Field:C253(->[PROCESSES_TO_HANDLE:115]Status:2)
		$_Ptr_TablePointer:=Table:C252($_l_TableNumber)
		$_t_tableName:=Table name:C256($_Ptr_TablePointer)
		$_ptr_Field:=Field:C253($_l_TableNumber; $_l_FieldNumber)
		$_t_FieldName:=Field name:C257($_ptr_Field)
		$_t_tableName:=Substring:C12($_t_tableName; 1; 3)
		ARRAY POINTER:C280($_aptr_FieldPointerArray; 1)
		$_aptr_FieldPointerArray{1}:=Field:C253($_l_TableNumber; $_l_FieldNumber)
		$_t_IndexName:=$_t_tableName+$_t_FieldName+"indx"
		$_t_IndexName:=Replace string:C233($_t_IndexName; " "; "")
		CREATE INDEX:C966($_Ptr_TablePointer->; $_aptr_FieldPointerArray; Default index type:K58:2; $_t_IndexName)
		QUERY:C277([PROCESSES_TO_HANDLE:115]; [PROCESSES_TO_HANDLE:115]Status:2=1)
		If ($_l_ManageTable>0)
			QUERY SELECTION:C341([PROCESSES_TO_HANDLE:115]; [PROCESSES_TO_HANDLE:115]TableNumber:1=$_l_ManageTable)
		End if 
		If (vLastProcessServiceCorruption=!00-00-00!) | (vLastProcessServiceCorruption<Current date:C33(*))  //limit number of emails sent
			vLastProcessServiceCorruption:=Current date:C33(*)
			If (<>Email_bo_Enabled)
				EMAIL_t_EmailType:="To"  // 22/04/02 pb
				$_t_EmailSentTo:="To"
				$_t_EmailAttachment:=""
				$_t_EmailText:="Error in process Services. Index was corrupted. Has now been fixed."
				EMAIL_t_SendCalledFrom:="ProcessServices"
				$_t_EmailID:=Email_Send(->$_t_EmailSentTo; -><>DB_t_ErrorReportPerson; -><>DB_t_ErrorReportAddress; <>PER_t_CurrentEmailFrom; <>EMAIL_t_DefaultReplyToAddress; <>EMAIL_t_DefaultReplyToAddress; "Daybook Error Auto Report"; ->$_t_EmailAttachment; ->$_t_EmailText; False:C215)
			End if 
		End if 
	End if 
End if   // 1 = waiting to be processed


If (Records in selection:C76([PROCESSES_TO_HANDLE:115])>0)
	$_bo_ProcessToRun:=True:C214
Else 
	$_bo_ProcessToRun:=False:C215
End if 
$_bo_MoreToHandle:=False:C215
$_l_BufferFlush:=0

While ((Not:C34(Process aborted:C672)) & (Not:C34(<>SYS_bo_QuitCalled)))
	If (<>DB_bo_NoServicesPlease)
		Repeat 
			DelayTicks(60*60)
		Until (Not:C34(<>DB_bo_NoServicesPlease))
	End if 
	
	If ($_l_ManageTable>0)
		READ WRITE:C146([PROCESSES_TO_HANDLE:115])
	Else 
		
		READ ONLY:C145([PROCESSES_TO_HANDLE:115])
		
	End if 
	
	If ($_bo_MoreToHandle)
		$_bo_ProcessToRun:=True:C214
	End if 
	
	If ($_bo_ProcessToRun)
		$_ti_CurrentTime:=Current time:C178(*)
		$_bo_ProcessToRun:=False:C215
		
		<>ProcessServicesActive:=True:C214
		<>ProcessServicesActiveCount:=<>ProcessServicesActiveCount+1
		//   ALERT(String(Records in selection([ProcessesToHandle]))+" to handle.")
		//   TRACE
		If (Records in table:C83([PROCESSES_TO_HANDLE:115])>1000000)
			
			
			SCAN INDEX:C350([PROCESSES_TO_HANDLE:115]Status:2; 1001; >)
			If ($_l_ManageTable>0)
				QUERY SELECTION:C341([PROCESSES_TO_HANDLE:115]; [PROCESSES_TO_HANDLE:115]TableNumber:1=$_l_ManageTable)
			Else 
				QUERY SELECTION:C341([PROCESSES_TO_HANDLE:115]; [PROCESSES_TO_HANDLE:115]TableNumber:1#0)
			End if 
			
		Else 
			QUERY:C277([PROCESSES_TO_HANDLE:115]; [PROCESSES_TO_HANDLE:115]Status:2=1)
			If ($_l_ManageTable>0)
				QUERY SELECTION:C341([PROCESSES_TO_HANDLE:115]; [PROCESSES_TO_HANDLE:115]TableNumber:1=$_l_ManageTable)
			Else 
				QUERY SELECTION:C341([PROCESSES_TO_HANDLE:115]; [PROCESSES_TO_HANDLE:115]TableNumber:1#0)
			End if 
			If (Records in selection:C76([PROCESSES_TO_HANDLE:115])>0) & ([PROCESSES_TO_HANDLE:115]Status:2#1) & ($_l_ManageTable=0)  //added 15/03/07 -kmw, temp fix, checks for corrupt index - still having some issues with corrupt index causing processes to handle to remain forever
				SET INDEX:C344([PROCESSES_TO_HANDLE:115]Status:2; False:C215)
				//SET INDEX([ProcessesToHandle]Status;True)
				$_l_TableNumber:=Table:C252(->[PROCESSES_TO_HANDLE:115])
				$_l_FieldNumber:=Field:C253(->[PROCESSES_TO_HANDLE:115]Status:2)
				$_Ptr_TablePointer:=Table:C252($_l_TableNumber)
				$_t_tableName:=Table name:C256($_Ptr_TablePointer)
				$_ptr_Field:=Field:C253($_l_TableNumber; $_l_FieldNumber)
				$_t_FieldName:=Field name:C257($_ptr_Field)
				$_t_tableName:=Substring:C12($_t_tableName; 1; 3)
				ARRAY POINTER:C280($_aptr_FieldPointerArray; 1)
				$_aptr_FieldPointerArray{1}:=Field:C253($_l_TableNumber; $_l_FieldNumber)
				$_t_IndexName:=$_t_tableName+$_t_FieldName+"indx"
				$_t_IndexName:=Replace string:C233($_t_IndexName; " "; "")
				CREATE INDEX:C966($_Ptr_TablePointer->; $_aptr_FieldPointerArray; Default index type:K58:2; $_t_IndexName)
				QUERY:C277([PROCESSES_TO_HANDLE:115]; [PROCESSES_TO_HANDLE:115]Status:2=1)
				If (vLastProcessServiceCorruption=!00-00-00!) | (vLastProcessServiceCorruption<Current date:C33(*))  //limit number of emails sent
					vLastProcessServiceCorruption:=Current date:C33(*)
					If (<>Email_bo_Enabled)
						EMAIL_t_EmailType:="To"  // 22/04/02 pb
						$_t_EmailSentTo:="To"
						$_t_EmailAttachment:=""
						$_t_EmailText:="Error in process Services. Index was corrupted. Has now been fixed."
						EMAIL_t_SendCalledFrom:="ProcessServices(2)"
						$_t_EmailID:=Email_Send(->$_t_EmailSentTo; -><>DB_t_ErrorReportPerson; -><>DB_t_ErrorReportAddress; <>PER_t_CurrentEmailFrom; <>EMAIL_t_DefaultReplyToAddress; <>EMAIL_t_DefaultReplyToAddress; "Daybook Error Auto Report"; ->$_t_EmailAttachment; ->$_t_EmailText; False:C215)
					End if 
				End if 
			End if 
			
		End if 
		
		
		$_bo_MoreToHandle:=False:C215
		
		If (Records in selection:C76([PROCESSES_TO_HANDLE:115])>1000) & ($_l_ManageTable>0)
			REDUCE SELECTION:C351([PROCESSES_TO_HANDLE:115]; 1000)
			$_bo_MoreToHandle:=True:C214
		End if 
		MESSAGES OFF:C175
		ORDER BY:C49([PROCESSES_TO_HANDLE:115]; [PROCESSES_TO_HANDLE:115]DateCreated:4; [PROCESSES_TO_HANDLE:115]TimeCreated:5)
		MESSAGES ON:C181
		If ($_l_ManageTable=0)
			UNLOAD RECORD:C212([PROCESSES_TO_HANDLE:115])
			READ ONLY:C145([PROCESSES_TO_HANDLE:115])
		End if 
		FIRST RECORD:C50([PROCESSES_TO_HANDLE:115])
		lCredits:=0  // no. of credits available
		SMS_rCreditsUsed:=0  // no. of credits used in this session 10/10/02 pb
		iSMS_Msgs_Sent:=0
		COPY NAMED SELECTION:C331([PROCESSES_TO_HANDLE:115]; "Current")
		$_l_End:=Records in selection:C76([PROCESSES_TO_HANDLE:115])
		//ARRAY LONGINT(PS_l_aRecordNumbers;0)
		// LONGINT ARRAY FROM SELECTION([ProcessesToHandle];PS_l_aRecordNumbers)
		$_l_BufferFlush:=0
		$_l_RecordsProcessed:=0
		ARRAY LONGINT:C221($_al_TablesAccessed; 0)
		For ($_l_Index; 1; $_l_End)
			If (<>SYS_bo_QuitCalled)
				$_l_Index:=$_l_End
			End if 
			$_l_BufferFlush:=$_l_BufferFlush+1
			USE NAMED SELECTION:C332("Current")
			If ($_l_Index<=Records in selection:C76([PROCESSES_TO_HANDLE:115]))
				If ($_l_ManageTable>0)
					READ WRITE:C146([PROCESSES_TO_HANDLE:115])
					GOTO SELECTED RECORD:C245([PROCESSES_TO_HANDLE:115]; $_l_Index)
					While (Not:C34(Check_Locked(->[PROCESSES_TO_HANDLE:115]; 0))) & (Not:C34(<>SYS_bo_QuitCalled))
						DelayTicks(60)
					End while 
				Else 
					GOTO SELECTED RECORD:C245([PROCESSES_TO_HANDLE:115]; $_l_Index)
				End if 
				$_l_RecordNumber:=Record number:C243([PROCESSES_TO_HANDLE:115])
				
				$_l_Time:=(Current time:C178(*)*1)
				
				
				If ([PROCESSES_TO_HANDLE:115]Status:2#2)
					If ([PROCESSES_TO_HANDLE:115]Status:2#3)
						$_l_RecordsProcessed:=$_l_RecordsProcessed+1
					End if 
					If ($_l_ManageTable>0)
						
						StartTransaction  // 13/05/02 pb
						DB_bo_NotFound:=False:C215
						$_ti_CurrentTime:=((Current time:C178*1)*60)
						Case of 
							: ([PROCESSES_TO_HANDLE:115]ServiceType:6="Integrity")
								
								CLEAR VARIABLE:C89($_Obj_RecordInformation)
								
								$_l_BlobOffset:=0
								
								BLOB TO VARIABLE:C533([PROCESSES_TO_HANDLE:115]Data5Blob:12; $_Obj_RecordInformation)  //Extract the object from the blob into the object
								
								ARRAY TEXT:C222($_at_PropertyNames; 0)
								ARRAY LONGINT:C221($_al_PropertyTypes; 0)
								OB GET PROPERTY NAMES:C1232($_Obj_RecordInformation; $_at_PropertyNames; $_al_PropertyTypes)
								$_t_LasteditorName:=OB Get:C1224($_Obj_RecordInformation; "Last Editor Name"; Is text:K8:3)
								$_l_TableToCreateMirrorFrom:=OB Get:C1224($_Obj_RecordInformation; "Master Table"; Is longint:K8:6)  //This should be the same as $_l_ProcessTableNumber-if its not???
								$_T_UUID_RecordToCreateMirrorF:=OB Get:C1224($_Obj_RecordInformation; "Master UUID"; Is text:K8:3)
								$_l_RecordID:=OB Get:C1224($_Obj_RecordInformation; "Master ID"; Is longint:K8:6)
								$_l_index:=Find in array:C230($_at_PropertyNames; "Record Status")
								$_l_RecordStatus:=0
								If ($_l_Index>0)
									$_l_RecordStatus:=OB Get:C1224($_Obj_RecordInformation; "Record Status"; Is longint:K8:6)
								End if 
								//$_Bo_IsOK:=DATA_CreateMirror($_l_TableToCreateMirrorFrom;$_T_UUID_RecordToCreateMirrorF;$_l_RecordID;$_l_RecordStatus;$_t_LasteditorName)
								$_Ptr_MasterTable:=Table:C252($_l_TableToCreateMirrorFrom)
								UNLOAD RECORD:C212($_Ptr_MasterTable->)  //it should not be loaded but lets be careful out there
								
							: ([PROCESSES_TO_HANDLE:115]TableNumber:1=Table:C252(->[CURRENT_STOCK:62]))
								DB_t_error:="PS_CurrentStock"
								
								$_bo_OK:=ProcessService_Currentstock
								UNLOAD RECORD:C212([STOCK_MOVEMENTS:40])
								UNLOAD RECORD:C212([STOCK_MOVEMENT_ITEMS:27])
								UNLOAD RECORD:C212([STOCK_LEVELS:58])
								UNLOAD RECORD:C212([CURRENT_STOCK:62])
							: ([PROCESSES_TO_HANDLE:115]TableNumber:1=Table:C252(->[DIARY:12]))
								
								
								DB_t_error:="PS_Diary"
								$_bo_OK:=ProcessService_Diary
								UNLOAD RECORD:C212([DIARY:12])
								
							: ([PROCESSES_TO_HANDLE:115]TableNumber:1=Table:C252(->[INFORMATION:55]))
								
								
								DB_t_error:="PS_qualities"
								$_bo_OK:=ProcessService_Qualities
							: ([PROCESSES_TO_HANDLE:115]TableNumber:1=Table:C252(->[PERSONNEL:11]))
								
								
								DB_t_error:="PS_Personnel"
								$_bo_OK:=ProcessService_Personnel
								UNLOAD RECORD:C212([PERSONNEL:11])
								UNLOAD RECORD:C212([PERSONNEL_GROUPS:92])
								UNLOAD RECORD:C212([PERSONNEL_DIARY_ACCESS:149])
							: ([PROCESSES_TO_HANDLE:115]TableNumber:1=Table:C252(->[STOCK_MOVEMENTS:40]))
								DB_t_error:="PS_Stock"
								$_bo_OK:=ProcessService_Stock
								UNLOAD RECORD:C212([STOCK_MOVEMENTS:40])
								UNLOAD RECORD:C212([STOCK_MOVEMENT_ITEMS:27])
								UNLOAD RECORD:C212([STOCK_LEVELS:58])
								UNLOAD RECORD:C212([CURRENT_STOCK:62])
							: ([PROCESSES_TO_HANDLE:115]TableNumber:1=Table:C252(->[STOCK_MOVEMENT_ITEMS:27]))
								
								
								DB_t_error:="PS_stockitemsl"
								$_bo_OK:=ProcessService_StockItems
								UNLOAD RECORD:C212([STOCK_MOVEMENTS:40])
								UNLOAD RECORD:C212([STOCK_MOVEMENT_ITEMS:27])
								UNLOAD RECORD:C212([STOCK_LEVELS:58])
								UNLOAD RECORD:C212([CURRENT_STOCK:62])
							: ([PROCESSES_TO_HANDLE:115]TableNumber:1=Table:C252(->[STOCK_LEVELS:58]))
								
								
								DB_t_error:="PS_stocklevels"
								$_bo_OK:=ProcessService_StockLevels
								UNLOAD RECORD:C212([STOCK_MOVEMENTS:40])
								UNLOAD RECORD:C212([STOCK_MOVEMENT_ITEMS:27])
								UNLOAD RECORD:C212([STOCK_LEVELS:58])
								UNLOAD RECORD:C212([CURRENT_STOCK:62])
							: ([PROCESSES_TO_HANDLE:115]TableNumber:1=Table:C252(->[ACCOUNT_BALANCES:34]))
								
								DB_t_error:="PS_accbal"
								$_bo_OK:=ProcessService_AccBal
								UNLOAD RECORD:C212([ACCOUNTS:32])
								UNLOAD RECORD:C212([ACCOUNT_BALANCES:34])
								UNLOAD RECORD:C212([TRANSACTION_BATCHES:30])
								UNLOAD RECORD:C212([TRANSACTION_BATCH_ITEMS:155])
								UNLOAD RECORD:C212([TRANSACTIONS:29])
							: ([PROCESSES_TO_HANDLE:115]TableNumber:1=Table:C252(->[TRANSACTIONS:29]))
								DB_t_error:="PS_stocktransactions"
								$_bo_OK:=ProcessService_Transactions($_l_Time)
								UNLOAD RECORD:C212([ACCOUNTS:32])
								UNLOAD RECORD:C212([ACCOUNT_BALANCES:34])
								UNLOAD RECORD:C212([TRANSACTION_BATCHES:30])
								UNLOAD RECORD:C212([TRANSACTION_BATCH_ITEMS:155])
								UNLOAD RECORD:C212([TRANSACTIONS:29])
							: ([PROCESSES_TO_HANDLE:115]TableNumber:1=Table:C252(->[ORDERS:24]))
								
								
								DB_t_error:="PS_stockorders"
								$_bo_OK:=ProcessService_ORDERS
								UNLOAD RECORD:C212([ORDERS:24])
								UNLOAD RECORD:C212([ORDER_ITEMS:25])
							: ([PROCESSES_TO_HANDLE:115]TableNumber:1=Table:C252(->[LIST_ITEMS:95]))  //New line added NG 18/1/2003
								DB_t_error:="PS_stockListitems"
								$_bo_OK:=ProcessService_ListItems  //New Line added NG 18/1/2003
							: ([PROCESSES_TO_HANDLE:115]TableNumber:1=Table:C252(->[JOBS:26]))  //New Lines added NG 24/2/2004
								DB_t_error:="PS_stockJobs"
								$_bo_OK:=ProcessService_Jobs
								
							: ([PROCESSES_TO_HANDLE:115]TableNumber:1=Table:C252(->[JOB_STAGES:47]))  //added 20/02/07 -kmw
								DB_t_error:="PS_JobStages"
								If (Not:C34(JC_bo_Prefs2Loaded))
									JC_LoadPrefs2
								End if 
								If (JC_bo_ActivateProcessServices)
									$_bo_OK:=ProcessService_JobStages  //added 20/02/07 -kmw
								Else 
									$_bo_OK:=True:C214
								End if 
							: ([PROCESSES_TO_HANDLE:115]TableNumber:1=Table:C252(->[JOB PERSONNEL:48]))  //added 20/02/07 -kmw
								DB_t_error:="PS_Jobpersonnel"
								If (Not:C34(JC_bo_Prefs2Loaded))
									JC_LoadPrefs2
								End if 
								If (JC_bo_ActivateProcessServices)
									$_bo_OK:=ProcessService_JobPersonnel  //added 20/02/07 -kmw
								Else 
									$_bo_OK:=True:C214
								End if 
							: ([PROCESSES_TO_HANDLE:115]TableNumber:1=Table:C252(->[ORDER_ITEMS:25]))  //added 28/02/07 -kmw
								DB_t_error:="PS_orderitems"
								If (Not:C34(JC_bo_Prefs2Loaded))
									JC_LoadPrefs2
								End if 
								If (JC_bo_ActivateProcessServices)
									$_bo_OK:=ProcessService_OrderItems  //added 28/02/07 -kmw
								Else 
									$_bo_OK:=True:C214
								End if 
								UNLOAD RECORD:C212([ORDERS:24])
								UNLOAD RECORD:C212([ORDER_ITEMS:25])
								
								
								
							: ([PROCESSES_TO_HANDLE:115]TableNumber:1=Table:C252(->[PROJECTS:89]))  //New Lines added NG 24/2/2004
								DB_t_error:="PS_JobProjects"
								$_bo_OK:=ProcessService_Projects
							: ([PROCESSES_TO_HANDLE:115]TableNumber:1=Table:C252(->[PERSONNEL:11]))  //New line added V11 November 2009
								DB_t_error:="PS_JobPersonnel"
								$_bo_OK:=ProcessService_Personnel
							: ([PROCESSES_TO_HANDLE:115]TableNumber:1=Table:C252(->[INVOICES:39]))  //New line added NG 29/5/2004
								DB_t_error:="PS_JobInvoices"
								$_bo_OK:=ProcessServices_INVOICES  //New Line added NG 29/5/2004
								UNLOAD RECORD:C212([INVOICES:39])
								UNLOAD RECORD:C212([INVOICES_ITEMS:161])
							: ([PROCESSES_TO_HANDLE:115]TableNumber:1=0)  //New line added NG 29/5/2004
								
								$_bo_OK:=True:C214
								
							Else 
								$_bo_OK:=False:C215
								//BEEP
								//TRACE
						End case 
						$_ti_CurrentTime:=(((Current time:C178*1)*60)-$_ti_CurrentTime)/1000
						$_l_RecordNumber2:=Record number:C243([PROCESSES_TO_HANDLE:115])
						If ($_l_RecordNumber#$_l_RecordNumber2)
							USE NAMED SELECTION:C332("Current")
							READ WRITE:C146([PROCESSES_TO_HANDLE:115])
							GOTO SELECTED RECORD:C245([PROCESSES_TO_HANDLE:115]; $_l_Index)
							While (Not:C34(Check_Locked(->[PROCESSES_TO_HANDLE:115]; 0))) & (Not:C34(<>SYS_bo_QuitCalled))
								DelayTicks(60)
							End while 
							
						End if 
						
						
						If ($_ti_CurrentTime>10) & (False:C215)  //If it took more than 10 seconds to process record it
							//Record what process was being run
							If (Test path name:C476("ProcessService.txt")#Is a document:K24:1)
								DB_t_error:="PS_CreateDocument"
								$_ti_DocReference:=DB_CreateDocument("ProcessService.txt")
								$_t_tab:=Char:C90(Tab:K15:37)
								SEND PACKET:C103($_ti_DocReference; "Comments"+$_t_tab+"Data1 Longint"+$_t_tab+"Data2 Longint"+$_t_tab+"Data3Longint"+$_t_tab+"Data4Boolean"+$_t_tab+"Data5Blob"+$_t_tab+"DateCreated"+$_t_tab+"RecordNUmber"+$_t_tab+"ServiceType"+$_t_tab+"Status"+$_t_tab+"TableNumber"+$_t_tab+"Time Created"+Char:C90(10)+Char:C90(13))
								
								
								CLOSE DOCUMENT:C267($_ti_DocReference)
							End if 
							
							If (Is macOS:C1572)
								_O_SET DOCUMENT CREATOR:C531("ProcessService.txt"; "ttxt")
							End if 
							$_ti_DocReference:=Append document:C265("ProcessService.txt")
							$_t_tab:=Char:C90(9)
							SEND PACKET:C103($_ti_DocReference; [PROCESSES_TO_HANDLE:115]Comments:3+$_t_tab)
							SEND PACKET:C103($_ti_DocReference; String:C10([PROCESSES_TO_HANDLE:115]Data1Longint:8)+$_t_tab)
							SEND PACKET:C103($_ti_DocReference; String:C10([PROCESSES_TO_HANDLE:115]Data2Longint:9)+$_t_tab)
							SEND PACKET:C103($_ti_DocReference; String:C10([PROCESSES_TO_HANDLE:115]Data3Longint:10)+$_t_tab)
							SEND PACKET:C103($_ti_DocReference; String:C10(Num:C11([PROCESSES_TO_HANDLE:115]Data4Boolean:11))+$_t_tab)
							$_t_Text:=BLOB to text:C555([PROCESSES_TO_HANDLE:115]Data5Blob:12; 3)
							
							SEND PACKET:C103($_ti_DocReference; $_t_Text+$_t_tab)
							SEND PACKET:C103($_ti_DocReference; String:C10([PROCESSES_TO_HANDLE:115]DateCreated:4)+$_t_tab)
							SEND PACKET:C103($_ti_DocReference; String:C10([PROCESSES_TO_HANDLE:115]RecordNumber:7)+$_t_tab)
							SEND PACKET:C103($_ti_DocReference; ([PROCESSES_TO_HANDLE:115]ServiceType:6)+$_t_tab)
							SEND PACKET:C103($_ti_DocReference; String:C10([PROCESSES_TO_HANDLE:115]Status:2)+$_t_tab)
							SEND PACKET:C103($_ti_DocReference; String:C10([PROCESSES_TO_HANDLE:115]TableNumber:1)+$_t_tab)
							$_l_Time:=[PROCESSES_TO_HANDLE:115]TimeCreated:5*1
							$_t_TimeString:=Time string:C180($_l_Time)
							SEND PACKET:C103($_ti_DocReference; $_t_TimeString+Char:C90(9))
							SEND PACKET:C103($_ti_DocReference; String:C10($_ti_CurrentTime)+Char:C90(10)+Char:C90(13))
							
							CLOSE DOCUMENT:C267($_ti_DocReference)
						End if 
						$_bo_Flush:=($_l_BufferFlush>1000) | ($_l_Index=$_l_End) | (<>SYS_bo_QuitCalled)
						If ($_l_BufferFlush>1000)
							$_l_BufferFlush:=0
						End if 
						$_l_TableCount:=Get last table number:C254
						For ($_bo_Unload; 1; $_l_TableCount)
							If (Is table number valid:C999($_bo_Unload))
								If ($_bo_Unload#Table:C252(->[PROCESSES_TO_HANDLE:115]))
									$_Ptr_TablePointer:=Table:C252($_bo_Unload)
									REDUCE SELECTION:C351($_Ptr_TablePointer->; 0)
								End if 
							End if 
						End for 
						If ($_bo_OK)
							OK:=1
							//      VALIDATE TRANSACTION
							Transact_End(True:C214; $_bo_Flush)  // 13/05/02 pb
							If ([PROCESSES_TO_HANDLE:115]Status:2=1)  //| ([ProcessesToHandle]Status=1)
								[PROCESSES_TO_HANDLE:115]Status:2:=2
							End if 
						Else 
							OK:=0
							If (DB_bo_NotFound=False:C215)
								//       CANCEL TRANSACTION
								Transact_End(False:C215; $_bo_Flush)  // 13/05/02 pb
								If ([PROCESSES_TO_HANDLE:115]Status:2=-99)  //add 02/03/07
									DelayTicks(10)  //add 02/03/07
									[PROCESSES_TO_HANDLE:115]Status:2:=1  //add 02/03/07
								Else   //add 02/03/07
									[PROCESSES_TO_HANDLE:115]Status:2:=3
								End if   //add 02/03/07
							Else 
								Transact_End(True:C214)
								
							End if 
						End if 
						
						$_l_TableNumber:=[PROCESSES_TO_HANDLE:115]TableNumber:1
						$_d_Date:=[PROCESSES_TO_HANDLE:115]DateCreated:4
						$_t_ServiceType:=[PROCESSES_TO_HANDLE:115]ServiceType:6
						$_l_RecordNumber:=[PROCESSES_TO_HANDLE:115]RecordNumber:7
						$_l_Longint1:=[PROCESSES_TO_HANDLE:115]Data1Longint:8
						$_l_Longint2:=[PROCESSES_TO_HANDLE:115]Data2Longint:9
						$_l_Longint3:=[PROCESSES_TO_HANDLE:115]Data3Longint:10
						$_bo_Longint4:=[PROCESSES_TO_HANDLE:115]Data4Boolean:11
						DB_t_error:="PS_Saverecord"
						DB_SaveRecord(->[PROCESSES_TO_HANDLE:115])
					Else 
						//TRACE
						$_l_IndexRef:=Find in array:C230($_al_TablesAccessed; [PROCESSES_TO_HANDLE:115]TableNumber:1)
						If ($_l_IndexRef<0)
							APPEND TO ARRAY:C911($_al_TablesAccessed; [PROCESSES_TO_HANDLE:115]TableNumber:1)
							
							If (Is table number valid:C999([PROCESSES_TO_HANDLE:115]TableNumber:1))
								$_t_tableName:=Table name:C256([PROCESSES_TO_HANDLE:115]TableNumber:1)
								$_l_TableNumber:=[PROCESSES_TO_HANDLE:115]TableNumber:1
								UNLOAD RECORD:C212([PROCESSES_TO_HANDLE:115])
								$_l_Process:=New process:C317("ProcessServices"; 128*1024; "SP for Table "+$_t_tableName; $_l_TableNumber; *)
								//notice that this will not start a process if it is already running
							End if 
						End if 
						UNLOAD RECORD:C212([PROCESSES_TO_HANDLE:115])
						
					End if 
					
					//here find if there are any other processes to repeat the same
				End if 
				
				NEXT RECORD:C51([PROCESSES_TO_HANDLE:115])
			Else 
				$_l_Index:=$_l_End
			End if 
			If (<>SYS_bo_QuitCalled)
				$_l_Index:=$_l_End
			End if 
			
		End for 
		
		If ($_l_RecordsProcessed=0)
			$_bo_MoreToHandle:=False:C215
		End if 
		<>ProcessServicesActive:=False:C215
		<>ProcessServicesActiveCount:=<>ProcessServicesActiveCount-1
		UNLOAD RECORD:C212([PROCESSES_TO_HANDLE:115])
		$_ti_LastActivityTime:=Current time:C178(*)
		If (Not:C34(<>SYS_bo_QuitCalled))
		End if 
		
	Else 
		If (Not:C34(<>SYS_bo_QuitCalled))
			If (Current time:C178(*)>($_ti_LastActivityTime+$_ti_2Hours)) & ($_l_ManageTable=0)
				$_l_Process:=New process:C317("ProcessServices_Cleanup"; 256000; "CLEAN UP"; $_bo_Parameter1; *)
				$_ti_LastActivityTime:=Current time:C178(*)
			Else 
				If ($_l_End>0) | ($_bo_ProcessToRun=False:C215)
					QUERY:C277([PROCESSES_TO_HANDLE:115]; [PROCESSES_TO_HANDLE:115]Status:2=2)  // handled
					If (Records in selection:C76([PROCESSES_TO_HANDLE:115])>100000) & ($_l_ManageTable=0)
						$_l_Process:=New process:C317("ProcessServices_Cleanup"; 256000; "CLEAN UP"; $_bo_Parameter1; *)
					End if 
				End if 
				
			End if 
			If ($_l_DelayCount>6000) | ($_bo_ProcessToRun=False:C215)
				If ($_l_ManageTable=0)
					UNLOAD RECORD:C212([PROCESSES_TO_HANDLE:115])
					READ ONLY:C145([PROCESSES_TO_HANDLE:115])
				End if 
				
				QUERY:C277([PROCESSES_TO_HANDLE:115]; [PROCESSES_TO_HANDLE:115]Status:2=1)
				QUERY:C277([PROCESSES_TO_HANDLE:115]; [PROCESSES_TO_HANDLE:115]Status:2=1)
				If ($_l_ManageTable>0)
					QUERY SELECTION:C341([PROCESSES_TO_HANDLE:115]; [PROCESSES_TO_HANDLE:115]TableNumber:1=$_l_ManageTable)
				Else 
					QUERY SELECTION:C341([PROCESSES_TO_HANDLE:115]; [PROCESSES_TO_HANDLE:115]TableNumber:1#0)
				End if 
				If (Records in selection:C76([PROCESSES_TO_HANDLE:115])>0)  // just in case the $_bo_ProcessToRun var gets incorrectly set
					$_bo_ProcessToRun:=True:C214
				Else 
					$_bo_ProcessToRun:=False:C215
				End if 
				$_l_DelayCount:=1
			Else 
				$_l_DelayCount:=$_l_DelayCount+1
			End if 
			DelayTicks($_l_CheckDelay)
			
		End if 
		If ($_l_ManageTable=0)
			If (iSMS_Msgs_Sent>0)  // 11/09/02 pb
				$_bo_ProcessToRun:=True:C214
			End if 
			If (Not:C34(<>SYS_bo_QuitCalled))
				// Export Project stuff added 11/09/02
				If ($_l_ManageTable=0)
					If ($_l_IndecesDone>=$_l_DataExportIndexCount)
						READ WRITE:C146([EW_ExportProjects:117])
						QUERY:C277([EW_ExportProjects:117]; [EW_ExportProjects:117]AutoRun:3=True:C214; *)
						QUERY:C277([EW_ExportProjects:117];  & ; [EW_ExportProjects:117]NextRunDate:6<=Current date:C33(*); *)  // <= in case it got missed
						QUERY:C277([EW_ExportProjects:117];  & ; [EW_ExportProjects:117]NextRuntime:8<=Current time:C178(*))
						If (Records in selection:C76([EW_ExportProjects:117])>0)  // 26/02/03 pb
							ProcessServices_ExportProjects
							UNLOAD RECORD:C212([EW_ExportProjects:117])
						End if 
						$_l_IndecesDone:=0
					End if 
					
					If (Not:C34(BP_bo_BackGrounderInited)) & (Not:C34(<>SYS_bo_QuitCalled))
						
						DB_t_error:="PS_Backgrounder"
						BP_bo_BackGrounderInited:=True:C214
						StartBackgrounder
					End if 
				End if 
			End if 
		End if 
		While ((Records in table:C83([PROCESSES_TO_HANDLE:115])=0) | ($_bo_ProcessToRun=False:C215)) & (Not:C34(<>SYS_bo_QuitCalled))  //NG APRIL 2004
			If (Not:C34(<>SYS_bo_QuitCalled))
				DelayTicks(30*60)
				//************** added 2/3/7 ***************
				QUERY:C277([PROCESSES_TO_HANDLE:115]; [PROCESSES_TO_HANDLE:115]Status:2=1)
				If ($_l_ManageTable>0)
					QUERY SELECTION:C341([PROCESSES_TO_HANDLE:115]; [PROCESSES_TO_HANDLE:115]TableNumber:1=$_l_ManageTable)
				Else 
					QUERY SELECTION:C341([PROCESSES_TO_HANDLE:115]; [PROCESSES_TO_HANDLE:115]TableNumber:1#0)
				End if 
				If (Records in selection:C76([PROCESSES_TO_HANDLE:115])>0)  // just in case the $_bo_ProcessToRun var gets incorrectly set
					$_bo_ProcessToRun:=True:C214
				Else 
					$_bo_ProcessToRun:=False:C215
				End if 
				//*************************************
			End if 
		End while 
		
		$_l_IndecesDone:=$_l_IndecesDone+1
		
	End if 
	
End while 
ERR_MethodTrackerReturn("ProcessServices"; $_t_OldMethodName)
