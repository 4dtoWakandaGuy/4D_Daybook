//%attributes = {"invisible":true}
If (False:C215)
	//Project Method Name:      Diary_SelPvs
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:45:41If (False)// ----------------------------------------------------
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_DATE:C307(vDnDateF; vDnDateT; vDoDateF; vDoDateT)
	C_POINTER:C301(vFilePtr)
	C_REAL:C285(vValueF; vValueT)
	C_TEXT:C284(<>PER_t_CurrentUserInitials; <>TimeAct; $_t_oldMethodName; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; DIA_t_actionCode; DIA_t_actionName; vCallCode; vCompCode; vCompName)
	C_TEXT:C284(vContCode; vContrCode; vEvent; vForename; vGroup; vJob; vLetterCode; vOrderCode; vPriority; vProduct; vResDesc)
	C_TEXT:C284(vResult; vSales; vStage; vStatus; vSuperior; vSurname; vTele; vTerms; vTitle13)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Diary_SelPvs")
vCompCode:=""
vCompName:=""
vContCode:=""
vDoDateF:=!00-00-00!
vDoDateT:=!00-00-00!
vDnDateF:=!00-00-00!
vDnDateT:=!00-00-00!
If (DB_t_CurrentFormUsage="Your")
	vSales:=<>PER_t_CurrentUserInitials
Else 
	vSales:=""
End if 
vProduct:=""
vSuperior:=""
If (DB_t_CurrentFormUsage="Time")
	DIA_t_actionCode:=<>TimeAct
Else 
	DIA_t_actionCode:=""
End if 
vResult:=""
DIA_t_actionName:=""
vResDesc:=""
vLetterCode:=""
vForename:=""
vSurname:=""
vValueF:=0
vValueT:=0
vPriority:=""
vJob:=""
vEvent:=""
vStage:=""
vTele:=""
vOrderCode:=""
vContrCode:=""
vCallCode:=""
vStatus:=""
vGroup:=""
vTerms:=""
vFilePtr:=->[DIARY:12]
vTitle13:="vCompCode+vCompName+vContCode+vDoDateF+vDoDateT+vDnDateF+vDnDateT+vSales+"
vTitle13:=vTitle13+"vProduct+vSuperior+vAction+vResult+vActDesc+vResDesc+vLetterCode+vForename+"
vTitle13:=vTitle13+"vSurname+vValueF+vValueT+vPriority+vJob+vEvent+vStage+vTele+"
vTitle13:=vTitle13+"vOrderCode+vContrCode+vCallCode+vStatus+ch1+ch2+vTerms+"
ERR_MethodTrackerReturn("Diary_SelPvs"; $_t_oldMethodName)
