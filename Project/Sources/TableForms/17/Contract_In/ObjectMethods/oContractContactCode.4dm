If (False:C215)
	//object Name: [CONTRACTS]Contract_in.Variable27
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
	C_TEXT:C284($_t_oldMethodName; CON_t_CurContactCode; CON_t_CurContactName; vContName)
End if 

//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [CONTRACTS].Contract_in.Variable27"; Form event code:C388)
Check_Contact(->CON_t_CurContactCode; ->[CONTRACTS:17]Company_Code:1; ->[CONTRACTS:17])
CON_t_CurContactName:=vContName
ERR_MethodTrackerReturn("OBJ [CONTRACTS].Contract_in.Variable27"; $_t_oldMethodName)