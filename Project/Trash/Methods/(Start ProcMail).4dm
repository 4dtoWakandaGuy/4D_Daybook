//%attributes = {}
If (False:C215)
	//Project Method Name:      Start ProcMail
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
	C_LONGINT:C283(bd2; bd3; bd4; cEnvelopes; cExport; ch0; ch1; ch2; ch3; ch4; ch5)
	C_LONGINT:C283(ch6; ch7; ch8; cLabels; cLetters; cList; cMerged; cOC; cPreview; ADR_l_useEsquire; iInv)
	C_LONGINT:C283(iNoDear; iNoSal; ADR_l_UseQualifications; r0; r1; r2; r3; r4; vPage)
	C_REAL:C285(vDue)
	C_TEXT:C284($_t_oldMethodName; DB_t_CurrentFormUsage; DB_t_CurrentFormUsage2; DB_t_CurrentFormUsage3; Enclosures; Products; ProductsD; vDetails; vFrom; vFromPos; vJobTitle)
	C_TEXT:C284(vLetterDate; vOurRef; vSalutation)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Start ProcMail")
//Start ProcMail

If (DB_t_CurrentFormUsage2#"MergeSp")
	Clear_Rs
	vFrom:=""
	vFromPos:=""
	vJobTitle:=""
	vPage:=0
	iNoDear:=0
	iNoSal:=0
	iInv:=0
	ADR_l_useEsquire:=0
	ADR_l_UseQualifications:=0
	Enclosures:=""
	Products:=""
	ProductsD:=""
	vSalutation:=""
	vOurRef:=""
	vLetterDate:=""
	vDetails:=""
	vDue:=0
	r0:=0
	r1:=0
	r2:=0
	r3:=0
	r4:=0
	ch0:=0
	ch1:=0
	ch2:=0
	ch3:=0
	ch4:=0
	ch5:=0
	ch6:=0
	ch7:=0
	ch8:=0
	cLetters:=0
	cOC:=0
	cMerged:=0
	cPreview:=0
	cList:=0
	cLabels:=0
	cEnvelopes:=0
	cExport:=0
	bd2:=0
	bd3:=0
	bd4:=0
End if 
ERR_MethodTrackerReturn("Start ProcMail"; $_t_oldMethodName)