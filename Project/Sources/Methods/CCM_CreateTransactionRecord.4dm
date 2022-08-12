//%attributes = {}
If (False:C215)
	//Project Method Name:      CCM_CreateTransactionRecord
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/10/2013 12:28
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_BlobSize; $_l_offset; $_l_OrderID; $0; $2; $7; $8)
	C_POINTER:C301($3; $4)
	C_TEXT:C284($_l_DepositID; $_l_TransactionID; $_t_InvoiceID; $_t_oldMethodName; $_t_oldMethodName2; $_t_ReceiptID; $_t_ResponseText; $1; $10; $11; $12)
	C_TEXT:C284($5; $6; $9)
End if 

//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("CCM_CreateTransactionRecord")

//This method create s a record of the tran



If (Count parameters:C259>=7)
	If (Count parameters:C259>=8)
		$_l_OrderID:=$8
		If (Count parameters:C259>=9)
			$_t_InvoiceID:=$9
			If (Count parameters:C259>=10)
				$_l_DepositID:=$10
				If (Count parameters:C259>=11)
					$_t_ReceiptID:=$11
					If (Count parameters:C259>=12)
						$_l_TransactionID:=$12
					End if 
				End if 
			End if 
		End if 
		
	End if 
	
	CREATE RECORD:C68([CCM_PSPTransaction:136])
	[CCM_PSPTransaction:136]PSPUSED:4:=$1
	[CCM_PSPTransaction:136]XPSPID:14:=$2
	$_l_BlobSize:=BLOB size:C605($3->)
	$_l_offset:=0
	COPY BLOB:C558($3->; [CCM_PSPTransaction:136]SENTDATA:6; $_l_offset; $_l_offset; $_l_BlobSize)
	$_l_BlobSize:=BLOB size:C605($4->)
	$_l_offset:=0
	COPY BLOB:C558($4->; [CCM_PSPTransaction:136]RESPONSEDATA:7; $_l_offset; $_l_offset; $_l_BlobSize)
	$_t_ResponseText:=BLOB to text:C555([CCM_PSPTransaction:136]RESPONSEDATA:7; 3)
	[CCM_PSPTransaction:136]RESPONSE_STRING:5:=$5
	[CCM_PSPTransaction:136]TRANSACTION_DATE:2:=Current date:C33(*)
	[CCM_PSPTransaction:136]TRANSACTION_TYPE:3:=$6
	[CCM_PSPTransaction:136]x_CCID:8:=$7
	QUERY:C277([xCreditCardDetails:132]; [xCreditCardDetails:132]x_ID:1=$7)
	[CCM_PSPTransaction:136]xContactID:9:=[xCreditCardDetails:132]RelatedRecordIdent:13
	[CCM_PSPTransaction:136]xDepositCode:12:=$_l_DepositID
	[CCM_PSPTransaction:136]xInvoiceID:11:=$_t_InvoiceID
	[CCM_PSPTransaction:136]xOrderID:10:=$_l_OrderID
	[CCM_PSPTransaction:136]xReceiptID:13:=$_t_ReceiptID
	[CCM_PSPTransaction:136]xPSPTransID:16:=$_l_TransactionID
	[CCM_PSPTransaction:136]xCreatedTime:17:=Current time:C178(*)
	[CCM_PSPTransaction:136]x_ID:1:=AA_GetNextID(->[CCM_PSPTransaction:136]x_ID:1)
	DB_SaveRecord(->[CCM_PSPTransaction:136])
	$0:=[CCM_PSPTransaction:136]x_ID:1
	$_t_oldMethodName2:=ERR_MethodTracker("PSP Record ID="+String:C10($0))
	
	
	UNLOAD RECORD:C212([CCM_PSPTransaction:136])
	READ ONLY:C145([CCM_PSPTransaction:136])
End if 
ERR_MethodTrackerReturn("CCM_CreateTransactionRecord"; $_t_oldMethodName)