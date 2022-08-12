If (False:C215)
	//object Name: [COMPANIES]Company_In.SR_EmailPrintOption1
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:06
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(REP_at_DocReportTo;0)
	//ARRAY TEXT(SR_at_EmailPrintOption1;0)
	//ARRAY TEXT(SR_at_EmailPrintOption2;0)
	//ARRAY TEXT(SR_at_EmailPrintOption3;0)
	//ARRAY TEXT(SR_at_EmailPrintOption4;0)
	C_TEXT:C284($_t_CurrentSRDocReport; $_t_oldMethodName; SR_t_EmailPrintOption2Cont; SR_t_EmailPrintOption2Email; SR_t_EmailPrintOption2Pers; SR_t_EmailPrintOption2Role; SR_t_EmailPrintOption3Con; SR_t_EmailPrintOption3Email; SR_t_EmailPrintOption3Pers; SR_t_EmailPrintOption3Role)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [COMPANIES].Company_In.SR_EmailPrintOption1"; Form event code:C388)

//Added 13/11/08 v631b120g -kmw
$_t_CurrentSRDocReport:=REP_at_DocReportTo{REP_at_DocReportTo}
Reports_PrefsOpt1ObjHandler($_t_CurrentSRDocReport; ->SR_at_EmailPrintOption1; ->SR_at_EmailPrintOption2; ->SR_at_EmailPrintOption3; ->SR_at_EmailPrintOption4; ->SR_t_EmailPrintOption2Email; ->SR_t_EmailPrintOption2Role; ->SR_t_EmailPrintOption2Pers; ->SR_t_EmailPrintOption2Cont; ->SR_t_EmailPrintOption3Email; ->SR_t_EmailPrintOption3Role; ->SR_t_EmailPrintOption3Pers; ->SR_t_EmailPrintOption3Con)
ERR_MethodTrackerReturn("OBJ [COMPANIES].Company_In.SR_EmailPrintOption1"; $_t_oldMethodName)
