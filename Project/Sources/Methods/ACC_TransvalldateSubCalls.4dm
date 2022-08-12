//%attributes = {}
If (False:C215)
	//Project Method Name:      ACC_TransvalldateSubCalls
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/11/2012 13:40
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(ACC_al_NoTransaction;0)
	//ARRAY LONGINT(ACC_al_TransAwaitsBalance;0)
	//ARRAY LONGINT(ACC_al_TransAwaitsBalanceDebit;0)
	//ARRAY LONGINT(ACC_al_TransPairIDs;0)
	//ARRAY LONGINT(ACC_al_TransPairIDsDEB;0)
	//ARRAY REAL(ACC_ar_TransCreditAwaiting;0)
	//ARRAY REAL(ACC_ar_TransCreditTotalAwaiting;0)
	//ARRAY REAL(ACC_ar_TransCreditVatAwaiting;0)
	//ARRAY REAL(ACC_ar_TransDebitAwaiting;0)
	//ARRAY REAL(ACC_ar_TransDebitTotalAwaiting;0)
	//ARRAY REAL(ACC_ar_TransDebitVatAwaiting;0)
	C_LONGINT:C283($1; $2; DS_l_BATCHITEMRef)
	C_REAL:C285($7; $8)
	C_TEXT:C284($_t_oldMethodName; $3; $4; $5; $6; ACC_t_CreditIO; ACC_t_DebitIO)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("ACC_TransvalldateSubCalls")
Case of 
	: (Count parameters:C259=0)
		ARRAY LONGINT:C221(ACC_al_TransPairIDsDEB; 0)
		ARRAY LONGINT:C221(ACC_al_TransPairIDs; 0)
		ARRAY LONGINT:C221(ACC_al_TransAwaitsBalance; 0)
		ARRAY REAL:C219(ACC_ar_TransCreditAwaiting; 0)
		ARRAY REAL:C219(ACC_ar_TransCreditVatAwaiting; 0)
		ARRAY REAL:C219(ACC_ar_TransCreditTotalAwaiting; 0)
		ARRAY LONGINT:C221(ACC_al_TransAwaitsBalanceDebit; 0)
		ARRAY REAL:C219(ACC_ar_TransDebitAwaiting; 0)
		ARRAY REAL:C219(ACC_ar_TransDebitVatAwaiting; 0)
		ARRAY REAL:C219(ACC_ar_TransDebitTotalAwaiting; 0)
		
		ARRAY LONGINT:C221(ACC_al_NoTransaction; 0)
	: (Count parameters:C259>=1)
		Case of 
			: ($1=-1)
				
			: ($1=1)
				QUERY:C277([TRANSACTIONS:29]; [TRANSACTIONS:29]Batch_Number:7=$2; *)
				QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Account_Code:3=$3; *)
				QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Analysis_Code:2=$4; *)
				QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Layer_Code:23=$5; *)
				QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Currency_Code:22=$6; *)
				QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Amount:6=$7; *)
				QUERY:C277([TRANSACTIONS:29];  & ; [TRANSACTIONS:29]Tax_Amount:16=$8)
			: ($1=2)
				INSERT IN ARRAY:C227(ACC_al_TransPairIDs; Size of array:C274(ACC_al_TransAwaitsBalance)+1; 1)
				INSERT IN ARRAY:C227(ACC_al_TransAwaitsBalance; Size of array:C274(ACC_al_TransAwaitsBalance)+1; 1)
				INSERT IN ARRAY:C227(ACC_ar_TransCreditAwaiting; Size of array:C274(ACC_ar_TransCreditAwaiting)+1; 1)
				INSERT IN ARRAY:C227(ACC_ar_TransCreditVatAwaiting; Size of array:C274(ACC_ar_TransCreditVatAwaiting)+1; 1)
				INSERT IN ARRAY:C227(ACC_ar_TransCreditTotalAwaiting; Size of array:C274(ACC_ar_TransCreditTotalAwaiting)+1; 1)
			: ($1=3)
				INSERT IN ARRAY:C227(ACC_al_TransPairIDsDEB; Size of array:C274(ACC_al_TransAwaitsBalance)+1; 1)
				INSERT IN ARRAY:C227(ACC_al_TransAwaitsBalanceDebit; Size of array:C274(ACC_al_TransAwaitsBalanceDebit)+1; 1)
				INSERT IN ARRAY:C227(ACC_ar_TransDebitAwaiting; Size of array:C274(ACC_ar_TransDebitAwaiting)+1; 1)
				INSERT IN ARRAY:C227(ACC_ar_TransDebitVatAwaiting; Size of array:C274(ACC_ar_TransDebitVatAwaiting)+1; 1)
				INSERT IN ARRAY:C227(ACC_ar_TransDebitTotalAwaiting; Size of array:C274(ACC_ar_TransDebitTotalAwaiting)+1; 1)
		End case 
End case 
ERR_MethodTrackerReturn("ACC_TransvalldateSubCalls"; $_t_oldMethodName)
