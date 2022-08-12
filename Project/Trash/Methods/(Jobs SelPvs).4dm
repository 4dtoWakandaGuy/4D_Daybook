//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Jobs_SelPvs
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
	C_DATE:C307(SRCH_d_EntryDateFrom; SRCH_d_EntryDateTo; vRDateF; vRDateT; vSDateF; vSDateT)
	C_POINTER:C301(vFilePtr)
	C_REAL:C285($_r_AmountFrom; $_r_AmountTo; $_r_invF; $_r_invT; VamountF; VamountT; VinvF; vInvT)
	C_TEXT:C284($_t_oldMethodName; vAnalysis; vCompCode; vCompName; vContCode; vContrCode; ACC_t_CurrencyCode; vForename; vJob; vJobCode; vLayer)
	C_TEXT:C284(vOrderNo; vProdCode; vSales; vStage; vSurname; vTitle13; vType)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Jobs_SelPvs")
Sel_BegArr(26)
vCompCode:=""
vCompName:=""
vContCode:=""
vJobCode:=""
vJob:=""
vStage:=""
vSDateF:=!00-00-00!
vSDateT:=!00-00-00!
SRCH_d_EntryDateFrom:=!00-00-00!
SRCH_d_EntryDateTo:=!00-00-00!
vRDateF:=!00-00-00!
vRDateT:=!00-00-00!
vProdCode:=""
vForename:=""
vSurname:=""
vAmountF:=0
vAmountT:=0
vInvF:=0
vInvT:=0
vOrderNo:=""
vSales:=""
vStage:=""
vType:=""
vAnalysis:=""
ACC_t_CurrencyCode:=""
vLayer:=""
vContrCode:=""
vFilePtr:=->[JOBS:26]
vTitle13:="vCompCode+vCompName+vContCode+vJobCode+vJob+vStage+vSDateF+vSDateT+SRCH_d_EntryDateFrom+"
vTitle13:=vTitle13+"SRCH_d_EntryDateTo+vRDateF+vRDateT+vProdCode+vForename+vSurname+vAmountF+vAmountT+vInvF+"
vTitle13:=vTitle13+"vInvT+vOrderNo+vSales+vStage+vType+vAnalysis+ACC_t_CurrencyCode+vLayer+vContrCode+"
vTitle13:=vTitle13+"_FileState+"
ERR_MethodTrackerReturn("Jobs_SelPvs"; $_t_oldMethodName)