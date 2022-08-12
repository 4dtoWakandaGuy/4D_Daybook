//%attributes = {}
If (False:C215)
	//Project Method Name:      SI_AllocationDeleteDuplicates
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_Add)
	C_LONGINT:C283($_l_Index)
	C_REAL:C285($_r_Amount)
	C_TEXT:C284($_t_CreditNumber; $_t_DepositNumber; $_t_InvoiceNumber; $_t_oldMethodName; $_t_ReceiptNumber)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SI_AllocationDeleteDuplicates")
SI_CreditAllocationFix

QUERY:C277([XInvoiceAllocation:126]; [XInvoiceAllocation:126]xCreditNumber:3#""; *)
QUERY:C277([XInvoiceAllocation:126];  & ; [XInvoiceAllocation:126]xInvoiceNumber:2=""; *)
QUERY:C277([XInvoiceAllocation:126];  & ; [XInvoiceAllocation:126]xCrossInvoiceNumber:11=""; *)
QUERY:C277([XInvoiceAllocation:126];  & ; [XInvoiceAllocation:126]xCrossCreditNumber:12=""; *)
QUERY:C277([XInvoiceAllocation:126];  & ; [XInvoiceAllocation:126]xReceiptNumber:4=""; *)
QUERY:C277([XInvoiceAllocation:126];  & ; [XInvoiceAllocation:126]xDepositNumber:5=""; *)
QUERY:C277([XInvoiceAllocation:126];  & ; [XInvoiceAllocation:126]xNegativeDepositNumber:10="")
DELETE SELECTION:C66([XInvoiceAllocation:126])
QUERY:C277([XInvoiceAllocation:126]; [XInvoiceAllocation:126]xCreditNumber:3=""; *)
QUERY:C277([XInvoiceAllocation:126];  & ; [XInvoiceAllocation:126]xInvoiceNumber:2#""; *)
QUERY:C277([XInvoiceAllocation:126];  & ; [XInvoiceAllocation:126]xCrossInvoiceNumber:11=""; *)
QUERY:C277([XInvoiceAllocation:126];  & ; [XInvoiceAllocation:126]xCrossCreditNumber:12=""; *)
QUERY:C277([XInvoiceAllocation:126];  & ; [XInvoiceAllocation:126]xReceiptNumber:4=""; *)
QUERY:C277([XInvoiceAllocation:126];  & ; [XInvoiceAllocation:126]xDepositNumber:5=""; *)
QUERY:C277([XInvoiceAllocation:126];  & ; [XInvoiceAllocation:126]xNegativeDepositNumber:10="")
DELETE SELECTION:C66([XInvoiceAllocation:126])
QUERY:C277([XInvoiceAllocation:126]; [XInvoiceAllocation:126]xCreditNumber:3=""; *)
QUERY:C277([XInvoiceAllocation:126];  & ; [XInvoiceAllocation:126]xInvoiceNumber:2=""; *)
QUERY:C277([XInvoiceAllocation:126];  & ; [XInvoiceAllocation:126]xCrossInvoiceNumber:11#""; *)
QUERY:C277([XInvoiceAllocation:126];  & ; [XInvoiceAllocation:126]xCrossCreditNumber:12=""; *)
QUERY:C277([XInvoiceAllocation:126];  & ; [XInvoiceAllocation:126]xReceiptNumber:4=""; *)
QUERY:C277([XInvoiceAllocation:126];  & ; [XInvoiceAllocation:126]xDepositNumber:5=""; *)
QUERY:C277([XInvoiceAllocation:126];  & ; [XInvoiceAllocation:126]xNegativeDepositNumber:10="")
DELETE SELECTION:C66([XInvoiceAllocation:126])
QUERY:C277([XInvoiceAllocation:126]; [XInvoiceAllocation:126]xCreditNumber:3=""; *)
QUERY:C277([XInvoiceAllocation:126];  & ; [XInvoiceAllocation:126]xInvoiceNumber:2=""; *)
QUERY:C277([XInvoiceAllocation:126];  & ; [XInvoiceAllocation:126]xCrossInvoiceNumber:11=""; *)
QUERY:C277([XInvoiceAllocation:126];  & ; [XInvoiceAllocation:126]xCrossCreditNumber:12#""; *)
QUERY:C277([XInvoiceAllocation:126];  & ; [XInvoiceAllocation:126]xReceiptNumber:4=""; *)
QUERY:C277([XInvoiceAllocation:126];  & ; [XInvoiceAllocation:126]xDepositNumber:5=""; *)
QUERY:C277([XInvoiceAllocation:126];  & ; [XInvoiceAllocation:126]xNegativeDepositNumber:10="")
DELETE SELECTION:C66([XInvoiceAllocation:126])
QUERY:C277([XInvoiceAllocation:126]; [XInvoiceAllocation:126]xCreditNumber:3=""; *)
QUERY:C277([XInvoiceAllocation:126];  & ; [XInvoiceAllocation:126]xInvoiceNumber:2=""; *)
QUERY:C277([XInvoiceAllocation:126];  & ; [XInvoiceAllocation:126]xCrossInvoiceNumber:11=""; *)
QUERY:C277([XInvoiceAllocation:126];  & ; [XInvoiceAllocation:126]xCrossCreditNumber:12=""; *)
QUERY:C277([XInvoiceAllocation:126];  & ; [XInvoiceAllocation:126]xReceiptNumber:4#""; *)
QUERY:C277([XInvoiceAllocation:126];  & ; [XInvoiceAllocation:126]xDepositNumber:5=""; *)
QUERY:C277([XInvoiceAllocation:126];  & ; [XInvoiceAllocation:126]xNegativeDepositNumber:10="")
DELETE SELECTION:C66([XInvoiceAllocation:126])
QUERY:C277([XInvoiceAllocation:126]; [XInvoiceAllocation:126]xCreditNumber:3=""; *)
QUERY:C277([XInvoiceAllocation:126];  & ; [XInvoiceAllocation:126]xInvoiceNumber:2=""; *)
QUERY:C277([XInvoiceAllocation:126];  & ; [XInvoiceAllocation:126]xCrossInvoiceNumber:11=""; *)
QUERY:C277([XInvoiceAllocation:126];  & ; [XInvoiceAllocation:126]xCrossCreditNumber:12=""; *)
QUERY:C277([XInvoiceAllocation:126];  & ; [XInvoiceAllocation:126]xReceiptNumber:4=""; *)
QUERY:C277([XInvoiceAllocation:126];  & ; [XInvoiceAllocation:126]xDepositNumber:5#""; *)
QUERY:C277([XInvoiceAllocation:126];  & ; [XInvoiceAllocation:126]xNegativeDepositNumber:10="")

DELETE SELECTION:C66([XInvoiceAllocation:126])
QUERY:C277([XInvoiceAllocation:126]; [XInvoiceAllocation:126]xCreditNumber:3=""; *)
QUERY:C277([XInvoiceAllocation:126];  & ; [XInvoiceAllocation:126]xInvoiceNumber:2=""; *)
QUERY:C277([XInvoiceAllocation:126];  & ; [XInvoiceAllocation:126]xCrossInvoiceNumber:11=""; *)
QUERY:C277([XInvoiceAllocation:126];  & ; [XInvoiceAllocation:126]xCrossCreditNumber:12=""; *)
QUERY:C277([XInvoiceAllocation:126];  & ; [XInvoiceAllocation:126]xReceiptNumber:4=""; *)
QUERY:C277([XInvoiceAllocation:126];  & ; [XInvoiceAllocation:126]xDepositNumber:5=""; *)
QUERY:C277([XInvoiceAllocation:126];  & ; [XInvoiceAllocation:126]xNegativeDepositNumber:10#"")
DELETE SELECTION:C66([XInvoiceAllocation:126])
If (True:C214)
	ALL RECORDS:C47([XInvoiceAllocation:126])
	CREATE EMPTY SET:C140([XInvoiceAllocation:126]; "UseThese")
	ORDER BY:C49([XInvoiceAllocation:126]; [XInvoiceAllocation:126]xAmount:7)
	$_r_Amount:=0
	$_t_InvoiceNumber:=""
	$_t_CreditNumber:=""
	$_t_ReceiptNumber:=""
	$_t_DepositNumber:=""
	For ($_l_Index; 1; Records in selection:C76([XInvoiceAllocation:126]))
		If ([XInvoiceAllocation:126]xAmount:7=$_r_Amount)
			PREVIOUS RECORD:C110([XInvoiceAllocation:126])
			ADD TO SET:C119([XInvoiceAllocation:126]; "UseThese")
			NEXT RECORD:C51([XInvoiceAllocation:126])
			Case of 
				: ([XInvoiceAllocation:126]xCreditNumber:3#"")
				: ([XInvoiceAllocation:126]xDepositNumber:5#"")
				: ([XInvoiceAllocation:126]xInvoiceNumber:2#"")
				: ([XInvoiceAllocation:126]xReceiptNumber:4#"")
			End case 
			ADD TO SET:C119([XInvoiceAllocation:126]; "UseThese")
			
		End if 
		$_t_InvoiceNumber:=""
		$_t_CreditNumber:=""
		$_t_ReceiptNumber:=""
		$_t_DepositNumber:=""
		$_r_Amount:=[XInvoiceAllocation:126]xAmount:7
		
		NEXT RECORD:C51([XInvoiceAllocation:126])
	End for 
	USE SET:C118("UseThese")
	CLEAR SET:C117("UseThese")
	
	ORDER BY:C49([XInvoiceAllocation:126]; [XInvoiceAllocation:126]xInvoiceNumber:2; [XInvoiceAllocation:126]xCreditNumber:3; [XInvoiceAllocation:126]xDepositNumber:5; [XInvoiceAllocation:126]xReceiptNumber:4)
	CREATE EMPTY SET:C140([XInvoiceAllocation:126]; "UseThese")
	ORDER BY:C49([XInvoiceAllocation:126]; [XInvoiceAllocation:126]xAmount:7)
	$_r_Amount:=0
	$_t_InvoiceNumber:=""
	$_t_CreditNumber:=""
	$_t_ReceiptNumber:=""
	$_t_DepositNumber:=""
	For ($_l_Index; 1; Records in selection:C76([XInvoiceAllocation:126]))
		
		
		If ([XInvoiceAllocation:126]xCreditNumber:3#"")
			If ([XInvoiceAllocation:126]xCreditNumber:3=$_t_InvoiceNumber) | ([XInvoiceAllocation:126]xCreditNumber:3=$_t_CreditNumber) | ([XInvoiceAllocation:126]xCreditNumber:3=$_t_ReceiptNumber) | ([XInvoiceAllocation:126]xCreditNumber:3=$_t_DepositNumber)
				$_bo_Add:=False:C215
				Case of 
					: (([XInvoiceAllocation:126]xDepositNumber:5=$_t_InvoiceNumber) & (""#$_t_InvoiceNumber)) | (([XInvoiceAllocation:126]xDepositNumber:5=$_t_ReceiptNumber) & (""#$_t_ReceiptNumber)) | (([XInvoiceAllocation:126]xDepositNumber:5=$_t_DepositNumber) & (""#$_t_DepositNumber))
						$_bo_Add:=True:C214
					: (([XInvoiceAllocation:126]xReceiptNumber:4=$_t_InvoiceNumber) & (""#$_t_InvoiceNumber)) | (([XInvoiceAllocation:126]xReceiptNumber:4=$_t_ReceiptNumber) & (""#$_t_ReceiptNumber)) | (([XInvoiceAllocation:126]xReceiptNumber:4=$_t_DepositNumber) & (""#$_t_DepositNumber))
						$_bo_Add:=True:C214
					: (([XInvoiceAllocation:126]xInvoiceNumber:2=$_t_InvoiceNumber) & (""#$_t_InvoiceNumber)) | (([XInvoiceAllocation:126]xInvoiceNumber:2=$_t_ReceiptNumber) & (""#$_t_ReceiptNumber)) | (([XInvoiceAllocation:126]xInvoiceNumber:2=$_t_DepositNumber) & (""#$_t_DepositNumber))
						$_bo_Add:=True:C214
						
				End case 
				If ($_bo_Add)
					PREVIOUS RECORD:C110([XInvoiceAllocation:126])
					ADD TO SET:C119([XInvoiceAllocation:126]; "UseThese")
					NEXT RECORD:C51([XInvoiceAllocation:126])
					ADD TO SET:C119([XInvoiceAllocation:126]; "UseThese")
				End if 
			End if 
		End if 
		If ([XInvoiceAllocation:126]xDepositNumber:5#"")
			If ([XInvoiceAllocation:126]xDepositNumber:5=$_t_InvoiceNumber) | ([XInvoiceAllocation:126]xDepositNumber:5=$_t_CreditNumber) | ([XInvoiceAllocation:126]xDepositNumber:5=$_t_ReceiptNumber) | ([XInvoiceAllocation:126]xDepositNumber:5=$_t_DepositNumber)
				$_bo_Add:=False:C215
				Case of 
					: (([XInvoiceAllocation:126]xCreditNumber:3=$_t_InvoiceNumber) & (""#$_t_InvoiceNumber)) | (([XInvoiceAllocation:126]xCreditNumber:3=$_t_ReceiptNumber) & (""#$_t_ReceiptNumber)) | (([XInvoiceAllocation:126]xCreditNumber:3=$_t_DepositNumber) & (""#$_t_DepositNumber))
						$_bo_Add:=True:C214
					: (([XInvoiceAllocation:126]xReceiptNumber:4=$_t_InvoiceNumber) & (""#$_t_InvoiceNumber)) | (([XInvoiceAllocation:126]xReceiptNumber:4=$_t_ReceiptNumber) & (""#$_t_ReceiptNumber)) | (([XInvoiceAllocation:126]xReceiptNumber:4=$_t_DepositNumber) & (""#$_t_DepositNumber))
						$_bo_Add:=True:C214
					: (([XInvoiceAllocation:126]xInvoiceNumber:2=$_t_InvoiceNumber) & (""#$_t_InvoiceNumber)) | (([XInvoiceAllocation:126]xInvoiceNumber:2=$_t_ReceiptNumber) & (""#$_t_ReceiptNumber)) | (([XInvoiceAllocation:126]xInvoiceNumber:2=$_t_DepositNumber) & (""#$_t_DepositNumber))
						$_bo_Add:=True:C214
						
				End case 
				
				If ($_bo_Add)
					PREVIOUS RECORD:C110([XInvoiceAllocation:126])
					ADD TO SET:C119([XInvoiceAllocation:126]; "UseThese")
					NEXT RECORD:C51([XInvoiceAllocation:126])
					ADD TO SET:C119([XInvoiceAllocation:126]; "UseThese")
				End if 
				
			End if 
		End if 
		
		If ([XInvoiceAllocation:126]xInvoiceNumber:2#"")
			If ([XInvoiceAllocation:126]xInvoiceNumber:2=$_t_InvoiceNumber) | ([XInvoiceAllocation:126]xInvoiceNumber:2=$_t_CreditNumber) | ([XInvoiceAllocation:126]xInvoiceNumber:2=$_t_ReceiptNumber) | ([XInvoiceAllocation:126]xInvoiceNumber:2=$_t_DepositNumber)
				$_bo_Add:=False:C215
				Case of 
					: (([XInvoiceAllocation:126]xDepositNumber:5=$_t_InvoiceNumber) & (""#$_t_InvoiceNumber)) | (([XInvoiceAllocation:126]xDepositNumber:5=$_t_ReceiptNumber) & (""#$_t_ReceiptNumber)) | (([XInvoiceAllocation:126]xDepositNumber:5=$_t_DepositNumber) & (""#$_t_DepositNumber))
						$_bo_Add:=True:C214
					: (([XInvoiceAllocation:126]xReceiptNumber:4=$_t_InvoiceNumber) & (""#$_t_InvoiceNumber)) | (([XInvoiceAllocation:126]xReceiptNumber:4=$_t_ReceiptNumber) & (""#$_t_ReceiptNumber)) | (([XInvoiceAllocation:126]xReceiptNumber:4=$_t_DepositNumber) & (""#$_t_DepositNumber))
						$_bo_Add:=True:C214
					: (([XInvoiceAllocation:126]xCreditNumber:3=$_t_InvoiceNumber) & (""#$_t_InvoiceNumber)) | (([XInvoiceAllocation:126]xCreditNumber:3=$_t_ReceiptNumber) & (""#$_t_ReceiptNumber)) | (([XInvoiceAllocation:126]xCreditNumber:3=$_t_DepositNumber) & (""#$_t_DepositNumber))
						$_bo_Add:=True:C214
						
				End case 
				
				If ($_bo_Add)
					PREVIOUS RECORD:C110([XInvoiceAllocation:126])
					ADD TO SET:C119([XInvoiceAllocation:126]; "UseThese")
					NEXT RECORD:C51([XInvoiceAllocation:126])
					ADD TO SET:C119([XInvoiceAllocation:126]; "UseThese")
				End if 
				
			End if 
		End if 
		
		If ([XInvoiceAllocation:126]xReceiptNumber:4#"")
			If ([XInvoiceAllocation:126]xReceiptNumber:4=$_t_InvoiceNumber) | ([XInvoiceAllocation:126]xReceiptNumber:4=$_t_CreditNumber) | ([XInvoiceAllocation:126]xReceiptNumber:4=$_t_ReceiptNumber) | ([XInvoiceAllocation:126]xReceiptNumber:4=$_t_DepositNumber)
				$_bo_Add:=False:C215
				Case of 
					: (([XInvoiceAllocation:126]xDepositNumber:5=$_t_InvoiceNumber) & (""#$_t_InvoiceNumber)) | (([XInvoiceAllocation:126]xDepositNumber:5=$_t_ReceiptNumber) & (""#$_t_ReceiptNumber)) | (([XInvoiceAllocation:126]xDepositNumber:5=$_t_DepositNumber) & (""#$_t_DepositNumber))
						$_bo_Add:=True:C214
					: (([XInvoiceAllocation:126]xCreditNumber:3=$_t_InvoiceNumber) & (""#$_t_InvoiceNumber)) | (([XInvoiceAllocation:126]xCreditNumber:3=$_t_ReceiptNumber) & (""#$_t_ReceiptNumber)) | (([XInvoiceAllocation:126]xCreditNumber:3=$_t_DepositNumber) & (""#$_t_DepositNumber))
						$_bo_Add:=True:C214
					: (([XInvoiceAllocation:126]xCreditNumber:3=$_t_InvoiceNumber) & (""#$_t_InvoiceNumber)) | (([XInvoiceAllocation:126]xCreditNumber:3=$_t_ReceiptNumber) & (""#$_t_ReceiptNumber)) | (([XInvoiceAllocation:126]xCreditNumber:3=$_t_DepositNumber) & (""#$_t_DepositNumber))
						$_bo_Add:=True:C214
						
				End case 
				If ($_bo_Add)
					PREVIOUS RECORD:C110([XInvoiceAllocation:126])
					ADD TO SET:C119([XInvoiceAllocation:126]; "UseThese")
					NEXT RECORD:C51([XInvoiceAllocation:126])
					ADD TO SET:C119([XInvoiceAllocation:126]; "UseThese")
				End if 
				
			End if 
			
			
		End if 
		
		
		$_t_InvoiceNumber:=[XInvoiceAllocation:126]xInvoiceNumber:2
		$_t_CreditNumber:=[XInvoiceAllocation:126]xCreditNumber:3
		$_t_ReceiptNumber:=[XInvoiceAllocation:126]xReceiptNumber:4
		$_t_DepositNumber:=[XInvoiceAllocation:126]xDepositNumber:5
		$_r_Amount:=[XInvoiceAllocation:126]xAmount:7
		
		NEXT RECORD:C51([XInvoiceAllocation:126])
	End for 
	READ WRITE:C146([XInvoiceAllocation:126])
	
	USE SET:C118("UseThese")
	CLEAR SET:C117("UseThese")
	DELETE SELECTION:C66([XInvoiceAllocation:126])
End if 
ERR_MethodTrackerReturn("SI_AllocationDeleteDuplicates"; $_t_oldMethodName)
