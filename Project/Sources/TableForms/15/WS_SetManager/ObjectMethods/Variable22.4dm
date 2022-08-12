If (False:C215)
	//object Name: [USER]WS_SetManager.Variable22
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
	//Array TEXT(GEN_at_Name;0)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].WS_SetManager.Variable22"; Form event code:C388)
If (Gen_Option)
	SORT ARRAY:C229(GEN_at_Name; <)
Else 
	SORT ARRAY:C229(GEN_at_Name; >)
End if 
GEN_at_Name:=1
ERR_MethodTrackerReturn("OBJ [USER].WS_SetManager.Variable22"; $_t_oldMethodName)