//%attributes = {}
If (False:C215)
	//Project Method Name:      Contracts_SelPv
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
	C_DATE:C307(SRCH_d_EntryDateFrom; SRCH_d_EntryDateTo; vSDateF; vSDateT)
	C_POINTER:C301(vFilePtr)
	C_TEXT:C284($_t_oldMethodName; vCompCode; vContCode; vContrCode; vJob; vOrderCode; vProdCode; vTitle13; vType)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Contracts_SelPv")
vCompCode:=""
vContCode:=""
vContrCode:=""
vType:=""
vSDateF:=!00-00-00!
vSDateT:=!00-00-00!
SRCH_d_EntryDateFrom:=!00-00-00!
SRCH_d_EntryDateTo:=!00-00-00!
vJob:=""
vOrderCode:=""
vProdCode:=""
vFilePtr:=->[CONTRACTS:17]
vTitle13:="vCompCode+vContCode+vContrCode+vType+vSDateF+vSDateT+SRCH_d_EntryDateFrom+"
vTitle13:=vTitle13+"SRCH_d_EntryDateTo+vJob+vOrderCode+vProdCode+"
ERR_MethodTrackerReturn("Contracts_SelPv"; $_t_oldMethodName)