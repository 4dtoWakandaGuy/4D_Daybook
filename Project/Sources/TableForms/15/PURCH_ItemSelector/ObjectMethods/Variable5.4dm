If (False:C215)
	//object Name: [USER]PURCH_ItemSelector.Variable5
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/11/2009 16:34
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(PI_l_Copy)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].PURCH_ItemSelector.Variable5"; Form event code:C388)
PI_l_Copy:=0
CANCEL:C270
ERR_MethodTrackerReturn("OBJ [USER].PURCH_ItemSelector.Variable5"; $_t_oldMethodName)