If (False:C215)
	//object Name: [INVOICES]Invoices_In.Variable14
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 01/08/2012 19:26
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY LONGINT:C221($_al_TransactionIDs; 0)
	//ARRAY LONGINT(INV_al_AuthRecord;0)
	//ARRAY TEXT(INV_at_CCAuth;0)
	C_TEXT:C284($_t_oldMethodName; CCM_t_PaymentHeader)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [INVOICES].Invoices_In.Variable14"; Form event code:C388)
CCM_t_PaymentHeader:="Transaction activity for invoice "+[INVOICES:39]Invoice_Number:1
If (Size of array:C274(INV_at_CCAuth)>0)
	QUERY WITH ARRAY:C644([CC_OrderAuths:133]x_ID:1; INV_al_AuthRecord)
	SELECTION TO ARRAY:C260([CC_OrderAuths:133]TransactionID:10; $_al_TransactionIDs)
	QUERY WITH ARRAY:C644([CCM_PSPTransaction:136]x_ID:1; $_al_TransactionIDs)
	READ WRITE:C146([CCM_PSPTransaction:136])
	QUERY SELECTION:C341([CCM_PSPTransaction:136]; [CCM_PSPTransaction:136]xInvoiceID:11="")
	APPLY TO SELECTION:C70([CCM_PSPTransaction:136]; [CCM_PSPTransaction:136]xInvoiceID:11:=[INVOICES:39]Invoice_Number:1)
	UNLOAD RECORD:C212([CCM_PSPTransaction:136])
	
	
	CCM_ShowDetails(Table:C252(->[INVOICES:39]); ->[INVOICES:39]Invoice_Number:1)
End if 
ERR_MethodTrackerReturn("OBJ [INVOICES].Invoices_In.Variable14"; $_t_oldMethodName)
