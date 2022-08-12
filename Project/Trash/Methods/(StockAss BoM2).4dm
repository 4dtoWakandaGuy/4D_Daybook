//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      StockAss_BoM2
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
	//ARRAY LONGINT(aApptO;0)
	//ARRAY REAL(SRAmount;0)
	//ARRAY REAL(SRPrice;0)
	//ARRAY REAL(SRRate;0)
	//ARRAY TEXT(SRDesc;0)
	//ARRAY TEXT(SRQtyT;0)
	//ARRAY TEXT(SRSerial;0)
	C_LONGINT:C283($_l_Index; $_l_SizeofArray)
	C_REAL:C285(STK_r_QuantityAvailable; STK_r_QuantityInStock; STK_r_QuantityRequired; STK_r_QuantityToAssemble; vT1; vT2; vT3; vT4; vTSTK_r_QuantityInStock2)
	C_TEXT:C284($_t_Action; $_t_oldMethodName; STK_t_Level; STK_t_ProductCode; STK_t_ProductName; vProdCode; vProdName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("StockAss_BoM2")
//StockAss_BoM2
$_l_SizeofArray:=Size of array:C274(SRSerial)
If ($_l_SizeofArray>0)
	$_t_Action:=""
	For ($_l_Index; 1; $_l_SizeofArray)
		STK_t_Level:=SRQtyT{$_l_Index}
		If ($_t_Action#STK_t_Level)
			Print form:C5([STOCK_MOVEMENT_ITEMS:27]; "StockAss_BoMLin")
			$_t_Action:=STK_t_Level
		End if 
		STK_t_ProductCode:=SRSerial{$_l_Index}
		STK_t_ProductName:=SRDesc{$_l_Index}
		STK_r_QuantityRequired:=SRPrice{$_l_Index}
		STK_r_QuantityInStock:=SRRate{$_l_Index}
		STK_r_QuantityToAssemble:=SRAmount{$_l_Index}
		STK_r_QuantityAvailable:=aApptO{$_l_Index}
		Print form:C5([STOCK_MOVEMENT_ITEMS:27]; "StockAss_BoMDet")
	End for 
End if 
PAGE BREAK:C6
ERR_MethodTrackerReturn("StockAss_BoM2"; $_t_oldMethodName)
