If (False:C215)
	//object Name: Object Name:      SD2_DateSelector.oContinue
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 05/01/2011 23:05
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

$_t_oldMethodName:=ERR_MethodTracker("OBJ SD2_DateSelector.oContinue"; Form event code:C388)
ACCEPT:C269
ERR_MethodTrackerReturn("OBJ SD2_DateSelector.oContinue"; $_t_oldMethodName)