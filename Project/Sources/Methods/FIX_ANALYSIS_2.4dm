//%attributes = {}
If (False:C215)
	//Project Method Name:      FIX_ANALYSIS_2
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
	C_TEXT:C284($_t_oldMethodName; ACC_t_AnalysisPeriodtoFix)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FIX_ANALYSIS_2")

ACC_t_AnalysisPeriodtoFix:=Gen_Request("Enter the Accounting Period to fix."; ""; "Fix"; "Cancel")


If (OK=1)
	BEEP:C151
	FIX_ANALYSIS_CODE_INV_D
	BEEP:C151
	FIX_ANALYSIS_CODE_PO_D
	BEEP:C151
	FIX_ANALYSIS_CODE_1_D
	BEEP:C151
	FIX_ANALYSIS_CODE_5_D
	BEEP:C151
	FIX_ANALYSIS_CODE_4_D
	BEEP:C151
	// ALERT("FIX ANALYSIS CODES BY DATE: DONE")
	Gen_Alert("FIX ANALYSIS CODES BY DATE: DONE")
End if 
ERR_MethodTrackerReturn("FIX_ANALYSIS_2"; $_t_oldMethodName)