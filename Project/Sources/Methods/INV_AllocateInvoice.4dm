//%attributes = {}
If (False:C215)
	//Project Method Name:      INV_AllocateInvoice
	//------------------ Method Notes ------------------
	//This method is used to allocate an invoice to a credit note..ie pay the invoice with the credit note
	//this is called from the credit note(I have not created a way to pay an invoice with a credit note
	//Inv_Accept (False)  `this is the LPA
	
	//------------------ Revision Control ----------------
	//Date Created: 01/04/2010 20:52
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(INV_abo_Select;0)
	//ARRAY INTEGER(viSelect;0)
	//ARRAY LONGINT(WIN_al_CalledFromReference;0)
	//ARRAY LONGINT(WIN_al_ThisWIndowReference;0)
	//ARRAY REAL(GEN_ar_Value;0)
	ARRAY TEXT:C222($_at_DepositNumbers; 0)
	//ARRAY TEXT(GEN_at_Name;0)
	//ARRAY TEXT(GEN_at_RecordCode;0)
	C_BOOLEAN:C305($_bo_StartNewTransaction; WIN_bo_TrackerInited)
	C_LONGINT:C283($_l_CurrentRow; $_l_Index; $_l_SelectedRecordNumber; $_l_WindowReferenceRow; GEN_l_NameSelected; INV_l_AllocationPage; vIn; WIN_l_CurrentWinRef)
	C_REAL:C285($_r_Amount; V31)
	C_TEXT:C284($_t_CompanyCode; $_t_InvoiceNumber; $_t_oldMethodName; vTitle; vTitle2)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("INV_AllocateInvoice")
$_bo_StartNewTransaction:=False:C215
//If (In transaction)
//Transact_End
//$_bo_StartNewTransaction:=True
//End if
$_l_SelectedRecordNumber:=Selected record number:C246([INVOICES:39])
COPY NAMED SELECTION:C331([INVOICES:39]; "CurrentSelection")
$_t_InvoiceNumber:=[INVOICES:39]Invoice_Number:1
$_r_Amount:=[INVOICES:39]Total_Due:7
ONE RECORD SELECT:C189([INVOICES:39])
CREATE SET:C116([INVOICES:39]; "Invoice")

$_t_CompanyCode:=[INVOICES:39]Company_Code:2
V31:=[INVOICES:39]Total_Due:7
QUERY:C277([INVOICES:39]; [INVOICES:39]Company_Code:2=$_t_CompanyCode; *)
QUERY:C277([INVOICES:39];  & ; [INVOICES:39]State:10>=-1; *)
QUERY:C277([INVOICES:39];  & ; [INVOICES:39]Total_Due:7>0)
//Here user needs to select the Invoice
ARRAY TEXT:C222(GEN_at_Name; Records in selection:C76([INVOICES:39]))
ARRAY TEXT:C222(GEN_at_RecordCode; Records in selection:C76([INVOICES:39]))
ARRAY REAL:C219(GEN_ar_Value; Records in selection:C76([INVOICES:39]))
If (Records in selection:C76([INVOICES:39])>0)
	FIRST RECORD:C50([INVOICES:39])
	
	For ($_l_Index; 1; Records in selection:C76([INVOICES:39]))
		GEN_at_Name{$_l_Index}:=[INVOICES:39]Invoice_Number:1
		//invert the amount due as this the amount due TO the client
		GEN_at_RecordCode{$_l_Index}:=String:C10([INVOICES:39]Total_Due:7; "|Accounts")
		GEN_ar_Value{$_l_Index}:=Num2(GEN_at_RecordCode{$_l_Index})
		NEXT RECORD:C51([INVOICES:39])
	End for 
	
	Open_Any_Window(257; 457; -1984)
	INV_l_AllocationPage:=3
	vTitle:="INVOICE ALLOCATION"
	vTitle2:="To be"+Char:C90(13)+"Allocated"
	DIALOG:C40([INVOICES:39]; "dAllocation")
	INV_l_AllocationPage:=0
	CLOSE WINDOW:C154
	If (WIN_bo_TrackerInited)
		$_l_WindowReferenceRow:=Find in array:C230(WIN_al_ThisWIndowReference; WIN_l_CurrentWinRef)
		If ($_l_WindowReferenceRow>0)
			WIN_l_CurrentWinRef:=WIN_al_CalledFromReference{$_l_WindowReferenceRow}
		End if 
	End if 
	CREATE EMPTY SET:C140([INVOICES:39]; "Invoicess")
	GEN_l_NameSelected:=0
	For ($_l_Index; 1; Size of array:C274(INV_abo_Select))
		If (INV_abo_Select{$_l_Index})
			GEN_l_NameSelected:=1
		End if 
	End for 
	If (GEN_l_NameSelected=1)
		ARRAY TEXT:C222($_at_DepositNumbers; Size of array:C274(INV_abo_Select))
		$_l_CurrentRow:=0
		For ($_l_Index; 1; Size of array:C274(INV_abo_Select))
			If (INV_abo_Select{$_l_Index})
				QUERY:C277([INVOICES:39]; [INVOICES:39]Invoice_Number:1=GEN_at_Name{$_l_Index})
				ADD TO SET:C119([INVOICES:39]; "Invoicess")
			End if 
		End for 
		UNION:C120("Invoicess"; "Invoice"; "Invoice")
		USE SET:C118("invoice")
		CLEAR SET:C117("Invoice")
		CLEAR SET:C117("Invoicess")
		
		If (Records in selection:C76([INVOICES:39])>1)
			Invoices_Pay2(False:C215; 0; 0; False:C215; True:C214)
		Else 
			Gen_Alert("Allocation cancelled")
			CLEAR SET:C117("Invoice")
		End if 
		
	Else 
		Gen_Alert("Allocation cancelled-no Invoices_Selected")
		CLEAR SET:C117("Invoice")
	End if 
	
Else 
	Gen_Alert("There are no due invoices for this company"; "OK")
	CLEAR SET:C117("Invoice")
End if 

QUERY:C277([INVOICES:39]; [INVOICES:39]Invoice_Number:1=$_t_InvoiceNumber)
If ($_bo_StartNewTransaction)
	START TRANSACTION:C239
	
End if 
//USE NAMED SELECTION("CurrentSelection")
//GOTO SELECTED RECORD([INVOICES];$_l_SelectedRecordNumber)
Invoices_InLPBB
Invoices_InLPß("B")
vIn:=0
ERR_MethodTrackerReturn("INV_AllocateInvoice"; $_t_oldMethodName)