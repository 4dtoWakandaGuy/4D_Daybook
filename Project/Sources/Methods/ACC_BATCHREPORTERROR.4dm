//%attributes = {}

If (False:C215)
	//Project Method Name:      ACC_BATCHREPORTERROR
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  26/02/2020
	//Created BY:  Unknown
	
	//Date Modified:
	//Modified By: Nigel Greenlee
	//Modification notes
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(ACC_al_aDiaryOwnerIDs;0)
	//ARRAY TEXT(ACC_at_EmailAccountsUser;0)
	C_BOOLEAN:C305(<>Email_bo_PersonInited; ACC_bo_ReportPrefsLoaded)
	C_LONGINT:C283($_l_Index; $_l_Retries; $1; $2; $3; $4; $5; ACC_l_CBLogToDiary; ACC_l_CBLogToeMail; ACC_l_errorDestination)
	C_POINTER:C301($_ptr_Field)
	C_REAL:C285($6)
	C_TEXT:C284(<>EMAIL_t_DefaultReplyToAddress; <>PER_t_CurrentEmailFrom; $_t_EmailAttachment; $_t_EmailID; $_t_EmailSentTo; $_t_ErrorMessage; $_t_FieldName; $_t_FieldValue; $_t_oldMethodName; ACC_t_ActionCode; EMAIL_t_SendCalledFrom)
	C_TIME:C306($_ti_DocumentRef; $_ti_Time)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("ACC_BATCHREPORTERROR")

//$1=Batch No
//$2=Batch Item
//if one of the fields is wrong
//$3=Field in batch table(2=subtable)
//$4=if subtable field in subtable`
//yes yes we can't soft code it
//$5=error type
//-1=does not exist
//-2=DOES NOT BALANCE
//3=transaction exists without batch item
//6=sum of transactions
$_t_oldMethodName:=ERR_MethodTracker("ACC_BATCHREPORTERROR")


