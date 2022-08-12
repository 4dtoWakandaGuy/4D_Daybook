If (False:C215)
	//Table Form Method Name: [COMPANIES]dScript_Sel
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
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("FM [COMPANIES].dScript_Sel"; Form event code:C388)
ERR_MethodTrackerReturn("FM [COMPANIES].dScript_Sel"; $_t_oldMethodName)