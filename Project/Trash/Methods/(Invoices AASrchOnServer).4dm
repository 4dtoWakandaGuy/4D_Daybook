//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Invoices_AASrchOnServer
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
	//ARRAY LONGINT(ACC_al_ADAASelection;0)
	C_BLOB:C604(<>ACC_Blb_ADAABLOB)
	C_BOOLEAN:C305(<>ACC_bo_BlobIsReady)
	C_DATE:C307($_d_InvoiceDate; $1)
	C_TEXT:C284($_t_oldMethodName; $2; Acc_t_AccountCodeFrom)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Invoices_AASrchOnServer")
If (Count parameters:C259>=2)
	$_d_InvoiceDate:=$1
	ARRAY LONGINT:C221(ACC_al_ADAASelection; 0)
	SET BLOB SIZE:C606(<>ACC_Blb_ADAABLOB; 0)
	<>ACC_bo_BlobIsReady:=False:C215
	Acc_t_AccountCodeFrom:=$2
	QUERY:C277([INVOICES:39]; [INVOICES:39]Invoice_Date:4<=$_d_InvoiceDate)
	QUERY:C277([ACCOUNTS:32]; [ACCOUNTS:32]Account_Code:2=Acc_t_AccountCodeFrom)
	If ((OK=1) & (Records in selection:C76([ACCOUNTS:32])>0))
		QUERY SELECTION:C341([INVOICES:39]; [INVOICES:39]Debtors_Account:15=Acc_t_AccountCodeFrom)
		QUERY SELECTION BY FORMULA:C207([INVOICES:39]; Invoices_AASrch)
		LONGINT ARRAY FROM SELECTION:C647([INVOICES:39]; ACC_al_ADAASelection)
		VARIABLE TO BLOB:C532(ACC_al_ADAASelection; <>ACC_Blb_ADAABLOB)
		<>ACC_bo_BlobIsReady:=True:C214
		Repeat 
			DelayTicks(60*10)
			
		Until (<>ACC_bo_BlobIsReady=False:C215)
		SET BLOB SIZE:C606(<>ACC_Blb_ADAABLOB; 0)
	End if 
End if 
ERR_MethodTrackerReturn("Invoices_AASrchOnServer"; $_t_oldMethodName)