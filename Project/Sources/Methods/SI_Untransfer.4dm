//%attributes = {}
If (False:C215)
	//Project Method Name:      SI_Untransfer
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 31/08/2009 17:16
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_AllocationsIndex; $_l_Index)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("SI_Untransfer")
READ WRITE:C146([INVOICES:39])
ALL RECORDS:C47([INVOICES:39])
For ($_l_Index; 1; Records in selection:C76([INVOICES:39]))
	QUERY:C277([INVOICES_ALLOCATIONS:162]; [INVOICES_ALLOCATIONS:162]INVOICES_CODE:6=[INVOICES:39]Invoice_Number:1)
	For ($_l_AllocationsIndex; 1; Records in selection:C76([INVOICES_ALLOCATIONS:162]))
		[INVOICES_ALLOCATIONS:162]xTransferred:4:=0
		DB_SaveRecord(->[INVOICES_ALLOCATIONS:162])
		
		NEXT RECORD:C51([INVOICES_ALLOCATIONS:162])
	End for 
	SAVE RECORD:C53([INVOICES:39])
	NEXT RECORD:C51([INVOICES:39])
End for 
UNLOAD RECORD:C212([INVOICES:39])
ERR_MethodTrackerReturn("SI_Untransfer"; $_t_oldMethodName)
