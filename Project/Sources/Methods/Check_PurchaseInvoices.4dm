//%attributes = {}
If (False:C215)
	//Project Method Name:      Check_PurchaseInvoices
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 16/10/2013 22:30
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305($3)
	C_LONGINT:C283(<>SYS_l_WindowTop; $_l_CurrentWinRefOLD; $_l_DockRight; $_l_WindowBottom; $_l_WindowLeft; $_l_WindowRIght; $_l_WindowTop; WIN_l_CurrentWinRef; WIN_l_CurrentWinRefOLD; xNew)
	C_POINTER:C301($1; $2)
	C_TEXT:C284($_t_CurrentFormUsage; $_t_oldMethodName; DB_t_CurrentFormUsage; PI_S20_PurchaseInvoice; vPurchase)
End if 

//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("Check_PurchaseInvoices")

//Check_Contact (->[ORDERS]Contact Code;->[ORDERS]Company Code;->[ORDERS])
$_t_CurrentFormUsage:=DB_t_CurrentFormUsage
xNew:=0
vPurchase:=""
QUERY:C277([PURCHASE_INVOICES:37]; [PURCHASE_INVOICES:37]Purchase_Code:1=$1->; *)
QUERY:C277([PURCHASE_INVOICES:37];  | ; [PURCHASE_INVOICES:37]Purchase_Invoice_Number:4=$1->)
If (Count parameters:C259>=2)
	If ($2->#"")
		QUERY SELECTION:C341([PURCHASE_INVOICES:37]; [PURCHASE_INVOICES:37]Company_Code:2=$2->)
	End if 
End if 
If (Records in selection:C76([PURCHASE_INVOICES:37])=0)
	QUERY:C277([PURCHASE_INVOICES:37]; [PURCHASE_INVOICES:37]Purchase_Code:1=$1->+"@"; *)
	QUERY:C277([PURCHASE_INVOICES:37];  | ; [PURCHASE_INVOICES:37]Purchase_Invoice_Number:4=$1->+"@")
	If (Count parameters:C259>=2)
		If ($2->#"")
			QUERY SELECTION:C341([PURCHASE_INVOICES:37]; [PURCHASE_INVOICES:37]Company_Code:2=$2->)
		End if 
	End if 
End if 
If (Records in selection:C76([PURCHASE_INVOICES:37])>0)
	If (Records in selection:C76([PURCHASE_INVOICES:37])=1)
		$1->:=[PURCHASE_INVOICES:37]Purchase_Code:1
	Else 
		Check_DispNum(->[PURCHASE_INVOICES:37]; "Purchase Invoices")
		If (OK=1)
			$_l_CurrentWinRefOLD:=WIN_l_CurrentWinRef
			GET WINDOW RECT:C443($_l_WindowLeft; $_l_WindowTop; $_l_WindowRIght; $_l_WindowBottom)
			If ($_l_WindowTop>0)
				WIN_l_CurrentWinRef:=Open window:C153(($_l_WindowLeft+10); $_l_WindowTop+10; $_l_WindowLeft+10; $_l_WindowTop+10; 4; "Select a Purchase invoice"; "Close_Cancel")
				
			Else 
				$_l_DockRight:=INT_GetDock("R")
				
				WIN_l_CurrentWinRef:=Open window:C153((Screen width:C187-$_l_DockRight)-372; <>SYS_l_WindowTop+50; Screen width:C187-$_l_DockRight; <>SYS_l_WindowTop+266; 4; "Select a Purchase invoice"; "Close_Cancel")
			End if 
			PI_S20_PurchaseInvoice:=""
			DIALOG:C40([PURCHASE_INVOICES:37]; "dask_Purchases")
			CLOSE WINDOW:C154
			WIN_l_CurrentWinRef:=$_l_CurrentWinRefOLD
			WS_KeepFocus
			
			Array_LCx(0)
			
			WS_KeepFocus
			If (xNew=1)
				
			Else 
				If (OK=0)
					GOTO OBJECT:C206($1->)
				End if 
				$1->:=PI_S20_PurchaseInvoice
			End if 
			DB_t_CurrentFormUsage:=$_t_CurrentFormUsage
			
		End if 
		
	End if 
Else 
	Gen_Alert("No Purchase invoices found")
	$1->:=""
	
End if 
ERR_MethodTrackerReturn("Check_PurchaseInvoices"; $_t_oldMethodName)