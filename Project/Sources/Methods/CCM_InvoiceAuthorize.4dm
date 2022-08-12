//%attributes = {}
If (False:C215)
	//Project Method Name:      CCM_InvoiceAuthorize
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
	//ARRAY LONGINT(<>CC_al_CardOwnerTable;0)
	//ARRAY LONGINT(<>CC_al_CardOwnerXID;0)
	ARRAY LONGINT:C221($_al_ExistingAllocations; 0)
	ARRAY LONGINT:C221($_al_ExistingAllocations2; 0)
	//ARRAY LONGINT(CC_al_CardOwnerTable;0)
	//ARRAY LONGINT(CC_al_CardOwnerXID;0)
	//ARRAY TEXT(<>CC_at_CardOwnerRange;0)
	ARRAY TEXT:C222($_at_InvoiceOrderCodes; 0)
	//ARRAY TEXT(CC_at_CardOwnerRange;0)
	C_BOOLEAN:C305(<>CCM_bo_CompanyCards; <>CCM_bo_Inited; $_bo_CCMCreateReceipt; $7; CCM_bo_HideAuth; CCM_bo_PaymentTaken)
	C_LONGINT:C283($_l_AllocationRow; $_l_Allocations2Index; $_l_ArraySize; $_l_CardIndex; $_l_CCAuthTransactionID; $_l_CurrentRow; $_l_CurrentWinRefOLD; $_l_Process; $_l_ProcessState; $_l_RememberLoadExpired; $_l_Retries)
	C_LONGINT:C283($6; CCM_l_cardIDtoAuth; CCM_l_CCAuditID; CCM_l_CurrentOwnerID; CCM_l_CurrentOwnerTable; CCM_l_LoadExpired; CCM_l_OrderID; CCM_l_ParentProcess; CCM_l_SaveAuth; DB_l_ButtonClickedFunction; WIN_l_CurrentWinRef)
	C_LONGINT:C283(WIN_l_CurrentWinRefOLD)
	C_REAL:C285($_r_Amount; $0; $4; CCM_R_AuthAmount; CCM_R_TotalAuthAvailable)
	C_TEXT:C284($_t_ErrLogTextToDisplay; $_t_InvoiceNumber; $_t_oldMethodName; $_t_ReceiptNumberCreated; $_t_SpecialERRCheckText; $1; $2; $3; $5; CC_t_AuthCode; CC_t_CardOwnerName)
	C_TEXT:C284(CC_t_DepositNumber; CCM_t_CartID; CCM_t_ChequeNo; CCM_t_CurrencyCode; CCM_t_InvoiceNumber)
End if 

//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("CCM_InvoiceAuthorize")

