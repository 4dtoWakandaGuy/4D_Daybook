If (False:C215)
	//object Name: [ACCOUNT_BALANCES]dACC_BalSelect.oAnalysisCodeF
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:46
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(cNAL)
	C_TEXT:C284($_t_oldMethodName; ACC_t_AnalysisCodeFrom)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [ACCOUNT_BALANCES].dACC_BalSelect.oAnalysisCodeF"; Form event code:C388)
If (cNAL=0)
	Check_MinorNC(->ACC_t_AnalysisCodeFrom; ""; ->[ANALYSES:36]; ->[ANALYSES:36]Analysis_Code:1; ->[ANALYSES:36]Analysis_Name:2; "Analysis")
End if 
ERR_MethodTrackerReturn("OBJ [ACCOUNT_BALANCES].dACC_BalSelect.oAnalysisCodeF"; $_t_oldMethodName)
