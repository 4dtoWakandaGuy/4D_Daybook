//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Projects_SelPvs
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
	C_DATE:C307(SRCH_d_EntryDateFrom; SRCH_d_EntryDateTo; vSDateF; vSDateT)
	C_POINTER:C301(vFilePtr)
	C_TEXT:C284($_t_oldMethodName; vCompCode; vCompName; vContCode; vForename; vJob; vJobCode; vSales; vStage; vSurname; vTitle13)
	C_TEXT:C284(vType)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Projects_SelPvs")
Sel_BegArr(89)
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
vForename:=""
vSurname:=""
vSales:=""
vType:=""
vFilePtr:=->[PROJECTS:89]
vTitle13:="vCompCode+vCompName+vContCode+vJobCode+vJob+vStage+vSDateF+"
vTitle13:=vTitle13+"vSDateT+SRCH_d_EntryDateFrom+SRCH_d_EntryDateTo+vForename+vSurname+vSales+vType+_FileState+"
ERR_MethodTrackerReturn("Projects_SelPvs"; $_t_oldMethodName)