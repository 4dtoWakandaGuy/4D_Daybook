If (False:C215)
	//object Name: [CONTRACTS]Contract_in.Variable9
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
	C_TEXT:C284($_t_oldMethodName; CON_t_CurFurtherCode)
End if 

//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [CONTRACTS].Contract_in.Variable9"; Form event code:C388)
Check_Minor(->CON_t_CurFurtherCode; ""; ->[ADDITIONAL_RECORD_ANALYSIS:53]; ->[ADDITIONAL_RECORD_ANALYSIS:53]Additional_Analysis_Code:1; ->[ADDITIONAL_RECORD_ANALYSIS:53]Additional_Analysis_Name:2; "Furthers In"; "Further Analysis")
ERR_MethodTrackerReturn("OBJ [CONTRACTS].Contract_in.Variable9"; $_t_oldMethodName)