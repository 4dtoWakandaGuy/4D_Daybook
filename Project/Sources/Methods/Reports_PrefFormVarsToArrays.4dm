//%attributes = {}
If (False:C215)
	//Project Method Name:      Reports_PrefFormVarsToArrays
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/11/2009`Method: Reports_PrefFormVarsToArrays
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(SR_at_EmailPrintOption2Val;0)
	//ARRAY TEXT(SR_at_EmailPrintOption3Val;0)
	C_TEXT:C284($_t_oldMethodName; SR_t_EmailPrintOption2Cont; SR_t_EmailPrintOption2Email; SR_t_EmailPrintOption2Pers; SR_t_EmailPrintOption2Role; SR_t_EmailPrintOption3Cont; SR_t_EmailPrintOption3Email; SR_t_EmailPrintOption3Pers; SR_t_EmailPrintOption3Role)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Reports_PrefFormVarsToArrays")
//Added 23/02/09 v631b120o -kmw
//NG Aug 2020 the arrays here are no longer used
If (False:C215)
	//SR_at_EmailPrintOption2Val{3}:=SR_t_EmailPrintOption2Role
	//SR_at_EmailPrintOption2Val{6}:=SR_t_EmailPrintOption2Cont
	//SR_at_EmailPrintOption2Val{7}:=SR_t_EmailPrintOption2Pers
	//SR_at_EmailPrintOption2Val{8}:=SR_t_EmailPrintOption2Email
	
	//SR_at_EmailPrintOption3Val{4}:=SR_t_EmailPrintOption3Role
	//SR_at_EmailPrintOption3Val{7}:=SR_t_EmailPrintOption3Cont
	//SR_at_EmailPrintOption3Val{8}:=SR_t_EmailPrintOption3Pers
	//SR_at_EmailPrintOption3Val{9}:=SR_t_EmailPrintOption3Email
End if 

ERR_MethodTrackerReturn("Reports_PrefFormVarsToArrays"; $_t_oldMethodName)
