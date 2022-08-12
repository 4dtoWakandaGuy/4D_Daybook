//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Jobs WIPPost
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
	//ARRAY REAL(SRAmount;0)
	//ARRAY REAL(SRPrice;0)
	//ARRAY TEXT(SRProdCode;0)
	//ARRAY TEXT(SRQtyT;0)
	C_DATE:C307($3)
	C_LONGINT:C283($_l_Index; $_l_SizeofArray; DS_l_BATCHITEMRef)
	C_REAL:C285(vTotal)
	C_TEXT:C284($_t_oldMethodName; $1; $2; $4)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Jobs WIPPost")

$_l_SizeofArray:=Size of array:C274(SRProdCode)
If ($_l_SizeofArray>0)
	If ([TRANSACTION_TYPES:31]Transaction_Type_Code:1#$1)
		QUERY:C277([TRANSACTION_TYPES:31]; [TRANSACTION_TYPES:31]Transaction_Type_Code:1=$1)
	End if 
	If (Records in selection:C76([TRANSACTION_TYPES:31])>0)
		For ($_l_Index; 1; $_l_SizeofArray)
			If (SRAmount{$_l_Index}#0)
				QUERY:C277([JOBS:26]; [JOBS:26]Job_Code:1=SRProdCode{$_l_Index})
				If (Records in selection:C76([JOBS:26])>0)
					CREATE RECORD:C68([TRANSACTION_BATCH_ITEMS:155])
					[TRANSACTION_BATCH_ITEMS:155]Transaction_Batch_Code:31:=[TRANSACTION_BATCHES:30]Batch_Number:10
					[TRANSACTION_BATCH_ITEMS:155]ID:30:=AA_GetNextID(->[TRANSACTION_BATCH_ITEMS:155]ID:30)
					
					[TRANSACTION_BATCH_ITEMS:155]Transaction_Type_Code:1:=[TRANSACTION_TYPES:31]Transaction_Type_Code:1
					[TRANSACTION_BATCH_ITEMS:155]Description:10:=[TRANSACTION_TYPES:31]Transaction_Type_Name:2
					[TRANSACTION_BATCH_ITEMS:155]Debit_Account:3:=[TRANSACTION_TYPES:31]Debit_Account:4
					[TRANSACTION_BATCH_ITEMS:155]Credit_Account:12:=[TRANSACTION_TYPES:31]Credit_Account:5
					[TRANSACTION_BATCH_ITEMS:155]Analysis_Code:2:=[JOBS:26]Analysis_Code:24
					If ([TRANSACTION_BATCH_ITEMS:155]Analysis_Code:2="")
						[TRANSACTION_BATCH_ITEMS:155]Analysis_Code:2:=[TRANSACTION_TYPES:31]Analysis_Code:7
					End if 
					TransB_DC
					[TRANSACTION_BATCH_ITEMS:155]Job_Code:23:=[JOBS:26]Job_Code:1
					[TRANSACTION_BATCH_ITEMS:155]Company_Code:13:=[JOBS:26]Company_Code:3
					[TRANSACTION_BATCH_ITEMS:155]Transaction_Date:5:=$3
					[TRANSACTION_BATCH_ITEMS:155]Period_Code:11:=$4
					[TRANSACTION_BATCH_ITEMS:155]Tax_Code:7:=[TRANSACTION_TYPES:31]Tax_Code:6
					RELATE ONE:C42([TRANSACTION_BATCH_ITEMS:155]Tax_Code:7)
					[TRANSACTION_BATCH_ITEMS:155]Amount:6:=Round:C94((SRAmount{$_l_Index}); 2)
					[TRANSACTION_BATCH_ITEMS:155]Tax_Amount:8:=0
					[TRANSACTION_BATCH_ITEMS:155]Total:9:=Round:C94((SRAmount{$_l_Index}); 2)
					[TRANSACTION_BATCH_ITEMS:155]UK_EC:18:="U"
					[TRANSACTION_BATCH_ITEMS:155]Currency_Code:19:=[JOBS:26]Currency_Code:25
					[TRANSACTION_BATCH_ITEMS:155]Layer_Code:20:=[JOBS:26]Layer_Code:26
					If ([TRANSACTION_BATCH_ITEMS:155]BatchItemID:25=0)
						[TRANSACTION_BATCH_ITEMS:155]BatchItemID:25:=AA_GetNextIDinMethod(->DS_l_BATCHITEMRef)
					End if 
					DB_SaveRecord(->[TRANSACTION_BATCH_ITEMS:155])
					
					vTotal:=Round:C94((vTotal+SRAmount{$_l_Index}); 2)
				End if 
			End if 
		End for 
	End if 
End if 

$_l_SizeofArray:=Size of array:C274(SRQtyT)
If ($_l_SizeofArray>0)
	If ([TRANSACTION_TYPES:31]Transaction_Type_Code:1#$2)
		QUERY:C277([TRANSACTION_TYPES:31]; [TRANSACTION_TYPES:31]Transaction_Type_Code:1=$2)
	End if 
	If (Records in selection:C76([TRANSACTION_TYPES:31])>0)
		For ($_l_Index; 1; $_l_SizeofArray)
			If (SRPrice{$_l_Index}#0)
				QUERY:C277([JOBS:26]; [JOBS:26]Job_Code:1=SRQtyT{$_l_Index})
				If (Records in selection:C76([JOBS:26])>0)
					CREATE RECORD:C68([TRANSACTION_BATCH_ITEMS:155])
					[TRANSACTION_BATCH_ITEMS:155]Transaction_Batch_Code:31:=[TRANSACTION_BATCHES:30]Batch_Number:10
					[TRANSACTION_BATCH_ITEMS:155]ID:30:=AA_GetNextID(->[TRANSACTION_BATCH_ITEMS:155]ID:30)
					
					[TRANSACTION_BATCH_ITEMS:155]Transaction_Type_Code:1:=[TRANSACTION_TYPES:31]Transaction_Type_Code:1
					[TRANSACTION_BATCH_ITEMS:155]Description:10:=[TRANSACTION_TYPES:31]Transaction_Type_Name:2
					[TRANSACTION_BATCH_ITEMS:155]Debit_Account:3:=[TRANSACTION_TYPES:31]Debit_Account:4
					[TRANSACTION_BATCH_ITEMS:155]Credit_Account:12:=[TRANSACTION_TYPES:31]Credit_Account:5
					[TRANSACTION_BATCH_ITEMS:155]Analysis_Code:2:=[JOBS:26]Analysis_Code:24
					If ([TRANSACTION_BATCH_ITEMS:155]Analysis_Code:2="")
						[TRANSACTION_BATCH_ITEMS:155]Analysis_Code:2:=[TRANSACTION_TYPES:31]Analysis_Code:7
					End if 
					TransB_DC
					[TRANSACTION_BATCH_ITEMS:155]Job_Code:23:=[JOBS:26]Job_Code:1
					[TRANSACTION_BATCH_ITEMS:155]Company_Code:13:=[JOBS:26]Company_Code:3
					[TRANSACTION_BATCH_ITEMS:155]Transaction_Date:5:=$3
					[TRANSACTION_BATCH_ITEMS:155]Period_Code:11:=$4
					[TRANSACTION_BATCH_ITEMS:155]Tax_Code:7:=[TRANSACTION_TYPES:31]Tax_Code:6
					RELATE ONE:C42([TRANSACTION_BATCH_ITEMS:155]Tax_Code:7)
					[TRANSACTION_BATCH_ITEMS:155]Amount:6:=Round:C94((SRPrice{$_l_Index}); 2)
					[TRANSACTION_BATCH_ITEMS:155]Tax_Amount:8:=0
					[TRANSACTION_BATCH_ITEMS:155]Total:9:=Round:C94((SRPrice{$_l_Index}); 2)
					[TRANSACTION_BATCH_ITEMS:155]UK_EC:18:="U"
					[TRANSACTION_BATCH_ITEMS:155]Currency_Code:19:=[JOBS:26]Currency_Code:25
					[TRANSACTION_BATCH_ITEMS:155]Layer_Code:20:=[JOBS:26]Layer_Code:26
					If ([TRANSACTION_BATCH_ITEMS:155]BatchItemID:25=0)
						[TRANSACTION_BATCH_ITEMS:155]BatchItemID:25:=AA_GetNextIDinMethod(->DS_l_BATCHITEMRef)
					End if 
					DB_SaveRecord(->[TRANSACTION_BATCH_ITEMS:155])
					
					vTotal:=Round:C94((vTotal+SRPrice{$_l_Index}); 2)
				End if 
			End if 
		End for 
	End if 
End if 
ERR_MethodTrackerReturn("Jobs WIPPost"; $_t_oldMethodName)