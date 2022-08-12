//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      PurchOrd_SelPvs
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
	C_DATE:C307(vIDateF; vIDateT; vPDateF; vPDateT; vRDateF; vRDateT)
	C_POINTER:C301(vFilePtr)
	C_REAL:C285($_r_AmountFrom; $_r_AmountTo; $_r_invF; $_r_invT; VamountF; VamountT; VinvF; vInvT)
	C_TEXT:C284($_t_oldMethodName; vAnalysis; vCompCode; vCompName; vCompNameC; vContCode; ACC_t_CurrencyCode; vForename; vLayer; vOrderNo; vProdCode)
	C_TEXT:C284(vPurchCode; vPurchInvNo; vSurname; vTitle13)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("PurchOrd_SelPvs")
Sel_BegArr(Table:C252(->[PURCHASE_ORDERS:57]))
vCompCode:=""
vCompName:=""
vContCode:=""
vForename:=""
vSurname:=""
vCompNameC:=""
vPurchInvNo:=""
vIDateF:=!00-00-00!
vIDateT:=!00-00-00!
vRDateF:=!00-00-00!
vRDateT:=!00-00-00!
vPDateF:=!00-00-00!
vPDateT:=!00-00-00!
vPurchCode:=""
vProdCode:=""
vOrderNo:=""
vInvF:=0
vInvT:=0
vAnalysis:=""
ACC_t_CurrencyCode:=""
vLayer:=""
vFilePtr:=->[PURCHASE_ORDERS:57]
vTitle13:="vCompCode+vCompName+vContCode+vForename+vSurname+vCompNameC+vPurchInvNo+"
vTitle13:=vTitle13+"vIDateF+vIDateT+vRDateF+vRDateT+vPDateF+vPDateT+vPurchCode+vProdCode+"
vTitle13:=vTitle13+"vOrderNo+vInvF+vInvT+vAnalysis+ACC_t_CurrencyCode+vLayer+r0+r1+ch0+ch1+"
ERR_MethodTrackerReturn("PurchOrd_SelPvs"; $_t_oldMethodName)