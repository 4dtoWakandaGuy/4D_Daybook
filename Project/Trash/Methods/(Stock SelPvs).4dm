//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Stock_SelPvs
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
	C_DATE:C307(vIDateF; vIDateT; vSDateF; vSDateT)
	C_LONGINT:C283(vItemNum)
	C_POINTER:C301(vFilePtr)
	C_TEXT:C284($_t_oldMethodName; vCompCode; vContCode; vOrderCode; vProdCode; vProdName; vSerialNo; vTitle13)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Stock_SelPvs")
vCompCode:=""
vIDateF:=!00-00-00!
vIDateT:=!00-00-00!
vSDateF:=!00-00-00!
vSDateT:=!00-00-00!
vProdCode:=""
vContCode:=""
vSerialNo:=""
vProdName:=""
vItemNum:=0
vOrderCode:=""
vFilePtr:=->[STOCK_MOVEMENT_ITEMS:27]
vTitle13:="vCompCode+vIDateF+vIDateT+vSDateF+vSDateT+vProdCode+vContCode+vSerialNo+"
vTitle13:=vTitle13+"vProdName+vItemNum+vOrderCode+"
ERR_MethodTrackerReturn("Stock_SelPvs"; $_t_oldMethodName)