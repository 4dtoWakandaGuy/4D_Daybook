//%attributes = {}
If (False:C215)
	//Project Method Name:      Prod_SelPvs
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
	C_DATE:C307(SRCH_d_EntryDateFrom; SRCH_d_EntryDateTo)
	C_POINTER:C301(vFilePtr)
	C_REAL:C285(vAmountF; vAmountT; vValueF; vValueT)
	C_TEXT:C284($_t_oldMethodName; Enclosures; vAnalysis; vBrand; vComments; vGroup; vLetterCode; vModelCode; vProblem; vProdCode; vProdName)
	C_TEXT:C284(vProduct; vSuperior; vSupplier; vTitle13)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Prod_SelPvs")
vProdCode:=""
vProdName:=""
vAmountF:=0
vAmountT:=0
vGroup:=""
vBrand:=""
vModelCode:=""
vLetterCode:=""
vValueF:=0
vValueT:=0
SRCH_d_EntryDateFrom:=!00-00-00!
SRCH_d_EntryDateTo:=!00-00-00!
vSuperior:=""
Enclosures:=""
vComments:=""
vSupplier:=""
vProduct:=""
vProblem:=""
vAnalysis:=""
vFilePtr:=->[PRODUCTS:9]
vTitle13:="vProdCode+vProdName+vAmountF+vAmountT+vGroup+"
vTitle13:=vTitle13+"vBrand+vModelCode+vLetterCode+vValueF+vValueT+"
vTitle13:=vTitle13+"SRCH_d_EntryDateFrom+SRCH_d_EntryDateTo+vSuperior+Enclosures+vComments+vSupplier+vProduct+"
vTitle13:=vTitle13+"ch1+ch2+ch3+cSetAdd+cSetMod+vProblem+vAnalysis+"
ERR_MethodTrackerReturn("Prod_SelPvs"; $_t_oldMethodName)