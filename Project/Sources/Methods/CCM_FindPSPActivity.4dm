//%attributes = {}
If (False:C215)
	//Project Method Name:      CCM_FindPSPActivity
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
	C_DATE:C307($3; $4)
	C_LONGINT:C283($1)
	C_POINTER:C301($2)
	C_TEXT:C284($_t_oldMethodName; $5)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("CCM_FindPSPActivity")
Case of 
	: ($1=24)  //Orders
		QUERY:C277([CCM_PSPTransaction:136]; [CCM_PSPTransaction:136]xOrderID:10=$2->)
	: ($1=Table:C252(->[CONTACTS:1]))  //Contacts
		QUERY:C277([CCM_PSPTransaction:136]; [CCM_PSPTransaction:136]xContactID:9=$2->)
	: ($1=Table:C252(->[xCreditCardDetails:132]))  //Credit Card
		QUERY:C277([CCM_PSPTransaction:136]; [CCM_PSPTransaction:136]x_CCID:8=$2->)
	: ($1=Table:C252(->[INVOICES:39]))  //invoices
		Case of 
			: ($2->="*D@")
				QUERY:C277([CCM_PSPTransaction:136]; [CCM_PSPTransaction:136]xDepositCode:12=$2->)
			: ($2->="*R@")
				QUERY:C277([CCM_PSPTransaction:136]; [CCM_PSPTransaction:136]xReceiptID:13=$2->)
			Else 
				QUERY:C277([CCM_PSPTransaction:136]; [CCM_PSPTransaction:136]xInvoiceID:11=$2->)
		End case 
	Else 
		
		QUERY:C277([CCM_PSPTransaction:136]; [CCM_PSPTransaction:136]XPSPID:14=$2->)
End case 
If (Count parameters:C259>=3)
	If (Count parameters:C259>=4)
		If ($4#!00-00-00!) & ($3#!00-00-00!)
			QUERY SELECTION:C341([CCM_PSPTransaction:136]; [CCM_PSPTransaction:136]TRANSACTION_DATE:2>=$3; *)
			QUERY SELECTION:C341([CCM_PSPTransaction:136];  & ; [CCM_PSPTransaction:136]TRANSACTION_DATE:2<=$4)
		Else 
			If ($3#!00-00-00!)
				QUERY SELECTION:C341([CCM_PSPTransaction:136]; [CCM_PSPTransaction:136]TRANSACTION_DATE:2=$3)
			End if 
		End if 
	Else 
		If ($3#!00-00-00!)
			QUERY SELECTION:C341([CCM_PSPTransaction:136]; [CCM_PSPTransaction:136]TRANSACTION_DATE:2=$3)
		End if 
	End if 
End if 
If (Count parameters:C259>=5)
	QUERY SELECTION:C341([CCM_PSPTransaction:136]; [CCM_PSPTransaction:136]TRANSACTION_TYPE:3=$5)
End if 
ERR_MethodTrackerReturn("CCM_FindPSPActivity"; $_t_oldMethodName)