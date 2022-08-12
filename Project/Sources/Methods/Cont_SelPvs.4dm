//%attributes = {}
If (False:C215)
	//Project Method Name:      Cont_SelPvs
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
	C_DATE:C307(SRCH_d_EntryDateFrom; SRCH_d_EntryDateTo; vSDateF; vSDateT)
	C_POINTER:C301(vFilePtr)
	C_TEXT:C284($_t_oldMethodName; vAccName; vAccount; vAnalysis; vCalYr; vCharge; vContCode; vEmail; vForename; vJobTitle; vPerson)
	C_TEXT:C284(vRole; vSource_; vStatus_; vSurname; vTitle; vTitle13; vType_)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Cont_SelPvs")
vContCode:=""
vTitle:=""
vForename:=""
vSurname:=""
vJobTitle:=""
vRole:=""
vStatus_:=""
vType_:=""
vSource_:=""
//vOmit:=""
vAnalysis:=""
SRCH_d_EntryDateFrom:=!00-00-00!
SRCH_d_EntryDateTo:=!00-00-00!
vPerson:=""
vCalYr:=""
vCharge:=""
vSDateF:=!00-00-00!
vSDateT:=!00-00-00!
vEmail:=""  // 01/09/03 pb
vAccName:=""
vAccount:=""
vFilePtr:=->[CONTACTS:1]
vTitle13:=vTitle13+"vContCode+vTitle+vForename+vSurname+vJobTitle+vRole+vStatus_+vType_+"
vTitle13:=vTitle13+"vSource_+vAnalysis+SRCH_d_EntryDateFrom+SRCH_d_EntryDateTo+vPerson+vCharge+cSetAdd+cSetMod+"
vTitle13:=vTitle13+"vSDateF+vSDateT+vCalYr+vAccName+vAccount+"
ERR_MethodTrackerReturn("Cont_SelPvs"; $_t_oldMethodName)