//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_UpgradeV13toV14
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 17/12/2013 08:08
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY LONGINT:C221($_al_FieldIndex2DS; 0)
	ARRAY LONGINT:C221($_al_FieldIndexIDS; 0)
	ARRAY TEXT:C222($_at_CountryCodes; 0)
	ARRAY TEXT:C222($_at_ModuleIDS; 0)
	ARRAY TEXT:C222($_at_MovementCodes; 0)
	ARRAY TEXT:C222($_at_RecordCodes; 0)
	C_BOOLEAN:C305($_bo_FieldIndexed; $_bo_FieldInvisible; $_bo_FieldUnique)
	C_LONGINT:C283($_l_FieldIndex; $_l_FieldIndex2; $_l_FieldLength; $_l_FieldType; $_l_Process; $_l_RecordsCount; $_l_RecordsIndex; $_l_TableIndex)
	C_POINTER:C301($_ptr_FieldPointer; $_ptr_Table)
	C_TEXT:C284($_t_Machine; $_t_oldMethodName; $_t_ProcessName; $_t_ReportName; $_t_TableName; $_t_user)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DB_UpgradeV13toV14")

QUERY:C277([PRODUCT_BRANDS:8]; [PRODUCT_BRANDS:8]X_ID:4=0)
If (Records in selection:C76([PRODUCT_BRANDS:8])>0)
	READ WRITE:C146([PRODUCT_BRANDS:8])
	APPLY TO SELECTION:C70([PRODUCT_BRANDS:8]; [PRODUCT_BRANDS:8]X_ID:4:=AA_GetNextID(->[PRODUCT_BRANDS:8]X_ID:4))
	
	
	UNLOAD RECORD:C212([PRODUCT_BRANDS:8])
	READ ONLY:C145([PRODUCT_BRANDS:8])
End if 

QUERY:C277([CC_OrderAuths:133]; [CC_OrderAuths:133]x_ID:1=0)
If (Records in selection:C76([CC_OrderAuths:133])>0)
	READ WRITE:C146([CC_OrderAuths:133])
	APPLY TO SELECTION:C70([CC_OrderAuths:133]; [CC_OrderAuths:133]x_ID:1:=AA_GetNextID(->[CC_OrderAuths:133]x_ID:1))
	
	UNLOAD RECORD:C212([CC_OrderAuths:133])
	READ ONLY:C145([CC_OrderAuths:133])
Else 
	//TRACE
	
	ALL RECORDS:C47([CC_OrderAuths:133])
	DISTINCT VALUES:C339([CC_OrderAuths:133]x_ID:1; $_al_FieldIndex2DS)
	READ WRITE:C146([CC_OrderAuths:133])
	For ($_l_FieldIndex2; 1; Size of array:C274($_al_FieldIndex2DS))
		QUERY:C277([CC_OrderAuths:133]; [CC_OrderAuths:133]x_ID:1=$_al_FieldIndex2DS{$_l_FieldIndex2})
		If (Records in selection:C76([CC_OrderAuths:133])>1)
			$_l_RecordsCount:=Records in selection:C76([CC_OrderAuths:133])
			REDUCE SELECTION:C351([CC_OrderAuths:133]; $_l_RecordsCount-1)
			For ($_l_RecordsIndex; 1; Records in selection:C76([CC_OrderAuths:133]))
				[CC_OrderAuths:133]x_ID:1:=0
				[CC_OrderAuths:133]x_ID:1:=AA_GetNextID(->[CC_OrderAuths:133]x_ID:1)
				SAVE RECORD:C53([CC_OrderAuths:133])
				NEXT RECORD:C51([CC_OrderAuths:133])
			End for 
			
		End if 
	End for 
	
	
	
	
	
	
	
	
End if 


QUERY:C277([CCM_PSPTransaction:136]; [CCM_PSPTransaction:136]x_ID:1=0)
If (Records in selection:C76([CCM_PSPTransaction:136])>0)
	READ WRITE:C146([CCM_PSPTransaction:136])
	APPLY TO SELECTION:C70([CCM_PSPTransaction:136]; [CCM_PSPTransaction:136]x_ID:1:=AA_GetNextID(->[CCM_PSPTransaction:136]x_ID:1))
	
	UNLOAD RECORD:C212([CCM_PSPTransaction:136])
	READ ONLY:C145([CCM_PSPTransaction:136])
Else 
	//TRACE
	
	ALL RECORDS:C47([CCM_PSPTransaction:136])
	DISTINCT VALUES:C339([CCM_PSPTransaction:136]x_ID:1; $_al_FieldIndex2DS)
	READ WRITE:C146([CCM_PSPTransaction:136])
	For ($_l_FieldIndex2; 1; Size of array:C274($_al_FieldIndex2DS))
		QUERY:C277([CCM_PSPTransaction:136]; [CCM_PSPTransaction:136]x_ID:1=$_al_FieldIndex2DS{$_l_FieldIndex2})
		If (Records in selection:C76([CCM_PSPTransaction:136])>1)
			$_l_RecordsCount:=Records in selection:C76([CCM_PSPTransaction:136])
			REDUCE SELECTION:C351([CCM_PSPTransaction:136]; $_l_RecordsCount-1)
			For ($_l_RecordsIndex; 1; Records in selection:C76([CCM_PSPTransaction:136]))
				[CCM_PSPTransaction:136]x_ID:1:=0
				[CCM_PSPTransaction:136]x_ID:1:=AA_GetNextID(->[CCM_PSPTransaction:136]x_ID:1)
				SAVE RECORD:C53([CCM_PSPTransaction:136])
				NEXT RECORD:C51([CCM_PSPTransaction:136])
			End for 
			
		End if 
	End for 
End if 

QUERY:C277([LICENCE_UPDATES:97]; [LICENCE_UPDATES:97]X_ID:5=0)
If (Records in selection:C76([LICENCE_UPDATES:97])>0)
	READ WRITE:C146([LICENCE_UPDATES:97])
	APPLY TO SELECTION:C70([LICENCE_UPDATES:97]; [LICENCE_UPDATES:97]X_ID:5:=AA_GetNextID(->[LICENCE_UPDATES:97]X_ID:5))
	
	
	UNLOAD RECORD:C212([LICENCE_UPDATES:97])
	READ ONLY:C145([LICENCE_UPDATES:97])
Else 
	//TRACE
	
	ALL RECORDS:C47([LICENCE_UPDATES:97])
	DISTINCT VALUES:C339([LICENCE_UPDATES:97]X_ID:5; $_al_FieldIndex2DS)
	READ WRITE:C146([LICENCE_UPDATES:97])
	For ($_l_FieldIndex2; 1; Size of array:C274($_al_FieldIndex2DS))
		QUERY:C277([LICENCE_UPDATES:97]; [LICENCE_UPDATES:97]X_ID:5=$_al_FieldIndex2DS{$_l_FieldIndex2})
		If (Records in selection:C76([LICENCE_UPDATES:97])>1)
			$_l_RecordsCount:=Records in selection:C76([LICENCE_UPDATES:97])
			REDUCE SELECTION:C351([LICENCE_UPDATES:97]; $_l_RecordsCount-1)
			For ($_l_RecordsIndex; 1; Records in selection:C76([LICENCE_UPDATES:97]))
				[LICENCE_UPDATES:97]X_ID:5:=0
				[LICENCE_UPDATES:97]X_ID:5:=AA_GetNextID(->[LICENCE_UPDATES:97]X_ID:5)
				SAVE RECORD:C53([LICENCE_UPDATES:97])
				NEXT RECORD:C51([LICENCE_UPDATES:97])
			End for 
			
		End if 
	End for 
End if 

QUERY:C277([PURCHASE_INVOICE_ALLOCATIONS:159]; [PURCHASE_INVOICE_ALLOCATIONS:159]ID:5=0)
If (Records in selection:C76([PURCHASE_INVOICE_ALLOCATIONS:159])>0)
	READ WRITE:C146([PURCHASE_INVOICE_ALLOCATIONS:159])
	APPLY TO SELECTION:C70([PURCHASE_INVOICE_ALLOCATIONS:159]; [PURCHASE_INVOICE_ALLOCATIONS:159]ID:5:=AA_GetNextID(->[PURCHASE_INVOICE_ALLOCATIONS:159]ID:5))
	UNLOAD RECORD:C212([LICENCE_UPDATES:97])
	READ ONLY:C145([LICENCE_UPDATES:97])
Else 
	//TRACE
	
	ALL RECORDS:C47([PURCHASE_INVOICE_ALLOCATIONS:159])
	DISTINCT VALUES:C339([PURCHASE_INVOICE_ALLOCATIONS:159]ID:5; $_al_FieldIndex2DS)
	READ WRITE:C146([PURCHASE_INVOICE_ALLOCATIONS:159])
	For ($_l_FieldIndex2; 1; Size of array:C274($_al_FieldIndex2DS))
		QUERY:C277([PURCHASE_INVOICE_ALLOCATIONS:159]; [PURCHASE_INVOICE_ALLOCATIONS:159]ID:5=$_al_FieldIndex2DS{$_l_FieldIndex2})
		If (Records in selection:C76([PURCHASE_INVOICE_ALLOCATIONS:159])>1)
			$_l_RecordsCount:=Records in selection:C76([PURCHASE_INVOICE_ALLOCATIONS:159])
			REDUCE SELECTION:C351([PURCHASE_INVOICE_ALLOCATIONS:159]; $_l_RecordsCount-1)
			For ($_l_RecordsIndex; 1; Records in selection:C76([PURCHASE_INVOICE_ALLOCATIONS:159]))
				[PURCHASE_INVOICE_ALLOCATIONS:159]ID:5:=0
				[PURCHASE_INVOICE_ALLOCATIONS:159]ID:5:=AA_GetNextID(->[PURCHASE_INVOICE_ALLOCATIONS:159]ID:5)
				SAVE RECORD:C53([PURCHASE_INVOICE_ALLOCATIONS:159])
				NEXT RECORD:C51([PURCHASE_INVOICE_ALLOCATIONS:159])
			End for 
			
		End if 
	End for 
