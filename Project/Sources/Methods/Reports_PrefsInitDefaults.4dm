//%attributes = {}
If (False:C215)
	//Project Method Name:      Reports_PrefsInitDefaults
	//------------------ Method Notes ------------------
	//Added 26/11/08 v631b120i -kmw
	//------------------ Revision Control ----------------
	//Date Created: 22/11/2009`Method: Reports_PrefsInitDefaults
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(SR_at_EmailPrintOption1;0)
	//ARRAY TEXT(SR_at_EmailPrintOption2;0)
	//ARRAY TEXT(SR_at_EmailPrintOption2Val;0)
	//ARRAY TEXT(SR_at_EmailPrintOption3;0)
	//ARRAY TEXT(SR_at_EmailPrintOption3Val;0)
	//ARRAY TEXT(SR_at_EmailPrintOption4;0)
	C_LONGINT:C283(SR_l_CompSettingsOverrideSR; SR_l_CompSettingsUseStandardSR)
	C_TEXT:C284($_t_oldMethodName; SR_t_EmailPrintOption2Role; SR_t_EmailPrintOption3Role)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Reports_PrefsInitDefaults")


SR_l_CompSettingsUseStandardSR:=0
SR_l_CompSettingsOverrideSR:=0
ARRAY TEXT:C222(SR_at_EmailPrintOption1; 0)
ARRAY TEXT:C222(SR_at_EmailPrintOption2; 0)
ARRAY TEXT:C222(SR_at_EmailPrintOption3; 0)
ARRAY TEXT:C222(SR_at_EmailPrintOption4; 0)
//************ Changed to array of values 20/02/09 -kmw ************
C_TEXT:C284(SR_t_EmailPrintOption2Role)
C_TEXT:C284(SR_t_EmailPrintOption3Role)
//SR_t_EmailPrintOption2Role:=""
//SR_t_EmailPrintOption3Role:=""
//ARRAY TEXT(SR_at_EmailPrintOption2Val;0)
// TEXT(SR_at_EmailPrintOption3Val;0)

//********************************************************************
ERR_MethodTrackerReturn("Reports_PrefsInitDefaults"; $_t_oldMethodName)
