//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_ForceAL
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/12/2009 13:48
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_BOOLEAN:C305(<>ALUseListBox)
	C_LONGINT:C283($1; DB_l_ButtonClickedFunction)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DB_ForceAL")
//This method is to get around a problem with area list that stops the cursor showing.
If (Not:C34(<>ALUseListBox))
	
	If (Count parameters:C259>=1)
		DelayTicks(30)
		SET PROCESS VARIABLE:C370($1; DB_l_ButtonClickedFunction; 899)
		
		POST OUTSIDE CALL:C329($1)
	End if 
End if 
ERR_MethodTrackerReturn("DB_ForceAL"; $_t_oldMethodName)