End if 
////////

QUERY:C277([TRANS_MULTI:128]; [TRANS_MULTI:128]x_ID:1=0)

If (Records in selection:C76([TRANS_MULTI:128])>0)
	READ WRITE:C146([TRANS_MULTI:128])
	APPLY TO SELECTION:C70([TRANS_MULTI:128]; [TRANS_MULTI:128]x_ID:1:=AA_GetNextID(->[TRANS_MULTI:128]x_ID:1))
	
	UNLOAD RECORD:C212([LICENCE_UPDATES:97])
	READ ONLY:C145([LICENCE_UPDATES:97])
Else 
	//TRACE
	
	ALL RECORDS:C47([TRANS_MULTI:128])
	DISTINCT VALUES:C339([TRANS_MULTI:128]x_ID:1; $_al_FieldIndex2DS)
	
	READ WRITE:C146([TRANS_MULTI:128])
	For ($_l_FieldIndex2; 1; Size of array:C274($_al_FieldIndex2DS))
		QUERY:C277([TRANS_MULTI:128]; [TRANS_MULTI:128]x_ID:1=$_al_FieldIndex2DS{$_l_FieldIndex2})
		
		If (Records in selection:C76([TRANS_MULTI:128])>1)
			$_l_RecordsCount:=Records in selection:C76([TRANS_MULTI:128])
			REDUCE SELECTION:C351([TRANS_MULTI:128]; $_l_RecordsCount-1)
			For ($_l_RecordsIndex; 1; Records in selection:C76([TRANS_MULTI:128]))
				[TRANS_MULTI:128]x_ID:1:=0
				
				
				[TRANS_MULTI:128]x_ID:1:=AA_GetNextID(->[TRANS_MULTI:128]x_ID:1)
				
				SAVE RECORD:C53([TRANS_MULTI:128])
				NEXT RECORD:C51([TRANS_MULTI:128])
			End for 
			
		End if 
	End for 
End if 

QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Transaction_ID:31=0)



If (Records in selection:C76([TRANSACTIONS:29])>0)
	READ WRITE:C146([TRANSACTIONS:29])
	APPLY TO SELECTION:C70([TRANSACTIONS:29]; [TRANSACTIONS:29]Transaction_ID:31:=AA_GetNextID(->[TRANSACTIONS:29]Transaction_ID:31))
	
	
	UNLOAD RECORD:C212([TRANSACTIONS:29])
	READ ONLY:C145([TRANSACTIONS:29])
Else 
	//TRACE
	
	ALL RECORDS:C47([TRANSACTIONS:29])
	DISTINCT VALUES:C339([TRANSACTIONS:29]Transaction_ID:31; $_al_FieldIndex2DS)
	
	
	READ WRITE:C146([TRANSACTIONS:29])
	For ($_l_FieldIndex2; 1; Size of array:C274($_al_FieldIndex2DS))
		QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Transaction_ID:31=$_al_FieldIndex2DS{$_l_FieldIndex2})
		
		
		If (Records in selection:C76([TRANSACTIONS:29])>1)
			
			$_l_RecordsCount:=Records in selection:C76([TRANSACTIONS:29])
			REDUCE SELECTION:C351([TRANSACTIONS:29]; $_l_RecordsCount-1)
			
			For ($_l_RecordsIndex; 1; Records in selection:C76([TRANSACTIONS:29]))
				[TRANSACTIONS:29]Transaction_ID:31:=0
				
				
				
				[TRANSACTIONS:29]Transaction_ID:31:=AA_GetNextID(->[TRANSACTIONS:29]Transaction_ID:31)
				
				
				SAVE RECORD:C53([TRANSACTIONS:29])
				NEXT RECORD:C51([TRANSACTIONS:29])
			End for 
			
		End if 
	End for 
End if 
QUERY:C277([TRANSACTION_BATCH_ITEMS:155]; [TRANSACTION_BATCH_ITEMS:155]ID:30=0)


If (Records in selection:C76([TRANSACTION_BATCH_ITEMS:155])>0)
	READ WRITE:C146([TRANSACTION_BATCH_ITEMS:155])
	APPLY TO SELECTION:C70([TRANSACTION_BATCH_ITEMS:155]; [TRANSACTION_BATCH_ITEMS:155]ID:30:=AA_GetNextID(->[TRANSACTION_BATCH_ITEMS:155]ID:30))
	
	UNLOAD RECORD:C212([TRANSACTION_BATCH_ITEMS:155])
	READ ONLY:C145([TRANSACTION_BATCH_ITEMS:155])
Else 
	//TRACE
	
	ALL RECORDS:C47([TRANSACTION_BATCH_ITEMS:155])
	DISTINCT VALUES:C339([TRANSACTION_BATCH_ITEMS:155]ID:30; $_al_FieldIndex2DS)
	
	READ WRITE:C146([TRANSACTION_BATCH_ITEMS:155])
	For ($_l_FieldIndex2; 1; Size of array:C274($_al_FieldIndex2DS))
		QUERY:C277([TRANSACTION_BATCH_ITEMS:155]; [TRANSACTION_BATCH_ITEMS:155]ID:30=$_al_FieldIndex2DS{$_l_FieldIndex2})
		
		
		If (Records in selection:C76([TRANSACTION_BATCH_ITEMS:155])>1)
			
			$_l_RecordsCount:=Records in selection:C76([TRANSACTION_BATCH_ITEMS:155])
			REDUCE SELECTION:C351([TRANSACTION_BATCH_ITEMS:155]; $_l_RecordsCount-1)
			
			For ($_l_RecordsIndex; 1; Records in selection:C76([TRANSACTION_BATCH_ITEMS:155]))
				[TRANSACTION_BATCH_ITEMS:155]ID:30:=0
				
				
				[TRANSACTION_BATCH_ITEMS:155]ID:30:=AA_GetNextID(->[TRANSACTION_BATCH_ITEMS:155]ID:30)
				
				SAVE RECORD:C53([TRANSACTION_BATCH_ITEMS:155])
				NEXT RECORD:C51([TRANSACTION_BATCH_ITEMS:155])
			End for 
			
		End if 
	End for 
End if 
QUERY:C277([ACCOUNT_BALANCES:34]; [ACCOUNT_BALANCES:34]x_ID:7=0)


If (Records in selection:C76([ACCOUNT_BALANCES:34])>0)
	READ WRITE:C146([ACCOUNT_BALANCES:34])
	APPLY TO SELECTION:C70([ACCOUNT_BALANCES:34]; [ACCOUNT_BALANCES:34]x_ID:7:=AA_GetNextID(->[ACCOUNT_BALANCES:34]x_ID:7))
	
	UNLOAD RECORD:C212([ACCOUNT_BALANCES:34])
	READ ONLY:C145([ACCOUNT_BALANCES:34])
Else 
	//TRACE
	
	ALL RECORDS:C47([ACCOUNT_BALANCES:34])
	DISTINCT VALUES:C339([ACCOUNT_BALANCES:34]x_ID:7; $_al_FieldIndex2DS)
	
	READ WRITE:C146([ACCOUNT_BALANCES:34])
	For ($_l_FieldIndex2; 1; Size of array:C274($_al_FieldIndex2DS))
		QUERY:C277([ACCOUNT_BALANCES:34]; [ACCOUNT_BALANCES:34]x_ID:7=$_al_FieldIndex2DS{$_l_FieldIndex2})
		
		
		If (Records in selection:C76([ACCOUNT_BALANCES:34])>1)
			$_l_RecordsCount:=Records in selection:C76([ACCOUNT_BALANCES:34])
			REDUCE SELECTION:C351([ACCOUNT_BALANCES:34]; $_l_RecordsCount-1)
			
			For ($_l_RecordsIndex; 1; Records in selection:C76([ACCOUNT_BALANCES:34]))
				[ACCOUNT_BALANCES:34]x_ID:7:=0
				
				
				[ACCOUNT_BALANCES:34]x_ID:7:=AA_GetNextID(->[ACCOUNT_BALANCES:34]x_ID:7)
				
				SAVE RECORD:C53([ACCOUNT_BALANCES:34])
				NEXT RECORD:C51([ACCOUNT_BALANCES:34])
			End for 
			
		End if 
	End for 
End if 
QUERY:C277([STOCK_MOVEMENTS:40]; [STOCK_MOVEMENTS:40]x_ID:22=0)


