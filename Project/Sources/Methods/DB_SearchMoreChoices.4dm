//%attributes = {}
If (False:C215)
	//Project Method Name:      DB_SearchMoreChoices
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 19/08/2010 17:18
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(DB_l_CurrentDisplayedForm)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("DB_SearchMoreChoices")


SRCH_MoreChoices(DB_l_CurrentDisplayedForm)
ERR_MethodTrackerReturn("DB_SearchMoreChoices"; $_t_oldMethodName)
