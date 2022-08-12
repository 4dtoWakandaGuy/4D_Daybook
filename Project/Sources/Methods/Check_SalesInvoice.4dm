//%attributes = {}
If (False:C215)
	//Project Method Name:      Check_SalesInvoice
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 25/03/2010 05:31
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(SVS_at_PreviewEvent;0)
	C_BOOLEAN:C305($_bo_QueryInvoices; $3)
	C_LONGINT:C283(<>SYS_l_WindowTop; $_l_CurrentWinRefOLD; $_l_DockRight; $_l_WindowBottom; $_l_WindowLeft; $_l_WindowRIght; $_l_WindowTop; WIN_l_CurrentWinRef; WIN_l_CurrentWinRefOLD; xNew)
	C_POINTER:C301($1; $2)
	C_TEXT:C284($_t_CurrentFormUsage; $_t_InvoiceCode; $_t_InvoiceNumber; $_t_oldMethodName; $_t_OrderCode; DB_t_CurrentFormUsage; SI_t_InvoiceNo; vPurchase)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Check_SalesInvoice")
//Check_Contact (->[ORDERS]Contact Code;->[ORDERS]Company Code;->[ORDERS])
$_t_CurrentFormUsage:=DB_t_CurrentFormUsage
xNew:=0
vPurchase:=""


$_t_InvoiceCode:=$1->
$1->:=""
If (Count parameters:C259>=3)  //send false in here if you already have the selection
	$_bo_QueryInvoices:=$3
Else 
	$_bo_QueryInvoices:=True:C214
End if 
If ($_bo_QueryInvoices)
	QUERY:C277([INVOICES:39]; [INVOICES:39]Invoice_Number:1=$_t_InvoiceCode)
End if 
If (Count parameters:C259>=2)
	If ($2->#"")
		QUERY SELECTION:C341([INVOICES:39]; [INVOICES:39]Company_Code:2=$2->)
	End if 
End if 
If (Records in selection:C76([INVOICES:39])=0)
	If ($_t_InvoiceCode#"")
		QUERY:C277([INVOICES:39]; [INVOICES:39]Invoice_Number:1=$_t_InvoiceCode+"@")
		If (Count parameters:C259>=2)
			If ($2->#"")
				QUERY SELECTION:C341([INVOICES:39]; [INVOICES:39]Company_Code:2=$2->)
			End if 
		End if 
	End if 
End if 

If (Records in selection:C76([INVOICES:39])>0)
	If (Records in selection:C76([INVOICES:39])=1)
		$_t_InvoiceNumber:=[INVOICES:39]Invoice_Number:1
		If (Count parameters:C259>=2)
			$2->:=[INVOICES:39]Company_Code:2
		End if 
	Else 
		Check_DispNum(->[INVOICES:39]; "invoices")
		If (OK=1)
			GET WINDOW RECT:C443($_l_WindowLeft; $_l_WindowTop; $_l_WindowRIght; $_l_WindowBottom)
			$_l_CurrentWinRefOLD:=WIN_l_CurrentWinRef
			If ($_l_WindowTop>0)
				WIN_l_CurrentWinRef:=Open window:C153(($_l_WindowLeft+10); $_l_WindowTop+10; $_l_WindowLeft+10; $_l_WindowTop+10; 4; "Select an invoice"; "Close_Cancel")
				
			Else 
				$_l_DockRight:=INT_GetDock("R")
				
				WIN_l_CurrentWinRef:=Open window:C153((Screen width:C187-$_l_DockRight)-372; <>SYS_l_WindowTop+50; Screen width:C187-$_l_DockRight; <>SYS_l_WindowTop+266; 4; "Select an Order"; "Close_Cancel")
			End if 
			SI_t_InvoiceNo:=""
			DIALOG:C40([INVOICES:39]; "dask_Invoices")
			CLOSE WINDOW:C154
			WIN_l_CurrentWinRef:=$_l_CurrentWinRefOLD
			WS_KeepFocus
			
			Array_LCx(0)
			ARRAY TEXT:C222(SVS_at_PreviewEvent; 0)
			WS_KeepFocus
			If (xNew=1)
				
			Else 
				If (OK=0)
					GOTO OBJECT:C206($_t_OrderCode)
				End if 
				$1->:=SI_t_InvoiceNo
				If (Count parameters:C259>=2)
					QUERY:C277([INVOICES:39]; [INVOICES:39]Invoice_Number:1=SI_t_InvoiceNo)
					$2->:=[INVOICES:39]Company_Code:2
				End if 
			End if 
			DB_t_CurrentFormUsage:=$_t_CurrentFormUsage
			
		End if 
		
	End if 
Else 
	$_t_OrderCode:=""
End if 
ERR_MethodTrackerReturn("Check_SalesInvoice"; $_t_oldMethodName)