//%attributes = {}
If (False:C215)
	//Project Method Name:      Orders_SelPvs
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 26/07/2012 15:14
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//C_UNKNOWN(<>CompCodeDB_BigUnittest)
	C_DATE:C307(SRCH_d_EntryDateFrom; SRCH_d_EntryDateTo; vFDateF; vFDateT; vIDateF; vIDateT; vRDateF; vRDateT; vSDateF; vSDateT)
	C_LONGINT:C283(<>MENU_l_BarModule)
	C_POINTER:C301(vFilePtr)
	C_REAL:C285(vAmountF; vAmountT; vMarginF; vMarginPF; vMarginPT; vMarginT)
	C_TEXT:C284($_t_oldMethodName; Enclosures; vAnalysis; vArea; vAttendType; vComments; vCompCode; vCompName; vContCode; ACC_t_CurrencyCode; vEvent)
	C_TEXT:C284(vForename; vLayer; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; vOrderCode; vOrderNo; ACC_t_PeriodFrom; ACC_t_PeriodTo; vProdCode; vSales)
	C_TEXT:C284(vSource; vSurname; vTele; vTitle13)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Orders_SelPvs")
Sel_BegArr(24)
If (DB_t_CurrentFormUsage="ContrOI")  //From Contracts OI proc
	vCompCode:=<>CompCodeDB_BigUnittest
Else 
	vCompCode:=""
End if 
vCompName:=""
vContCode:=""
vIDateF:=!00-00-00!
vIDateT:=!00-00-00!
vRDateF:=!00-00-00!
vRDateT:=!00-00-00!
vFDateF:=!00-00-00!
vFDateT:=!00-00-00!
SRCH_d_EntryDateFrom:=!00-00-00!
SRCH_d_EntryDateTo:=!00-00-00!
vSDateF:=!00-00-00!
vSDateT:=!00-00-00!
vProdCode:=""
ACC_t_PeriodFrom:=""
ACC_t_PeriodTo:=""
vForename:=""
vSurname:=""
vAmountF:=0
vAmountT:=0
vMarginF:=0
vMarginT:=0
vMarginPF:=0
vMarginPT:=0
vOrderCode:=""
vOrderNo:=""
vSales:=""
vTele:=""
vSource:=""
vComments:=""
Enclosures:=""
ACC_t_CurrencyCode:=""
vAnalysis:=""
vArea:=""
ACC_t_PeriodFrom:=""
ACC_t_PeriodTo:=""
vLayer:=""
If (<>MENU_l_BarModule=10)
	vAttendType:="EVENT"
Else 
	vAttendType:=""
End if 
vEvent:=""
vFilePtr:=->[ORDERS:24]
vTitle13:="vCompCode+vCompName+vContCode+vIDateF+vIDateT+vRDateF+vRDateT+"
vTitle13:=vTitle13+"vFDateF+vFDateT+SRCH_d_EntryDateFrom+SRCH_d_EntryDateTo+vSDateF+vSDateT+"
vTitle13:=vTitle13+"vProdCode+ACC_t_PeriodFrom+ACC_t_PeriodTo+vForename+vSurname+vAmountF+vAmountT+"
vTitle13:=vTitle13+"vMarginF+vMarginT+vMarginPF+vMarginPT+vOrderCode+vOrderNo+"
vTitle13:=vTitle13+"vSales+vTele+vSource+vComments+Enclosures+ACC_t_CurrencyCode+vAnalysis+vArea+ACC_t_PeriodFrom+"
vTitle13:=vTitle13+"ACC_t_PeriodTo+vLayer+vAttendType+vEvent+cSetAdd+cSetMod+_FileState+"
ERR_MethodTrackerReturn("Orders_SelPvs"; $_t_oldMethodName)