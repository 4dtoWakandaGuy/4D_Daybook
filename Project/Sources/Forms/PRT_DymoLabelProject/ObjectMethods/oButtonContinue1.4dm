If (False:C215)
	//object Name: Object Name:      PRT_DymoLabelProject.oButtonContinue1
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 08/06/2012 20:32
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(PRT_l_Save)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ PRT_DymoLabelProject.oButtonContinue1"; Form event code:C388)

PRT_l_Save:=0
ERR_MethodTrackerReturn("OBJ PRT_DymoLabelProject.oButtonContinue1"; $_t_oldMethodName)