$_t_FieldName:=""
$_t_FieldValue:=""
If (Count parameters:C259>=5)
	Case of 
		: ($1=0)
			Case of 
				: ($5=-6)
					If ($6#0)
						$_t_ErrorMessage:="Error: Transactions"+" These transactions will cause an accounts imbalance of"+String:C10($6)
					Else 
						$_t_ErrorMessage:="Error:The Above transactions despite"
						$_t_ErrorMessage:=$_t_ErrorMessage+"  being widowed still balance."
						$_t_ErrorMessage:=$_t_ErrorMessage+" this may cause no problem with your"+" account balances "+" However you should check this"
					End if 
					
			End case 
		: ($1>0)  //batch no
			If ([TRANSACTION_BATCHES:30]Batch_Number:10#$1)
				QUERY:C277([TRANSACTION_BATCHES:30]; [TRANSACTION_BATCHES:30]Batch_Number:10=$1)
				QUERY:C277([TRANSACTION_BATCH_ITEMS:155]; [TRANSACTION_BATCH_ITEMS:155]Transaction_Batch_Code:31=[TRANSACTION_BATCHES:30]Batch_Number:10)
				
			End if 
			If ($2>0)
				If ([TRANSACTION_BATCH_ITEMS:155]BatchItemID:25#$2)
					QUERY SELECTION:C341([TRANSACTION_BATCH_ITEMS:155]; [TRANSACTION_BATCH_ITEMS:155]BatchItemID:25=$2)
				End if 
			End if 
			If ($3>0)  //field value is wrong
				If ($3#2)
					$_t_FieldName:=Field name:C257(Table:C252(->[TRANSACTION_BATCHES:30]); $3)
					$_ptr_Field:=Field:C253(Table:C252(->[TRANSACTION_BATCHES:30]); $3)
					Case of 
						: (Type:C295($_ptr_Field->)=1) | (Type:C295($_ptr_Field->)=8) | (Type:C295($_ptr_Field->)=9)  //Real/long/int
							$_t_FieldValue:=String:C10($_ptr_Field->)
						: (Type:C295($_ptr_Field->)=2)  //Text
							$_t_FieldValue:=Substring:C12($_ptr_Field->; 1; 80)
						: (Type:C295($_ptr_Field->)=4)  //date
							$_t_FieldValue:=String:C10($_ptr_Field->)
						: (Type:C295($_ptr_Field->)=6)  //boolean
							If ($_ptr_Field->)
								$_t_FieldValue:="True"
							Else 
								$_t_FieldValue:="False"
							End if 
						: (Type:C295($_ptr_Field->)=11)  //time
							$_ti_Time:=($_ptr_Field->)*1
							$_t_FieldValue:=Time string:C180($_ti_Time)
							
						: (Type:C295($_ptr_Field->)=0)  //time
							
							$_t_FieldValue:=$_ptr_Field->
					End case 
					
				Else 
					If ($4>0)
						Case of 
							: ($4=1)  //[TRANS IN_TRANS SUB]Trans Code
								$_t_FieldName:="Trans Code"
								$_t_FieldValue:=[TRANSACTION_BATCH_ITEMS:155]Transaction_Type_Code:1
							: ($4=2)  //[TRANS IN_TRANS SUB]Analysis Code
								$_t_FieldName:="Analysis Code"
								$_t_FieldValue:=[TRANSACTION_BATCH_ITEMS:155]Analysis_Code:2
							: ($4=3)  //[TRANS IN_TRANS SUB]Debit Acc
								$_t_FieldName:="Debit Acc"
								$_t_FieldValue:=[TRANSACTION_BATCH_ITEMS:155]Debit_Account:3
							: ($4=4)  //[TRANS IN_TRANS SUB]Invoice No
								$_t_FieldName:="Invoice Number"
								$_t_FieldValue:=[TRANSACTION_BATCH_ITEMS:155]Invoice_Number:4
							: ($4=5)  //[TRANS IN_TRANS SUB]Trans_Date
								$_t_FieldName:="Trans_Date"
								$_t_FieldValue:=String:C10([TRANSACTION_BATCH_ITEMS:155]Transaction_Date:5)
							: ($4=6)  //[TRANS IN_TRANS SUB]Amount
								$_t_FieldName:="Amount"
								$_t_FieldValue:=String:C10([TRANSACTION_BATCH_ITEMS:155]Amount:6)
							: ($4=7)  //[[TRANS IN_TRANS SUB]Tax Code
								$_t_FieldName:="Tax Code"
								$_t_FieldValue:=[TRANSACTION_BATCH_ITEMS:155]Tax_Code:7
							: ($4=8)  //[TRANS IN_TRANS SUB]Tax Amount
								$_t_FieldName:="Tax Amount"
								$_t_FieldValue:=[TRANSACTION_BATCH_ITEMS:155]Tax_Code:7
							: ($4=9)  //[TRANS IN_TRANS SUB]Total
								$_t_FieldName:="Total"
								$_t_FieldValue:=String:C10([TRANSACTION_BATCH_ITEMS:155]Total:9)
							: ($4=10)  //[TRANS IN_TRANS SUB]Desc
								$_t_FieldName:="Decription"
								$_t_FieldValue:="Desription"
								
							: ($4=11)  //[TRANS IN_TRANS SUB]Period Code
								$_t_FieldName:="Period Code"
								$_t_FieldValue:=[TRANSACTION_BATCH_ITEMS:155]Period_Code:11
							: ($4=12)  //[TRANS IN_TRANS SUB]Credit Acc
								$_t_FieldName:="Credit Acc"
								$_t_FieldValue:=[TRANSACTION_BATCH_ITEMS:155]Credit_Account:12
							: ($4=13)  //[TRANS IN_TRANS SUB]Company Code
								$_t_FieldName:="Company Code"
								$_t_FieldValue:=[TRANSACTION_BATCH_ITEMS:155]Company_Code:13
							: ($4=14)  //[TRANS IN_TRANS SUB]Debit IO
								$_t_FieldName:="Debit IO"
								$_t_FieldValue:=[TRANSACTION_BATCH_ITEMS:155]Debit_IO:15
							: ($4=15)  //[TRANS IN_TRANS SUB]Credit IO
								$_t_FieldName:="Credit IO"
								$_t_FieldValue:=[TRANSACTION_BATCH_ITEMS:155]Credit_IO:16
							: ($4=16)  //[TRANS IN_TRANS SUB]Purch Inv_No
								$_t_FieldName:="Purch Inv_No"
								$_t_FieldValue:=[TRANSACTION_BATCH_ITEMS:155]Purchase_invoice_Number:17
							: ($4=17)  //[TRANS IN_TRANS SUB]UK EC
								$_t_FieldName:="UK EC"
								$_t_FieldValue:=[TRANSACTION_BATCH_ITEMS:155]UK_EC:18
							: ($4=18)  //[TRANS IN_TRANS SUB]Currency Code
								$_t_FieldName:="Currency Code"
								$_t_FieldValue:=[TRANSACTION_BATCH_ITEMS:155]Currency_Code:19
							: ($4=19)  //[TRANS IN_TRANS SUB]Layer Code
								$_t_FieldName:="Layer Code"
								$_t_FieldValue:=[TRANSACTION_BATCH_ITEMS:155]Layer_Code:20
							: ($4=20)  //[TRANS IN_TRANS SUB]Second Amt
								$_t_FieldName:="Second Amt"
								$_t_FieldValue:=String:C10([TRANSACTION_BATCH_ITEMS:155]Second_Amount:21)
								
							: ($4=21)  //[TRANS IN_TRANS SUB]Purchase Code
								$_t_FieldName:="Purchase Code"
								$_t_FieldValue:=[TRANSACTION_BATCH_ITEMS:155]Purchase_Invoice_Code:22
							: ($4=22)  //[TRANS IN][TRANS IN_TRANS SUB]Job Code
								$_t_FieldName:="Job Code"
								$_t_FieldValue:=[TRANSACTION_BATCH_ITEMS:155]Job_Code:23
								
							: ($4=24)  //[TRANS IN_TRANS SUB]BatchItemID
								$_t_FieldName:="BatchItemID"
								$_t_FieldValue:=String:C10([TRANSACTION_BATCH_ITEMS:155]BatchItemID:25)
						End case 
					End if 
				End if 
			End if 
			Case of 
				: ($5=-2)
					If ($_t_FieldName="")
						$_t_ErrorMessage:="Error: Batch Number "+String:C10($1)+" Transaction cannot be found for batch item"+String:C10($2)
					Else 
						If ($4=0)
							$_t_ErrorMessage:="Error: Batch Number "+String:C10($1)+" Field "+$_t_FieldName+" Record data ("+$_t_FieldValue+") is invalid."
						Else 
							$_t_ErrorMessage:="Error: Batch Number "+String:C10($1)+" Batch Item ID "+String:C10($2)+" Field "+$_t_FieldName+"Record data ("+$_t_FieldValue+") is invalid."
						End if 
					End if 
				: ($5=-1)  // record or data is missing/invalid
					If ($_t_FieldName="")
						$_t_ErrorMessage:="Error: Batch Number "+String:C10($1)+" Cannot be found,"+" This is referred to in one or more transactions."
					Else 
						If ($4=0)
							$_t_ErrorMessage:="Error: Batch Number "+String:C10($1)+" Field "+$_t_FieldName+"Record data ("+$_t_FieldValue+") is invalid."
						Else 
							$_t_ErrorMessage:="Error: Batch Number "+String:C10($1)+" Batch Item ID "+String:C10($2)+" Field "+$_t_FieldName+"Record data ("+$_t_FieldValue+") is invalid."
						End if 
					End if 
				: ($5=2)
					$_t_ErrorMessage:="Error: Batch Number "+String:C10($1)+" Does not balance by "+String:C10($6)
				: ($5=-4)
					$_t_ErrorMessage:="Error: Batch Number "+String:C10($1)+" Batch Item ID: "+String:C10($2)+"Has No Transaction"
				: ($5=-5)
					$_t_ErrorMessage:="Error: Batch Number  "+String:C10($1)+" Batch Item ID: "+String:C10($2)+" IO does not match account IO"
			End case 
			
			
			
		: ($1<0)
			//transaction ID
			If ($2>0)  //1
				If ([TRANSACTIONS:29]Transaction_ID:31#Abs:C99($1))  //2
					QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Transaction_ID:31=Abs:C99($1))
				End if 
				//2
				If ($3>0)  //3
					
					$_t_FieldName:=Field name:C257(Table:C252(->[TRANSACTIONS:29]); $3)
					$_ptr_Field:=Field:C253(Table:C252(->[TRANSACTIONS:29]); $3)
					Case of   //4
						: (Type:C295($_ptr_Field->)=1) | (Type:C295($_ptr_Field->)=8) | (Type:C295($_ptr_Field->)=9)  //Real/long/int
							$_t_FieldValue:=String:C10($_ptr_Field->)
						: (Type:C295($_ptr_Field->)=2)  //Text
							$_t_FieldValue:=Substring:C12($_ptr_Field->; 1; 80)
						: (Type:C295($_ptr_Field->)=4)  //date
							$_t_FieldValue:=String:C10($_ptr_Field->)
						: (Type:C295($_ptr_Field->)=6)  //boolean
							If ($_ptr_Field->)
								$_t_FieldValue:="True"
							Else 
								$_t_FieldValue:="False"
							End if 
						: (Type:C295($_ptr_Field->)=11)  //time
							$_ti_Time:=$_ptr_Field->*1
							$_t_FieldValue:=Time string:C180($_ti_Time)
						: (Type:C295($_ptr_Field->)=0)  //time
							$_t_FieldValue:=$_ptr_Field->
					End case   //4
				End if   //3
				
				Case of 
					: ($5=-1)  // record or data is missing/invalid
						If ($_t_FieldName="")
							$_t_ErrorMessage:="Error: Transaction ID Number "+String:C10(Abs:C99($1))+" Cannot be found."
						Else 
							$_t_ErrorMessage:="Error: TransactionID Number "+String:C10(Abs:C99($1))+" Field "+$_t_FieldName+"Record data ("+$_t_FieldValue+") is invalid."
						End if 
					: ($5=-3)
						$_t_ErrorMessage:="Error: TransactionID Number "+String:C10(Abs:C99($1))+" Does not Match with any Batch Item.batch"+String:C10([TRANSACTION_BATCHES:30]Batch_Number:10)
				End case 
			Else 
				//$2<0 transaction did not exist
				Case of 
					: ($5=-1)  // record or data is missing/invalid
						If ($_t_FieldName="")
							$_t_ErrorMessage:="Error: Transaction ID Number "+String:C10(Abs:C99($1))+" Cannot be found."
						Else 
							$_t_ErrorMessage:="Error: TransactionID Number "+String:C10(Abs:C99($1))+" Field "+$_t_FieldName+"Record data ("+$_t_FieldValue+") is invalid."
						End if 
					: ($5=-3)
						$_t_ErrorMessage:="Error: TransactionID Number "+String:C10(Abs:C99($1))+" Does not Match with any Batch Item.batch"+String:C10([TRANSACTION_BATCHES:30]Batch_Number:10)
				End case 
				
			End if 
			
			
		Else 
	End case 
	
	
End if 
If (Not:C34(ACC_bo_ReportPrefsLoaded))
	ACC_ReportingPrefs
End if 
If (ACC_l_CBLogToDiary=1)
	If (ACC_t_ActionCode#"")
		If (Size of array:C274(ACC_al_aDiaryOwnerIDs)>0)
			READ WRITE:C146([DIARY:12])
			QUERY:C277([PERSONNEL:11]; [PERSONNEL:11]Personnel_ID:48=ACC_al_aDiaryOwnerIDs{1})
			CREATE RECORD:C68([DIARY:12])
			DiarySetCode
			[DIARY:12]Action_Code:9:=ACC_t_ActionCode
			[DIARY:12]Date_Do_From:4:=Current date:C33(*)
			[DIARY:12]Time_Do_From:6:=Current time:C178(*)
			[DIARY:12]Person:8:=[PERSONNEL:11]Initials:1
			[DIARY:12]Action_Details:10:=$_t_ErrorMessage
			DB_SaveRecord(->[DIARY:12])
			AA_CheckFileUnlocked(->[DIARY:12]x_ID:50)
			READ WRITE:C146([DIARY_ITEMOWNERS:106])
			For ($_l_Index; 1; Size of array:C274(ACC_al_aDiaryOwnerIDs))
				CREATE RECORD:C68([DIARY_ITEMOWNERS:106])
				[DIARY_ITEMOWNERS:106]DIARY_CODE:1:=[DIARY:12]Diary_Code:3
				[DIARY_ITEMOWNERS:106]PERSONNEL_ID:2:=ACC_al_aDiaryOwnerIDs{$_l_Index}
				[DIARY_ITEMOWNERS:106]RELATIONSHIP_CLASSID:3:=1
				[DIARY_ITEMOWNERS:106]RELATIONSHIP_CLASSNAME:4:="Diary Item Owner"
				DB_SaveRecord(->[DIARY_ITEMOWNERS:106])
			End for 
			UNLOAD RECORD:C212([DIARY_ITEMOWNERS:106])
			UNLOAD RECORD:C212([DIARY:12])
			READ ONLY:C145([DIARY_ITEMOWNERS:106])
			READ ONLY:C145([DIARY:12])
		End if 
	End if 
End if 

If (ACC_l_CBLogToeMail=1)
	While (Semaphore:C143("InitEmail"))
		DelayTicks(2)
	End while 
	If (<>Email_bo_PersonInited=False:C215)
		LOGIN_SetEmail
	End if 
	CLEAR SEMAPHORE:C144("InitEmail")
	
	
	If (Size of array:C274(ACC_at_EmailAccountsUser)>0)
		//C_TEXT($_t_EmailSentTo;$_t_EmailAttachment;$_t_EmailText)
		$_t_EmailSentTo:="To"
		$_t_EmailAttachment:=""
		
		EMAIL_t_SendCalledFrom:="ACC_BatchReportError"
		$_t_EmailID:=Email_Send(->$_t_EmailSentTo; ->ACC_at_EmailAccountsUser; ->ACC_at_EMailAccounts; <>PER_t_CurrentEmailFrom; <>EMAIL_t_DefaultReplyToAddress; <>EMAIL_t_DefaultReplyToAddress; "Daybook: Accounts Balance error"; ->$_t_EmailAttachment; ->$_t_ErrorMessage; False:C215)
	End if 
End if 

ACC_l_errorDestination:=1  //file
If (ACC_l_errorDestination=1)
	If (Test path name:C476("Transactionerrs.txt")#Is a document:K24:1)
		$_ti_DocumentRef:=DB_CreateDocument("Transactionerrs.txt"; "TEXT")
		If (OK=1)
			CLOSE DOCUMENT:C267($_ti_DocumentRef)
		End if 
	End if 
	$_l_Retries:=0
	While (Semaphore:C143("$DOCINUSE"))  //NG March 2004 got an error with this whilst testing
		$_l_Retries:=$_l_Retries+1
		DelayTicks(2*(1+$_l_Retries))
	End while 
	$_ti_DocumentRef:=Append document:C265("Transactionerrs.txt"; "TEXT")
	
	If (Is macOS:C1572)
		SEND PACKET:C103($_ti_DocumentRef; $_t_ErrorMessage+Char:C90(13))
	Else 
		SEND PACKET:C103($_ti_DocumentRef; $_t_ErrorMessage+Char:C90(13)+Char:C90(10))
	End if 
	CLOSE DOCUMENT:C267($_ti_DocumentRef)
	CLEAR SEMAPHORE:C144("$DOCINUSE")
	
End if 
ERR_MethodTrackerReturn("ACC_BATCHREPORTERROR"; $_t_oldMethodName)
