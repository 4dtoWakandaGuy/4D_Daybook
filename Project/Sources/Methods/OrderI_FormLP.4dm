//%attributes = {}
If (False:C215)
	//Project Method Name:      OrderI_FormLP
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
	C_BOOLEAN:C305(<>SalesItemDP)
	C_REAL:C285(v0; v31; vAmount; vPrice; vRate)
	C_TEXT:C284($_t_oldMethodName; $0; vComments; vDesc; vInvNoT; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; vProdCode; vProdname; vQtyT)
	C_TEXT:C284(vSerialNo; VshortCode; vT)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OrderI_FormLP")
//OrderI_FormLP
VshortCode:=""
If ((End selection:C36([ORDER_ITEMS:25])) & (vT=""))
	$0:=""
	vDesc:=""
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
			vProdCode:=[ORDER_ITEMS:25]Product_Code:2
			RELATE ONE:C42([ORDER_ITEMS:25]Product_Code:2)
			VshortCode:=[PRODUCTS:9]Short_Code:19
			$0:=[ORDER_ITEMS:25]Product_Name:13
			If (DB_t_CurrentFormUsage="Subs")
				vProdname:=$0
				Subscript_OIIte
				$0:=vProdName
			End if 
			vDesc:=$0
			vPrice:=[ORDER_ITEMS:25]Sales_Price:4
			If ([ORDER_ITEMS:25]Quantity:3=0)
				vQtyT:=""
			Else 
				vQtyT:=String:C10([ORDER_ITEMS:25]Quantity:3)
			End if 
			If ([ORDER_ITEMS:25]Sales_Amount:7=0)
				vRate:=0
			Else 
				RELATE ONE:C42([ORDER_ITEMS:25]Tax_Code:12)
				vRate:=[TAX_CODES:35]Tax_Rate:3
			End if 
			vAmount:=[ORDER_ITEMS:25]Sales_Amount:7
			vSerialNo:=[ORDER_ITEMS:25]Serial_Number:24
			If ([ORDER_ITEMS:25]Price_Per:50=0)
				vInvNoT:="1"
			Else 
				vInvNoT:=String:C10([ORDER_ITEMS:25]Price_Per:50)
			End if 
			If ((([ORDER_ITEMS:25]Print_Description:45) | (<>SalesItemDP)) & ([ORDER_ITEMS:25]Description:44#""))
				vT:=RemoveTrailCR([ORDER_ITEMS:25]Description:44)
			Else 
				vT:=""
			End if 
			v0:=[ORDER_ITEMS:25]Retail_Price:38
			v31:=[ORDER_ITEMS:25]Discount:37
			
			NEXT RECORD:C51([ORDER_ITEMS:25])
		End if 
	End if 
End if 
ERR_MethodTrackerReturn("OrderI_FormLP"; $_t_oldMethodName)