If (Records in selection:C76([STOCK_MOVEMENTS:40])>0)
	READ WRITE:C146([STOCK_MOVEMENTS:40])
	APPLY TO SELECTION:C70([STOCK_MOVEMENTS:40]; [STOCK_MOVEMENTS:40]x_ID:22:=AA_GetNextID(->[STOCK_MOVEMENTS:40]x_ID:22))
	
	UNLOAD RECORD:C212([STOCK_MOVEMENTS:40])
	READ ONLY:C145([STOCK_MOVEMENTS:40])
Else 
	//TRACE
	
	ALL RECORDS:C47([STOCK_MOVEMENTS:40])
	DISTINCT VALUES:C339([STOCK_MOVEMENTS:40]x_ID:22; $_al_FieldIndex2DS)
	
	READ WRITE:C146([STOCK_MOVEMENTS:40])
	For ($_l_FieldIndex2; 1; Size of array:C274($_al_FieldIndex2DS))
		QUERY:C277([STOCK_MOVEMENTS:40]; [STOCK_MOVEMENTS:40]x_ID:22=$_al_FieldIndex2DS{$_l_FieldIndex2})
		
		If (Records in selection:C76([STOCK_MOVEMENTS:40])>1)
			$_l_RecordsCount:=Records in selection:C76([STOCK_MOVEMENTS:40])
			REDUCE SELECTION:C351([STOCK_MOVEMENTS:40]; $_l_RecordsCount-1)
			
			For ($_l_RecordsIndex; 1; Records in selection:C76([STOCK_MOVEMENTS:40]))
				[STOCK_MOVEMENTS:40]x_ID:22:=0
				
				
				[STOCK_MOVEMENTS:40]x_ID:22:=AA_GetNextID(->[STOCK_MOVEMENTS:40]x_ID:22)
				
				SAVE RECORD:C53([STOCK_MOVEMENTS:40])
				NEXT RECORD:C51([STOCK_MOVEMENTS:40])
			End for 
			
		End if 
	End for 
End if 
QUERY:C277([STOCK_MOVEMENTS:40]; [STOCK_MOVEMENTS:40]Movement_Code:1="")

If (Records in selection:C76([STOCK_MOVEMENTS:40])>0)
	READ WRITE:C146([STOCK_MOVEMENTS:40])
	APPLY TO SELECTION:C70([STOCK_MOVEMENTS:40]; Movement_Code)
	
	
	UNLOAD RECORD:C212([STOCK_MOVEMENTS:40])
	READ ONLY:C145([STOCK_MOVEMENTS:40])
Else 
	//TRACE
	
	ALL RECORDS:C47([STOCK_MOVEMENTS:40])
	DISTINCT VALUES:C339([STOCK_MOVEMENTS:40]Movement_Code:1; $_at_MovementCodes)
	
	READ WRITE:C146([STOCK_MOVEMENTS:40])
	For ($_l_FieldIndex2; 1; Size of array:C274($_at_MovementCodes))
		
		QUERY:C277([STOCK_MOVEMENTS:40]; [STOCK_MOVEMENTS:40]Movement_Code:1=$_at_MovementCodes{$_l_FieldIndex2})
		
		If (Records in selection:C76([STOCK_MOVEMENTS:40])>1)
			$_l_RecordsCount:=Records in selection:C76([STOCK_MOVEMENTS:40])
			REDUCE SELECTION:C351([STOCK_MOVEMENTS:40]; $_l_RecordsCount-1)
			
			For ($_l_RecordsIndex; 1; Records in selection:C76([STOCK_MOVEMENTS:40]))
				Movement_Code
				SAVE RECORD:C53([STOCK_MOVEMENTS:40])
				NEXT RECORD:C51([STOCK_MOVEMENTS:40])
			End for 
			
		End if 
	End for 
End if 
QUERY:C277([LIST_LAYOUTS:96]; [LIST_LAYOUTS:96]X_UUID:21="")
If (Records in selection:C76([LIST_LAYOUTS:96])>0)
	
	
	
	READ WRITE:C146([LIST_LAYOUTS:96])
	APPLY TO SELECTION:C70([LIST_LAYOUTS:96]; [LIST_LAYOUTS:96]X_UUID:21:=Generate UUID:C1066)
	
	
	
	
	
	
	
	
	
	
	
	
	
End if 

QUERY:C277([IDENTIFIERS:16]; [IDENTIFIERS:16]x_UUID:10="")
If (Records in selection:C76([IDENTIFIERS:16])>0)
	
	READ WRITE:C146([IDENTIFIERS:16])
	APPLY TO SELECTION:C70([IDENTIFIERS:16]; [IDENTIFIERS:16]x_UUID:10:=Generate UUID:C1066)
	
	
End if 

QUERY:C277([TIME_BILLING_CATEGORIES:46]; [TIME_BILLING_CATEGORIES:46]X_UUID:5="")

If (Records in selection:C76([TIME_BILLING_CATEGORIES:46])>0)
	
	READ WRITE:C146([TIME_BILLING_CATEGORIES:46])
	APPLY TO SELECTION:C70([TIME_BILLING_CATEGORIES:46]; [TIME_BILLING_CATEGORIES:46]X_UUID:5:=Generate UUID:C1066)
	
End if 

QUERY:C277([MODULES:63]; [MODULES:63]X_UUID:9="")
If (Records in selection:C76([MODULES:63])>0)
	
	READ WRITE:C146([MODULES:63])
	APPLY TO SELECTION:C70([MODULES:63]; [MODULES:63]X_UUID:9:=Generate UUID:C1066)
Else 
	ALL RECORDS:C47([MODULES:63])
	
	DISTINCT VALUES:C339([MODULES:63]X_UUID:9; $_at_ModuleIDS)
	READ WRITE:C146([MODULES:63])
	
	
	For ($_l_FieldIndex2; 1; Size of array:C274($_at_ModuleIDS))
		QUERY:C277([MODULES:63]; [MODULES:63]X_UUID:9=$_at_ModuleIDS{$_l_FieldIndex2})
		
		If (Records in selection:C76([MODULES:63])>1)
			//TRACE
			
			$_l_RecordsCount:=Records in selection:C76([MODULES:63])
			REDUCE SELECTION:C351([MODULES:63]; $_l_RecordsCount-1)
			For ($_l_RecordsIndex; 1; Records in selection:C76([MODULES:63]))
				[MODULES:63]X_UUID:9:=Generate UUID:C1066
				SAVE RECORD:C53([MODULES:63])
				NEXT RECORD:C51([MODULES:63])
				
				
				
				
				
				
				
			End for 
			
			
			
		End if 
	End for 
	
End if 

QUERY:C277([CLIENT_SERVERMESSAGES:123]; [CLIENT_SERVERMESSAGES:123]UUID:5="")
If (Records in selection:C76([CLIENT_SERVERMESSAGES:123])>0)
	
	READ WRITE:C146([CLIENT_SERVERMESSAGES:123])
	APPLY TO SELECTION:C70([CLIENT_SERVERMESSAGES:123]; [CLIENT_SERVERMESSAGES:123]UUID:5:=Generate UUID:C1066)
	
	
End if 

QUERY:C277([CODE_USES:91]; [CODE_USES:91]X_UUID:3="")
If (Records in selection:C76([CODE_USES:91])>0)
	
	READ WRITE:C146([CODE_USES:91])
	APPLY TO SELECTION:C70([CODE_USES:91]; [CODE_USES:91]X_UUID:3:=Generate UUID:C1066)
	
	
End if 
If (True:C214)
	
	
	
	//TRACE
	
	QUERY:C277([CUSTOM_FIELDS:98]; [CUSTOM_FIELDS:98]X_UUID:9="")
	If (Records in selection:C76([CUSTOM_FIELDS:98])>0)
		
		READ WRITE:C146([CUSTOM_FIELDS:98])
		APPLY TO SELECTION:C70([CUSTOM_FIELDS:98]; [CUSTOM_FIELDS:98]X_UUID:9:=Generate UUID:C1066)
		
		
	End if 
End if 



QUERY:C277([CUSTOM_FIELDS_PERSONNEL:100]; [CUSTOM_FIELDS_PERSONNEL:100]X_UUID:3="")
If (Records in selection:C76([CUSTOM_FIELDS_PERSONNEL:100])>0)
	
	READ WRITE:C146([CUSTOM_FIELDS_PERSONNEL:100])
	APPLY TO SELECTION:C70([CUSTOM_FIELDS_PERSONNEL:100]; [CUSTOM_FIELDS_PERSONNEL:100]X_UUID:3:=Generate UUID:C1066)
	
	
End if 


QUERY:C277([IDENTIFIERS_MULTI_NUMBERS:94]; [IDENTIFIERS_MULTI_NUMBERS:94]X_UUID:5="")
If (Records in selection:C76([IDENTIFIERS_MULTI_NUMBERS:94])>0)
	
	READ WRITE:C146([IDENTIFIERS_MULTI_NUMBERS:94])
	APPLY TO SELECTION:C70([IDENTIFIERS_MULTI_NUMBERS:94]; [IDENTIFIERS_MULTI_NUMBERS:94]X_UUID:5:=Generate UUID:C1066)
	
	
End if 

