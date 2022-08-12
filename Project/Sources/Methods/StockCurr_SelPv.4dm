//%attributes = {}
If (False:C215)
	//Project Method Name:      StockCurr_SelPv
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
	C_LONGINT:C283(vItemNum)
	C_POINTER:C301(vFilePtr)
	C_REAL:C285(vAmountF; vAmountT; vMarginF; vMarginPF; vMarginPT; vMarginT)
	C_TEXT:C284($_t_oldMethodName; vAnalysis; ACC_t_CurrencyCode; vLayer; vLocation; vOrderCode; vProdCode; vSerialNo; vTitle13; vType)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("StockCurr_SelPv")
vProdCode:=""
vSerialNo:=""
vType:=""
vLocation:=""
vAnalysis:=""
ACC_t_CurrencyCode:=""
vLayer:=""
vOrderCode:=""
vItemNum:=0
vAmountF:=0
vAmountT:=0
vMarginF:=0
vMarginT:=0
vMarginPF:=0
vMarginPT:=0
vFilePtr:=->[CURRENT_STOCK:62]
vTitle13:="vProdCode+vSerialNo+vType+vLocation+vAnalysis+ACC_t_CurrencyCode+vLayer+vOrderCode+"
vTitle13:=vTitle13+"vItemNum+vAmountF+vAmountT+vMarginF+vMarginT+vMarginPF+vMarginPT+"
ERR_MethodTrackerReturn("StockCurr_SelPv"; $_t_oldMethodName)