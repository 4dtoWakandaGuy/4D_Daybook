//%attributes = {}
If (False:C215)
	//Project Method Name:      Post_BalArr
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/04/2010 17:28
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY REAL(TRANS_ar_PostEuroAmount;0)
	//ARRAY REAL(TRNS_ar_Postamount;0)
	//ARRAY TEXT(SRSerial;0)
	//ARRAY TEXT(TRNS_at_AccountIdentity;0)
	C_LONGINT:C283($_l_UniqueIDRow)
	C_TEXT:C284($_t_oldMethodName; $_t_UniqueID)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Post_BalArr")

$_t_UniqueID:=ACC_Buildunique([TRANSACTIONS:29]Account_Code:3; [TRANSACTIONS:29]Analysis_Code:2; [TRANSACTIONS:29]Period_Code:12; [TRANSACTIONS:29]Layer_Code:23; [TRANSACTIONS:29]Currency_Code:22)

If (Size of array:C274(TRNS_at_AccountIdentity)=0)
	$_l_UniqueIDRow:=0
Else 
	$_l_UniqueIDRow:=Find in array:C230(TRNS_at_AccountIdentity; $_t_UniqueID)
End if 
If ($_l_UniqueIDRow<1)
	APPEND TO ARRAY:C911(TRNS_at_AccountIdentity; $_t_UniqueID)
	APPEND TO ARRAY:C911(TRNS_ar_Postamount; 0)
	APPEND TO ARRAY:C911(TRANS_ar_PostEuroAmount; 0)
	//ARRAY REAL(SREuroAmt;Size of array(SRSerial))
	//INSERT IN ARRAY(SRSerial;9999;1)
	//INSERT IN ARRAY(SRAmount;9999;1)
	//INSERT IN ARRAY(SREuroAmt;9999;1)
	$_l_UniqueIDRow:=Size of array:C274(TRNS_at_AccountIdentity)
	If ((DB_GetLedgerCashvatACC#"") & ([TRANSACTIONS:29]IO:18="@C"))  //If Cash VAT Cash then post the total not the amt
		TRNS_ar_Postamount{$_l_UniqueIDRow}:=[TRANSACTIONS:29]Total:17
	Else 
		TRNS_ar_Postamount{$_l_UniqueIDRow}:=[TRANSACTIONS:29]Amount:6
	End if 
Else 
	If ((DB_GetLedgerCashvatACC#"") & ([TRANSACTIONS:29]IO:18="@C"))
		TRNS_ar_Postamount{$_l_UniqueIDRow}:=TRNS_ar_Postamount{$_l_UniqueIDRow}+[TRANSACTIONS:29]Total:17
	Else 
		TRNS_ar_Postamount{$_l_UniqueIDRow}:=TRNS_ar_Postamount{$_l_UniqueIDRow}+[TRANSACTIONS:29]Amount:6
	End if 
End if 
If (Size of array:C274(TRANS_ar_PostEuroAmount)<$_l_UniqueIDRow)  //NG January 2005 Lucy got range check error
	ARRAY REAL:C219(TRANS_ar_PostEuroAmount; $_l_UniqueIDRow)
End if 
If (Size of array:C274(TRNS_ar_Postamount)<$_l_UniqueIDRow)
	ARRAY REAL:C219(TRNS_ar_Postamount; $_l_UniqueIDRow)
End if 
TRANS_ar_PostEuroAmount{$_l_UniqueIDRow}:=WS_EuroConvertor(TRANS_ar_PostEuroAmount{$_l_UniqueIDRow}; [TRANSACTIONS:29]Currency_Code:22)

If ([TRANSACTIONS:29]Tax_Amount:16#0)
	If (Not:C34(([TRANSACTIONS:29]UK_EC:21="E") & (([TRANSACTIONS:29]IO:18="I") | ([TRANSACTIONS:29]IO:18="IS"))))  //omit posting the EC VAT theoretical figures
		If ((DB_GetLedgerCashvatACC#"") & ([TRANSACTIONS:29]IO:18="@S"))  //If S for Suspense Cash VAT then post to this account
			$_t_UniqueID:=ACC_Buildunique(DB_GetLedgerCashvatACC; [TRANSACTIONS:29]Analysis_Code:2; [TRANSACTIONS:29]Period_Code:12; [TRANSACTIONS:29]Layer_Code:23; [TRANSACTIONS:29]Currency_Code:22)
			
		Else 
			$_t_UniqueID:=ACC_Buildunique(DB_GetLedgerVatInputACC; [TRANSACTIONS:29]Analysis_Code:2; [TRANSACTIONS:29]Period_Code:12; [TRANSACTIONS:29]Layer_Code:23; [TRANSACTIONS:29]Currency_Code:22)
			
		End if 
		If (Size of array:C274(TRNS_at_AccountIdentity)=0)
			$_l_UniqueIDRow:=0
		Else 
			$_l_UniqueIDRow:=Find in array:C230(TRNS_at_AccountIdentity; $_t_UniqueID)
		End if 
		If ($_l_UniqueIDRow<1)
			APPEND TO ARRAY:C911(TRNS_at_AccountIdentity; $_t_UniqueID)
			APPEND TO ARRAY:C911(TRNS_ar_Postamount; [TRANSACTIONS:29]Tax_Amount:16)
			APPEND TO ARRAY:C911(TRANS_ar_PostEuroAmount; 0)
			$_l_UniqueIDRow:=Size of array:C274(TRNS_at_AccountIdentity)
		Else 
			TRNS_ar_Postamount{$_l_UniqueIDRow}:=TRNS_ar_Postamount{$_l_UniqueIDRow}+[TRANSACTIONS:29]Tax_Amount:16
		End if 
		If ((DB_GetLedgerCashvatACC#"") & ([TRANSACTIONS:29]IO:18="@C"))  //If C for Cash VAT Receipt/Payment then do this too
			$_t_UniqueID:=ACC_Buildunique(DB_GetLedgerCashvatACC; [TRANSACTIONS:29]Analysis_Code:2; [TRANSACTIONS:29]Period_Code:12; [TRANSACTIONS:29]Layer_Code:23; [TRANSACTIONS:29]Currency_Code:22)
			
			If (Size of array:C274(TRNS_at_AccountIdentity)=0)
				$_l_UniqueIDRow:=0
			Else 
				$_l_UniqueIDRow:=Find in array:C230(TRNS_at_AccountIdentity; $_t_UniqueID)
			End if 
			If ($_l_UniqueIDRow<1)
				APPEND TO ARRAY:C911(TRNS_at_AccountIdentity; $_t_UniqueID)
				APPEND TO ARRAY:C911(TRNS_ar_Postamount; Gen_Round((0-[TRANSACTIONS:29]Tax_Amount:16); 2; 2))
				APPEND TO ARRAY:C911(TRANS_ar_PostEuroAmount; 0)
				//INSERT IN ARRAY(SRSerial;9999;1)
				//INSERT IN ARRAY(SRAmount;9999;1)
				$_l_UniqueIDRow:=Size of array:C274(SRSerial)
				
				//SRAmount{$_l_UniqueIDRow}:=Gen_Round ((0-[TRANSACTIONS]Tax Amount);2;2)
			Else 
				TRNS_ar_Postamount{$_l_UniqueIDRow}:=Gen_Round((TRNS_ar_Postamount{$_l_UniqueIDRow}-[TRANSACTIONS:29]Tax_Amount:16); 2; 2)
			End if 
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("Post_BalArr"; $_t_oldMethodName)
