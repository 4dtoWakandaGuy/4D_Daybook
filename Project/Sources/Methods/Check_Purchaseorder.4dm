//%attributes = {}
If (False:C215)
	//Project Method Name:      Check_Purchaseorder
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 15/03/2010 13:38
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(SVS_at_PreviewEvent;0)
	C_LONGINT:C283(<>SYS_l_WindowTop; $_l_CurrentWinRefOLD; $_l_DockRight; $_l_WindowBottom; $_l_WindowLeft; $_l_WindowRIght; $_l_WindowTop; WIN_l_CurrentWinRef; WIN_l_CurrentWinRefOLD; xNew)
	C_POINTER:C301($1; $2)
	C_TEXT:C284($_t_CurrentFormUsage; $_t_oldMethodName; DB_t_CurrentFormUsage; PO_S20_PurchaseOrder; vPurchase)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Check_Purchaseorder")

//Check_Contact (->[ORDERS]Contact Code;->[ORDERS]Company Code;->[ORDERS])
$_t_CurrentFormUsage:=DB_t_CurrentFormUsage
xNew:=0
vPurchase:=""
QUERY:C277([PURCHASE_ORDERS:57]; [PURCHASE_ORDERS:57]Purchase_Order_Number:2=$1->)
If (Count parameters:C259>=2)
	If ($2->#"")
		QUERY SELECTION:C341([PURCHASE_ORDERS:57]; [PURCHASE_ORDERS:57]Company_Code:1=$2->)
	End if 
End if 
If (Records in selection:C76([PURCHASE_ORDERS:57])=0)
	QUERY:C277([PURCHASE_ORDERS:57]; [PURCHASE_ORDERS:57]Purchase_Order_Number:2=$1->+"@")
	If (Count parameters:C259>=2)
		If ($2->#"")
			QUERY SELECTION:C341([PURCHASE_ORDERS:57]; [PURCHASE_ORDERS:57]Company_Code:1=$2->)
		End if 
	End if 
End if 
If (Records in selection:C76([PURCHASE_ORDERS:57])>0)
	If (Records in selection:C76([PURCHASE_ORDERS:57])=1)
		$1->:=[PURCHASE_ORDERS:57]Purchase_Order_Number:2
	Else 
		Check_DispNum(->[PURCHASE_ORDERS:57]; "Purchase Orders")
		If (OK=1)
			GET WINDOW RECT:C443($_l_WindowLeft; $_l_WindowTop; $_l_WindowRIght; $_l_WindowBottom)
			$_l_CurrentWinRefOLD:=WIN_l_CurrentWinRef
			
			If ($_l_WindowTop>0)
				WIN_l_CurrentWinRef:=Open window:C153(($_l_WindowLeft+10); $_l_WindowTop+10; $_l_WindowLeft+10; $_l_WindowTop+10; 4; "Select a Purchase order"; "Close_Cancel")
				
			Else 
				$_l_DockRight:=INT_GetDock("R")
				
				WIN_l_CurrentWinRef:=Open window:C153((Screen width:C187-$_l_DockRight)-372; <>SYS_l_WindowTop+50; Screen width:C187-$_l_DockRight; <>SYS_l_WindowTop+266; 4; "Select a Purchase order"; "Close_Cancel")
			End if 
			PO_S20_PurchaseOrder:=""
			DIALOG:C40([PURCHASE_ORDERS:57]; "dAsk_PurchaseOrder")
			CLOSE WINDOW:C154
			WIN_l_CurrentWinRef:=$_l_CurrentWinRefOLD
			WS_KeepFocus
			
			Array_LCx(0)
			ARRAY TEXT:C222(SVS_at_PreviewEvent; 0)
			WS_KeepFocus
			If (xNew=1)
				
			Else 
				If (OK=0)
					GOTO OBJECT:C206($1->)
				End if 
				$1->:=PO_S20_PurchaseOrder
			End if 
			DB_t_CurrentFormUsage:=$_t_CurrentFormUsage
			
		End if 
		
	End if 
Else 
	Gen_Alert("No Purchase orders found")
	$1->:=""
	
End if 
ERR_MethodTrackerReturn("Check_Purchaseorder"; $_t_oldMethodName)