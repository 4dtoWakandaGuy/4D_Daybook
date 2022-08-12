//%attributes = {}
If (False:C215)
	//Project Method Name:      CCM_OrderAuthorize
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
	//ARRAY BOOLEAN(INV_abo_Select;0)
	//ARRAY DATE(ORD_ad_CCAuthDate;0)
	//ARRAY LONGINT(<>CC_al_CardOwnerTable;0)
	//ARRAY LONGINT(<>CC_al_CardOwnerXID;0)
	//ARRAY LONGINT(CC_al_CardOwnerTable;0)
	//ARRAY LONGINT(CC_al_CardOwnerXID;0)
	//ARRAY LONGINT(ORD_al_AuthStatus;0)
	//ARRAY LONGINT(WIN_al_CalledFromReference;0)
	//ARRAY LONGINT(WIN_al_ThisWIndowReference;0)
	//ARRAY REAL(GEN_ar_Value;0)
	//ARRAY REAL(ORD_ar_CCAmount;0)
	//ARRAY TEXT(<>CC_at_CardOwnerRange;0)
	ARRAY TEXT:C222($_at_DepositNos; 0)
	ARRAY TEXT:C222($_at_InvoiceNumbers; 0)
	ARRAY TEXT:C222($_at_DepositNumbers; 0)
	//ARRAY TEXT(CC_at_CardOwnerRange;0)
	//ARRAY TEXT(GEN_at_Name;0)
	//ARRAY TEXT(GEN_at_RecordCode;0)
	//ARRAY TEXT(ORD_at_CCAUTH;0)
	//ARRAY TEXT(ORD_at_InvoiceCode;0)
	C_BLOB:C604($CCM_Bl_TransRecord; $CCM_Bl_TransResponse)
	C_BOOLEAN:C305(<>CCM_bo_CompanyCards; <>CCM_bo_Inited; <>PersAnOver; $_bo_Continue; $_bo_Deposit; $_bo_InvoiceMade; $_bo_Posted; $_bo_sOK; CCM_bo_PaymentTaken; WIN_bo_TrackerInited)
	C_DATE:C307(<>DB_d_CurrentDate)
	C_LONGINT:C283($_l_AddMode; $_l_CurrentWinRefOLD; $_l_Element; $_l_Index; $_l_InvoiceNumberRow; $_l_Process; $_l_ProcessState; $_l_RecordsinSelection; $_l_RecordsinSelection2; $_l_RememberCCM_LoadExpired; $_l_Retries)
	C_LONGINT:C283($_l_TransID; $_l_WindowReferenceRow; $2; $7; $8; $9; CCM_l_cardIDtoAuth; CCM_l_CardToUse; CCM_l_CCAuditID; CCM_l_CurrentOwnerID; CCM_l_CurrentOwnerTable)
	C_LONGINT:C283(CCM_l_LoadExpired; CCM_l_OrderID; CCM_l_ParentProcess; CCM_l_PreAuthID; CCM_l_RelatedCoID; CCM_l_SaveAuth; DB_l_ButtonClickedFunction; GEN_l_NameSelected; INV_l_AllocationPage; Vadd; WIN_l_CurrentWinRef)
	C_LONGINT:C283(WIN_l_CurrentWinRefOLD)
	C_REAL:C285($_r_IndexnvoivedTotal; $_r_OutstadinginvoicedAmount; $_r_OutstandinginvoicedAmount; $_r_TotalOrder; $_r_UnallocatedInvoiceAmount; $5; CCM_R_AuthAmount; CCM_R_TotalAuthAvailable)
	C_TEXT:C284(<>Per_t_CurrentDefaultAnalCode; <>SYS_t_BaseCurrency; $_t_oldMethodName; $_t_oldMethodName2; $1; $3; $4; $6; CC_t_AuthCode; CC_t_CardOwnerName; CC_t_DepositNumber)
	C_TEXT:C284(CCM_t_CartID; CCM_t_CurrencyCode; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; INV_t_RecordCode; vAccount; vBAccount; vTitle; vTitle2)
End if 

//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("CCM_OrderAuthorize")