QUERY:C277([EW_BKFields:122]; [EW_BKFields:122]X_UUID:6="")
If (Records in selection:C76([EW_BKFields:122])>0)
	
	READ WRITE:C146([EW_BKFields:122])
	APPLY TO SELECTION:C70([EW_BKFields:122]; [EW_BKFields:122]X_UUID:6:=Generate UUID:C1066)
	
	
End if 





//TRACE


QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]x_UUID:6="")
If (Records in selection:C76([PREFERENCES:116])>0)
	
	LOCKED BY:C353([PREFERENCES:116]; $_l_Process; $_t_user; $_t_Machine; $_t_ProcessName)
	
	
	
	READ WRITE:C146([PREFERENCES:116])
	APPLY TO SELECTION:C70([PREFERENCES:116]; [PREFERENCES:116]x_UUID:6:=Generate UUID:C1066)
	
Else 
	//TRACE
	
	ALL RECORDS:C47([PREFERENCES:116])
	
	DISTINCT VALUES:C339([PREFERENCES:116]x_UUID:6; $_at_ModuleIDS)
	READ WRITE:C146([PREFERENCES:116])
	For ($_l_FieldIndex2; 1; Size of array:C274($_at_ModuleIDS))
		QUERY:C277([PREFERENCES:116]; [PREFERENCES:116]x_UUID:6=$_at_ModuleIDS{$_l_FieldIndex2})
		If (Records in selection:C76([PREFERENCES:116])>1)
			$_l_RecordsCount:=Records in selection:C76([PREFERENCES:116])
			REDUCE SELECTION:C351([PREFERENCES:116]; $_l_RecordsCount-1)
			For ($_l_RecordsIndex; 1; Records in selection:C76([PREFERENCES:116]))
				[PREFERENCES:116]x_UUID:6:=Generate UUID:C1066
				SAVE RECORD:C53([PREFERENCES:116])
				NEXT RECORD:C51([PREFERENCES:116])
			End for 
			
			
			
		End if 
	End for 
End if 


QUERY:C277([COMPONENTS:86]; [COMPONENTS:86]X_ComponentID:21=0)

If (Records in selection:C76([COMPONENTS:86])>0)
	
	
	
	
	READ WRITE:C146([COMPONENTS:86])
	APPLY TO SELECTION:C70([COMPONENTS:86]; [COMPONENTS:86]X_ComponentID:21:=AA_GetNextID(->[COMPONENTS:86]X_ComponentID:21))
	
	
	
Else 
	//TRACE
	
	ALL RECORDS:C47([COMPONENTS:86])
	
	DISTINCT VALUES:C339([COMPONENTS:86]X_ComponentID:21; $_al_FieldIndex2DS)
	READ WRITE:C146([COMPONENTS:86])
	For ($_l_FieldIndex2; 1; Size of array:C274($_al_FieldIndex2DS))
		QUERY:C277([COMPONENTS:86]; [COMPONENTS:86]X_ComponentID:21=$_al_FieldIndex2DS{$_l_FieldIndex2})
		If (Records in selection:C76([COMPONENTS:86])>1)
			$_l_RecordsCount:=Records in selection:C76([COMPONENTS:86])
			REDUCE SELECTION:C351([COMPONENTS:86]; $_l_RecordsCount-1)
			For ($_l_RecordsIndex; 1; Records in selection:C76([COMPONENTS:86]))
				[COMPONENTS:86]X_ComponentID:21:=0
				[COMPONENTS:86]X_ComponentID:21:=AA_GetNextID(->[COMPONENTS:86]X_ComponentID:21)
				
				SAVE RECORD:C53([COMPONENTS:86])
				NEXT RECORD:C51([COMPONENTS:86])
			End for 
			
			
			
		End if 
	End for 
End if 






QUERY:C277([COMPANIES:2]; [COMPANIES:2]x_ID:63=0)

If (Records in selection:C76([COMPANIES:2])>0)
	
	
	
	
	READ WRITE:C146([COMPANIES:2])
	APPLY TO SELECTION:C70([COMPANIES:2]; [COMPANIES:2]x_ID:63:=AA_GetNextID(->[COMPANIES:2]x_ID:63))
	
	
	
Else 
	//TRACE
	
	ALL RECORDS:C47([COMPANIES:2])
	
	DISTINCT VALUES:C339([COMPANIES:2]x_ID:63; $_al_FieldIndex2DS)
	READ WRITE:C146([COMPANIES:2])
	For ($_l_FieldIndex2; 1; Size of array:C274($_al_FieldIndex2DS))
		QUERY:C277([COMPANIES:2]; [COMPANIES:2]x_ID:63=$_al_FieldIndex2DS{$_l_FieldIndex2})
		If (Records in selection:C76([COMPANIES:2])>1)
			$_l_RecordsCount:=Records in selection:C76([COMPANIES:2])
			REDUCE SELECTION:C351([COMPANIES:2]; $_l_RecordsCount-1)
			For ($_l_RecordsIndex; 1; Records in selection:C76([COMPANIES:2]))
				[COMPANIES:2]x_ID:63:=0
				[COMPANIES:2]x_ID:63:=AA_GetNextID(->[COMPANIES:2]x_ID:63)
				
				SAVE RECORD:C53([COMPANIES:2])
				NEXT RECORD:C51([COMPANIES:2])
			End for 
			
			
			
		End if 
	End for 
End if 


QUERY:C277([PROCESSES_TO_HANDLE:115]; [PROCESSES_TO_HANDLE:115]x_UUID:14="")
If (Records in selection:C76([PROCESSES_TO_HANDLE:115])>0)
	READ WRITE:C146([PROCESSES_TO_HANDLE:115])
	APPLY TO SELECTION:C70([PROCESSES_TO_HANDLE:115]; [PROCESSES_TO_HANDLE:115]x_UUID:14:=Generate UUID:C1066)
	
	
End if 

QUERY:C277([SD_Settings:107]; [SD_Settings:107]x_UUID:15="")
If (Records in selection:C76([SD_Settings:107])>0)
	READ WRITE:C146([SD_Settings:107])
	APPLY TO SELECTION:C70([SD_Settings:107]; [SD_Settings:107]x_UUID:15:=Generate UUID:C1066)
	
	
	
	
	
	
End if 

QUERY:C277([TABLE_RECORD_STATES:90]; [TABLE_RECORD_STATES:90]x_UUID:10="")
If (Records in selection:C76([TABLE_RECORD_STATES:90])>0)
	READ WRITE:C146([TABLE_RECORD_STATES:90])
	APPLY TO SELECTION:C70([TABLE_RECORD_STATES:90]; [TABLE_RECORD_STATES:90]x_UUID:10:=Generate UUID:C1066)
	
	
	
	
	
	
End if 

QUERY:C277([TERMINOLOGY:75]; [TERMINOLOGY:75]x_UUID:11="")
If (Records in selection:C76([TERMINOLOGY:75])>0)
	READ WRITE:C146([TERMINOLOGY:75])
	APPLY TO SELECTION:C70([TERMINOLOGY:75]; [TERMINOLOGY:75]x_UUID:11:=Generate UUID:C1066)
	
	
	
	
	
	
	
	
	
	
End if 
QUERY:C277([X_URL_LInks:101]; [X_URL_LInks:101]x_UUID:4="")
If (Records in selection:C76([X_URL_LInks:101])>0)
	READ WRITE:C146([X_URL_LInks:101])
	APPLY TO SELECTION:C70([X_URL_LInks:101]; [X_URL_LInks:101]x_UUID:4:=Generate UUID:C1066)
	
	
	
	
	
	
	
	
	
	
	
End if 

QUERY:C277([CONTRACT_RECORD_ANALYSIS:88]; [CONTRACT_RECORD_ANALYSIS:88]X_UUID:4="")

If (Records in selection:C76([CONTRACT_RECORD_ANALYSIS:88])>0)
	READ WRITE:C146([CONTRACT_RECORD_ANALYSIS:88])
	APPLY TO SELECTION:C70([CONTRACT_RECORD_ANALYSIS:88]; [CONTRACT_RECORD_ANALYSIS:88]X_UUID:4:=Generate UUID:C1066)
	
	
	
	
	
	
	
	
	
	
	
	
End if 

QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]x_ID:58=0)

If (Records in selection:C76([ORDER_ITEMS:25])>0)
	
	
	
	
	READ WRITE:C146([ORDER_ITEMS:25])
	APPLY TO SELECTION:C70([ORDER_ITEMS:25]; [ORDER_ITEMS:25]x_ID:58:=AA_GetNextID(->[ORDER_ITEMS:25]x_ID:58))
	
	
	
Else 
	//TRACE
	
	ALL RECORDS:C47([ORDER_ITEMS:25])
	
	DISTINCT VALUES:C339([ORDER_ITEMS:25]x_ID:58; $_al_FieldIndex2DS)
	READ WRITE:C146([ORDER_ITEMS:25])
	For ($_l_FieldIndex2; 1; Size of array:C274($_al_FieldIndex2DS))
		QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]x_ID:58=$_al_FieldIndex2DS{$_l_FieldIndex2})
		If (Records in selection:C76([ORDER_ITEMS:25])>1)
			$_l_RecordsCount:=Records in selection:C76([ORDER_ITEMS:25])
			REDUCE SELECTION:C351([ORDER_ITEMS:25]; $_l_RecordsCount-1)
			For ($_l_RecordsIndex; 1; Records in selection:C76([ORDER_ITEMS:25]))
				[ORDER_ITEMS:25]x_ID:58:=0
				[ORDER_ITEMS:25]x_ID:58:=AA_GetNextID(->[ORDER_ITEMS:25]x_ID:58)
				
				SAVE RECORD:C53([ORDER_ITEMS:25])
				NEXT RECORD:C51([ORDER_ITEMS:25])
			End for 
			
			
			
		End if 
	End for 
