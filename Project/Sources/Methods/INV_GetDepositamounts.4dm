//%attributes = {}
If (False:C215)
	//Project Method Name:      INV_GetDepositamounts
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
	C_LONGINT:C283($_l_Index; $2; INV_l_GetDepositProcess)
	C_REAL:C285($_r_CCDeposits; $_r_TotalDeposits; INV_R_CCDeposit; INV_R_totalDeposit)
	C_TEXT:C284($_t_oldMethodName; $1)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("INV_GetDepositamounts")

//This method runs in  its own process; It is called specifically from the Ballocate button on an invoice
//this will check for a deposit relating to the order code passed in $1 and return to the variables in teh calling process $2 the values in variables
If (Count parameters:C259>=2)
	
	QUERY:C277([ORDERS:24]; [ORDERS:24]Order_Code:3=$1)
	If (Records in selection:C76([ORDERS:24])=1)
		QUERY:C277([INVOICES:39]; [INVOICES:39]X_DepositRelatedTable:44=Table:C252(->[ORDERS:24]); *)
		QUERY:C277([INVOICES:39];  & ; [INVOICES:39]X_DepositRelatedRecordID:45=[ORDERS:24]x_ID:58; *)
		QUERY:C277([INVOICES:39];  & ; [INVOICES:39]Invoice_Number:1="*D@"; *)
		QUERY:C277([INVOICES:39];  & ; [INVOICES:39]Total_Due:7#0)
		If (Records in selection:C76([INVOICES:39])>0)
			$_r_TotalDeposits:=Abs:C99(Sum:C1([INVOICES:39]Total_Due:7))
			CREATE EMPTY SET:C140([INVOICES:39]; "BYCC")
			
			For ($_l_Index; 1; Records in selection:C76([INVOICES:39]))
				QUERY:C277([CC_OrderAuths:133]; [CC_OrderAuths:133]xDepositCode:8=[INVOICES:39]Invoice_Number:1)
				If (Records in selection:C76([CC_OrderAuths:133])>0)
					ADD TO SET:C119([INVOICES:39]; "BYCC")
				End if 
				NEXT RECORD:C51([INVOICES:39])
				
			End for 
			USE SET:C118("BYCC")
			$_r_CCDeposits:=Abs:C99(Sum:C1([INVOICES:39]Total_Due:7))
			
		End if 
	End if 
	
	SET PROCESS VARIABLE:C370($2; INV_R_totalDeposit; $_r_TotalDeposits)
	SET PROCESS VARIABLE:C370($2; INV_R_CCDeposit; $_r_CCDeposits)
	SET PROCESS VARIABLE:C370($2; INV_l_GetDepositProcess; 0)
End if 
ERR_MethodTrackerReturn("INV_GetDepositamounts"; $_t_oldMethodName)