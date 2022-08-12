If (False:C215)
	//object Name: Object Name:      PROMANAGER.oRevisedComments
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 05/01/2011 23:06
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283($_l_event; PRO_l_SetSelected2)
	C_TEXT:C284($_t_oldMethodName; PRO_t_NewComment)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ PROMANAGER.oRevisedComments"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Data Change:K2:15)
		If (PRO_t_NewComment#"")
			OBJECT SET VISIBLE:C603(PRO_l_SetSelected2; True:C214)
		Else 
			OBJECT SET VISIBLE:C603(PRO_l_SetSelected2; False:C215)
		End if 
End case 
ERR_MethodTrackerReturn("OBJ PROMANAGER.oRevisedComments"; $_t_oldMethodName)
