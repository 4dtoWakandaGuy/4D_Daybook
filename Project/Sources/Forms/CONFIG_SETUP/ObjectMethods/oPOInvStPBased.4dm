If (False:C215)
	//object Name: Object Name:      CONFIG_SETUP.oPOInvStPBased
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/07/2012 10:21
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

$_t_oldMethodName:=ERR_MethodTracker("OBJ CONFIG_SETUP.oPOInvStPBased")

$_t_oldMethodName:=ERR_MethodTracker("OBJ CONFIG_SETUP.oPOInvStPBased"; Form event code:C388)
[USER:15]Purch Price2:153:=1
ERR_MethodTrackerReturn("OBJ CONFIG_SETUP.oPOInvStPBased"; $_t_oldMethodName)