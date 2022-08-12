//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Contr PPFormSR
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45:40If (False)// ----------------------------------------------------
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
	//ARRAY TEXT(SRProdCode;0)
	//ARRAY TEXT(SRQtyT;0)
	//ARRAY TEXT(SRSerial;0)
	C_LONGINT:C283($_l_RecordsinSelection; $_l_RowIndex)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Contr PPFormSR")
Contr_PPFormLP
$_l_RecordsinSelection:=Records in selection:C76([ORDER_ITEMS:25])
Form_SRArray($_l_RecordsinSelection)
$_l_RowIndex:=1
FIRST RECORD:C50([ORDER_ITEMS:25])
While (Not:C34(End selection:C36([ORDER_ITEMS:25])))
	SRProdCode{$_l_RowIndex}:=[ORDER_ITEMS:25]Product_Code:2
	SRDesc{$_l_RowIndex}:=[ORDER_ITEMS:25]Product_Name:13
	SRSerial{$_l_RowIndex}:=[ORDER_ITEMS:25]Serial_Number:24
	SRPrice{$_l_RowIndex}:=[ORDER_ITEMS:25]Contract_Cost:30
	If ([ORDER_ITEMS:25]Quantity:3=0)
		SRQtyT{$_l_RowIndex}:=""
	Else 
		SRQtyT{$_l_RowIndex}:=String:C10([ORDER_ITEMS:25]Quantity:3)
	End if 
	RELATE ONE:C42([ORDER_ITEMS:25]Tax_Code:12)
	SRRate{$_l_RowIndex}:=[TAX_CODES:35]Tax_Rate:3
	SRAmount{$_l_RowIndex}:=[ORDER_ITEMS:25]Sales_Amount:7
	SREuroAmt{$_l_RowIndex}:=WS_EuroConvertor([ORDER_ITEMS:25]Sales_Amount:7; [ORDERS:24]Currency_Code:32)
	
	$_l_RowIndex:=$_l_RowIndex+1
	NEXT RECORD:C51([ORDER_ITEMS:25])
End while 
FIRST RECORD:C50([ORDER_ITEMS:25])
ERR_MethodTrackerReturn("Contr PPFormSR"; $_t_oldMethodName)