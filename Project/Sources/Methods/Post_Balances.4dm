//%attributes = {}
If (False:C215)
	//Project Method Name:      Post_Balances
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 19/04/2010 20:55
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_noPost; $_bo_NotLocked)
	C_LONGINT:C283($_l_AccountBalanceProcess; $_l_Process)
	C_REAL:C285($_r_AccBalance; $_r_AccBalance2; $_r_ChangeTotal; $0)
	C_TEXT:C284(<>PER_t_CurrentUserName; $_t_AccountCode; $_t_ChangeType; $_t_oldMethodName; $_t_SemID; $_t_UniqueID)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Post_Balances")
//Post_Balances
OK:=1
While (Semaphore:C143("UPDATEBALANCE"+[TRANSACTIONS:29]Account_Code:3))
	DelayTicks(2)
End while 
$_t_UniqueID:=ACC_Buildunique([TRANSACTIONS:29]Account_Code:3; [TRANSACTIONS:29]Analysis_Code:2; [TRANSACTIONS:29]Period_Code:12; [TRANSACTIONS:29]Layer_Code:23; [TRANSACTIONS:29]Currency_Code:22)
QUERY:C277([ACCOUNT_BALANCES:34]; [ACCOUNT_BALANCES:34]Unique_StringIdent:8=$_t_UniqueID)
If (Records in selection:C76([ACCOUNT_BALANCES:34])=0)
	QUERY:C277([ACCOUNT_BALANCES:34]; [ACCOUNT_BALANCES:34]Account_Code:2=[TRANSACTIONS:29]Account_Code:3; *)
	QUERY:C277([ACCOUNT_BALANCES:34];  & ; [ACCOUNT_BALANCES:34]Analysis_Code:1=[TRANSACTIONS:29]Analysis_Code:2; *)
	QUERY:C277([ACCOUNT_BALANCES:34];  & ; [ACCOUNT_BALANCES:34]Period_Code:4=[TRANSACTIONS:29]Period_Code:12; *)
	QUERY:C277([ACCOUNT_BALANCES:34];  & ; [ACCOUNT_BALANCES:34]Currency_Code:6=[TRANSACTIONS:29]Currency_Code:22; *)
	QUERY:C277([ACCOUNT_BALANCES:34];  & ; [ACCOUNT_BALANCES:34]Layer_Code:5=[TRANSACTIONS:29]Layer_Code:23)
