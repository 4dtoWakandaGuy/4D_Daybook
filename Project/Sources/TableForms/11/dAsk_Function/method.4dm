If (False:C215)
	//Table Form Method Name: [PERSONNEL]dAsk_Function
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 02/11/2012 08:18
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

$_t_oldMethodName:=ERR_MethodTracker("FM [PERSONNEL].dAsk_Function"; Form event code:C388)
If (Form event code:C388=On Load:K2:1)
	Personnel_FuncP
	INT_SkinsPrefs
	
	INT_SetDialog
	
End if 
ERR_MethodTrackerReturn("FM:dAsk_Function"; $_t_oldMethodName)
