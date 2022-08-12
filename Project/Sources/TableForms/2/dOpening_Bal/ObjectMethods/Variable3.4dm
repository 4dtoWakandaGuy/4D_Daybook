If (False:C215)
	//object Name: [COMPANIES]dOpening_Bal.Variable3
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:05
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_TEXT:C284($_t_oldMethodName; vPeriod)
End if 

//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [COMPANIES].dOpening_Bal.Variable3"; Form event code:C388)
Check_MinorNC(->vPeriod; ""; ->[PERIODS:33]; ->[PERIODS:33]Period_Code:1; ->[PERIODS:33]Period_Name:2; "Period")
Check_PerClose
vPeriod:=[PERIODS:33]Period_Code:1
ERR_MethodTrackerReturn("OBJ [COMPANIES].dOpening_Bal.Variable3"; $_t_oldMethodName)