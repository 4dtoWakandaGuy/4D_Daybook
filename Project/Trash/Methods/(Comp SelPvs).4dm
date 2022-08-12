//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Comp_SelPvs
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 20/11/2012 13:42
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_DATE:C307(SRCH_d_EntryDateFrom; SRCH_d_EntryDateTo; vDoDateF; vDoDateT; vFDateF; vFDateT; vSDateF; vSDateT)
	C_POINTER:C301(vFilePtr)
	C_REAL:C285(vDiscountF; vDiscountT; vValueF; vValueT)
	C_TEXT:C284($_t_oldMethodName; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; vArea; vComments; vCompCode; vCompName; vContrCode; vCountry; vCounty)
	C_TEXT:C284(vLocation; vOmit; vPostcode; vProbCode; vProdCode; vSales; vSource; vStatus; vSuperior; vTel; vTele)
	C_TEXT:C284(vTitle13; vTown; vType)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Comp_SelPvs")
//Comp_SelPvs
vCompCode:=""
vSuperior:=""
vTele:=""
vCompName:=""
vTown:=""
vCounty:=""
vTel:=""
vArea:=""
vStatus:=""
vType:=""
vSource:=""
vDiscountF:=0
vDiscountT:=0
vValueF:=0
vValueT:=0
SRCH_d_EntryDateFrom:=!00-00-00!
SRCH_d_EntryDateTo:=!00-00-00!
vSDateF:=!00-00-00!
vSDateT:=!00-00-00!
vFDateF:=!00-00-00!
vFDateT:=!00-00-00!
If (DB_t_CurrentFormUsage="Omit")
	vOmit:="N"
Else 
	vOmit:=""
End if 
vSales:=""
vComments:=""
vPostcode:=""
vProdCode:=""
vDoDateF:=!00-00-00!
vDoDateT:=!00-00-00!
vCountry:=""
vContrCode:=""
vLocation:=""
vProbCode:=""
vFilePtr:=->[COMPANIES:2]
vTitle13:="vCompCode+vSuperior+vTele+vCompName+vTown+vCounty+vTel+vArea+vStatus+vType+"
vTitle13:=vTitle13+"vSource+vDiscountF+vDiscountT+vValueF+vValueT+SRCH_d_EntryDateFrom+SRCH_d_EntryDateTo+vSDateF+vSDateT+"
vTitle13:=vTitle13+"vFDateF+vFDateT+vOmit+vSales+vComments+vPostcode+vProdCode+vDoDateF+vDoDateT+"
vTitle13:=vTitle13+"vCountry+vContrCode+vLocation+vProbCode+ch1+cSetAdd+cSetMod+"
Qualities_SelPv
ERR_MethodTrackerReturn("Comp_SelPvs"; $_t_oldMethodName)