//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      StockLev_SelPvs
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
	C_POINTER:C301(vFilePtr)
	C_REAL:C285(vAmountF; vAmountT; vMarginF; vMarginT)
	C_TEXT:C284($_t_oldMethodName; vAnalysis; ACC_t_CurrencyCode; vLayer; vProdCode; vTitle13; vType)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("StockLev_SelPvs")
vProdCode:=""
vType:=""
vAnalysis:=""
ACC_t_CurrencyCode:=""
vLayer:=""
vAmountF:=0
vAmountT:=0
vMarginF:=0
vMarginT:=0
vFilePtr:=->[STOCK_LEVELS:58]
vTitle13:="vProdCode+vType+vAnalysis+ACC_t_CurrencyCode+vLayer+vAmountF+vAmountT+vMarginF+vMarginT+"
ERR_MethodTrackerReturn("StockLev_SelPvs"; $_t_oldMethodName)