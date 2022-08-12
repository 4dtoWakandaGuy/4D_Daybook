If (False:C215)
	//object Name: [COMPANIES]dPath_Test.Variable3
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
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [COMPANIES].dPath_Test.Variable3"; Form event code:C388)
HIDE WINDOW:C436
LR_Main  //will get opened in new process
SHOW WINDOW:C435
ERR_MethodTrackerReturn("OBJ [COMPANIES].dPath_Test.Variable3"; $_t_oldMethodName)