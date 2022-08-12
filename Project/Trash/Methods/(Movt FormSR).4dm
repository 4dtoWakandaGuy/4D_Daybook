//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Movt FormSR
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
	//ARRAY REAL(SRAmount;0)
	//ARRAY REAL(SRPrice;0)
	//ARRAY REAL(SRRate;0)
	//ARRAY TEXT(SRDesc;0)
	//ARRAY TEXT(SRProdCode;0)
	//ARRAY TEXT(SRQtyT;0)
	//ARRAY TEXT(SRSerial;0)
	C_LONGINT:C283($_l_RecordsinSelection; $_l_RowIndex)
	C_REAL:C285(vAmount; vPrice; vQuantity)
	C_TEXT:C284($_t_oldMethodName; vLocation; vProdCode; vProduct; vSerialNo)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Movt FormSR")
Movt_FormLP
$_l_RecordsinSelection:=Records in selection:C76([STOCK_MOVEMENT_ITEMS:27])
Form_SRArray($_l_RecordsinSelection)
$_l_RowIndex:=1
FIRST RECORD:C50([STOCK_MOVEMENT_ITEMS:27])
While (Not:C34(End selection:C36([STOCK_MOVEMENT_ITEMS:27])))
	Movt_FormItLP
	SRProdCode{$_l_RowIndex}:=vProdCode
	SRDesc{$_l_RowIndex}:=vProduct
	SRSerial{$_l_RowIndex}:=vSerialNo
	SRPrice{$_l_RowIndex}:=vPrice
	SRQtyT{$_l_RowIndex}:=vLocation
	SRRate{$_l_RowIndex}:=vQuantity
	SRAmount{$_l_RowIndex}:=vAmount
	$_l_RowIndex:=$_l_RowIndex+1
	NEXT RECORD:C51([STOCK_MOVEMENT_ITEMS:27])
End while 
FIRST RECORD:C50([STOCK_MOVEMENT_ITEMS:27])
ERR_MethodTrackerReturn("Movt FormSR"; $_t_oldMethodName)