//This method which is called in a seperate process from an invoice will display the authorization screen relating to an invoice(
//note that there is a timer in the form so it will close if the order is closed
// The most significant difference with this is that it does not create a [CC_OrderAuths]
//the
If (Count parameters:C259>=6)
	If ($6#Current process:C322)
		Start_Process
	End if 
	$_bo_CCMCreateReceipt:=True:C214  //by default
	If (Count parameters:C259>=7)
		$_bo_CCMCreateReceipt:=$7
	End if 
	ARRAY TEXT:C222(CC_at_CardOwnerRange; 0)
	ARRAY LONGINT:C221(CC_al_CardOwnerTable; 0)
	ARRAY LONGINT:C221(CC_al_CardOwnerXID; 0)
	CCM_l_CurrentOwnerID:=0
	CCM_t_InvoiceNumber:=$1
	CCM_t_CartID:="INV"+$1
	READ ONLY:C145([COMPANIES:2])
	READ ONLY:C145([CONTACTS:1])
	If (Count parameters:C259>=6)
		CCM_l_ParentProcess:=$6
		If ($2#"") & (False:C215)  //Credit cards not attached to companies
			QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Code:1=$2)
			INSERT IN ARRAY:C227(CC_at_CardOwnerRange; Size of array:C274(CC_at_CardOwnerRange)+1; 1)
			INSERT IN ARRAY:C227(CC_al_CardOwnerTable; Size of array:C274(CC_al_CardOwnerTable)+1; 1)
			INSERT IN ARRAY:C227(CC_al_CardOwnerXID; Size of array:C274(CC_al_CardOwnerXID)+1; 1)
			CC_at_CardOwnerRange{Size of array:C274(CC_at_CardOwnerRange)}:=[COMPANIES:2]Company_Name:2
			CC_al_CardOwnerTable{Size of array:C274(CC_al_CardOwnerTable)}:=Table:C252(->[COMPANIES:2])
			CC_al_CardOwnerXID{Size of array:C274(CC_al_CardOwnerXID)}:=[COMPANIES:2]x_ID:63
			CCM_l_CurrentOwnerTable:=Table:C252(->[COMPANIES:2])
			CCM_l_CurrentOwnerID:=[COMPANIES:2]x_ID:63
			CC_t_CardOwnerName:=[COMPANIES:2]Company_Name:2
		End if 
		If ($3#"")  //Contact code
			If (Not:C34(<>CCM_bo_Inited))
				CCM_InitCreditCardModule
			End if 
			QUERY:C277([CONTACTS:1]; [CONTACTS:1]Contact_Code:2=$3)
			INSERT IN ARRAY:C227(CC_at_CardOwnerRange; Size of array:C274(CC_at_CardOwnerRange)+1; 1)
			INSERT IN ARRAY:C227(CC_al_CardOwnerTable; Size of array:C274(CC_al_CardOwnerTable)+1; 1)
			INSERT IN ARRAY:C227(CC_al_CardOwnerXID; Size of array:C274(CC_al_CardOwnerXID)+1; 1)
			CC_at_CardOwnerRange{Size of array:C274(CC_at_CardOwnerRange)}:=[CONTACTS:1]Contact_Name:31
			CC_al_CardOwnerTable{Size of array:C274(CC_al_CardOwnerTable)}:=Table:C252(->[CONTACTS:1])
			CC_al_CardOwnerXID{Size of array:C274(CC_al_CardOwnerXID)}:=[CONTACTS:1]x_ID:33
			If (CCM_l_CurrentOwnerID=0)
				CCM_l_CurrentOwnerTable:=Table:C252(->[CONTACTS:1])
				CCM_l_CurrentOwnerID:=[CONTACTS:1]x_ID:33
				CC_t_CardOwnerName:=[CONTACTS:1]Contact_Name:31
			End if 
			If (<>CCM_bo_CompanyCards)
				If ([COMPANIES:2]Company_Code:1#[CONTACTS:1]Company_Code:1)
					QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Code:1=[CONTACTS:1]Company_Code:1)
				End if 
				//user can select other cards within the company.
				//Load names of Contacts_In the company with company cards.
				$_l_Retries:=0
				While (Semaphore:C143("$LoadingCards"))
					$_l_Retries:=$_l_Retries+1
					DelayTicks(2*(1+$_l_Retries))
				End while 
				$_l_Process:=New process:C317("CCM_LoadCompanyContacts"; 256000; "LoadCompanyContacts"; [CONTACTS:1]x_ID:33; [COMPANIES:2]x_ID:63)
				$_l_Retries:=0
				Repeat 
					$_l_ProcessState:=Process state:C330($_l_Process)
					If ($_l_ProcessState>=0)
						$_l_Retries:=$_l_Retries+1
						DelayTicks(2*(1+$_l_Retries))
					End if 
				Until ($_l_ProcessState<0)
				$_l_ArraySize:=Size of array:C274(<>CC_at_CardOwnerRange)
				If ($_l_ArraySize>0)
					ARRAY TEXT:C222(CC_at_CardOwnerRange; $_l_ArraySize+1)
					ARRAY LONGINT:C221(CC_al_CardOwnerTable; $_l_ArraySize+1)
					ARRAY LONGINT:C221(CC_al_CardOwnerXID; $_l_ArraySize+1)
					For ($_l_CardIndex; 1; Size of array:C274(<>CC_at_CardOwnerRange))
						CC_at_CardOwnerRange{$_l_CardIndex+1}:=<>CC_at_CardOwnerRange{$_l_CardIndex}
						CC_al_CardOwnerTable{$_l_CardIndex+1}:=<>CC_al_CardOwnerTable{$_l_CardIndex}
						CC_al_CardOwnerXID{$_l_CardIndex+1}:=<>CC_al_CardOwnerXID{$_l_CardIndex}
					End for 
					
				End if 
				
				CLEAR SEMAPHORE:C144("$LoadingCards")
				
				
			End if 
			
		End if 
		
		CCM_LoadServiceProvidersV11(True:C214)
		
		CCM_R_TotalAuthAvailable:=$4
		CCM_t_CurrencyCode:=$5
		CCM_l_OrderID:=0
		CCM_l_SaveAuth:=0
		CCM_bo_HideAuth:=True:C214
		$_l_RememberLoadExpired:=CCM_l_LoadExpired
		$_l_CurrentWinRefOLD:=WIN_l_CurrentWinRef
		WIN_l_CurrentWinRef:=Open window:C153((Screen width:C187/2); (Screen width:C187/2); 100; 100; 4)
		SET WINDOW TITLE:C213("Get Credit Card Payment for invoice")
		
		CCM_l_LoadExpired:=-1  //added 22/08/08 -kmw (always force deny access to expired cards if this is anything but veiwing/editing cards themselves)
		DIALOG:C40([USER:15]; "CC_CreditCardProcessor")
		CLOSE WINDOW:C154
		WIN_l_CurrentWinRef:=$_l_CurrentWinRefOLD
		CCM_l_LoadExpired:=$_l_RememberLoadExpired  //added 22/08/08 -kmw (always force deny access to expired cards if this is anything but veiwing/editing cards themselves)
		
		$_t_ReceiptNumberCreated:=""
		If ($_bo_CCMCreateReceipt)
			If (CCM_l_SaveAuth=1)
				//Create the auth
				CC_t_DepositNumber:=""
				If (CCM_bo_PaymentTaken)
					//here we are taking a payment against an invoice..the invoice exists so...
					$_t_InvoiceNumber:=$1
					Invoices_File
					If ([INVOICES:39]Invoice_Number:1#$1)
						QUERY:C277([INVOICES:39]; [INVOICES:39]Invoice_Number:1=$1)
					End if 
					If ($1="*D@")
						QUERY:C277([XInvoiceAllocation:126]; [XInvoiceAllocation:126]xDepositNumber:5=$1)
					Else 
						QUERY:C277([XInvoiceAllocation:126]; [XInvoiceAllocation:126]xInvoiceNumber:2=$1)
					End if 
					ARRAY LONGINT:C221($_al_ExistingAllocations; 0)
					
					SELECTION TO ARRAY:C260([XInvoiceAllocation:126]x_ID:1; $_al_ExistingAllocations)
					
					//note the above means we had to unload the invoice in the calling processes!!
					$_r_Amount:=CCM_R_AuthAmount
					
					QUERY:C277([INVOICES_ITEMS:161]; [INVOICES_ITEMS:161]INVOICES_CODE:18=[INVOICES:39]Invoice_Number:1)
					
					FIRST RECORD:C50([INVOICES_ITEMS:161])
					ARRAY TEXT:C222($_at_InvoiceOrderCodes; 0)
					$_l_CurrentRow:=0
					//`make sure the receipt here gets the cheque number
					CCM_t_ChequeNo:=""
					If (CCM_l_cardIDtoAuth#0)
						//Get card type
						If ([xCreditCardDetails:132]x_ID:1#CCM_l_cardIDtoAuth)
							QUERY:C277([xCreditCardDetails:132]; [xCreditCardDetails:132]x_ID:1=CCM_l_cardIDtoAuth)
						End if 
						CCM_t_ChequeNo:=[xCreditCardDetails:132]Card_TypeName:5
					End if 
					
					//******************* added  15/01/09 -kmw v631b120h_4 / v631b120m *******************
					$_t_ErrLogTextToDisplay:="Before call to 'Invoices_Pay2' method from 'CCM_InvoiceAuthorize'."
					$_t_SpecialERRCheckText:=ERR_MethodTracker($_t_ErrLogTextToDisplay)
					//*********************************************************************************************
					Invoices_Pay2(False:C215; $_r_Amount; 0; False:C215; True:C214)
					//******************* added  15/01/09 -kmw v631b120h_4 / v631b120m *******************
					$_t_ErrLogTextToDisplay:="After call to 'Invoices_Pay2' method from 'CCM_InvoiceAuthorize'."
					ERR_MethodTrackerReturn($_t_ErrLogTextToDisplay; $_t_SpecialERRCheckText)
					//********************************************************************************************
					
					
					If ($1="*D@")
						QUERY:C277([XInvoiceAllocation:126]; [XInvoiceAllocation:126]xDepositNumber:5=$1)
					Else 
						QUERY:C277([XInvoiceAllocation:126]; [XInvoiceAllocation:126]xInvoiceNumber:2=$1)
					End if 
					ARRAY LONGINT:C221($_al_ExistingAllocations2; 0)
					SELECTION TO ARRAY:C260([XInvoiceAllocation:126]x_ID:1; $_al_ExistingAllocations2)
					For ($_l_Allocations2Index; Size of array:C274($_al_ExistingAllocations2); 1; -1)
						$_l_AllocationRow:=Find in array:C230($_al_ExistingAllocations; $_al_ExistingAllocations2{$_l_Allocations2Index})
						If ($_l_AllocationRow<0)
							QUERY:C277([XInvoiceAllocation:126]; [XInvoiceAllocation:126]x_ID:1=$_al_ExistingAllocations2{$_l_Allocations2Index})
							$_t_ReceiptNumberCreated:=[XInvoiceAllocation:126]xReceiptNumber:4
							$_l_Allocations2Index:=0
						End if 
					End for 
					
					
					CCM_t_ChequeNo:=""
				End if 
				
				If (CC_t_AuthCode#"")
					If (CCM_l_SaveAuth=1)
						//Create the auth
						If (CC_t_AuthCode#"")
							
							READ WRITE:C146([CC_OrderAuths:133])
							CREATE RECORD:C68([CC_OrderAuths:133])
							[CC_OrderAuths:133]AuthorizationAmount:5:=CCM_R_AuthAmount
							[CC_OrderAuths:133]AuthorizationCode:6:=CC_t_AuthCode
							[CC_OrderAuths:133]AuthorizationDate:4:=Current date:C33(*)
							[CC_OrderAuths:133]CC_RecordID:3:=CCM_l_cardIDtoAuth
							[CC_OrderAuths:133]Order_ID:2:=0  //NOT RELATED TO AN ORDER
							If (CCM_bo_PaymentTaken)
								[CC_OrderAuths:133]xAuthStatus:7:=3
							Else 
								[CC_OrderAuths:133]xAuthStatus:7:=1  //awaiting payment
							End if 
							[CC_OrderAuths:133]xinvoiceCode:9:=$1
							
							[CC_OrderAuths:133]TransactionID:10:=CCM_l_CCAuditID
							$_l_CCAuthTransactionID:=[CC_OrderAuths:133]TransactionID:10
							DB_SaveRecord(->[CC_OrderAuths:133])
							
							UNLOAD RECORD:C212([CC_OrderAuths:133])
							READ ONLY:C145([CC_OrderAuths:133])
							If ($_t_ReceiptNumberCreated#"")
								QUERY:C277([CCM_PSPTransaction:136]; [CCM_PSPTransaction:136]x_ID:1=$_l_CCAuthTransactionID)  //our reference
								[CCM_PSPTransaction:136]xReceiptID:13:=$_t_ReceiptNumberCreated
								DB_SaveRecord(->[CCM_PSPTransaction:136])
								UNLOAD RECORD:C212([CCM_PSPTransaction:136])
							End if 
							//and call the order process to refresh
							If (CCM_l_ParentProcess#Current process:C322)
								//DB_l_ButtonClickedFunction:=800
								SET PROCESS VARIABLE:C370(CCM_l_ParentProcess; DB_l_ButtonClickedFunction; DB_GetButtonFunction("ReloadAuths"))
								RESUME PROCESS:C320(CCM_l_ParentProcess)
								POST OUTSIDE CALL:C329(CCM_l_ParentProcess)
								BRING TO FRONT:C326(CCM_l_ParentProcess)
							End if 
							
							
						End if 
					End if 
					
					//and call the invoice process to refresh
					If (CCM_l_ParentProcess#Current process:C322)
						
						//DB_l_ButtonClickedFunction:=800
						SET PROCESS VARIABLE:C370(CCM_l_ParentProcess; DB_l_ButtonClickedFunction; DB_GetButtonFunction("ReloadAuths"))
						RESUME PROCESS:C320(CCM_l_ParentProcess)
						POST OUTSIDE CALL:C329(CCM_l_ParentProcess)
						BRING TO FRONT:C326(CCM_l_ParentProcess)
					End if 
				End if 
			Else 
				If (CCM_l_ParentProcess#Current process:C322)
					
					SET PROCESS VARIABLE:C370(CCM_l_ParentProcess; DB_l_ButtonClickedFunction; DB_GetButtonFunction("ReloadAuths"))
					RESUME PROCESS:C320(CCM_l_ParentProcess)
					POST OUTSIDE CALL:C329(CCM_l_ParentProcess)
					BRING TO FRONT:C326(CCM_l_ParentProcess)
				End if 
			End if 
		Else 
			//not creating a receipt...because we are already entering a receipt
			If (CCM_l_SaveAuth=1)
				$0:=CCM_R_AuthAmount
				CCM_R_AuthAmount:=0
				
				$_l_CurrentRow:=0
				//`make sure the receipt here gets the cheque number
				CCM_t_ChequeNo:=""
				If (CCM_l_cardIDtoAuth#0)
					//Get card type
					If ([xCreditCardDetails:132]x_ID:1#CCM_l_cardIDtoAuth)
						QUERY:C277([xCreditCardDetails:132]; [xCreditCardDetails:132]x_ID:1=CCM_l_cardIDtoAuth)
					End if 
					CCM_t_ChequeNo:=[xCreditCardDetails:132]Card_TypeName:5
				End if 
				
				
			Else 
				$0:=0
				CCM_t_ChequeNo:=""
			End if 
		End if 
		If ($6#Current process:C322)
			Process_End
		End if 
	End if 
	
	
End if 
ERR_MethodTrackerReturn("CCM_InvoiceAuthorize"; $_t_oldMethodName)