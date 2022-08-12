//%attributes = {}
If (False:C215)
	//Project Method Name:      Invoices_Mod
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 17/06/2010 21:25
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($_bo_AutoFind)
	C_LONGINT:C283(vIn)
	C_TEXT:C284($_t_EventCodeFind; $_t_oldMethodName; $1; $2)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Invoices_Mod")
READ ONLY:C145([TRANSACTION_TYPES:31])
QUERY:C277([TRANSACTION_TYPES:31]; [TRANSACTION_TYPES:31]Transaction_Type_Code:1=DB_GetLedgerTRANSINVpost)
If ((DB_GetLedgerTRANSINVpost#"") & (Records in selection:C76([TRANSACTION_TYPES:31])=1) & (DB_GetLedgerVatInputACC#""))
	If (Count parameters:C259>=2)
		$_bo_AutoFind:=($2="TRUE")
		$_t_EventCodeFind:=$1
	End if 
	Gen_Mod(Term_SLPLWT("View Sales Ledger"); "Invoices_File"; "IMaster"; ->[INVOICES:39]; ->vIn; "Invoices_Sel"; Term_SLPLWT("Sales Ledger Items"); $_bo_AutoFind; $_t_EventCodeFind)
	
Else 
	Gen_Alert("Required Setups have not been completed"; "")
End if 
ERR_MethodTrackerReturn("Invoices_Mod"; $_t_oldMethodName)