End if 

QUERY:C277([INFORMATION:55]; [INFORMATION:55]X_UUID:17="")
If (Records in selection:C76([INFORMATION:55])>0)
	READ WRITE:C146([INFORMATION:55])
	APPLY TO SELECTION:C70([INFORMATION:55]; [INFORMATION:55]X_UUID:17:=Generate UUID:C1066)
End if 


QUERY:C277([PRICE_TABLE:28]; [PRICE_TABLE:28]x_ID:15=0)

If (Records in selection:C76([PRICE_TABLE:28])>0)
	
	
	
	
	READ WRITE:C146([PRICE_TABLE:28])
	APPLY TO SELECTION:C70([PRICE_TABLE:28]; [PRICE_TABLE:28]x_ID:15:=AA_GetNextID(->[PRICE_TABLE:28]x_ID:15))
	
	
	
Else 
	//TRACE
	
	ALL RECORDS:C47([PRICE_TABLE:28])
	
	DISTINCT VALUES:C339([PRICE_TABLE:28]x_ID:15; $_al_FieldIndex2DS)
	READ WRITE:C146([PRICE_TABLE:28])
	For ($_l_FieldIndex2; 1; Size of array:C274($_al_FieldIndex2DS))
		QUERY:C277([PRICE_TABLE:28]; [PRICE_TABLE:28]x_ID:15=$_al_FieldIndex2DS{$_l_FieldIndex2})
		If (Records in selection:C76([PRICE_TABLE:28])>1)
			$_l_RecordsCount:=Records in selection:C76([PRICE_TABLE:28])
			REDUCE SELECTION:C351([PRICE_TABLE:28]; $_l_RecordsCount-1)
			For ($_l_RecordsIndex; 1; Records in selection:C76([PRICE_TABLE:28]))
				[PRICE_TABLE:28]x_ID:15:=0
				[PRICE_TABLE:28]x_ID:15:=AA_GetNextID(->[PRICE_TABLE:28]x_ID:15)
				
				SAVE RECORD:C53([PRICE_TABLE:28])
				NEXT RECORD:C51([PRICE_TABLE:28])
			End for 
			
			
			
		End if 
	End for 
End if 

ALL RECORDS:C47([EMAIL_ATTACHMENTS:103])

QUERY:C277([EMAIL_ATTACHMENTS:103]; [EMAIL_ATTACHMENTS:103]X_UUID:9="")
If (Records in selection:C76([EMAIL_ATTACHMENTS:103])>0)
	READ WRITE:C146([EMAIL_ATTACHMENTS:103])
	APPLY TO SELECTION:C70([EMAIL_ATTACHMENTS:103]; [EMAIL_ATTACHMENTS:103]X_UUID:9:=Generate UUID:C1066)
End if 
ALL RECORDS:C47([EMAIL_RECIPIENTS:104])

QUERY:C277([EMAIL_RECIPIENTS:104]; [EMAIL_RECIPIENTS:104]X_UUID:8="")
If (Records in selection:C76([EMAIL_RECIPIENTS:104])>0)
	READ WRITE:C146([EMAIL_RECIPIENTS:104])
	APPLY TO SELECTION:C70([EMAIL_RECIPIENTS:104]; [EMAIL_RECIPIENTS:104]X_UUID:8:=Generate UUID:C1066)
End if 

ALL RECORDS:C47([DIARY_ITEMOWNERS:106])

QUERY:C277([DIARY_ITEMOWNERS:106]; [DIARY_ITEMOWNERS:106]X_UUID:7="")
If (Records in selection:C76([DIARY_ITEMOWNERS:106])>0)
	READ WRITE:C146([DIARY_ITEMOWNERS:106])
	APPLY TO SELECTION:C70([DIARY_ITEMOWNERS:106]; [DIARY_ITEMOWNERS:106]X_UUID:7:=Generate UUID:C1066)
End if 

ALL RECORDS:C47([EW_ExportSteps:118])

QUERY:C277([EW_ExportSteps:118]; [EW_ExportSteps:118]X_UUID:10="")
If (Records in selection:C76([EW_ExportSteps:118])>0)
	READ WRITE:C146([EW_ExportSteps:118])
	APPLY TO SELECTION:C70([EW_ExportSteps:118]; [EW_ExportSteps:118]X_UUID:10:=Generate UUID:C1066)
End if 

ALL RECORDS:C47([EW_StepActions:119])

QUERY:C277([EW_StepActions:119]; [EW_StepActions:119]X_UUID:15="")
If (Records in selection:C76([EW_StepActions:119])>0)
	READ WRITE:C146([EW_StepActions:119])
	APPLY TO SELECTION:C70([EW_StepActions:119]; [EW_StepActions:119]X_UUID:15:=Generate UUID:C1066)
End if 

ALL RECORDS:C47([xDiaryRelations:137])

QUERY:C277([xDiaryRelations:137]; [xDiaryRelations:137]X_UUID:8="")
If (Records in selection:C76([xDiaryRelations:137])>0)
	READ WRITE:C146([xDiaryRelations:137])
	APPLY TO SELECTION:C70([xDiaryRelations:137]; [xDiaryRelations:137]X_UUID:8:=Generate UUID:C1066)
End if 


QUERY:C277([PURCHASE_ORDERS_ITEMS:169]; [PURCHASE_ORDERS_ITEMS:169]ID:17=0)

If (Records in selection:C76([PURCHASE_ORDERS_ITEMS:169])>0)
	
	
	
	
	READ WRITE:C146([PURCHASE_ORDERS_ITEMS:169])
	APPLY TO SELECTION:C70([PURCHASE_ORDERS_ITEMS:169]; [PURCHASE_ORDERS_ITEMS:169]ID:17:=AA_GetNextID(->[PURCHASE_ORDERS_ITEMS:169]ID:17))
	
	
	
Else 
	//TRACE
	
	ALL RECORDS:C47([PURCHASE_ORDERS_ITEMS:169])
	
	DISTINCT VALUES:C339([PURCHASE_ORDERS_ITEMS:169]ID:17; $_al_FieldIndex2DS)
	READ WRITE:C146([PURCHASE_ORDERS_ITEMS:169])
	For ($_l_FieldIndex2; 1; Size of array:C274($_al_FieldIndex2DS))
		QUERY:C277([PURCHASE_ORDERS_ITEMS:169]; [PURCHASE_ORDERS_ITEMS:169]ID:17=$_al_FieldIndex2DS{$_l_FieldIndex2})
		If (Records in selection:C76([PURCHASE_ORDERS_ITEMS:169])>1)
			$_l_RecordsCount:=Records in selection:C76([PURCHASE_ORDERS_ITEMS:169])
			REDUCE SELECTION:C351([PURCHASE_ORDERS_ITEMS:169]; $_l_RecordsCount-1)
			For ($_l_RecordsIndex; 1; Records in selection:C76([PURCHASE_ORDERS_ITEMS:169]))
				[PURCHASE_ORDERS_ITEMS:169]ID:17:=0
				[PURCHASE_ORDERS_ITEMS:169]ID:17:=AA_GetNextID(->[PURCHASE_ORDERS_ITEMS:169]ID:17)
				
				SAVE RECORD:C53([PURCHASE_ORDERS_ITEMS:169])
				NEXT RECORD:C51([PURCHASE_ORDERS_ITEMS:169])
			End for 
			
			
			
		End if 
	End for 
End if 


QUERY:C277([PRODUCTS_SUPPLIERS:148]; [PRODUCTS_SUPPLIERS:148]ID:7=0)

If (Records in selection:C76([PRODUCTS_SUPPLIERS:148])>0)
	
	
	
	
	READ WRITE:C146([PRODUCTS_SUPPLIERS:148])
	APPLY TO SELECTION:C70([PRODUCTS_SUPPLIERS:148]; [PRODUCTS_SUPPLIERS:148]ID:7:=AA_GetNextID(->[PRODUCTS_SUPPLIERS:148]ID:7))
	
	
	
Else 
	//TRACE
	
	
	ALL RECORDS:C47([PRODUCTS_SUPPLIERS:148])
	
	DISTINCT VALUES:C339([PRODUCTS_SUPPLIERS:148]ID:7; $_al_FieldIndex2DS)
	READ WRITE:C146([PRODUCTS_SUPPLIERS:148])
	For ($_l_FieldIndex2; 1; Size of array:C274($_al_FieldIndex2DS))
		QUERY:C277([PRODUCTS_SUPPLIERS:148]; [PRODUCTS_SUPPLIERS:148]ID:7=$_al_FieldIndex2DS{$_l_FieldIndex2})
		If (Records in selection:C76([PRODUCTS_SUPPLIERS:148])>1)
			$_l_RecordsCount:=Records in selection:C76([PRODUCTS_SUPPLIERS:148])
			REDUCE SELECTION:C351([PRODUCTS_SUPPLIERS:148]; $_l_RecordsCount-1)
			For ($_l_RecordsIndex; 1; Records in selection:C76([PRODUCTS_SUPPLIERS:148]))
				[PRODUCTS_SUPPLIERS:148]ID:7:=0
				[PRODUCTS_SUPPLIERS:148]ID:7:=AA_GetNextID(->[PRODUCTS_SUPPLIERS:148]ID:7)
				
				SAVE RECORD:C53([PRODUCTS_SUPPLIERS:148])
				NEXT RECORD:C51([PRODUCTS_SUPPLIERS:148])
			End for 
			
			
			
		End if 
	End for 
