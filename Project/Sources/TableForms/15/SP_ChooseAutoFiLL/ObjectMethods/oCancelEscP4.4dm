If (False:C215)
	//object Name: [USER]SP_ChooseAutoFiLL.Variable19
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
	C_LONGINT:C283(SP_l_Continue)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].SP_ChooseAutoFiLL.Variable19"; Form event code:C388)
SP_l_Continue:=0
CANCEL:C270
ERR_MethodTrackerReturn("OBJ [USER].SP_ChooseAutoFiLL.Variable19"; $_t_oldMethodName)