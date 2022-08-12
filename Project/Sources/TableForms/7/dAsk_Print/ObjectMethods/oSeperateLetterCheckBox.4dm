If (False:C215)
	//object Name: [DOCUMENTS]dAsk_Print.oSeperateLetterCheckBox
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:07
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	C_LONGINT:C283(ch0; cLetters; cMerged)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [DOCUMENTS].dAsk_Print.oSeperateLetterCheckBox"; Form event code:C388)
If ((cLetters=1) & (DB_GetModuleSettingByNUM(Module_DiaryManager)#0))
	ch0:=1
	cMerged:=0
End if 
ERR_MethodTrackerReturn("OBJ:dAsk_Print,cLetters"; $_t_oldMethodName)