End if 




























QUERY:C277([PURCHASE_INVOICE_ITEMS:158]; [PURCHASE_INVOICE_ITEMS:158]ID:16=0)
If (Records in selection:C76([PURCHASE_INVOICE_ITEMS:158])>0)
	READ WRITE:C146([PURCHASE_INVOICE_ITEMS:158])
	APPLY TO SELECTION:C70([PURCHASE_INVOICE_ITEMS:158]; [PURCHASE_INVOICE_ITEMS:158]ID:16:=AA_GetNextID(->[PURCHASE_INVOICE_ITEMS:158]ID:16))
Else 
	//TRACE
	
	
	ALL RECORDS:C47([PURCHASE_INVOICE_ITEMS:158])
	DISTINCT VALUES:C339([PURCHASE_INVOICE_ITEMS:158]ID:16; $_al_FieldIndex2DS)
	READ WRITE:C146([PURCHASE_INVOICE_ITEMS:158])
	For ($_l_FieldIndex2; 1; Size of array:C274($_al_FieldIndex2DS))
		QUERY:C277([PURCHASE_INVOICE_ITEMS:158]; [PURCHASE_INVOICE_ITEMS:158]ID:16=$_al_FieldIndex2DS{$_l_FieldIndex2})
		If (Records in selection:C76([PURCHASE_INVOICE_ITEMS:158])>1)
			$_l_RecordsCount:=Records in selection:C76([PURCHASE_INVOICE_ITEMS:158])
			REDUCE SELECTION:C351([PURCHASE_INVOICE_ITEMS:158]; $_l_RecordsCount-1)
			For ($_l_RecordsIndex; 1; Records in selection:C76([PURCHASE_INVOICE_ITEMS:158]))
				[PURCHASE_INVOICE_ITEMS:158]ID:16:=0
				[PURCHASE_INVOICE_ITEMS:158]ID:16:=AA_GetNextID(->[PURCHASE_INVOICE_ITEMS:158]ID:16)
				
				SAVE RECORD:C53([PURCHASE_INVOICE_ITEMS:158])
				NEXT RECORD:C51([PURCHASE_INVOICE_ITEMS:158])
			End for 
			
			
			
		End if 
	End for 
End if 
QUERY:C277([COUNTRIES:73]; [COUNTRIES:73]COUNTRY_CODE:1="")
If (Records in selection:C76([COUNTRIES:73])>0)
	READ WRITE:C146([COUNTRIES:73])
	APPLY TO SELECTION:C70([COUNTRIES:73]; [COUNTRIES:73]COUNTRY_CODE:1:=Generate UUID:C1066)
Else 
	//TRACE
	
	ALL RECORDS:C47([COUNTRIES:73])
	DISTINCT VALUES:C339([COUNTRIES:73]COUNTRY_CODE:1; $_at_CountryCodes)
	READ WRITE:C146([COUNTRIES:73])
	For ($_l_FieldIndex2; 1; Size of array:C274($_at_CountryCodes))
		QUERY:C277([COUNTRIES:73]; [COUNTRIES:73]COUNTRY_CODE:1=$_at_CountryCodes{$_l_FieldIndex2})
		If (Records in selection:C76([COUNTRIES:73])>1)
			$_l_RecordsCount:=Records in selection:C76([COUNTRIES:73])
			REDUCE SELECTION:C351([COUNTRIES:73]; $_l_RecordsCount-1)
			
			DELETE SELECTION:C66([COUNTRIES:73])
			
			
		End if 
	End for 
End if 


QUERY:C277([INVOICES_ITEMS:161]; [INVOICES_ITEMS:161]ID:17=0)
If (Records in selection:C76([INVOICES_ITEMS:161])>0)
	READ WRITE:C146([INVOICES_ITEMS:161])
	APPLY TO SELECTION:C70([INVOICES_ITEMS:161]; [INVOICES_ITEMS:161]ID:17:=AA_GetNextID(->[INVOICES_ITEMS:161]ID:17))
Else 
	//TRACE
	
	ALL RECORDS:C47([INVOICES_ITEMS:161])
	DISTINCT VALUES:C339([INVOICES_ITEMS:161]ID:17; $_al_FieldIndex2DS)
	READ WRITE:C146([INVOICES_ITEMS:161])
	For ($_l_FieldIndex2; 1; Size of array:C274($_al_FieldIndex2DS))
		QUERY:C277([INVOICES_ITEMS:161]; [INVOICES_ITEMS:161]ID:17=$_al_FieldIndex2DS{$_l_FieldIndex2})
		If (Records in selection:C76([INVOICES_ITEMS:161])>1)
			$_l_RecordsCount:=Records in selection:C76([INVOICES_ITEMS:161])
			REDUCE SELECTION:C351([INVOICES_ITEMS:161]; $_l_RecordsCount-1)
			For ($_l_RecordsIndex; 1; Records in selection:C76([INVOICES_ITEMS:161]))
				[INVOICES_ITEMS:161]ID:17:=0
				[INVOICES_ITEMS:161]ID:17:=AA_GetNextID(->[INVOICES_ITEMS:161]ID:17)
				
				SAVE RECORD:C53([INVOICES_ITEMS:161])
				NEXT RECORD:C51([INVOICES_ITEMS:161])
			End for 
			
			
			
		End if 
	End for 
End if 

QUERY:C277([INVOICES_ALLOCATIONS:162]; [INVOICES_ALLOCATIONS:162]ID:5=0)
If (Records in selection:C76([INVOICES_ALLOCATIONS:162])>0)
	READ WRITE:C146([INVOICES_ALLOCATIONS:162])
	APPLY TO SELECTION:C70([INVOICES_ALLOCATIONS:162]; [INVOICES_ALLOCATIONS:162]ID:5:=AA_GetNextID(->[INVOICES_ALLOCATIONS:162]ID:5))
Else 
	//TRACE
	
	ALL RECORDS:C47([INVOICES_ALLOCATIONS:162])
	DISTINCT VALUES:C339([INVOICES_ALLOCATIONS:162]ID:5; $_al_FieldIndex2DS)
	READ WRITE:C146([INVOICES_ALLOCATIONS:162])
	For ($_l_FieldIndex2; 1; Size of array:C274($_al_FieldIndex2DS))
		QUERY:C277([INVOICES_ALLOCATIONS:162]; [INVOICES_ALLOCATIONS:162]ID:5=$_al_FieldIndex2DS{$_l_FieldIndex2})
		If (Records in selection:C76([INVOICES_ALLOCATIONS:162])>1)
			$_l_RecordsCount:=Records in selection:C76([INVOICES_ALLOCATIONS:162])
			REDUCE SELECTION:C351([INVOICES_ALLOCATIONS:162]; $_l_RecordsCount-1)
			For ($_l_RecordsIndex; 1; Records in selection:C76([INVOICES_ALLOCATIONS:162]))
				[INVOICES_ALLOCATIONS:162]ID:5:=0
				[INVOICES_ALLOCATIONS:162]ID:5:=AA_GetNextID(->[INVOICES_ALLOCATIONS:162]ID:5)
				
				SAVE RECORD:C53([INVOICES_ALLOCATIONS:162])
				NEXT RECORD:C51([INVOICES_ALLOCATIONS:162])
			End for 
			
			
			
		End if 
	End for 
End if 

QUERY:C277([xSynch:139]; [xSynch:139]xSynchRecordID:3=0)

If (Records in selection:C76([xSynch:139])>0)
	READ WRITE:C146([xSynch:139])
	APPLY TO SELECTION:C70([xSynch:139]; [xSynch:139]xSynchRecordID:3:=AA_GetNextID(->[xSynch:139]xSynchRecordID:3))
	
Else 
	//TRACE
	
	
	ALL RECORDS:C47([xSynch:139])
	DISTINCT VALUES:C339([xSynch:139]xSynchRecordID:3; $_al_FieldIndex2DS)
	
	READ WRITE:C146([xSynch:139])
	For ($_l_FieldIndex2; 1; Size of array:C274($_al_FieldIndex2DS))
		QUERY:C277([xSynch:139]; [xSynch:139]xSynchRecordID:3=$_al_FieldIndex2DS{$_l_FieldIndex2})
		
		If (Records in selection:C76([xSynch:139])>1)
			$_l_RecordsCount:=Records in selection:C76([xSynch:139])
			REDUCE SELECTION:C351([xSynch:139]; $_l_RecordsCount-1)
			For ($_l_RecordsIndex; 1; Records in selection:C76([xSynch:139]))
				[xSynch:139]xSynchRecordID:3:=0
				[xSynch:139]xSynchRecordID:3:=AA_GetNextID(->[xSynch:139]xSynchRecordID:3)
				
				
				
				SAVE RECORD:C53([xSynch:139])
				NEXT RECORD:C51([xSynch:139])
			End for 
			
			
			
		End if 
	End for 
