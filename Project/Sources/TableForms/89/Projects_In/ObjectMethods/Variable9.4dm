If (False:C215)
	//object Name: [PROJECTS]Projects_In.Variable9
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
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [PROJECTS].Projects_In.Variable9"; Form event code:C388)
States_Up(->[PROJECTS:89]State:9)
ERR_MethodTrackerReturn("OBJ [PROJECTS].Projects_In.Variable9"; $_t_oldMethodName)