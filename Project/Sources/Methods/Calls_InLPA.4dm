//%attributes = {}
If (False:C215)
	//Project Method Name:      Calls_InLPA
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 28/09/2012 09:34
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(vSC)
	C_TEXT:C284(<>CallCode; $_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("Calls_InLPA")
//Calls_InLPA

If ([SERVICE_CALLS:20]Call_Code:4="")
	Calls_Code
End if 
<>CallCode:=[SERVICE_CALLS:20]Call_Code:4
SC_SaveProducts

Gen_AutoProc

DB_SaveRecord(->[SERVICE_CALLS:20])
AA_CheckFileUnlocked(->[SERVICE_CALLS:20]x_ID:27)
vSC:=0
ERR_MethodTrackerReturn("Calls_InLPA"; $_t_oldMethodName)