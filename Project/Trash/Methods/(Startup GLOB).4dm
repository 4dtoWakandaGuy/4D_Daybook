//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Startup GLOB
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 09/04/2010 12:42
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//C_UNKNOWN(a01Real1)
	//C_UNKNOWN(a01Real2)
	//C_UNKNOWN(a01Stri1)
	//C_UNKNOWN(a01Stri2)
	C_BOOLEAN:C305($0)
	C_DATE:C307(<>DB_d_CurrentDate)
	C_LONGINT:C283(<>SYS_l_DateFormatPreference; $_l_Index; $_l_SizeOfArray; $_l_TransPostStatus; DS_l_BATCHITEMRef; xNext)
	C_REAL:C285(vAmount)
	C_TEXT:C284(<>Per_t_CurrentDefaultAnalCode; <>SYS_t_BaseCurrency; $_t_oldMethodName; vPeriod; vTitle)
	C_TIME:C306(<>CTime)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Startup GLOB")
//Statup GLOB - General Ledger Opening Balances

If (<>DB_d_CurrentDate=!00-00-00!)
	
	<>DB_d_CurrentDate:=Current date:C33
	<>CTime:=Current time:C178
	<>SYS_l_DateFormatPreference:=Date_Format(<>DB_d_CurrentDate)
End if 
vTitle:="General Ledger Opening Balances"
Open_Pro_Window("New Data Setups"; 0; 3; ->[COMPANIES:2]; "dOpening Bal")
DIALOG:C40([COMPANIES:2]; "dOpening Bal")
Close_ProWin

If ((OK=1) & (vPeriod#""))
	$0:=True:C214
	If (xNext=1)
		Startup_Page2Ex
		If ([USER:15]Opening Balance:49="")
			[USER:15]Opening Balance:49:="  1"
		Else 
			[USER:15]Opening Balance:49:=Substring:C12([USER:15]Opening Balance:49; 1; 2)+"1"
		End if 
		DB_SaveRecord(->[USER:15])
	Else 
		$_l_SizeOfArray:=Size of array:C274(a01Stri1)
		If ($_l_SizeOfArray>0)
			//  START TRANSACTION
			StartTransaction  // 13/05/02 pb
			
			READ WRITE:C146([TRANSACTION_BATCHES:30])
			CREATE RECORD:C68([TRANSACTION_BATCHES:30])
			BatchNo
			$_l_TransPostStatus:=0
			If ([TRANSACTION_BATCHES:30]Batch_Number:10=0)
				OK:=0
				$_l_TransPostStatus:=-1
			Else 
				[TRANSACTION_BATCHES:30]Batch_Date:1:=<>DB_d_CurrentDate
				[TRANSACTION_BATCHES:30]Entry_Date:6:=<>DB_d_CurrentDate
				[TRANSACTION_BATCHES:30]Description:12:="Startup Opening Balances"
				
				For ($_l_Index; 1; $_l_SizeOfArray)
					If ((a01Real1{$_l_Index}#0) | (a01Real2{$_l_Index}#0))
						QUERY:C277([ACCOUNTS:32]; [ACCOUNTS:32]Account_Code:2=a01Stri1{$_l_Index})
						If (Records in selection:C76([ACCOUNTS:32])=1)
							CREATE RECORD:C68([TRANSACTION_BATCH_ITEMS:155])
							[TRANSACTION_BATCH_ITEMS:155]Transaction_Batch_Code:31:=[TRANSACTION_BATCHES:30]Batch_Number:10
							[TRANSACTION_BATCH_ITEMS:155]ID:30:=AA_GetNextID(->[TRANSACTION_BATCH_ITEMS:155]ID:30)
							
							[TRANSACTION_BATCH_ITEMS:155]Transaction_Type_Code:1:="OB"
							[TRANSACTION_BATCH_ITEMS:155]Description:10:=a01Stri2{$_l_Index}
							If (a01Real1{$_l_Index}=0)
								[TRANSACTION_BATCH_ITEMS:155]Credit_Account:12:=a01Stri1{$_l_Index}
								vAmount:=a01Real2{$_l_Index}
							Else 
								[TRANSACTION_BATCH_ITEMS:155]Debit_Account:3:=a01Stri1{$_l_Index}
								vAmount:=a01Real1{$_l_Index}
							End if 
							[TRANSACTION_BATCH_ITEMS:155]Analysis_Code:2:=<>Per_t_CurrentDefaultAnalCode
							[TRANSACTION_BATCH_ITEMS:155]Debit_IO:15:="N"
							[TRANSACTION_BATCH_ITEMS:155]Credit_IO:16:="N"
							[TRANSACTION_BATCH_ITEMS:155]Transaction_Date:5:=<>DB_d_CurrentDate
							[TRANSACTION_BATCH_ITEMS:155]Period_Code:11:=vPeriod
							[TRANSACTION_BATCH_ITEMS:155]Tax_Code:7:="N"
							[TRANSACTION_BATCH_ITEMS:155]Amount:6:=vAmount
							[TRANSACTION_BATCH_ITEMS:155]Tax_Amount:8:=0
							[TRANSACTION_BATCH_ITEMS:155]Total:9:=vAmount
							[TRANSACTION_BATCH_ITEMS:155]UK_EC:18:="U"
							[TRANSACTION_BATCH_ITEMS:155]Currency_Code:19:=<>SYS_t_BaseCurrency
							[TRANSACTION_BATCH_ITEMS:155]Layer_Code:20:=DB_GetLedgerActualLayer
							If ([TRANSACTION_BATCH_ITEMS:155]BatchItemID:25=0)
								[TRANSACTION_BATCH_ITEMS:155]BatchItemID:25:=AA_GetNextIDinMethod(->DS_l_BATCHITEMRef)
							End if 
							DB_SaveRecord(->[TRANSACTION_BATCH_ITEMS:155])
							
						End if 
					End if 
				End for 
				
				If (OK=1)
					QUERY:C277([TRANSACTION_BATCH_ITEMS:155]; [TRANSACTION_BATCH_ITEMS:155]Transaction_Batch_Code:31=[TRANSACTION_BATCHES:30]Batch_Number:10)
					
					[TRANSACTION_BATCHES:30]Batch_Amount:3:=Sum:C1([TRANSACTION_BATCH_ITEMS:155]Amount:6)
					[TRANSACTION_BATCHES:30]Batch_Total:5:=[TRANSACTION_BATCHES:30]Batch_Amount:3
					DB_SaveRecord(->[TRANSACTION_BATCHES:30])
					TransB_InCalc
					$_l_TransPostStatus:=TransactionBatch_Post
				End if 
			End if 
			If ($_l_TransPostStatus>=0)
				Transact_End
			Else 
				Transact_End(False:C215)
			End if 
			UNLOAD RECORD:C212([TRANSACTION_BATCHES:30])
			UNLOAD RECORD:C212([ACCOUNT_BALANCES:34])
			UNLOAD RECORD:C212([TRANSACTIONS:29])
			READ ONLY:C145([TRANSACTION_BATCHES:30])
		End if 
		
		If ([USER:15]Opening Balance:49#"")
			[USER:15]Opening Balance:49:=Substring:C12([USER:15]Opening Balance:49; 1; 2)
			If (([USER:15]Opening Balance:49="   ") | ([USER:15]Opening Balance:49="  ") | ([USER:15]Opening Balance:49=" "))
				[USER:15]Opening Balance:49:=""
			End if 
			DB_SaveRecord(->[USER:15])
		End if 
	End if 
Else 
	$0:=False:C215
End if 
ERR_MethodTrackerReturn("Startup GLOB"; $_t_oldMethodName)