End if 

QUERY:C277([CONTRACTS:17]; [CONTRACTS:17]x_ID:12=0)
If (Records in selection:C76([CONTRACTS:17])>0)
	READ WRITE:C146([CONTRACTS:17])
	APPLY TO SELECTION:C70([CONTRACTS:17]; [CONTRACTS:17]x_ID:12:=AA_GetNextID(->[CONTRACTS:17]x_ID:12))
Else 
	//TRACE
	
	ALL RECORDS:C47([CONTRACTS:17])
	DISTINCT VALUES:C339([CONTRACTS:17]x_ID:12; $_al_FieldIndex2DS)
	READ WRITE:C146([CONTRACTS:17])
	For ($_l_FieldIndex2; 1; Size of array:C274($_al_FieldIndex2DS))
		QUERY:C277([CONTRACTS:17]; [CONTRACTS:17]x_ID:12=$_al_FieldIndex2DS{$_l_FieldIndex2})
		If (Records in selection:C76([CONTRACTS:17])>1)
			$_l_RecordsCount:=Records in selection:C76([CONTRACTS:17])
			REDUCE SELECTION:C351([CONTRACTS:17]; $_l_RecordsCount-1)
			For ($_l_RecordsIndex; 1; Records in selection:C76([CONTRACTS:17]))
				[CONTRACTS:17]x_ID:12:=0
				[CONTRACTS:17]x_ID:12:=AA_GetNextID(->[CONTRACTS:17]x_ID:12)
				
				SAVE RECORD:C53([CONTRACTS:17])
				NEXT RECORD:C51([CONTRACTS:17])
			End for 
			
			
			
		End if 
	End for 
End if 

