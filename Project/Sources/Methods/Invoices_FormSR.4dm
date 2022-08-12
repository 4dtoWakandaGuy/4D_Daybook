//%attributes = {}
If (False:C215)
	//Project Method Name:      Invoices_FormSR
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 28/11/2010 19:03
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY REAL(SRAmount;0)
	//ARRAY REAL(SRDisc;0)
	//ARRAY REAL(SREuroAmt;0)
	//ARRAY REAL(SRPrice;0)
	//ARRAY REAL(SRRate;0)
	//ARRAY REAL(SRRetail;0)
	//ARRAY TEXT(SRDesc;0)
	//ARRAY TEXT(SRPricePerT;0)
	//ARRAY TEXT(SRProdCode;0)
	//ARRAY TEXT(SRQtyT;0)
	//ARRAY TEXT(SRSerial;0)
	C_BOOLEAN:C305($_bo_Texts)
	C_LONGINT:C283($_l_Level; $_l_OrderItemNumber; $_l_SizeofArray; $1)
	C_REAL:C285(v0; v31; vAmount; vPrice; vRate)
	C_TEXT:C284($_t_Description; $_t_oldMethodName; $_t_OrderCode; vComments; vDesc; vInvNoT; VPRODCODE; vQtyT; vSerialNo; vT)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Invoices_FormSR")
//Invoices_FormSR
vDesc:=""

QUERY:C277([INVOICES_ITEMS:161]; [INVOICES_ITEMS:161]INVOICES_CODE:18=[INVOICES:39]Invoice_Number:1)
Invoices_FormL2
CREATE EMPTY SET:C140([ORDER_ITEMS:25]; "Base")
Form_SRArray(0)
vT:=""
$_l_SizeofArray:=1
$_l_Level:=0

While (Not:C34((End selection:C36([INVOICES_ITEMS:161]))) | (vT#"") | (vComments#""))
	$_bo_Texts:=((vT#"") | (vComments#""))
	$_t_Description:=InvFormItem
	Form_SRArrIns(1)
	$_l_SizeofArray:=Size of array:C274(SRProdCode)
	If (VPRODCODE#"")
		SRProdCode{$_l_SizeofArray}:=vProdCode
	Else 
		SRProdCode{$_l_SizeofArray}:="-"
	End if 
	
	//SRDesc{$_l_SizeofArray}:=vDesc///NG May 2020 this was what it said but I think it should be as below
	
	SRDesc{$_l_SizeofArray}:=$_t_Description
	SRSerial{$_l_SizeofArray}:=vSerialNo
	SRPrice{$_l_SizeofArray}:=vPrice
	SRQtyT{$_l_SizeofArray}:=vQtyT
	
	SRRate{$_l_SizeofArray}:=vRate
	SRAmount{$_l_SizeofArray}:=vAmount
	// Invoices_FormSR
	SREuroAmt{$_l_SizeofArray}:=WS_EuroConvertor(vAmount; [INVOICES:39]Currency_Code:27)
	SRPricePerT{$_l_SizeofArray}:=vInvNoT
	SRRetail{$_l_SizeofArray}:=v0
	SRDisc{$_l_SizeofArray}:=v31
	
	If ((DB_GetModuleSettingByNUM(Module_Assemblies)>0) & ($_bo_Texts=False:C215) & ($_l_Level<10) & (Count parameters:C259=0))
		If (End selection:C36([INVOICES_ITEMS:161]))
			LAST RECORD:C200([INVOICES_ITEMS:161])
		Else 
			PREVIOUS RECORD:C110([INVOICES_ITEMS:161])
		End if 
		
		If (([INVOICES_ITEMS:161]Product_Code:1#"") & ([INVOICES_ITEMS:161]Item_Number:12#0))
			RELATE ONE:C42([INVOICES_ITEMS:161]Product_Code:1)
			If ([PRODUCTS:9]Bundle_Assembly:36)
				If ([PRODUCTS:9]Bundle_Show:37#0)
					RELATE ONE:C42([INVOICES_ITEMS:161]Item_Number:12)
					If ([ORDER_ITEMS:25]Purchase_Order_Number:18="BUNDLE")
						$_t_OrderCode:=[ORDER_ITEMS:25]Order_Code:1
						$_l_OrderItemNumber:=[ORDER_ITEMS:25]Item_Number:27
						QUERY:C277([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Order_Code:1=$_t_OrderCode; *)
						QUERY:C277([ORDER_ITEMS:25];  & ; [ORDER_ITEMS:25]Level_Up_Item_Number:48=$_l_OrderItemNumber)
						If (Records in selection:C76([ORDER_ITEMS:25])#0)
							If ([PRODUCTS:9]Bundle_Show:37=2)
								CREATE SET:C116([ORDER_ITEMS:25]; "Extra")
								UNION:C120("Extra"; "Base"; "Base")
							Else 
								ORDER BY:C49([ORDER_ITEMS:25]; [ORDER_ITEMS:25]Sort_Order:26; >)
								Orders_FormSR3(1; (Count parameters:C259=0))
							End if 
						End if 
						
					End if 
				End if 
			End if 
		End if 
		NEXT RECORD:C51([INVOICES_ITEMS:161])
	End if 
	
End while 

If ((Records in set:C195("Base")>0) & (Count parameters:C259=0))
	USE SET:C118("Base")
	FIRST RECORD:C50([ORDER_ITEMS:25])
	Form_SRArrIns(2)
	$_l_SizeofArray:=Size of array:C274(SRProdCode)
	SRDesc{$_l_SizeofArray}:="Components:"
	ORDER BY:C49([ORDER_ITEMS:25]Sort_Order:26; >)
	Orders_FormSR3(1; (Count parameters:C259=0))
End if 
CLEAR SET:C117("Base")

//  If (Count parameters>0)
//  If ($n>$2)
//     $_l_SizeofArray:=Int($n/$1)
//     vText:=Char(13)*(($1*$_l_SizeofArray)+$2)
//    Else
//     vText:=Char(13)*$2
//    End if
//  End if
//NEXT RECORD([INVOICES])
ERR_MethodTrackerReturn("Invoices_FormSR"; $_t_oldMethodName)