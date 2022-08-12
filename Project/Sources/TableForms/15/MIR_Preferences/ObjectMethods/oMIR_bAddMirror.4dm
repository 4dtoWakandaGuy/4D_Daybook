If (False:C215)
	//object Name: [USER]MIR_Preferences.oMIR_bAddMirror
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
	//Array BOOLEAN(MIR_lb_Servers;0)
	C_LONGINT:C283($LSizeOfArray)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].MIR_Preferences.oMIR_bAddMirror"; Form event code:C388)




$LSizeOfArray:=LISTBOX Get number of rows:C915(MIR_lb_Servers)
LISTBOX INSERT ROWS:C913(MIR_lb_Servers; $LSizeOfArray+1)
ERR_MethodTrackerReturn("OBJ [USER].MIR_Preferences.oMIR_bAddMirror"; $_t_oldMethodName)