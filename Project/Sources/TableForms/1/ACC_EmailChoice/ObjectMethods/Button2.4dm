If (False:C215)
	//object Name: [CONTACTS]ACC_EmailChoice.Button2
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:04
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(ACC_l_CONTINUE)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [CONTACTS].ACC_EmailChoice.Button2"; Form event code:C388)

ACC_l_Continue:=0
CANCEL:C270
ERR_MethodTrackerReturn("OBJ [CONTACTS].ACC_EmailChoice.Button2"; $_t_oldMethodName)