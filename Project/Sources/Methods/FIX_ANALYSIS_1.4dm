//%attributes = {}
If (False:C215)
	//Project Method Name:      FIX_ANALYSIS_1
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
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FIX_ANALYSIS_1")
BEEP:C151
BEEP:C151
FIX_ANALYSIS_CODE_INV
BEEP:C151
FIX_ANALYSIS_CODE_PO
BEEP:C151
FIX_ANALYSIS_CODE_1
BEEP:C151
FIX_ANALYSIS_CODE_5
BEEP:C151
FIX_ANALYSIS_CODE_4
BEEP:C151
//ALERT("FIX ANALYSIS CODES: DONE")
Gen_Alert("FIX ANALYSIS CODES: DONE")
ERR_MethodTrackerReturn("FIX_ANALYSIS_1"; $_t_oldMethodName)