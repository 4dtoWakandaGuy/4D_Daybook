//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      TransB Mod
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 01/09/2009 16:55
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY LONGINT:C221($_al_BatchNumbers; 0)
	C_BOOLEAN:C305(<>ViewLists; ACC_bo_ConsilidatedView)
	C_LONGINT:C283(<>DB_l_CBShowLinkedRecord; $_l_BatchNumber; vNo; vTr)
	C_TEXT:C284($_t_FormReference; $_t_InvoiceNumber; $_t_oldMethodName; $_t_PurchaseInvoiceNumber; $1; $2; $3; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; WIN_t_CurrentInputForm)
	C_TEXT:C284(WIN_t_CurrentOutputform)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("TransB Mod")
//transB mod
$_l_BatchNumber:=0
$_t_InvoiceNumber:=""
$_t_PurchaseInvoiceNumber:=""
If (Count parameters:C259>=1)
	$_l_BatchNumber:=Num:C11($1)
	If (Count parameters:C259>=2)
		$_t_InvoiceNumber:=$2
		If (Count parameters:C259>=3)
			$_t_PurchaseInvoiceNumber:=$3
		End if 
	End if 
	
	//$21=Batch number
	//$2=Invoice Number
	//$3=PI Number
	//  etc
End if 
ACC_bo_ConsilidatedView:=True:C214

Start_Process
TransB_File
While (vTr=1)
	If ($_l_BatchNumber=0) & ($_t_InvoiceNumber="") & ($_t_PurchaseInvoiceNumber="")
		TransB_Sel
	Else 
		If ($_l_BatchNumber>0)
			vTr:=1
			QUERY:C277([TRANSACTION_BATCHES:30]; [TRANSACTION_BATCHES:30]Batch_Number:10=$_l_BatchNumber)
		Else 
			If ($_t_InvoiceNumber#"")
				vTr:=1
				QUERY:C277([TRANSACTION_BATCH_ITEMS:155]; [TRANSACTION_BATCH_ITEMS:155]Invoice_Number:4=$_t_InvoiceNumber)
				SELECTION TO ARRAY:C260([TRANSACTION_BATCH_ITEMS:155]Transaction_Batch_Code:31; $_al_BatchNumbers)
				QUERY WITH ARRAY:C644([TRANSACTION_BATCHES:30]Batch_Number:10; $_al_BatchNumbers)
				
			Else 
				If ($_t_PurchaseInvoiceNumber#"")
					vTr:=1
					
					QUERY:C277([TRANSACTION_BATCH_ITEMS:155]; [TRANSACTION_BATCH_ITEMS:155]Purchase_Invoice_Code:22=$_t_PurchaseInvoiceNumber)
					SELECTION TO ARRAY:C260([TRANSACTION_BATCH_ITEMS:155]Transaction_Batch_Code:31; $_al_BatchNumbers)
					QUERY WITH ARRAY:C644([TRANSACTION_BATCHES:30]Batch_Number:10; $_al_BatchNumbers)
					
				Else 
					TransB_Sel
				End if 
			End if 
		End if 
	End if 
	
	If (vTr=1)
		If (Records in selection:C76([TRANSACTION_BATCHES:30])>0)
			vNo:=Records in selection:C76([TRANSACTION_BATCHES:30])
			ORDER BY:C49([TRANSACTION_BATCHES:30]; [TRANSACTION_BATCHES:30]Batch_Number:10; >)
			DB_t_CurrentFormUsage:="View"
			$_t_FormReference:=""
			If (((<>ViewLists=False:C215) | (<>DB_l_CBShowLinkedRecord=1)) & (Records in selection:C76([TRANSACTION_BATCHES:30])=1) & (Not:C34(Read only state:C362([TRANSACTION_BATCHES:30]))))
				<>DB_l_CBShowLinkedRecord:=0  // always reset this-it gets loaded again
				
				Open_Pro_Window("View Batches"; 0; 1; ->[TRANSACTION_BATCHES:30]; WIN_t_CurrentInputForm)
				$_t_FormReference:=Table name:C256(->[TRANSACTION_BATCHES:30])+"_"+WIN_t_CurrentInputForm
				MODIFY RECORD:C57([TRANSACTION_BATCHES:30]; *)
			Else 
				Open_Pro_Window("View Batches"; 0; 1; ->[TRANSACTION_BATCHES:30]; WIN_t_CurrentOutputform)
				
				Gen_Mod2("Master"; ->[TRANSACTION_BATCHES:30]; "Batches")
			End if 
			If ($_t_FormReference#"")
				Close_ProWin($_t_FormReference)
			Else 
				Close_ProWin
			End if 
			vTr:=0
		Else 
			Gen_None("Transaction Batches"; ->vTr)
		End if 
	End if 
End while 
Process_End
ERR_MethodTrackerReturn("TransB Mod"; $_t_oldMethodName)
