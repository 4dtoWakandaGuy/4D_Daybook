If (False:C215)
	//object Name: [USER]TRANS_DelSelector.Variable5
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
	C_LONGINT:C283(ACC_l_Deletion)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].TRANS_DelSelector.Variable5"; Form event code:C388)
ACC_l_Deletion:=0
CANCEL:C270
ERR_MethodTrackerReturn("OBJ [USER].TRANS_DelSelector.Variable5"; $_t_oldMethodName)