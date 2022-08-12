If (False:C215)
	//object Name: [COMPANIES]dConfirm3.Obutton1
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
	C_LONGINT:C283(xOK; xOK_1)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [COMPANIES].dConfirm3.Obutton1"; Form event code:C388)
xOK:=xOK_1
ERR_MethodTrackerReturn("OBJ [COMPANIES].dConfirm3.Obutton1"; $_t_oldMethodName)