//note that there is a timer in the form so it will close if the order is closed
Start_Process
If (Not:C34(<>CCM_bo_Inited))
	CCM_InitCreditCardModule
End if 

If (Count parameters:C259>=8)
	CCM_l_PreAuthID:=$8
End if 

ARRAY TEXT:C222(CC_at_CardOwnerRange; 0)
ARRAY LONGINT:C221(CC_al_CardOwnerTable; 0)
ARRAY LONGINT:C221(CC_al_CardOwnerXID; 0)
CCM_t_CartID:="ORD"+$1
CCM_l_CurrentOwnerID:=0
READ ONLY:C145([COMPANIES:2])
READ ONLY:C145([CONTACTS:1])
If (Count parameters:C259>=7)
	CCM_l_ParentProcess:=$7
	If ($3#"") & (False:C215)  //Credit cards not attached to companies
		QUERY:C277([COMPANIES:2]; [COMPANIES:2]Company_Code:1=$3)
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
	If ($4#"")  //Contact code
		QUERY:C277([CONTACTS:1]; [CONTACTS:1]Contact_Code:2=$4)
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
			$_l_RecordsinSelection:=Size of array:C274(<>CC_at_CardOwnerRange)
			If ($_l_RecordsinSelection>0)
				$_l_RecordsinSelection2:=Size of array:C274(CC_at_CardOwnerRange)
				ARRAY TEXT:C222(CC_at_CardOwnerRange; $_l_RecordsinSelection2+$_l_RecordsinSelection)
				ARRAY LONGINT:C221(CC_al_CardOwnerTable; $_l_RecordsinSelection2+$_l_RecordsinSelection)
				ARRAY LONGINT:C221(CC_al_CardOwnerXID; $_l_RecordsinSelection2+$_l_RecordsinSelection)
				For ($_l_Index; 1; Size of array:C274(<>CC_at_CardOwnerRange))
					CC_at_CardOwnerRange{$_l_Index+$_l_RecordsinSelection2}:=<>CC_at_CardOwnerRange{$_l_Index}
					CC_al_CardOwnerTable{$_l_Index+$_l_RecordsinSelection2}:=<>CC_al_CardOwnerTable{$_l_Index}
					CC_al_CardOwnerXID{$_l_Index+$_l_RecordsinSelection2}:=<>CC_al_CardOwnerXID{$_l_Index}
				End for 
				
			End if 
			
			CLEAR SEMAPHORE:C144("$LoadingCards")
			
			
		End if 
		
	End if 
	
	CCM_LoadOrderAuths($2; False:C215)
	
	CCM_R_TotalAuthAvailable:=$5
	CCM_t_CurrencyCode:=$6
	For ($_l_Index; 1; Size of array:C274(ORD_at_CCAUTH))
		Case of 
			: (((ORD_al_AuthStatus{$_l_Index}=3) | (ORD_al_AuthStatus{$_l_Index}=1)) | (ORD_at_InvoiceCode{$_l_Index}#"")) | ((ORD_al_AuthStatus{$_l_Index}=0) & (ORD_ad_CCAuthDate{$_l_Index}<=(Current date:C33-30)))
				CCM_R_TotalAuthAvailable:=CCM_R_TotalAuthAvailable-(ORD_ar_CCAmount{$_l_Index})
			Else 
				
		End case 
	End for 
	QUERY:C277([INVOICES_ITEMS:161]; [INVOICES_ITEMS:161]Order_Code:11=$1)
	SELECTION TO ARRAY:C260([INVOICES_ITEMS:161]INVOICES_CODE:18; $_at_InvoiceNumbers)
	QUERY WITH ARRAY:C644([INVOICES:39]Invoice_Number:1; $_at_InvoiceNumbers)
	
	$_bo_InvoiceMade:=False:C215
	If (Records in selection:C76([INVOICES:39])>0)
		$_bo_InvoiceMade:=True:C214
		$_r_OutstandinginvoicedAmount:=Sum:C1([INVOICES:39]Total_Due:7)
	Else 
		$_r_OutstandinginvoicedAmount:=0
	End if 
	//Look for unresolved deposits that were paid by CC
	QUERY:C277([INVOICES:39]; [INVOICES:39]Company_Code:2=$3; *)
	QUERY:C277([INVOICES:39];  & ; [INVOICES:39]State:10=-2; *)
	QUERY:C277([INVOICES:39];  & ; [INVOICES:39]X_DepositRelatedTable:44=0; *)
	QUERY:C277([INVOICES:39];  & ; [INVOICES:39]X_DepositRelatedRecordID:45=0; *)
	QUERY:C277([INVOICES:39];  & ; [INVOICES:39]Total_Due:7<0)
	$_bo_Continue:=True:C214
	If (Count parameters:C259>=9)
		CCM_l_CardToUse:=$9
	End if 
	If (Records in selection:C76([INVOICES:39])>0)
		//there are deposits against this company
		
		SELECTION TO ARRAY:C260([INVOICES:39]Invoice_Number:1; $_at_DepositNos)
		QUERY WITH ARRAY:C644([CCM_PSPTransaction:136]xDepositCode:12; $_at_DepositNos)
		If (Records in selection:C76([CCM_PSPTransaction:136])>0)  //only use those deposits if they have not been linked to an other order and the
			QUERY SELECTION:C341([CCM_PSPTransaction:136]; [CCM_PSPTransaction:136]xOrderID:10=0)
			SELECTION TO ARRAY:C260([CCM_PSPTransaction:136]xDepositCode:12; $_at_DepositNos)
			QUERY WITH ARRAY:C644([INVOICES:39]Invoice_Number:1; $_at_DepositNos)
		End if 
		$_bo_Continue:=True:C214
		If (Records in selection:C76([CCM_PSPTransaction:136])>0)
			Gen_Confirm("There are deposits from this company paid by Credit Card, would you like to use t"+"o use"+"hem?"; "Yes"; "No")
			If (OK=1)  //Note that unlike INV_allocateDeposit this does not select the invoice-we are not paying the invoice-merely marking the CCM_PspTransaction and  CC_orderAuth with the Order number
				//````
				$_l_RecordsinSelection:=Records in selection:C76([INVOICES:39])
				ARRAY TEXT:C222(GEN_at_Name; $_l_RecordsinSelection)
				ARRAY TEXT:C222(GEN_at_RecordCode; $_l_RecordsinSelection)
				ARRAY REAL:C219(GEN_ar_Value; $_l_RecordsinSelection)
				ARRAY TEXT:C222($_at_DepositNos; $_l_RecordsinSelection)
				If ($_l_RecordsinSelection>1)
					FIRST RECORD:C50([INVOICES:39])
					For ($_l_Index; 1; $_l_RecordsinSelection)
						GEN_at_Name{$_l_Index}:=[INVOICES:39]Invoice_Number:1
						//invert the amount due as this the amount due TO the client
						GEN_at_RecordCode{$_l_Index}:=String:C10(-[INVOICES:39]Total_Due:7; "|Accounts")
						GEN_ar_Value{$_l_Index}:=Num2(GEN_at_RecordCode{$_l_Index})
						NEXT RECORD:C51([INVOICES:39])
					End for 
					
					Open_Any_Window(257; 457; -1984)
					INV_l_AllocationPage:=3
					vTitle:="Deposit Selection"
					vTitle2:="To be"+Char:C90(13)+"Linked"
					DIALOG:C40([INVOICES:39]; "dAllocation")
					INV_l_AllocationPage:=0
					CLOSE WINDOW:C154
					If (WIN_bo_TrackerInited)
						$_l_WindowReferenceRow:=Find in array:C230(WIN_al_ThisWIndowReference; WIN_l_CurrentWinRef)
						If ($_l_WindowReferenceRow>0)
							WIN_l_CurrentWinRef:=WIN_al_CalledFromReference{$_l_WindowReferenceRow}
						End if 
					End if 
					CREATE EMPTY SET:C140([INVOICES:39]; "Deposits")
					$_l_Element:=0
					GEN_l_NameSelected:=0
					For ($_l_Index; 1; Size of array:C274(INV_abo_Select))
						If (INV_abo_Select{$_l_Index})
							$_l_Element:=$_l_Element+1
							$_at_DepositNos{$_l_Element}:=GEN_at_Name{$_l_Index}
							GEN_l_NameSelected:=1
						End if 
					End for 
					ARRAY TEXT:C222($_at_DepositNos; $_l_Element)
					
					If (GEN_l_NameSelected=1)
						ARRAY TEXT:C222($_at_DepositNumbers; Size of array:C274(INV_abo_Select))
						$_l_Element:=0
						For ($_l_Index; 1; Size of array:C274(INV_abo_Select))
							If (INV_abo_Select{$_l_Index})
								QUERY:C277([INVOICES:39]; [INVOICES:39]Invoice_Number:1=GEN_at_Name{$_l_Index})
								ADD TO SET:C119([INVOICES:39]; "Deposits")
							End if 
						End for 
						USE SET:C118("Deposits")
						CLEAR SET:C117("Deposits")
					Else 
						//there is only one deposit and we don't want the user to confirm it
					End if 
					If (Records in selection:C76([INVOICES:39])>=1)
						
						
						If (OK=1)
							For ($_l_Index; 1; Size of array:C274($_at_DepositNos))
								READ WRITE:C146([INVOICES:39])
								QUERY:C277([INVOICES:39]; [INVOICES:39]Invoice_Number:1=$_at_DepositNos{$_l_Index})
								[INVOICES:39]X_DepositRelatedRecordID:45:=$2
								[INVOICES:39]X_DepositRelatedTable:44:=Table:C252(->[ORDERS:24])
								DB_SaveRecord(->[INVOICES:39])
								READ WRITE:C146([CC_OrderAuths:133])
								QUERY:C277([CC_OrderAuths:133]; [CC_OrderAuths:133]xDepositCode:8=$_at_DepositNos{$_l_Index})
								If (Records in selection:C76([CC_OrderAuths:133])>0)
									//this deposit was by CC
									[CC_OrderAuths:133]Order_ID:2:=$2
									$_l_TransID:=[CC_OrderAuths:133]TransactionID:10
									DB_SaveRecord(->[CC_OrderAuths:133])
									UNLOAD RECORD:C212([CC_OrderAuths:133])
									READ WRITE:C146([CCM_PSPTransaction:136])
									READ ONLY:C145([CC_OrderAuths:133])
									QUERY:C277([CCM_PSPTransaction:136]; [CCM_PSPTransaction:136]x_ID:1=$_l_TransID)
									[CCM_PSPTransaction:136]xOrderID:10:=$2
									DB_SaveRecord(->[CCM_PSPTransaction:136])
									UNLOAD RECORD:C212([CCM_PSPTransaction:136])
									READ ONLY:C145([CCM_PSPTransaction:136])
								End if 
								
							End for 
							
						End if 
					Else 
						
					End if 
					$_bo_Continue:=False:C215
				Else 
					Gen_Confirm("Do you wish to get a fresh Authorization?"; "Yes"; "No")
					If (OK=1)
						$_bo_Continue:=True:C214
					End if 
				End if 
				
				
				
				//````
			End if 
			
		End if 
		
	End if 
	If ($_bo_Continue)
		$_bo_Continue:=False:C215
		Case of 
			: (CCM_l_PreAuthID>0)
				$_bo_Continue:=True:C214
				
			: ($_r_OutstandinginvoicedAmount<CCM_R_TotalAuthAvailable) & ($5>0) & ($_bo_InvoiceMade=True:C214)
				Gen_Confirm("The Amount being authorized may already be invoiced, are you sure you wish to con"+"tinue"; "No"; "Yes")
				If (OK=0)
					$_bo_Continue:=True:C214
				End if 
				
			: ($5=0)
				Gen_Confirm("There is currently no amount to be authorized are you sure you wish to continue"; "No"; "Yes")
				If (OK=0)
					$_bo_Continue:=True:C214
				End if 
			: ($5>0) & (CCM_R_TotalAuthAvailable=0)
				Gen_Confirm("There is currently no outstanding amount to be authorized are you sure you wish t"+"o continue"; "No"; "Yes")
				If (OK=0)
					$_bo_Continue:=True:C214
				End if 
			Else 
				$_bo_Continue:=True:C214
		End case 
	End if 
	If ($_bo_Continue)
		CCM_LoadServiceProvidersV11(True:C214)
		
		CCM_l_OrderID:=$2
		CCM_l_SaveAuth:=0
		SET WINDOW TITLE:C213("Get Credit Card Auth/Payment for Order")
		$_l_CurrentWinRefOLD:=WIN_l_CurrentWinRef
		WIN_l_CurrentWinRef:=Open window:C153((Screen width:C187/2); (Screen height:C188/2); 100; 100; 4)
		
		CCM_l_LoadExpired:=-1  //added 22/08/08 -kmw (always force deny access to expired cards if this is anything but veiwing/editing cards themselves)
		DIALOG:C40([USER:15]; "CC_CreditCardProcessor")
		CLOSE WINDOW:C154
		WIN_l_CurrentWinRef:=$_l_CurrentWinRefOLD
		CCM_l_LoadExpired:=$_l_RememberCCM_LoadExpired  //added 22/08/08 -kmw (always force deny access to expired cards if this is anything but veiwing/editing cards themselves)
		
		If (CCM_l_SaveAuth=1)
			$_t_oldMethodName2:=ERR_MethodTracker("Saving Auth")
			
			CC_t_DepositNumber:=""
			If (CCM_bo_PaymentTaken)  //we have taken a payment-create a deposit record
				$_t_oldMethodName2:=ERR_MethodTracker("Payment taken")
				
				//First we must check if there are any unpaid invoices and check if the payment is to go against them.
				READ ONLY:C145([ORDER_ITEMS:25])
				QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Order_Code:1=$1)
				FIRST RECORD:C50([ORDER_ITEMS:25])
				ARRAY TEXT:C222($_at_InvoiceNumbers; Records in selection:C76([ORDER_ITEMS:25]))
				$_l_Element:=0
				For ($_l_Index; 1; Records in selection:C76([ORDER_ITEMS:25]))
					If ([ORDER_ITEMS:25]Invoice_Number:17#"")
						$_l_InvoiceNumberRow:=Find in array:C230($_at_InvoiceNumbers; [ORDER_ITEMS:25]Invoice_Number:17)
						If ($_l_InvoiceNumberRow<0)
							$_l_Element:=$_l_Element+1
							$_at_InvoiceNumbers{$_l_Element}:=[ORDER_ITEMS:25]Invoice_Number:17
							
						End if 
					End if 
					NEXT RECORD:C51([ORDER_ITEMS:25])
					
				End for 
				ARRAY TEXT:C222($_at_InvoiceNumbers; $_l_Element)
				If ($_l_Element>0)
					$_r_UnallocatedInvoiceAmount:=0
					For ($_l_Index; 1; Size of array:C274($_at_InvoiceNumbers))
						QUERY:C277([INVOICES:39]; [INVOICES:39]Invoice_Number:1=$_at_InvoiceNumbers{$_l_Index})
						$_r_UnallocatedInvoiceAmount:=$_r_UnallocatedInvoiceAmount+[INVOICES:39]Total_Due:7
					End for 
				Else 
					$_r_UnallocatedInvoiceAmount:=0
				End if 
				
				If ($_r_UnallocatedInvoiceAmount>0)
					Gen_Confirm("There are invoices already against this order, do you wish to allocate the paymen"+"t to them?"; "Yes"; "No")
					If (OK=0)
						$_bo_Deposit:=True:C214
					Else 
						$_bo_Deposit:=False:C215
					End if 
				Else 
					$_bo_Deposit:=True:C214
				End if 
				If ($_bo_Deposit)
					QUERY:C277([TRANSACTION_TYPES:31]; [TRANSACTION_TYPES:31]Transaction_Type_Code:1=DB_GetLedgerTRANSDeposit)
					If ((DB_GetLedgerTRANSDeposit#"") & (Records in selection:C76([TRANSACTION_TYPES:31])=1) & (DB_GetLedgerVatInputACC#""))
						READ WRITE:C146([INVOICES:39])
						$_l_AddMode:=Vadd
						DB_t_CurrentFormUsage2:=""
						Vadd:=1
						
						CREATE RECORD:C68([INVOICES:39])
						[INVOICES:39]X_DepositRelatedTable:44:=Table:C252(->[ORDERS:24])
						[INVOICES:39]X_DepositRelatedRecordID:45:=$2
						INV_t_RecordCode:=$1
						[INVOICES:39]Currency_Code:27:=$6
						[INVOICES:39]Company_Code:2:=$3
						[INVOICES:39]Contact_Code:3:=$4
						RELATE ONE:C42([INVOICES:39]Company_Code:2)
						Invoices_InLPAr
						If ([COMPANIES:2]Default_Layer:51#"")
							[INVOICES:39]Layer_Code:38:=[COMPANIES:2]Default_Layer:51
						End if 
						InvP_No
						[INVOICES:39]State:10:=-2
						[INVOICES:39]Invoice_Date:4:=<>DB_d_CurrentDate
						vDate:=<>DB_d_CurrentDate
						Check_Period
						Check_PerCloseI
						[INVOICES:39]Period_Code:13:=[PERIODS:33]Period_Code:1
						If (<>PersAnOver)
							[INVOICES:39]Analysis_Code:17:=<>Per_t_CurrentDefaultAnalCode
						End if 
						If ([INVOICES:39]Currency_Code:27="")
							[INVOICES:39]Currency_Code:27:=<>SYS_t_BaseCurrency
						End if 
						Layer_Fill(->[INVOICES:39]Layer_Code:38)
						If ((DB_GetLedgerisCashVAT) & (DB_GetLedgerCashvatACC#"") & ([INVOICES:39]State:10#-2))
							[INVOICES:39]Cash_TAX:41:=True:C214
						End if 
						Invoices_UKEC
						QUERY:C277([TRANSACTION_TYPES:31]; [TRANSACTION_TYPES:31]Transaction_Type_Code:1=DB_GetLedgerTRANSDeposit)
						
						If ([INVOICES:39]Debtors_Account:15="")
							[INVOICES:39]Debtors_Account:15:=[TRANSACTION_TYPES:31]Credit_Account:5
							RELATE ONE:C42([INVOICES:39]Debtors_Account:15)
							vAccount:=[ACCOUNTS:32]Account_Name:3
							[INVOICES:39]Bank_Account:16:=[TRANSACTION_TYPES:31]Debit_Account:4
							RELATE ONE:C42([INVOICES:39]Bank_Account:16)
							vBAccount:=[ACCOUNTS:32]Account_Name:3
						End if 
						[INVOICES:39]Total_Paid:6:=CCM_R_AuthAmount
						If (CCM_l_cardIDtoAuth#0)
							//Get card type
							If ([xCreditCardDetails:132]x_ID:1#CCM_l_cardIDtoAuth)
								QUERY:C277([xCreditCardDetails:132]; [xCreditCardDetails:132]x_ID:1=CCM_l_cardIDtoAuth)
							End if 
							[INVOICES:39]Cheque_Number:36:=[xCreditCardDetails:132]Card_TypeName:5
						End if 
						
						DB_SaveRecord(->[INVOICES:39])
						Vadd:=$_l_AddMode
						If ((OK=1) & ([INVOICES:39]Posted_Date:8=!00-00-00!) & ([INVOICES:39]Invoice_Date:4>!00-00-00!) & ([INVOICES:39]Period_Code:13#"") & ([INVOICES:39]Total_Paid:6#0))
							$_bo_Posted:=Inv_DepPost
							If (Not:C34($_bo_Posted))
								OK:=0
							End if 
						Else 
							OK:=0
							
						End if 
						CC_t_DepositNumber:=[INVOICES:39]Invoice_Number:1
						UNLOAD RECORD:C212([INVOICES:39])
						READ ONLY:C145([INVOICES:39])
					End if 
					
				Else 
					//The received payment is to be allocated to existing invoices( a receipt)
					
				End if 
				
			End if 
			//Create the auth
			If (CC_t_AuthCode#"") & (CC_t_AuthCode#"00000")
				If (CCM_l_CCAuditID=-91234)
					CCM_l_CCAuditID:=CCM_CreateTransactionRecord("DUMMY"; 0; ->$CCM_Bl_TransRecord; ->$CCM_Bl_TransResponse; ""; "AUTH_ONLY"; CCM_l_cardIDtoAuth; CCM_l_OrderID)
					//$_l_IndexNVOICEID;$_bo_DepositID;$RECEIPTID;$ANTransID)
					
					//This is a dummy create the 'auth record
				End if 
				If (CCM_l_CCAuditID#0)
					$_bo_sOK:=CCM_GetResponseValidFromTrans(CCM_l_CCAuditID)
					If (CCM_l_PreAuthID=0)
						CREATE RECORD:C68([CC_OrderAuths:133])
						[CC_OrderAuths:133]AuthorizationAmount:5:=CCM_R_AuthAmount
						[CC_OrderAuths:133]AuthorizationCode:6:=CC_t_AuthCode
						[CC_OrderAuths:133]AuthorizationDate:4:=Current date:C33(*)
						[CC_OrderAuths:133]CC_RecordID:3:=CCM_l_cardIDtoAuth
						[CC_OrderAuths:133]Order_ID:2:=$2
						[CC_OrderAuths:133]xinvoiceCode:9:=""
						
						[CC_OrderAuths:133]x_ID:1:=AA_GetNextID(->[CC_OrderAuths:133]x_ID:1)
						If ($_bo_sOK)
							[CC_OrderAuths:133]xAuthStatus:7:=1  //awaiting payment
						Else 
							[CC_OrderAuths:133]xAuthStatus:7:=7  //awaiting payment
						End if 
					Else 
						READ WRITE:C146([CC_OrderAuths:133])
						QUERY:C277([CC_OrderAuths:133]; [CC_OrderAuths:133]x_ID:1=CCM_l_PreAuthID)
						//a small amendment here because we can take payment at a lower amount
						[CC_OrderAuths:133]AuthorizationAmount:5:=CCM_R_AuthAmount
					End if 
					[CC_OrderAuths:133]TransactionID:10:=CCM_l_CCAuditID
					If ([CC_OrderAuths:133]AuthorizationCode:6="0000")
						[CC_OrderAuths:133]AuthorizationCode:6:=CC_t_AuthCode
					End if 
					If (CC_t_DepositNumber#"")
						[CC_OrderAuths:133]xDepositCode:8:=CC_t_DepositNumber
						[CC_OrderAuths:133]xAuthStatus:7:=3
						//and put it on the [CCM_PSPTransaction]
						READ WRITE:C146([CCM_PSPTransaction:136])
						QUERY:C277([CCM_PSPTransaction:136]; [CCM_PSPTransaction:136]x_ID:1=CCM_l_CCAuditID)
						[CCM_PSPTransaction:136]xDepositCode:12:=CC_t_DepositNumber
						DB_SaveRecord(->[CCM_PSPTransaction:136])
						UNLOAD RECORD:C212([CCM_PSPTransaction:136])
						
					End if 
					
					
					DB_SaveRecord(->[CC_OrderAuths:133])
					UNLOAD RECORD:C212([CC_OrderAuths:133])
					READ ONLY:C145([CC_OrderAuths:133])
					//and call the order process to refresh
					
					
					SET PROCESS VARIABLE:C370(CCM_l_ParentProcess; DB_l_ButtonClickedFunction; DB_GetButtonFunction("ReloadAuths"))
					
					POST OUTSIDE CALL:C329(CCM_l_ParentProcess)
					
				End if 
			End if 
		End if 
	Else 
		
		SET PROCESS VARIABLE:C370(CCM_l_ParentProcess; DB_l_ButtonClickedFunction; DB_GetButtonFunction("ReloadAuths"))
		POST OUTSIDE CALL:C329(CCM_l_ParentProcess)
		
	End if 
	
End if 
Process_End
ERR_MethodTrackerReturn("CCM_OrderAuthorize"; $_t_oldMethodName)