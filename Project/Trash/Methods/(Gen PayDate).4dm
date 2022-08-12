//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Gen PayDate
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 16/12/2009 14:50`Method: Gen PayDate
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(GEN_al_DropDownMenuID;0)
	//ARRAY LONGINT(WIN_al_CalledFromReference;0)
	//ARRAY LONGINT(WIN_al_ThisWIndowReference;0)
	//ARRAY REAL(INV_ar_InvoiceAlocAmt;0)
	ARRAY TEXT:C222($_at_ContactNames; 0)
	//ARRAY TEXT(GEN_at_DropDownMenu;0)
	//ARRAY TEXT(INV_at_InvContactCodes;0)
	//ARRAY TEXT(INV_at_InvoiceNumbers;0)
	C_BOOLEAN:C305($_bo_Selection; $2; ACC_bo_CurrencyWriteOff; ACC_bo_DebtWriteoff; ACC_bo_LockAmounts; CCM_bo_IsLicenced; CCM_bo_OfflineHandling; GEN_Bo_ShowCreate; INV_HidePaytype; PAY_bo_CreateAuths; WIN_bo_TrackerInited)
	C_DATE:C307(<>DB_d_CurrentDate; $_d_DateOLD; $_d_LastInvoiceDate; $_d_LastStatementDate; $12; $13; SRCH_d_EntryDateTo; vDate; vDelDate)
	C_LONGINT:C283(<>DB_l_LocalLog; <>DB_l_TrackPath; $_l_CCAuditID; $_l_CurrentWinRefOLD; $_l_index; $_l_OK; $_l_PeriodID; $_l_RemDB_TrackPath; $_l_RemDBLocalLog; $_l_RemDBTrackPath; $_l_Selected)
	C_LONGINT:C283($_l_WindowReferenceRow; $4; CCM_l_cardIDtoAuth; CCM_l_CCAuditID; INV_l_CCID; INV_l_PSPID; PAY_l_CARDID; PAY_l_TransactionID; r0; r1; r2)
	C_LONGINT:C283(WIN_l_CurrentWinRef; WIN_l_CurrentWinRefOLD)
	C_POINTER:C301($10; $7; $9)
	C_REAL:C285($_r_Amount; $_r_AmountRequired; $_r_TotalAmountPreAuthd; $3; $8; v0; v31; v61; vPayment; vT1; vTotal)
	C_TEXT:C284(<>SYS_t_BaseCurrency; $_t_oldMethodName; $_t_PeriodCode; $1; $11; $5; $6; ACC_t_CurrencyCode; CC_t_AuthCode; CCM_t_ChequeNo; DB_t_WindowTitle)
	C_TEXT:C284(INV_t_DefaultPaymentType; INV_t_PaymentType; PAY_t_AUTHCODE; vAccount; vbank; vChequeNo; vCountry; vDesc)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Gen PayDate")
//Gen PayDate
If (Count parameters:C259>=11)
	If ([ACCOUNTS:32]Account_Code:2#$11)
		QUERY:C277([ACCOUNTS:32]; [ACCOUNTS:32]Account_Code:2=$1)
	End if 
Else 
	If ([ACCOUNTS:32]Account_Code:2#vbank)
		QUERY:C277([ACCOUNTS:32]; [ACCOUNTS:32]Account_Code:2=vBank)
	End if 
End if 
If (Count parameters:C259>=12)
	$_d_LastStatementDate:=$12
Else 
	$_d_LastStatementDate:=SRCH_d_EntryDateTo
End if 
If (Count parameters:C259>=13)
	$_d_LastInvoiceDate:=$13
Else 
	$_d_LastInvoiceDate:=vDelDate
End if 
vAccount:=[ACCOUNTS:32]Account_Name:3
vChequeNo:=""
vDate:=!00-00-00!


vPayment:=Gen_Round(vTotal; 2; 2)
vDesc:=""
ALL RECORDS:C47([ACCOUNTS:32])
OK:=1
If (ACC_t_CurrencyCode="")
	ACC_t_CurrencyCode:=<>SYS_t_BaseCurrency
End if 
vCountry:=ACC_t_CurrencyCode
//********************************************************* added v631b120l -kmw  *********************************************************
$_l_OK:=1
While (((vDate=!00-00-00!) | (Records in selection:C76([ACCOUNTS:32])#1)) & ($_l_OK=1))
	IDLE:C311
	
	vDate:=<>DB_d_CurrentDate
	While (vDate<=$_d_LastStatementDate)
		IDLE:C311
		vDate:=vDate+1
	End while 
	If (vDate<vDelDate)  //the latest date of those selected
		vDate:=vDelDate
	End if 
	If (Count parameters:C259>=2)
		$_bo_Selection:=$2
	Else 
		$_bo_Selection:=True:C214
		
	End if 
	If (Count parameters:C259>=3)
		$_r_Amount:=$3
	Else 
		$_r_Amount:=0
	End if 
	INV_t_DefaultPaymentType:=""
	If (Count parameters:C259>=4)
		$_l_CCAuditID:=$4
		If ($_l_CCAuditID#0)  //a previous auth single auth passed to  Inv_PaySel2
			INV_t_DefaultPaymentType:="Card"
		Else 
			If (Count parameters:C259>=8)  // card auths-not passed but auths found (array of auths)
				If (Size of array:C274($7->)>0)
					INV_t_DefaultPaymentType:="Card"
				End if 
				$_r_TotalAmountPreAuthd:=$8
				
			Else 
				$_l_CCAuditID:=0
				$_r_TotalAmountPreAuthd:=0
			End if 
		End if 
	End if 
	
	INV_HidePaytype:=False:C215
	If ($1="P")
		INV_HidePaytype:=True:C214
	End if 
	
	If ($_bo_Selection)
		
		Open_Any_Window(261; 398; -1984)
		ACC_bo_LockAmounts:=False:C215
		If ($_r_Amount#0)
			ACC_bo_LockAmounts:=True:C214
		End if 
		INV_t_PaymentType:=""
		
		If (False:C215)  //kmw 08/04/09 v631b120h_7 as Tims crashing problem FINALLY seems to have abated (or at least we havn't had any reports of it since we converted from drop down to option selection). Re-enable this if crashing starts to re-occur.
			//**************added turn on log 11/12/08 -kmw v631b120h_2 -kmw **************
			//TRACE
			$_l_RemDBLocalLog:=<>DB_l_LocalLog
			$_l_RemDB_TrackPath:=<>DB_l_TrackPath
			<>DB_l_LocalLog:=1
			<>DB_l_TrackPath:=1
			//************************************************************************************
		End if 
		
		DIALOG:C40([INVOICES:39]; "dPayment")
		CLOSE WINDOW:C154
		$_l_OK:=OK
		OK:=1
		//Now waits until later in this method before turning off logging, 15/01/09 -kmw v631b120h_4 / v631b120m
		
		//  `************** added turn off log 11/12/08 -kmw v631b120h_2  **************
		//◊DB_l_LocalLog:=$RemDB_l_LocalLog
		//◊DB_l_TrackPath:=$RemDB_l_TrackPath
		//  `************************************************************************************
		If (WIN_bo_TrackerInited)
			$_l_WindowReferenceRow:=Find in array:C230(WIN_al_ThisWIndowReference; WIN_l_CurrentWinRef)
			If ($_l_WindowReferenceRow>0)
				WIN_l_CurrentWinRef:=WIN_al_CalledFromReference{$_l_WindowReferenceRow}
			End if 
		End if 
		
		
		If ($_l_OK=1)
			
			
			If (INV_t_PaymentType="Card")
				$_r_AmountRequired:=0
				Case of 
					: ($_r_TotalAmountPreAuthd>0)  //Multiple pre auth'd
						If (vPayment>$_r_TotalAmountPreAuthd)
							//need extra auth
							$_r_AmountRequired:=vPayment-$_r_TotalAmountPreAuthd
							If ($_r_AmountRequired>0)
								Gen_Alert("Although and amount of "+String:C10($_r_TotalAmountPreAuthd; "########0.00;-########0.00;0")+" is authorised, an additional authorization of "+String:C10($_r_AmountRequired; "########0;-########0;0")+" is required")
								
								
							End if 
						Else 
							$_r_AmountRequired:=Vpayment
						End if 
						
					: ($_r_Amount>0)
						//order auth
						If (vPayment>$_r_Amount)
							//need extra auth
							$_r_AmountRequired:=vPayment-$_r_Amount
						Else 
							$_r_AmountRequired:=Vpayment
						End if 
					Else 
						$_r_AmountRequired:=Vpayment
				End case 
				
				
				If ($_l_CCAuditID=0) & (($_r_TotalAmountPreAuthd=0) | ($_r_AmountRequired#0))  //NOT pre authd
					//if Audit ID >0 this is already authorized
					//if this is a refund we must get the original transaction and refund it
					//if it is a payment then we get authorization for the amount first
					//we need to check if the invoice being paid has an authorization already
					
					
					CCM_LoadServiceProvidersV11(True:C214)
					
					
					
					If (CCM_bo_IsLicenced) | (CCM_bo_OfflineHandling)
						$_l_Selected:=0
						//we should have a list of contacts
						If (Size of array:C274(INV_at_InvContactCodes)>1)
							//have to select which person this will be charged to
							ARRAY TEXT:C222($_at_ContactNames; 0)
							ARRAY TEXT:C222(GEN_at_DropDownMenu; 0)
							ARRAY LONGINT:C221(GEN_al_DropDownMenuID; 0)
							For ($_l_index; 1; Size of array:C274(INV_at_InvContactCodes))
								QUERY:C277([CONTACTS:1]; [CONTACTS:1]Contact_Code:2=INV_at_InvContactCodes{$_l_index})
								APPEND TO ARRAY:C911($_at_ContactNames; [CONTACTS:1]Contact_Name:31)
								APPEND TO ARRAY:C911(GEN_al_DropDownMenuID; $_l_index)
								APPEND TO ARRAY:C911(GEN_at_DropDownMenu; Substring:C12([CONTACTS:1]Contact_Name:31; 1; 55))
							End for 
							
							
							
							DB_t_WindowTitle:="Select person whose credit card is being used"
							$_l_CurrentWinRefOLD:=WIN_l_CurrentWinRef
							WIN_l_CurrentWinRef:=Open window:C153(20; 20; 20; 20; -1986)
							GEN_Bo_ShowCreate:=False:C215
							DIALOG:C40([USER:15]; "Gen_PopUpChoice")
							CLOSE WINDOW:C154
							WIN_l_CurrentWinRef:=$_l_CurrentWinRefOLD
							If (GEN_at_DropDownMenu>0)
								$_l_Selected:=GEN_al_DropDownMenuID{GEN_at_DropDownMenu}
							Else 
								Gen_Alert("You did not select a person to charge")
							End if 
							
						Else 
							$_l_Selected:=Size of array:C274(INV_at_InvContactCodes)
						End if 
						If ($_l_Selected>0)
							//HIDE PROCESS(Current process)
							//here we take the payment BUT we do not create a receipt in this method
							//*********************************************************************************************
							
							$_r_Amount:=CCM_InvoiceAuthorize($5; $6; INV_at_InvContactCodes{$_l_Selected}; $_r_AmountRequired; ACC_t_CurrencyCode; Current process:C322; False:C215)
							
							
							//Note that the AUTH record is not created at this point
							//$_r_Amount is the about of money actually obtained.
							If ($_r_Amount#0)
								PAY_t_AUTHCODE:=CC_t_AuthCode
								PAY_l_CARDID:=CCM_l_cardIDtoAuth
								PAY_l_TransactionID:=CCM_l_CCAuditID
								PAY_bo_CreateAuths:=True:C214
								//CC_t_AuthCode
								//CCM_l_cardIDtoAuth
								vChequeNo:=CCM_t_ChequeNo
								//CCM_R_AuthAmount
								//CC_l_AuthTransID
								If ($_r_Amount#$_r_AmountRequired)
									Gen_Alert("You did not obtain the whole amount by Card. The amount receipted will be the amo"+"unt obtained.")
									VPayment:=$_r_Amount
								End if 
							Else 
								Gen_Alert("You did not obtain money via card. The receipt will be cancelled")
								VPayment:=0
							End if 
							//here we need record the AUTH amounts for the invoices($9») for the amounts??
							
							//$_l_Process:=New process("CCM_InvoiceAuthorize";64000;"Authorize"+$5;$5;$6;INV_at_InvContactCodes{$_l_Selected};$_r_AmountRequired;ACC_t_CurrencyCode;Current process;FALSE;*)
							//SHOW PROCESS($_l_Process)
							//BRING TO FRONT($_l_Process)
							//PAUSE PROCESS(Current process)
							If (INV_l_PSPID>0)  // This is NEVER set !!!!!
								INV_l_CCID:=-INV_l_PSPID  // so THIS NEVER happens
							End if 
							
						End if 
						
						
					End if 
					
				Else 
					//set the authID
					// is enough authd????
					
					If ($_l_CCAuditID>0)
						INV_l_CCID:=$_l_CCAuditID
						
					Else 
						INV_l_CCID:=-901  //use the array Multiple auths
					End if 
					
				End if 
				
			End if 
			
			
			
			
			QUERY:C277([ACCOUNTS:32]; [ACCOUNTS:32]Account_Code:2=vBank)
			$_d_DateOLD:=vDate
			$_l_PeriodID:=Check_Period
			If ($1="I")
				Check_PerCloseI
			Else 
				If ($1="M")
					Check_PerClose
				Else 
					Check_PerCloseP
				End if 
			End if 
			vDate:=$_d_DateOLD
		End if 
		
		
		If (False:C215)  //kmw 08/04/09 v631b120h_7 as Tims crashing problem FINALLY seems to have abated (or at least we havn't had any reports of it since we converted from drop down to option selection). Re-enable this if crashing starts to re-occur.
			
			//Now waits until later in this method before turning off logging, 15/01/09 -kmw v631b120h_4 / v631b120m
			
			//************** added turn off log 11/12/08 -kmw v631b120h_2 -kmw **************
			<>DB_l_LocalLog:=$_l_RemDBLocalLog
			<>DB_l_TrackPath:=$_l_RemDBTrackPath
			//************************************************************************************
		End if 
		
		
	Else 
		
		vT1:=$_r_Amount
		QUERY:C277([ACCOUNTS:32]; [ACCOUNTS:32]Account_Code:2=vBank)
		$_d_DateOLD:=vDate
		Check_Period
		If ($1="I")
			Check_PerCloseI
		Else 
			If ($1="M")
				Check_PerClose
			Else 
				Check_PerCloseP
			End if 
		End if 
		vDate:=$_d_DateOLD
		
	End if 
	
End while 
$_t_PeriodCode:=[PERIODS:33]Period_Code:1
ACC_bo_CurrencyWriteOff:=False:C215
ACC_bo_DebtWriteoff:=False:C215
If ($_bo_Selection)  // in a CC transaction the amount wwill always be in the amount of the invoice
	If ((OK=1) & (DB_GetModuleSettingByNUM(Module_MultiCurrency)>1)) & (ACC_t_CurrencyCode#vCountry)  //4.0.031"
		//currency write offs
		
		ACC_bo_CurrencyWriteOff:=True:C214
		ACC_bo_DebtWriteoff:=False:C215
		
		CurrRate_MostRecent(ACC_t_CurrencyCode; vCountry)
		v0:=vPayment
		CurrRate_Convert(ACC_t_CurrencyCode; ->v0)
		v31:=vTotal
		v61:=Round:C94((v31-v0); 2)
		
		Open_Any_Window(276; 398; -1984)
		DIALOG:C40([INVOICES:39]; "dPayment Curr")
		CLOSE WINDOW:C154
		$_l_OK:=OK
		OK:=1
		If (WIN_bo_TrackerInited)
			$_l_WindowReferenceRow:=Find in array:C230(WIN_al_ThisWIndowReference; WIN_l_CurrentWinRef)
			If ($_l_WindowReferenceRow>0)
				WIN_l_CurrentWinRef:=WIN_al_CalledFromReference{$_l_WindowReferenceRow}
			End if 
		End if 
		If ($_l_OK=1)
			If ($_t_PeriodCode#[PERIODS:33]Period_Code:1)
				QUERY:C277([PERIODS:33]; [PERIODS:33]Period_Code:1=$_t_PeriodCode)
			End if 
			
			
			Case of 
				: (r0=1)
					ACC_t_CurrencyCode:=vCountry
					vPayment:=v0
					v31:=v0
				Else 
					
			End case 
		End if 
		
	Else 
		//here we can allow someone to wipe out amounts
		//```
		If (Vpayment#Vtotal) & (False:C215)
			ACC_bo_CurrencyWriteOff:=False:C215
			ACC_bo_DebtWriteoff:=True:C214
			
			v0:=vPayment
			v31:=vTotal
			v61:=Round:C94((v31-v0); 2)
			r1:=0
			r2:=0
			Open_Any_Window(276; 398; -720)
			DIALOG:C40([INVOICES:39]; "dPaymentReconcile")
			CLOSE WINDOW:C154
			$_l_OK:=OK
			OK:=1
			If (WIN_bo_TrackerInited)
				$_l_WindowReferenceRow:=Find in array:C230(WIN_al_ThisWIndowReference; WIN_l_CurrentWinRef)
				If ($_l_WindowReferenceRow>0)
					WIN_l_CurrentWinRef:=WIN_al_CalledFromReference{$_l_WindowReferenceRow}
				End if 
			End if 
			
			If ($_l_OK=1)
				Case of 
					: (r0=1)
						vPayment:=v0
						v31:=v0
				End case 
				
			End if 
			
		Else 
			v0:=0
			v31:=vPayment
			v61:=0
			r0:=0
			r1:=0
			r2:=0
			
		End if 
		
	End if 
Else 
	v0:=0
	
	Vtotal:=$_r_Amount
	VPayment:=$_r_Amount
	v31:=$_r_Amount
	If (False:C215)
		For ($_l_index; 1; Size of array:C274(INV_at_InvoiceNumbers))
			If (INV_at_InvoiceNumbers{$_l_index}="*D@")
				Vtotal:=Vtotal-(INV_ar_InvoiceAlocAmt{$_l_index})
				VPayment:=VPayment-(INV_ar_InvoiceAlocAmt{$_l_index})
				v31:=V31-(INV_ar_InvoiceAlocAmt{$_l_index})
			End if 
		End for 
	End if 
	v61:=0
	r0:=0
	r1:=0
	r2:=0
	
End if 
ERR_MethodTrackerReturn("Gen PayDate"; $_t_oldMethodName)