ARRAY LONGINT:C221($_al_FieldIndex2DS; 0)
//Open window(20;Screen height-100;200;Screen height;-Palette window)
For ($_l_TableIndex; 1; Get last table number:C254)
	If (Is table number valid:C999($_l_TableIndex))
		$_t_TableName:=Table name:C256($_l_TableIndex)
		//GOTO XY(0;0)
		
		//MESSAGE($_t_TableName)
		For ($_l_FieldIndex; 1; Get last field number:C255($_l_TableIndex))
			If (Is field number valid:C1000($_l_TableIndex; $_l_FieldIndex))
				$_ptr_FieldPointer:=Field:C253($_l_TableIndex; $_l_FieldIndex)
				$_ptr_Table:=Table:C252($_l_TableIndex)
				
				GET FIELD PROPERTIES:C258($_ptr_FieldPointer; $_l_FieldType; $_l_FieldLength; $_bo_FieldIndexed; $_bo_FieldUnique; $_bo_FieldInvisible)
				If ($_bo_FieldUnique)
					Case of 
						: (Type:C295($_ptr_FieldPointer->)=Is longint:K8:6)
							
							QUERY:C277($_ptr_Table->; $_ptr_FieldPointer->=0)
							
							If (Records in selection:C76($_ptr_Table->)>0)
								READ WRITE:C146($_ptr_Table->)
								APPLY TO SELECTION:C70($_ptr_Table->; $_ptr_FieldPointer->:=AA_GetNextID($_ptr_FieldPointer))
							Else 
								//TRACE
								ALL RECORDS:C47($_ptr_Table->)
								DISTINCT VALUES:C339($_ptr_FieldPointer->; $_al_FieldIndex2DS)
								READ WRITE:C146($_ptr_Table->)
								For ($_l_FieldIndex2; 1; Size of array:C274($_al_FieldIndex2DS))
									QUERY:C277($_ptr_Table->; $_ptr_FieldPointer->=$_al_FieldIndex2DS{$_l_FieldIndex2})
									If (Records in selection:C76($_ptr_Table->)>1)
										$_l_RecordsCount:=Records in selection:C76($_ptr_Table->)
										REDUCE SELECTION:C351($_ptr_Table->; $_l_RecordsCount-1)
										For ($_l_RecordsIndex; 1; Records in selection:C76($_ptr_Table->))
											$_ptr_FieldPointer->:=0
											$_ptr_FieldPointer->:=AA_GetNextID($_ptr_FieldPointer)
											
											SAVE RECORD:C53($_ptr_Table->)
											NEXT RECORD:C51($_ptr_Table->)
										End for 
										
										
										
									End if 
								End for 
							End if 
						: (Type:C295($_ptr_FieldPointer->)=Is alpha field:K8:1)
							//$_ptr_FieldPointer:=Field($_l_FieldIndex2;$_l_FieldIndex)
							//$_ptr_Table:=Table($_l_FieldIndex2)
							QUERY:C277($_ptr_Table->; $_ptr_FieldPointer->="")
							
							If (Records in selection:C76($_ptr_Table->)>0)
								READ WRITE:C146($_ptr_Table->)
								Case of 
									: ($_ptr_FieldPointer=(->[AREAS:3]Area_Code:1))
										
										//TRACE
									: ($_ptr_FieldPointer=(->[STOCK_MOVEMENTS:40]Movement_Code:1))
										
										APPLY TO SELECTION:C70([STOCK_MOVEMENTS:40]; Movement_Code)
									: ($_ptr_FieldPointer=(->[DOCUMENTS:7]Document_Code:1))
										
										For ($_l_RecordsIndex; 1; Records in selection:C76([DOCUMENTS:7]))
											Case of 
												: ([DOCUMENTS:7]Document_Class:14=SuperWrite Report Template)
													[DOCUMENTS:7]Document_Code:1:="QR "+Gen_CodePref(5; ->[DOCUMENTS:7]Document_Code:1; "SR")
													
												: ([DOCUMENTS:7]Document_Class:14=SuperReportReport Template)
													[DOCUMENTS:7]Document_Code:1:="SR "+$_t_ReportName
													
													
													
												Else 
													Gen_CodePref(5; ->[DOCUMENTS:7]Document_Code:1)
													
													//[DOCUMENTS]LDocument_Code:="SR "+Gen_CodePref (5;->[DOCUMENTS]LDocument_Code)
													
											End case 
											SAVE RECORD:C53([DOCUMENTS:7])
											
										End for 
										
										APPLY TO SELECTION:C70([STOCK_MOVEMENTS:40]; Movement_Code)
									: ($_ptr_FieldPointer=(->[CONTACTS:1]Contact_Code:2))
										APPLY TO SELECTION:C70([CONTACTS:1]; [CONTACTS:1]Contact_Code:2:=Gen_CodePref(2; ->[CONTACTS:1]Contact_Code:2))
									: ($_ptr_FieldPointer=(->[PRODUCTS:9]Product_Code:1))
										
										
										
										//[PRODUCTS]Product_Code:=[PRODUCTS]Group_Code+[PRODUCTS]Brand_Code+[PRODUCTS]Model_Code
										For ($_l_RecordsIndex; 1; Records in selection:C76([DOCUMENTS:7]))
											[PRODUCTS:9]Product_Code:1:=[PRODUCTS:9]Group_Code:3+[PRODUCTS:9]Brand_Code:4+[PRODUCTS:9]Model_Code:5
											If ([PRODUCTS:9]Product_Code:1="")
												[PRODUCTS:9]Product_Code:1:="AAAA"+String:C10((Random:C100%100000)+10)
												
											End if 
											SAVE RECORD:C53([PRODUCTS:9])
										End for 
									: ($_ptr_FieldPointer=(->[DIARY:12]Diary_Code:3))
										
										APPLY TO SELECTION:C70([DIARY:12]; DiarySetCode)
										
									: ($_ptr_FieldPointer=(->[WORKFLOW_CONTROL:51]WFControl_Code:10))
										
										APPLY TO SELECTION:C70([WORKFLOW_CONTROL:51]; [WORKFLOW_CONTROL:51]WFControl_Code:10:=Gen_CodePref(20; ->[WORKFLOW_CONTROL:51]WFControl_Code:10))
									: ($_ptr_FieldPointer=(->[INFORMATION:55]X_UUID:17))
										
										APPLY TO SELECTION:C70([INFORMATION:55]; [INFORMATION:55]X_UUID:17:=Generate UUID:C1066)
									: ($_ptr_FieldPointer=(->[PURCHASE_ORDERS:57]Purchase_Order_Number:2))
										APPLY TO SELECTION:C70([PURCHASE_ORDERS:57]; [PURCHASE_ORDERS:57]Purchase_Order_Number:2:=Gen_CodePref(16; ->[PURCHASE_ORDERS:57]Purchase_Order_Number:2))
									: ($_ptr_FieldPointer=(->[JOB_TYPES:65]Type_Code:1))
										APPLY TO SELECTION:C70([JOB_TYPES:65]; [JOB_TYPES:65]Type_Code:1:="AAAA"+String:C10((Random:C100%100000)+10))
										
										
										
										
										
									: ($_ptr_FieldPointer=(->[TIME_BILLING_CATEGORIES:46]X_UUID:5))
										APPLY TO SELECTION:C70([TIME_BILLING_CATEGORIES:46]; [TIME_BILLING_CATEGORIES:46]X_UUID:5:=Generate UUID:C1066)
										
									: ($_ptr_FieldPointer=(->[STATUS:4]Status_Code:1))
										APPLY TO SELECTION:C70([STATUS:4]; [STATUS:4]Status_Code:1:="A"+String:C10((Random:C100%100000)+2))
										
									: ($_ptr_FieldPointer=(->[TYPES:5]Type_Code:1))
										APPLY TO SELECTION:C70([TYPES:5]; [TYPES:5]Type_Code:1:="A"+String:C10((Random:C100%100000)+2))
									: ($_ptr_FieldPointer=(->[SOURCES:6]Source_Code:1))
										APPLY TO SELECTION:C70([SOURCES:6]; [SOURCES:6]Source_Code:1:="A"+String:C10((Random:C100%100000)+2))
									: ($_ptr_FieldPointer=(->[PERSONNEL:11]Initials:1))
										APPLY TO SELECTION:C70([PERSONNEL:11]; [PERSONNEL:11]Initials:1:="A"+String:C10((Random:C100%100000)+2))
										
									: ($_ptr_FieldPointer=(->[JOBS:26]Job_Code:1))
										APPLY TO SELECTION:C70([JOBS:26]; [JOBS:26]Job_Code:1:=[JOBS:26]Job_Type:21+String:C10(Gen_Code(17)))
										
										
										
									: ($_ptr_FieldPointer=(->[JOB_STAGES:47]Job_Stage_code:52))
										
										
										
										APPLY TO SELECTION:C70([JOB_STAGES:47]; [JOB_STAGES:47]Job_Stage_code:52:=String:C10(Gen_Code((Table:C252(->[JOB_STAGES:47]))+255; ->[JOB_STAGES:47]Job_Stage_code:52)))
										
										
										
										
										
									Else 
										//TRACE
								End case 
							End if 
							UNLOAD RECORD:C212($_ptr_Table->)
							READ ONLY:C145($_ptr_Table->)
							
							//TRACE
							ARRAY TEXT:C222($_at_CountryCodes; 0)
							
							ALL RECORDS:C47($_ptr_Table->)
							DISTINCT VALUES:C339($_ptr_FieldPointer->; $_at_RecordCodes)
							
							READ WRITE:C146($_ptr_Table->)
							For ($_l_FieldIndex2; 1; Size of array:C274($_at_RecordCodes))
								QUERY:C277($_ptr_Table->; $_ptr_FieldPointer->=$_at_RecordCodes{$_l_FieldIndex2})
								
								If (Records in selection:C76($_ptr_Table->)>1)
									$_l_RecordsCount:=Records in selection:C76($_ptr_Table->)
									REDUCE SELECTION:C351($_ptr_Table->; $_l_RecordsCount-1)
									
									For ($_l_RecordsIndex; 1; Records in selection:C76($_ptr_Table->))
										
										Case of 
											: ($_ptr_FieldPointer=(->[STOCK_MOVEMENTS:40]Movement_Code:1))
												
												Movement_Code
											: ($_ptr_FieldPointer=(->[CONTACTS:1]Contact_Code:2))
												
												[CONTACTS:1]Contact_Code:2:=Gen_CodePref(2; ->[CONTACTS:1]Contact_Code:2)
											: ($_ptr_FieldPointer=(->[DOCUMENTS:7]Document_Code:1))
												
												Case of 
													: ([DOCUMENTS:7]Document_Class:14=SuperWrite Report Template)
														[DOCUMENTS:7]Document_Code:1:="QR "+Gen_CodePref(5; ->[DOCUMENTS:7]Document_Code:1; "SR")
														
													: ([DOCUMENTS:7]Document_Class:14=SuperReportReport Template)
														[DOCUMENTS:7]Document_Code:1:="SR "+$_t_ReportName
														
														
														
													Else 
														[DOCUMENTS:7]Document_Code:1:=Gen_CodePref(5; ->[DOCUMENTS:7]Document_Code:1)
														
														//[DOCUMENTS]LDocument_Code:="SR "+Gen_CodePref (5;->[DOCUMENTS]LDocument_Code)
														
												End case 
											: ($_ptr_FieldPointer=(->[IDENTIFIERS:16]x_UUID:10))
												
												[IDENTIFIERS:16]x_UUID:10:=Generate UUID:C1066
											: ($_ptr_FieldPointer=(->[INFORMATION:55]X_UUID:17))
												
												[INFORMATION:55]X_UUID:17:=Generate UUID:C1066
											: ($_ptr_FieldPointer=(->[PURCHASE_ORDERS:57]Purchase_Order_Number:2))
												
												[PURCHASE_ORDERS:57]Purchase_Order_Number:2:=Gen_CodePref(16; ->[PURCHASE_ORDERS:57]Purchase_Order_Number:2)
											: ($_ptr_FieldPointer=(->[JOB_STAGES:47]Job_Stage_code:52))
												[JOB PERSONNEL:48]Job_stage_Code:17:=JC_GetNextUniqueJobStageCode
											: ($_ptr_FieldPointer=(->[CONTRACT_RECORD_ANALYSIS:88]X_UUID:4))
												[CONTRACT_RECORD_ANALYSIS:88]X_UUID:4:=Generate UUID:C1066
											: ($_ptr_FieldPointer=(->[TIME_BILLING_CATEGORIES:46]X_UUID:5))
												
												[TIME_BILLING_CATEGORIES:46]X_UUID:5:=Generate UUID:C1066
											: ($_ptr_FieldPointer=(->[TABLE_RECORD_STATES:90]x_UUID:10))
												
												
												[TABLE_RECORD_STATES:90]x_UUID:10:=Generate UUID:C1066
											: ($_ptr_FieldPointer=(->[CODE_USES:91]X_UUID:3))
												
												
												[CODE_USES:91]X_UUID:3:=Generate UUID:C1066
											: ($_ptr_FieldPointer=(->[IDENTIFIERS_MULTI_NUMBERS:94]X_UUID:5))
												
												
												
												
												[IDENTIFIERS_MULTI_NUMBERS:94]X_UUID:5:=Generate UUID:C1066
												
											: ($_ptr_FieldPointer=(->[LIST_LAYOUTS:96]X_UUID:21))
												
												
												
												[LIST_LAYOUTS:96]X_UUID:21:=Generate UUID:C1066
											: ($_ptr_FieldPointer=(->[CUSTOM_FIELDS:98]X_UUID:9))
												
												
												
												[CUSTOM_FIELDS:98]X_UUID:9:=Generate UUID:C1066
												
											: ($_ptr_FieldPointer=(->[EMAIL_ATTACHMENTS:103]X_UUID:9))
												
												
												
												
												[EMAIL_ATTACHMENTS:103]X_UUID:9:=Generate UUID:C1066
											: ($_ptr_FieldPointer=(->[EMAIL_RECIPIENTS:104]X_UUID:8))
												
												
												
												[EMAIL_RECIPIENTS:104]X_UUID:8:=Generate UUID:C1066
											: ($_ptr_FieldPointer=(->[SD_Settings:107]x_UUID:15))
												
												
												
												
												[SD_Settings:107]x_UUID:15:=Generate UUID:C1066
												
											: ($_ptr_FieldPointer=(->[PROCESSES_TO_HANDLE:115]x_UUID:14))
												
												
												
												[PROCESSES_TO_HANDLE:115]x_UUID:14:=Generate UUID:C1066
											: ($_ptr_FieldPointer=(->[EW_ExportSteps:118]X_UUID:10))
												[EW_ExportSteps:118]X_UUID:10:=Generate UUID:C1066
												
												
												
												
												
												
												
											: ($_ptr_FieldPointer=(->[EW_StepActions:119]X_UUID:15))
												[EW_StepActions:119]X_UUID:15:=Generate UUID:C1066
												
											: ($_ptr_FieldPointer=(->[CLIENT_SERVERMESSAGES:123]UUID:5))
												
												
												[CLIENT_SERVERMESSAGES:123]UUID:5:=Generate UUID:C1066
												
												
											: ($_ptr_FieldPointer=(->[xDiaryRelations:137]X_UUID:8))
												
												
												[xDiaryRelations:137]X_UUID:8:=Generate UUID:C1066
											: ($_ptr_FieldPointer=(->[CUSTOM_FIELDS_PERSONNEL:100]X_UUID:3))
												
												
												[CUSTOM_FIELDS_PERSONNEL:100]X_UUID:3:=Generate UUID:C1066
											: ($_ptr_FieldPointer=(->[DIARY_ITEMOWNERS:106]X_UUID:7))
												
												
												[DIARY_ITEMOWNERS:106]X_UUID:7:=Generate UUID:C1066
											: ($_ptr_FieldPointer=(->[EW_BKFields:122]X_UUID:6))
												
												
												[EW_BKFields:122]X_UUID:6:=Generate UUID:C1066
											Else 
												//TRACE
										End case 
										
										SAVE RECORD:C53($_ptr_Table->)
										NEXT RECORD:C51($_ptr_Table->)
									End for 
									
								End if 
							End for 
							
							
							
						Else 
							//TRACE
					End case 
				End if 
			End if 
		End for 
	End if 
	
End for 
ERR_MethodTrackerReturn("DB_UpgradeV13toV14"; $_t_oldMethodName)