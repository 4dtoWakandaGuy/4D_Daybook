//%attributes = {}
If (False:C215)
	//Project Method Name:      Movt_SelPvs
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
	C_DATE:C307(vIDateF; vIDateT)
	C_POINTER:C301(vFilePtr)
	C_TEXT:C284($_t_oldMethodName; vAnalysis; vCompCode; vCompName; vContCode; vContrCode; ACC_t_CurrencyCode; vJobCode; vLayer; vProdCode; vTitle13)
	C_TEXT:C284(vType)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Movt_SelPvs")
vCompCode:=""
vCompName:=""
vIDateF:=!00-00-00!
vIDateT:=!00-00-00!
vProdCode:=""
vContCode:=""
vJobCode:=""
vType:=""
vContrCode:=""
vAnalysis:=""
ACC_t_CurrencyCode:=""
vLayer:=""
vFilePtr:=->[STOCK_MOVEMENTS:40]
vTitle13:="vCompCode+vCompName+vIDateF+vIDateT+vProdCode+vContCode+vJobCode+"
vTitle13:=vTitle13+"vType+vContrCode+vAnalysis+ACC_t_CurrencyCode+vLayer+"
ERR_MethodTrackerReturn("Movt_SelPvs"; $_t_oldMethodName)