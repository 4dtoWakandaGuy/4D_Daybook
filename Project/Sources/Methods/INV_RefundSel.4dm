//%attributes = {}

If (False:C215)
	//Project Method Name:      INV_RefundSel
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created:  26/02/2020
	//Created BY:  Unknown
	
	//Date Modified:
	//Modified By: Nigel Greenlee
	//Modification notes
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_Continue; $_bo_NoCreditCard; $_bo_Posted; $_bo_Unlocked; $_bo_Warnings; $1; $3; vMod3)
	C_LONGINT:C283($_l_CCAuditID; $_l_Index; $_l_RecordsInSelection; $_l_RecordsinSelectionInvoices; $_l_TimeOut)
	C_REAL:C285($2)
	C_TEXT:C284($_t_DepositNumber; $_t_oldMethodName; $_t_RefundNumber; ACC_t_CurrencyCode; vTitle1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("INV_RefundSel")

//NG May 2005
//This method will refund a  deposit
//this is done by creating and positng a negative deposit and then allocation the  negative deposit to the deposit
$_t_oldMethodName:=ERR_MethodTracker("INV_RefundSel")
COPY NAMED SELECTION:C331([INVOICES:39]; "$PaySel")
If (Count parameters:C259=0)  //If the parameters are passed the current selection is used
	
	USE SET:C118("Userset")
Else 
	USE NAMED SELECTION:C332("$PAYSEL")
	COPY NAMED SELECTION:C331([INVOICES:39]; "$PaySel")
End if 
If (Count parameters:C259>=1)
	$_bo_Warnings:=$1
Else 
	$_bo_Warnings:=True:C214
End if 
If (Count parameters:C259>=3)
	$_bo_NoCreditCard:=$3
Else 
	$_bo_NoCreditCard:=False:C215
End if 
If (Records in selection:C76([INVOICES:39])>0)
	
	$_l_RecordsInSelection:=Records in selection:C76([INVOICES:39])
	QUERY SELECTION:C341([INVOICES:39]; [INVOICES:39]X_Reversed:47=0)
	CREATE SET:C116([INVOICES:39]; "$Deposits")
	
	QUERY SELECTION:C341([INVOICES:39]; [INVOICES:39]State:10#-2)
	//Find a Deposit
	If (Records in selection:C76([INVOICES:39])=0)
		USE SET:C118("$Deposits")
		
		CREATE EMPTY SET:C140([INVOICES:39]; "$Receipted")
		For ($_l_Index; 1; Records in selection:C76([INVOICES:39]))
			//check they have not been allocated
			If ([INVOICES:39]Total_Due:7=0)
				ADD TO SET:C119([INVOICES:39]; "$Receipted")
			End if 
			NEXT RECORD:C51([INVOICES:39])
		End for 
		DIFFERENCE:C122("$Deposits"; "$Receipted"; "$Deposits")
		USE SET:C118("$Deposits")
		
		If (Records in set:C195("Receipted")>0)
			//warn which ones will not be receipted
		End if 
		If ($_bo_Warnings)
			Gen_Alert("Note: This will refund the whole amount, if you have entered an incorrect deposit"+" amount you should then re-enter the correct amount")
		End if 
		$_l_RecordsinSelectionInvoices:=Records in selection:C76([INVOICES:39])
		$_bo_Continue:=True:C214
		FIRST RECORD:C50([INVOICES:39])
		While ((Not:C34(End selection:C36([INVOICES:39]))) & ($_bo_Continue))
			$_bo_Unlocked:=Check_Locked(->[INVOICES:39]; 1)
			If (Not:C34($_bo_Unlocked))
				Invoices_InLPTi
				Gen_Confirm(vTitle1+" "+[INVOICES:39]Invoice_Number:1+" is locked by another user.  The deposit cannot be refunded."; "Wait"; "Stop")
				If (OK=0)
					$_bo_Unlocked:=False:C215
					$_bo_Continue:=False:C215
				Else 
					Repeat 
						$_l_TimeOut:=0
						Repeat 
							$_bo_Unlocked:=Check_Locked(->[INVOICES:39]; 1)
							If (Not:C34($_bo_Unlocked))
								$_l_TimeOut:=$_l_TimeOut+1
							End if 
							DelayTicks(60)
						Until ($_bo_Unlocked=True:C214) | ($_l_TimeOut>100)
						If (Not:C34($_bo_Unlocked))
							Gen_Confirm(vTitle1+" "+[INVOICES:39]Invoice_Number:1+" is STILL locked by another user.  The deposit still  cannot be refunded."; "Wait"; "Stop")
						End if 
						$_bo_Continue:=(OK=1)
					Until ($_bo_Unlocked=True:C214) | (Not:C34($_bo_Continue))
					
				End if 
			End if 
			If (Not:C34($_bo_Unlocked))
				//NG Change here
				Gen_Alert(vTitle1+" "+[INVOICES:39]Invoice_Number:1+" is locked by another user.  The deposit cannot be refunded."; "Cancel")
				$_bo_Continue:=False:C215
			End if 
			NEXT RECORD:C51([INVOICES:39])
		End while 
		If ($_bo_Continue)
			For ($_l_Index; 1; $_l_RecordsinSelectionInvoices)
				
				//I am told that we pay the deposit back out of a different account.!
				GOTO SELECTED RECORD:C245([INVOICES:39]; $_l_Index)
				
				$_t_DepositNumber:=[INVOICES:39]Invoice_Number:1
				QUERY:C277([CCM_PSPTransaction:136]; [CCM_PSPTransaction:136]xDepositCode:12=$_t_DepositNumber)
				$_l_CCAuditID:=[CCM_PSPTransaction:136]x_ID:1
				DUPLICATE RECORD:C225([INVOICES:39])
				[INVOICES:39]Invoice_Date:4:=Current date:C33(*)
				
				vMod3:=[INVOICES:39]Cash_TAX:41
				ACC_t_CurrencyCode:=[INVOICES:39]Currency_Code:27
				InvP_No
				Check_Period(Current date:C33(*))
				
				Check_PerCloseI
				[INVOICES:39]Period_Code:13:=[PERIODS:33]Period_Code:1
				[INVOICES:39]Total_Due:7:=-([INVOICES:39]Total_Due:7)
				[INVOICES:39]Total_Paid:6:=-([INVOICES:39]Total_Paid:6)
				DB_SaveRecord(->[INVOICES:39])
				$_t_RefundNumber:=[INVOICES:39]Invoice_Number:1
				//Now post the inverse deposit
				$_bo_Posted:=Inv_DepPost
				If ($_bo_Posted)
					//Now create an allocation
					QUERY:C277([INVOICES:39]; [INVOICES:39]Invoice_Number:1=$_t_DepositNumber; *)
					QUERY:C277([INVOICES:39];  | ; [INVOICES:39]Invoice_Number:1=$_t_RefundNumber)
					If ($_bo_NoCreditCard)
						Inv_PaySel2(False:C215; 0; 0; "Refund"; False:C215; False:C215)
					Else 
						Inv_PaySel2(False:C215; 0; $_l_CCAuditID; "Refund")
					End if 
					USE SET:C118("$Deposits")
					GOTO SELECTED RECORD:C245([INVOICES:39]; $_l_Index)
					[INVOICES:39]X_Reversed:47:=1
					DB_SaveRecord(->[INVOICES:39])
				End if 
			End for 
		Else 
			Gen_Alert("The deposit has not been refunded")
		End if 
	Else 
		Gen_Alert("You can refund anything other than an unreceipted deposit")
	End if 
	USE NAMED SELECTION:C332("$PaySel")
	
	
Else 
	Gen_Alert("No Deposits selected to refund")
	
End if 
ERR_MethodTrackerReturn("INV_RefundSel"; $_t_oldMethodName)