End if 
If (Records in selection:C76([ACCOUNT_BALANCES:34])=0)
	
	CREATE RECORD:C68([ACCOUNT_BALANCES:34])
	[ACCOUNT_BALANCES:34]Unique_StringIdent:8:=$_t_UniqueID
	[ACCOUNT_BALANCES:34]Account_Code:2:=[TRANSACTIONS:29]Account_Code:3
	[ACCOUNT_BALANCES:34]Layer_Code:5:=[TRANSACTIONS:29]Layer_Code:23
	[ACCOUNT_BALANCES:34]Analysis_Code:1:=[TRANSACTIONS:29]Analysis_Code:2
	[ACCOUNT_BALANCES:34]Period_Code:4:=[TRANSACTIONS:29]Period_Code:12
	If ((DB_GetLedgerCashvatACC#"") & ([TRANSACTIONS:29]IO:18="@C"))  //If Cash VAT Cash then post the total not the amt
		[ACCOUNT_BALANCES:34]Balance:3:=[TRANSACTIONS:29]Total:17
	Else 
		[ACCOUNT_BALANCES:34]Balance:3:=[TRANSACTIONS:29]Amount:6
	End if 
	[ACCOUNT_BALANCES:34]Currency_Code:6:=[TRANSACTIONS:29]Currency_Code:22
	[ACCOUNT_BALANCES:34]x_ID:7:=AA_GetNextID(->[ACCOUNT_BALANCES:34]x_ID:7)
	
	DB_SaveRecord(->[ACCOUNT_BALANCES:34])
	AA_CheckFileUnlocked(->[ACCOUNT_BALANCES:34]x_ID:7)
	$0:=[ACCOUNT_BALANCES:34]x_ID:7
Else 
	If (Application type:C494#4D Server:K5:6)
		$_r_AccBalance:=[ACCOUNT_BALANCES:34]Balance:3
		$_bo_NotLocked:=Check_Locked(->[ACCOUNT_BALANCES:34]; 2)
		If ($_bo_NotLocked)
			If ((DB_GetLedgerCashvatACC#"") & ([TRANSACTIONS:29]IO:18="@C"))
				$_r_ChangeTotal:=[TRANSACTIONS:29]Total:17
				$_t_ChangeType:="Total"
				[ACCOUNT_BALANCES:34]Balance:3:=Round:C94(([ACCOUNT_BALANCES:34]Balance:3+[TRANSACTIONS:29]Total:17); 2)
			Else 
				$_r_ChangeTotal:=[TRANSACTIONS:29]Amount:6
				$_t_ChangeType:="Amount"
				[ACCOUNT_BALANCES:34]Balance:3:=Round:C94(([ACCOUNT_BALANCES:34]Balance:3+[TRANSACTIONS:29]Amount:6); 2)
			End if 
			If ([ACCOUNT_BALANCES:34]x_ID:7=0)
				[ACCOUNT_BALANCES:34]x_ID:7:=AA_GetNextID(->[ACCOUNT_BALANCES:34]x_ID:7)
			End if 
			DB_SaveRecord(->[ACCOUNT_BALANCES:34])
			AA_CheckFileUnlocked(->[ACCOUNT_BALANCES:34]x_ID:7)
			$0:=[ACCOUNT_BALANCES:34]x_ID:7
			$_r_AccBalance2:=[ACCOUNT_BALANCES:34]Balance:3
			$_l_Process:=Execute on server:C373("ACC_RecordBalance"; 180000; "RecordAccountBalanceChange"; [ACCOUNT_BALANCES:34]Account_Code:2; $_t_ChangeType; $_r_ChangeTotal; $_r_AccBalance; $_r_AccBalance2; "Client "+<>PER_t_CurrentUserName+" Post_Balances(1)")
			
			UNLOAD RECORD:C212([ACCOUNT_BALANCES:34])
		Else 
			Gen_Alert("A Balance could not be saved.  The Posting will be cancelled."; "Cancel")
			OK:=0
		End if 
	Else 
		//we are updating the balance on the server-we will wait till it is free
		Repeat 
			$_bo_NotLocked:=Check_Locked(->[ACCOUNT_BALANCES:34]; 2)
		Until ($_bo_NotLocked)
		$_r_AccBalance:=[ACCOUNT_BALANCES:34]Balance:3
		If ((DB_GetLedgerCashvatACC#"") & ([TRANSACTIONS:29]IO:18="@C"))
			$_r_ChangeTotal:=[TRANSACTIONS:29]Total:17
			$_t_ChangeType:="Total"
			
			
			[ACCOUNT_BALANCES:34]Balance:3:=Round:C94(([ACCOUNT_BALANCES:34]Balance:3+[TRANSACTIONS:29]Total:17); 2)
		Else 
			$_r_ChangeTotal:=[TRANSACTIONS:29]Amount:6
			$_t_ChangeType:="Amount"
			
			[ACCOUNT_BALANCES:34]Balance:3:=Round:C94(([ACCOUNT_BALANCES:34]Balance:3+[TRANSACTIONS:29]Amount:6); 2)
		End if 
		If ([ACCOUNT_BALANCES:34]x_ID:7=0)
			[ACCOUNT_BALANCES:34]x_ID:7:=AA_GetNextID(->[ACCOUNT_BALANCES:34]x_ID:7)
		End if 
		DB_SaveRecord(->[ACCOUNT_BALANCES:34])
		AA_CheckFileUnlocked(->[ACCOUNT_BALANCES:34]x_ID:7)
		$0:=[ACCOUNT_BALANCES:34]x_ID:7
		$_r_AccBalance2:=[ACCOUNT_BALANCES:34]Balance:3
		$_l_AccountBalanceProcess:=New process:C317("ACC_RecordBalance"; 180000; "RecordAccountBalanceChange"; [ACCOUNT_BALANCES:34]Account_Code:2; $_t_ChangeType; $_r_ChangeTotal; $_r_AccBalance; $_r_AccBalance2; "Server"+" Post_Balances(1)")
		
		UNLOAD RECORD:C212([ACCOUNT_BALANCES:34])
		
		
		
	End if 
End if 
CLEAR SEMAPHORE:C144("UPDATEBALANCE"+[TRANSACTIONS:29]Account_Code:3)

If (([TRANSACTIONS:29]Tax_Amount:16#0) & (OK=1))
	If (Not:C34(([TRANSACTIONS:29]UK_EC:21="E") & (([TRANSACTIONS:29]IO:18="I") | ([TRANSACTIONS:29]IO:18="IS"))))  //omit posting the EC VAT theoretical figures
		If ((DB_GetLedgerCashvatACC#"") & ([TRANSACTIONS:29]IO:18="@S"))  //If S for Suspense Cash VAT then post to this account
			$_t_SemID:=DB_GetLedgerCashvatACC
			While (Semaphore:C143("UPDATEBALANCE"+$_t_SemID))
				DelayTicks(2)
			End while 
			$_t_AccountCode:=DB_GetLedgerCashvatACC
			//QUERY([ACC BALANCES];[ACC BALANCES]Account Code=◊VATCS;*)
			$_t_UniqueID:=ACC_Buildunique(DB_GetLedgerCashvatACC; [TRANSACTIONS:29]Analysis_Code:2; [TRANSACTIONS:29]Period_Code:12; [TRANSACTIONS:29]Layer_Code:23; [TRANSACTIONS:29]Currency_Code:22)
			
		Else 
			$_t_SemID:=DB_GetLedgerVatInputACC
			While (Semaphore:C143("UPDATEBALANCE"+$_t_SemID))
				DelayTicks(2)
			End while 
			$_t_UniqueID:=ACC_Buildunique(DB_GetLedgerVatInputACC; [TRANSACTIONS:29]Analysis_Code:2; [TRANSACTIONS:29]Period_Code:12; [TRANSACTIONS:29]Layer_Code:23; [TRANSACTIONS:29]Currency_Code:22)
			$_t_AccountCode:=DB_GetLedgerVatInputACC
			//QUERY([ACC BALANCES];[ACC BALANCES]Account Code=◊VATI;*)
		End if 
		QUERY:C277([ACCOUNT_BALANCES:34]; [ACCOUNT_BALANCES:34]Unique_StringIdent:8=$_t_UniqueID)
		If (Records in selection:C76([ACCOUNT_BALANCES:34])=0)
			QUERY:C277([ACCOUNT_BALANCES:34]; [ACCOUNT_BALANCES:34]Account_Code:2=$_t_AccountCode; *)
			QUERY:C277([ACCOUNT_BALANCES:34];  & ; [ACCOUNT_BALANCES:34]Analysis_Code:1=[TRANSACTIONS:29]Analysis_Code:2; *)
			QUERY:C277([ACCOUNT_BALANCES:34];  & ; [ACCOUNT_BALANCES:34]Period_Code:4=[TRANSACTIONS:29]Period_Code:12; *)
			QUERY:C277([ACCOUNT_BALANCES:34];  & ; [ACCOUNT_BALANCES:34]Currency_Code:6=[TRANSACTIONS:29]Currency_Code:22; *)
			QUERY:C277([ACCOUNT_BALANCES:34];  & ; [ACCOUNT_BALANCES:34]Layer_Code:5=[TRANSACTIONS:29]Layer_Code:23)
		End if 
		If (Records in selection:C76([ACCOUNT_BALANCES:34])=0)
			$_bo_noPost:=False:C215
			CREATE RECORD:C68([ACCOUNT_BALANCES:34])
			[ACCOUNT_BALANCES:34]Unique_StringIdent:8:=$_t_UniqueID
			If ((DB_GetLedgerCashvatACC#"") & ([TRANSACTIONS:29]IO:18="@S"))
				[ACCOUNT_BALANCES:34]Account_Code:2:=DB_GetLedgerCashvatACC
			Else 
				[ACCOUNT_BALANCES:34]Account_Code:2:=DB_GetLedgerVatInputACC
			End if 
			[ACCOUNT_BALANCES:34]Layer_Code:5:=[TRANSACTIONS:29]Layer_Code:23
			[ACCOUNT_BALANCES:34]Analysis_Code:1:=[TRANSACTIONS:29]Analysis_Code:2
			[ACCOUNT_BALANCES:34]Period_Code:4:=[TRANSACTIONS:29]Period_Code:12
			[ACCOUNT_BALANCES:34]Balance:3:=[TRANSACTIONS:29]Tax_Amount:16
			[ACCOUNT_BALANCES:34]Currency_Code:6:=[TRANSACTIONS:29]Currency_Code:22
			If ([ACCOUNT_BALANCES:34]x_ID:7=0)
				[ACCOUNT_BALANCES:34]x_ID:7:=AA_GetNextID(->[ACCOUNT_BALANCES:34]x_ID:7)
			End if 
			DB_SaveRecord(->[ACCOUNT_BALANCES:34])
			AA_CheckFileUnlocked(->[ACCOUNT_BALANCES:34]x_ID:7)
		Else 
			$_bo_noPost:=False:C215
			If (Application type:C494#4D Server:K5:6)
				$_bo_NotLocked:=Check_Locked(->[ACCOUNT_BALANCES:34]; 2)
				If ($_bo_NotLocked)
					$_r_AccBalance:=[ACCOUNT_BALANCES:34]Balance:3
					$_r_ChangeTotal:=[TRANSACTIONS:29]Tax_Amount:16
					[ACCOUNT_BALANCES:34]Balance:3:=Round:C94(([ACCOUNT_BALANCES:34]Balance:3+[TRANSACTIONS:29]Tax_Amount:16); 2)
					DB_SaveRecord(->[ACCOUNT_BALANCES:34])
					AA_CheckFileUnlocked(->[ACCOUNT_BALANCES:34]x_ID:7)
					$_r_AccBalance2:=[ACCOUNT_BALANCES:34]Balance:3
					$_l_Process:=Execute on server:C373("ACC_RecordBalance"; 180000; "RecordAccountBalanceChange"; [ACCOUNT_BALANCES:34]Account_Code:2; "Tax Amount"; $_r_ChangeTotal; $_r_AccBalance; $_r_AccBalance2; "Client "+<>PER_t_CurrentUserName+"Post_Balances(2)")
					
					
					UNLOAD RECORD:C212([ACCOUNT_BALANCES:34])
				Else 
					Gen_Alert("A Balance could not be saved.  The posting will be cancelled."; "Cancel")
					OK:=0
				End if 
			Else 
				Repeat 
					$_bo_NotLocked:=Check_Locked(->[ACCOUNT_BALANCES:34]; 2)
				Until ($_bo_NotLocked)
				[ACCOUNT_BALANCES:34]Balance:3:=Round:C94(([ACCOUNT_BALANCES:34]Balance:3+[TRANSACTIONS:29]Tax_Amount:16); 2)
				DB_SaveRecord(->[ACCOUNT_BALANCES:34])
				AA_CheckFileUnlocked(->[ACCOUNT_BALANCES:34]x_ID:7)
				$_r_AccBalance2:=[ACCOUNT_BALANCES:34]Balance:3
				$_l_Process:=New process:C317("ACC_RecordBalance"; 180000; "RecordAccountBalanceChange"; [ACCOUNT_BALANCES:34]Account_Code:2; "Tax Amount"; $_r_ChangeTotal; $_r_AccBalance; $_r_AccBalance2; "Server Post_Balances(2)")
				
				UNLOAD RECORD:C212([ACCOUNT_BALANCES:34])
				
			End if 
		End if 
		CLEAR SEMAPHORE:C144("UPDATEBALANCE"+$_t_SemID)
		If ($_bo_noPost=False:C215)
			If ((DB_GetLedgerCashvatACC#"") & ([TRANSACTIONS:29]IO:18="@C"))  //If C for Cash VAT Receipt/Payment then do this too
				While (Semaphore:C143("UPDATEBALANCE"+DB_GetLedgerCashvatACC))
					DelayTicks(2)
				End while 
				$_t_UniqueID:=ACC_Buildunique(DB_GetLedgerCashvatACC; [TRANSACTIONS:29]Analysis_Code:2; [TRANSACTIONS:29]Period_Code:12; [TRANSACTIONS:29]Layer_Code:23; [TRANSACTIONS:29]Currency_Code:22)
				QUERY:C277([ACCOUNT_BALANCES:34]; [ACCOUNT_BALANCES:34]Unique_StringIdent:8=$_t_UniqueID)
				If (Records in selection:C76([ACCOUNT_BALANCES:34])=0)
					QUERY:C277([ACCOUNT_BALANCES:34]; [ACCOUNT_BALANCES:34]Account_Code:2=DB_GetLedgerCashvatACC; *)
					QUERY:C277([ACCOUNT_BALANCES:34];  & ; [ACCOUNT_BALANCES:34]Analysis_Code:1=[TRANSACTIONS:29]Analysis_Code:2; *)
					QUERY:C277([ACCOUNT_BALANCES:34];  & ; [ACCOUNT_BALANCES:34]Period_Code:4=[TRANSACTIONS:29]Period_Code:12; *)
					QUERY:C277([ACCOUNT_BALANCES:34];  & ; [ACCOUNT_BALANCES:34]Currency_Code:6=[TRANSACTIONS:29]Currency_Code:22; *)
					QUERY:C277([ACCOUNT_BALANCES:34];  & ; [ACCOUNT_BALANCES:34]Layer_Code:5=[TRANSACTIONS:29]Layer_Code:23)
				End if 
				If (Records in selection:C76([ACCOUNT_BALANCES:34])=0)
					$_bo_noPost:=False:C215
					CREATE RECORD:C68([ACCOUNT_BALANCES:34])
					[ACCOUNT_BALANCES:34]Unique_StringIdent:8:=$_t_UniqueID
					[ACCOUNT_BALANCES:34]Account_Code:2:=DB_GetLedgerCashvatACC
					[ACCOUNT_BALANCES:34]Layer_Code:5:=[TRANSACTIONS:29]Layer_Code:23
					[ACCOUNT_BALANCES:34]Analysis_Code:1:=[TRANSACTIONS:29]Analysis_Code:2
					[ACCOUNT_BALANCES:34]Period_Code:4:=[TRANSACTIONS:29]Period_Code:12
					[ACCOUNT_BALANCES:34]Balance:3:=[TRANSACTIONS:29]Tax_Amount:16
					[ACCOUNT_BALANCES:34]Currency_Code:6:=[TRANSACTIONS:29]Currency_Code:22
					[ACCOUNT_BALANCES:34]x_ID:7:=AA_GetNextID(->[ACCOUNT_BALANCES:34]x_ID:7)
					
					DB_SaveRecord(->[ACCOUNT_BALANCES:34])
					AA_CheckFileUnlocked(->[ACCOUNT_BALANCES:34]x_ID:7)
				Else 
					If (Application type:C494#4D Server:K5:6)
						$_bo_NotLocked:=Check_Locked(->[ACCOUNT_BALANCES:34]; 2)
						If ($_bo_NotLocked)
							$_bo_noPost:=False:C215
							$_r_AccBalance:=[ACCOUNT_BALANCES:34]Balance:3
							$_r_ChangeTotal:=[TRANSACTIONS:29]Tax_Amount:16
							[ACCOUNT_BALANCES:34]Balance:3:=Round:C94(([ACCOUNT_BALANCES:34]Balance:3-[TRANSACTIONS:29]Tax_Amount:16); 2)
							DB_SaveRecord(->[ACCOUNT_BALANCES:34])
							AA_CheckFileUnlocked(->[ACCOUNT_BALANCES:34]x_ID:7)
							$_r_AccBalance2:=[ACCOUNT_BALANCES:34]Balance:3
							$_l_Process:=Execute on server:C373("ACC_RecordBalance"; 180000; "RecordAccountBalanceChange"; [ACCOUNT_BALANCES:34]Account_Code:2; "Tax Amount"; $_r_ChangeTotal; $_r_AccBalance; $_r_AccBalance2; "Client  "+<>PER_t_CurrentUserName+"Post_Balances(3)")
							
							UNLOAD RECORD:C212([ACCOUNT_BALANCES:34])
						Else 
							Gen_Alert("A Balance could not be saved.  The posting will be cancelled."; "Cancel")
							OK:=0
							$_bo_noPost:=True:C214
						End if 
					Else 
						Repeat 
							$_bo_NotLocked:=Check_Locked(->[ACCOUNT_BALANCES:34]; 2)
						Until ($_bo_NotLocked)
						$_bo_noPost:=False:C215
						$_r_AccBalance:=[ACCOUNT_BALANCES:34]Balance:3
						$_r_ChangeTotal:=[TRANSACTIONS:29]Tax_Amount:16
						[ACCOUNT_BALANCES:34]Balance:3:=Round:C94(([ACCOUNT_BALANCES:34]Balance:3-[TRANSACTIONS:29]Tax_Amount:16); 2)
						DB_SaveRecord(->[ACCOUNT_BALANCES:34])
						AA_CheckFileUnlocked(->[ACCOUNT_BALANCES:34]x_ID:7)
						$_r_AccBalance2:=[ACCOUNT_BALANCES:34]Balance:3
						$_l_Process:=New process:C317("ACC_RecordBalance"; 180000; "RecordAccountBalanceChange"; [ACCOUNT_BALANCES:34]Account_Code:2; "Tax Amount"; $_r_ChangeTotal; $_r_AccBalance; $_r_AccBalance2; "Server Post_Balances(3)")
						
						
						UNLOAD RECORD:C212([ACCOUNT_BALANCES:34])
						
					End if 
				End if 
				CLEAR SEMAPHORE:C144("UPDATEBALANCE"+DB_GetLedgerCashvatACC)
				
			End if 
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("Post_Balances"; $_t_oldMethodName)