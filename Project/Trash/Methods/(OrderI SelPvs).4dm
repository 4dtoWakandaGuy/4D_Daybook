//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      OrderI_SelPvs
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 25/04/2011 08:20
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_DATE:C307(vDnDateF; vDnDateT; vIDateF; vIDateT; vRDDateF; vRDDateT)
	C_LONGINT:C283(vItemNum)
	C_POINTER:C301(vFilePtr)
	C_REAL:C285(vAmountF; vAmountT; vMarginF; vMarginT)
	C_TEXT:C284($_t_oldMethodName; vContrCode; vInvNoF; vInvNoT; VitemRef; vOrderCode; vOrderNo; vProbCode; vProdCode; vProdName; vSales)
	C_TEXT:C284(vSerialNo; vSolCode; vTitle13)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OrderI_SelPvs")
Sel_BegArr(24)
vProbCode:=""
vSolCode:=""
vIDateF:=!00-00-00!
vIDateT:=!00-00-00!
vDnDateF:=!00-00-00!
vDnDateT:=!00-00-00!
vRDDateF:=!00-00-00!
vRDDateT:=!00-00-00!
vInvNoF:=""
vInvNoT:=""
vItemNum:=0
VitemRef:=""
vProdCode:=""
vAmountF:=0
vAmountT:=0
vMarginF:=0
vMarginT:=0
vOrderCode:=""
vOrderNo:=""
vSales:=""
vSerialNo:=""
vContrCode:=""
vProdName:=""
Clear_chrs
vFilePtr:=->[ORDER_ITEMS:25]
vTitle13:="vProbCode+vSolCode+vIDateF+vIDateT+vDnDateF+vDnDateT+vInvNoF+vInvNoT+"
vTitle13:=vTitle13+"vItemNum+vProdCode+vAmountF+vAmountT+vMarginF+vMarginT+vOrderCode+"
vTitle13:=vTitle13+"vOrderNo+vSales+vSerialNo+vContrCode+vProdName+"
vTitle13:=vTitle13+"r0+r1+r2+r3+r4+r5+r6+r7+_FileState+"
ERR_MethodTrackerReturn("OrderI_SelPvs"; $_t_oldMethodName)