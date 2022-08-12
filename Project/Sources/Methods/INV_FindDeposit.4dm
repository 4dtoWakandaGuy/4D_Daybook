//%attributes = {}
If (False:C215)
	//Project Method Name:      INV_FindDeposit
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 02/11/2009 21:13
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_Index; $1; $2)
	C_REAL:C285($_r_TotalDue2; $_r_TotalPaid2; $_r_TotalPaid3)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("INV_FindDeposit")
//This method will find any deposits relating to an order
If (Count parameters:C259>=2)
	QUERY:C277([INVOICES:39]; [INVOICES:39]X_DepositRelatedTable:44=$1; *)
	QUERY:C277([INVOICES:39];  & ; [INVOICES:39]X_DepositRelatedRecordID:45=$2)
	CREATE EMPTY SET:C140([INVOICES:39]; "UnCleared")
	If (Records in selection:C76([INVOICES:39])>0)
		For ($_l_Index; 1; Records in selection:C76([INVOICES:39]))
			$_r_TotalPaid2:=INV_CalculateAllocations([INVOICES:39]Invoice_Number:1; True:C214)
			If ($_r_TotalPaid2<0)
				$_r_TotalPaid2:=Abs:C99($_r_TotalPaid2)
				$_r_TotalPaid3:=$_r_TotalPaid2
			Else 
				$_r_TotalPaid2:=-($_r_TotalPaid2)
				$_r_TotalPaid3:=$_r_TotalPaid2
				
			End if 
			$_r_TotalDue2:=Gen_Round(([INVOICES:39]Total_Paid:6-$_r_TotalPaid2); 2; 2)
			If ($_r_TotalDue2#0)
				ADD TO SET:C119([INVOICES:39]; "Uncleared")
			End if 
			NEXT RECORD:C51([INVOICES:39])
		End for 
		USE SET:C118("Uncleared")
	End if 
End if 
ERR_MethodTrackerReturn("INV_FindDeposit"; $_t_oldMethodName)