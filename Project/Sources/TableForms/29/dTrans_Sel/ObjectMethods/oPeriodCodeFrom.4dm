If (False:C215)
	//object Name: [TRANSACTIONS]dTrans_Sel.Variable16
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
	C_TEXT:C284($_t_oldMethodName; ACC_t_PeriodFrom)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [TRANSACTIONS].dTrans_Sel.Variable16"; Form event code:C388)
If (cNAL=0)
	Check_MinorNC(->ACC_t_PeriodFrom; ""; ->[PERIODS:33]; ->[PERIODS:33]Period_Code:1; ->[PERIODS:33]Period_Name:2; "Period")
End if 
ERR_MethodTrackerReturn("OBJ [TRANSACTIONS].dTrans_Sel.Variable16"; $_t_oldMethodName)
