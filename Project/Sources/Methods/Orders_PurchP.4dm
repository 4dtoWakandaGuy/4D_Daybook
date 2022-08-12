//%attributes = {}
If (False:C215)
	//Project Method Name:      Orders_PurchP
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 07/12/2009 20:23`Method: Orders_PurchP
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY TEXT:C222($_at_SupplierCode; 0)
	C_BOOLEAN:C305(DB_bo_noRefresh)
	C_LONGINT:C283($_l_BlankSupplierRow; $_l_Index; ORD_l_SelectedViewTabOLD; vAdd)
	C_TEXT:C284($_t_oldMethodName; $_t_OrderCode; vNumber; WIN_t_CurrentInputForm)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Orders_PurchP")
//Orders_PurchP
QUERY:C277([PURCHASE_ORDERS:57]; [PURCHASE_ORDERS:57]Purchase_Order_Number:2=vNumber)
If ((vNumber#"") & (Records in selection:C76([PURCHASE_ORDERS:57])>0))
	Gen_Confirm("Purchase Order "+vNumber+" has already been created.  Do you want to view it?"; "Yes"; "No")
	If (OK=1)
		vAdd:=0
		PurchOrd_FileI
		Open_Pro_Window("View Purchase Order"; 0; 2; ->[PURCHASE_ORDERS:57]; WIN_t_CurrentInputForm)
		READ WRITE:C146([PURCHASE_ORDERS:57])
		MODIFY RECORD:C57([PURCHASE_ORDERS:57]; *)
		Close_ProWin(Table name:C256(->[PURCHASE_ORDERS:57])+"_"+WIN_t_CurrentInputForm)
	End if 
Else 
	If (Records in selection:C76([ORDER_ITEMS:25])>0)
		//  SORT SELECTION([ORDER ITEMS]Supplier Code;>)
		CREATE SET:C116([ORDER_ITEMS:25]; "Master")
		ARRAY TEXT:C222($_at_SupplierCode; 0)
		MESSAGES OFF:C175
		SELECTION TO ARRAY:C260([ORDER_ITEMS:25]Supplier_Code:20; $_at_SupplierCode)
		SORT ARRAY:C229($_at_SupplierCode)
		For ($_l_Index; Size of array:C274($_at_SupplierCode); 2; -1)
			If ($_at_SupplierCode{$_l_Index}=($_at_SupplierCode{$_l_Index-1}))
				$_at_SupplierCode{$_l_Index}:=""
			End if 
		End for 
		SORT ARRAY:C229($_at_SupplierCode; <)
		$_l_BlankSupplierRow:=Find in array:C230($_at_SupplierCode; "")
		If ($_l_BlankSupplierRow>0)
			ARRAY TEXT:C222($_at_SupplierCode; $_l_BlankSupplierRow-1)
		End if 
		
		
		MESSAGES ON:C181
		If (Size of array:C274($_at_SupplierCode)>0)
			If (Size of array:C274($_at_SupplierCode)>1)
				Gen_Confirm("Create "+String:C10(Size of array:C274($_at_SupplierCode))+" Purchase Order(s)?"; "Yes"; "No")
			Else 
				OK:=1
			End if 
			If (OK=1)
				$_l_Index:=1
				While ($_l_Index<=(Size of array:C274($_at_SupplierCode)))
					IDLE:C311  // 7/04/03 pb
					If ($_at_SupplierCode{$_l_Index}#"")
						USE SET:C118("Master")
						QUERY SELECTION:C341([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Supplier_Code:20=$_at_SupplierCode{$_l_Index})
						RELATE ONE:C42([ORDER_ITEMS:25]Order_Code:1)
						$_t_OrderCode:=[ORDERS:24]Order_Code:3
						vNumber:="N"
						Orders_POTrans
						If ([ORDERS:24]Order_Code:3#$_t_OrderCode) & (DB_bo_noRefresh=False:C215)
							ORD_l_SelectedViewTabOLD:=0
							QUERY:C277([ORDERS:24]; [ORDERS:24]Order_Code:3=$_t_OrderCode)
							Orders_InLPß("B")
						End if 
					End if 
					$_l_Index:=$_l_Index+1
				End while 
			End if 
		Else 
			Gen_Alert("There are no Items to Purchase Order"; "Cancel")
		End if 
	Else 
		Gen_Alert("There are no Items to Purchase Order"; "Cancel")
	End if 
End if 
DB_bo_noRefresh:=False:C215
ERR_MethodTrackerReturn("Orders_PurchP"; $_t_oldMethodName)
