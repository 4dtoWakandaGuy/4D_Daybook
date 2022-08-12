//%attributes = {}
If (False:C215)
	//Project Method Name:      Calls_SelPvs
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/11/2012 13:41
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_DATE:C307(<>DB_d_CurrentDate; vCDateF; vCDateT; vSDateF; vSDateT)
	C_POINTER:C301(vFilePtr)
	C_TEXT:C284($_t_oldMethodName; vCallCode; vCharge; vCompCode; vCompName; vContCode; vContrCode; vForename; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3)
	C_TEXT:C284(vPerson; vPriority; vProbCode; vProbDesc; vProdCode; vProdName; vSerialNo; vSolCode; vSolDesc; vSurname; vTele)
	C_TEXT:C284(vTitle13)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Calls_SelPvs")
vCompCode:=""
vContCode:=""
vContrCode:=""
vCallCode:=""
vCDateF:=!00-00-00!
If (DB_t_CurrentFormUsage="Outs")
	vCDateT:=<>DB_d_CurrentDate
Else 
	vCDateT:=!00-00-00!
End if 
vPriority:=""
vPerson:=""
vCompName:=""
vForename:=""
vSurname:=""
vTele:=""
vProbCode:=""
vProbDesc:=""
vSolCode:=""
vSolDesc:=""
vProdCode:=""
vProdName:=""
vSDateF:=!00-00-00!
vSDateT:=!00-00-00!
vCharge:=""
vSerialNo:=""
vFilePtr:=->[SERVICE_CALLS:20]
vTitle13:="vCompCode+vContCode+vContrCode+vCallCode+vCDateF+vCDateT+vPriority+"
vTitle13:=vTitle13+"vPerson+vCompName+vForename+vSurname+vTele+vProbCode+vProbDesc+"
vTitle13:=vTitle13+"vSolCode+vSolDesc+vProdCode+vProdName+"
vTitle13:=vTitle13+"vSDateF+vSDateT+vCharge+ch0+ch1+ch2+vSerialNo+"
ERR_MethodTrackerReturn("Calls_SelPvs"; $_t_oldMethodName)