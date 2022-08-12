//%attributes = {}
If (False:C215)
	//Project Method Name:      InvFormItem
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 02/09/2009 12:53
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_REAL:C285(v0; v31; vAmount; vPrice; VRATE)
	C_TEXT:C284($_t_oldMethodName; $0; vComments; vDesc; vInvNoT; vProdCode; vQtyT; vSerialNo; vT)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("InvFormItem")
//InvFormItem

If ((End selection:C36([INVOICES_ITEMS:161])) & (vT=""))
	$0:=""
	vDesc:=""
	vPrice:=0
	vQtyT:=""
	vRate:=0
	vAmount:=0
	vSerialNo:=""
	vInvNoT:=""
	v0:=0
	v31:=0
Else 
	If (vComments#"")
		$0:=FormItemComm
		vDesc:=$0
		vPrice:=0
		vQtyT:=""
		vRate:=0
		vAmount:=0
		vProdCode:=""
		vSerialNo:=""
		vInvNoT:=""
		v0:=0
		v31:=0
	Else 
		If (vT#"")
			$0:="  "+FormItemvT
			vDesc:=$0
			vPrice:=0
			vQtyT:=""
			vRate:=0
			vAmount:=0
			vProdCode:=""
			vSerialNo:=""
			vInvNoT:=""
			v0:=0
			v31:=0
		Else 
			vProdCode:=[INVOICES_ITEMS:161]Product_Code:1
			$0:=[INVOICES_ITEMS:161]Product_Name:2
			vDesc:=[INVOICES_ITEMS:161]Product_Name:2
			vPrice:=[INVOICES_ITEMS:161]Sales_Price:4
			vQtyT:=InvFormSubQty
			If ([INVOICES_ITEMS:161]Price_Per:16=0)
				vInvNoT:="1"
			Else 
				vInvNoT:=String:C10([INVOICES_ITEMS:161]Price_Per:16)
			End if 
			If ([INVOICES_ITEMS:161]Amount:5=0)
				vRate:=0
			Else 
				RELATE ONE:C42([INVOICES_ITEMS:161]Tax_Code:6)
				vRate:=[TAX_CODES:35]Tax_Rate:3
			End if 
			vAmount:=[INVOICES_ITEMS:161]Amount:5
			If (([INVOICES_ITEMS:161]Print_Description:14) & ([INVOICES_ITEMS:161]Description:13#""))
				vT:=RemoveTrailCR([INVOICES_ITEMS:161]Description:13)
			Else 
				vT:=""
			End if 
			If ([INVOICES_ITEMS:161]Item_Number:12#0)
				RELATE ONE:C42([INVOICES_ITEMS:161]Item_Number:12)
				vSerialNo:=[ORDER_ITEMS:25]Serial_Number:24
				v0:=[ORDER_ITEMS:25]Retail_Price:38
				v31:=[ORDER_ITEMS:25]Discount:37
			Else 
				vSerialNo:=""
				v0:=0
				v31:=0
			End if 
			NEXT RECORD:C51([INVOICES_ITEMS:161])
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("InvFormItem"; $_t_oldMethodName)