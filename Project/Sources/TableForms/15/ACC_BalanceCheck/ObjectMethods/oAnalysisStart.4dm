If (False:C215)
	//object Method Name: Object Name:      [USER].ACC_BalanceCheck.Variable8
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:11
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(ACC_l_AllAnalysis)
	C_TEXT:C284($_t_oldMethodName; ACC_t_AnalysisStart)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].ACC_BalanceCheck.Variable8"; Form event code:C388)

Check_MinorNC(->ACC_t_AnalysisStart; ""; ->[ANALYSES:36]; ->[ANALYSES:36]Analysis_Code:1; ->[ANALYSES:36]Analysis_Name:2; "Analysis")  //6
If (ACC_t_AnalysisStart#"")
	ACC_l_AllAnalysis:=0
End if 
ERR_MethodTrackerReturn("OBJ [USER].ACC_BalanceCheck.Variable8"; $_t_oldMethodName)
