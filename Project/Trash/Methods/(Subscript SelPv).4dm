//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Subscript_SelPv
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
	C_DATE:C307(vDnDateF; vDnDateT; vIDateF; vIDateT)
	C_LONGINT:C283(vItemNum)
	C_POINTER:C301(vFilePtr)
	C_REAL:C285(vAmountF; vAmountT)
	C_TEXT:C284($_t_oldMethodName; vInvNo; vProdCode; vProdName; vTitle13; vType)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Subscript_SelPv")
vIDateF:=!00-00-00!
vIDateT:=!00-00-00!
vDnDateF:=!00-00-00!
vDnDateT:=!00-00-00!
vItemNum:=0
vProdCode:=""
vAmountF:=0
vAmountT:=0
vType:=""
vProdName:=""
vInvNo:=""
vFilePtr:=->[SUBSCRIPTIONS:93]
vTitle13:="vIDateF+vIDateT+vDnDateF+vDnDateT+vItemNum+vProdCode+"
vTitle13:=vTitle13+"vAmountF+vAmountT+vType+vProdName+vInvNo+ch1+ch2+"
ERR_MethodTrackerReturn("Subscript_SelPv"; $_t_oldMethodName)