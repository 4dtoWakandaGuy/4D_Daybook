//%attributes = {}
If (False:C215)
	//Project Method Name:      PurchOrd_FormSR
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/11/2009`Method: PurchOrd_FormSR
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY REAL(SRAmount;0)
	//ARRAY REAL(SREuroAmt;0)
	//ARRAY REAL(SRPrice;0)
	//ARRAY REAL(SRRate;0)
	//ARRAY TEXT(SRDesc;0)
	//ARRAY TEXT(SRPricePerT;0)
	//ARRAY TEXT(SRProdCode;0)
	//ARRAY TEXT(SRQtyT;0)
	//ARRAY TEXT(SRShortCode;0)
	C_LONGINT:C283($_l_FillIndex; $_l_RecordsinSelection; $i; Mcount2; Mcount3; Mcount4; Mcount5)
	C_REAL:C285(vAmount; vPrice; vQuantity; vRate)
	C_TEXT:C284($_t_oldMethodName; MMessage; vComments; VContCode; vDesc; vInvNoT; vProdCode; vProdName; VprodShortCode; vT)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("PurchOrd_FormSR")
vDesc:=""
vT:=""
VContCode:=""
PurchOrd_FormLP

QUERY:C277([PURCHASE_ORDERS_ITEMS:169]; [PURCHASE_ORDERS_ITEMS:169]PURCHASE_ORDERS_CODE:18=[PURCHASE_ORDERS:57]Purchase_Order_Number:2)
$_l_RecordsinSelection:=Records in selection:C76([PURCHASE_ORDERS_ITEMS:169])
Form_SRArray(0)
$i:=1
If (vComments#"")  // | (vT#""))
	If (vComments#"")
		vProdName:=FormItemComm
		vPrice:=0
		vQuantity:=0
		vRate:=0
		vAmount:=0
		vProdCode:=""
		vInvNoT:=""
		Form_SRArrIns(1)
		$i:=Size of array:C274(SRProdCode)
		SRProdCode{$i}:=vProdCode
		SRShortCode{$i}:=VprodShortCode
		SRDesc{$i}:=vProdName
		SRPrice{$i}:=vPrice
		If (vQuantity=0)
			SRQtyT{$i}:=""
		Else 
			SRQtyT{$i}:=String:C10(vQuantity)
		End if 
		SRRate{$i}:=vRate
		SRAmount{$i}:=vAmount
		SREuroAmt{$i}:=vAmount
		SRPricePerT{$i}:=vInvNoT
		
	End if 
End if 
FIRST RECORD:C50([PURCHASE_ORDERS_ITEMS:169])

For ($_l_FillIndex; 1; $_l_RecordsinSelection)
	//While (Not((End subselection([PURCHASE ORDERS]ITEMS)))
	// | (vComments#"") | (vT#""))
	VprodShortCode:=""
	If ($_l_FillIndex>$_l_RecordsinSelection)  //don;t think this needed in the reworking `& (VT="")
		//If ((End subselection([PURCHASE ORDERS]ITEMS)) & (vT=""))
		vProdName:=""
		vPrice:=0
		vQuantity:=0
		vRate:=0
		
		//just moving this line to see it this it where the error is.
		
		vAmount:=0
		vProdCode:=""
		vInvNoT:=""
	Else 
		
	End if 
	//Else
	
	//vProdName:="HELLO"
	PurchOrd_FrmILP
	If (([PURCHASE_ORDERS_ITEMS:169]Print_Description:14) & ([PURCHASE_ORDERS_ITEMS:169]Description:13#""))
		vT:=RemoveTrailCR([PURCHASE_ORDERS_ITEMS:169]Description:13)
	Else 
		vT:=""
	End if 
	NEXT RECORD:C51([PURCHASE_ORDERS_ITEMS:169])
	//End if
	//End if
	//End if
	
	Form_SRArrIns(1)
	$i:=Size of array:C274(SRProdCode)
	SRProdCode{$i}:=vProdCode
	SRShortCode{$i}:=VprodShortCode
	SRDesc{$i}:=vProdName
	SRPrice{$i}:=vPrice
	If (vQuantity=0)
		SRQtyT{$i}:=""
	Else 
		SRQtyT{$i}:=String:C10(vQuantity)
	End if 
	SRRate{$i}:=vRate
	SRAmount{$i}:=vAmount
	SREuroAmt{$i}:=WS_EuroConvertor(vAmount; [PURCHASE_ORDERS:57]Currency_Code:16)
	SRPricePerT{$i}:=vInvNoT
	If (vT#"")  //Previous record had a comment
		vProdName:="  "+FormItemvT
		vPrice:=0
		vQuantity:=0
		vRate:=0
		vAmount:=0
		vProdCode:=""
		vInvNoT:=""
		//Insert the line
		Form_SRArrIns(1)
		$i:=Size of array:C274(SRProdCode)
		SRProdCode{$i}:=vProdCode
		SRShortCode{$i}:=VprodShortCode
		SRDesc{$i}:=vProdName
		SRPrice{$i}:=vPrice
		If (vQuantity=0)
			SRQtyT{$i}:=""
		Else 
			SRQtyT{$i}:=String:C10(vQuantity)
		End if 
		SRRate{$i}:=vRate
		SRAmount{$i}:=vAmount
		SREuroAmt{$i}:=WS_EuroConvertor(vAmount; [PURCHASE_ORDERS:57]Currency_Code:16)
		SRPricePerT{$i}:=vInvNoT
		Vt:=""
	End if 
	
	//End while
End for 

Mcount2:=Size of array:C274(SRDesc)
Mcount3:=Size of array:C274(SRPrice)
Mcount4:=Size of array:C274(SRQtyT)
Mcount5:=Size of array:C274(SRAmount)
MMessage:=SRProdCode{Mcount2}
ERR_MethodTrackerReturn("PurchOrd_FormSR"; $_t_oldMethodName)
