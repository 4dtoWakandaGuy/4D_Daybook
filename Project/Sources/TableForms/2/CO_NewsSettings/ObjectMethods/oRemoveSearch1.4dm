If (False:C215)
	//object Name: [COMPANIES]CO_NewsSettings.oRemoveSearch1
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:06
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(CO_at_SearchConstructs;0)
	//ARRAY TEXT(CO_at_SearchOptions;0)
	C_LONGINT:C283(CO_al_CurSearchOpt)
	C_TEXT:C284($_t_oldMethodName; CO_T_SEARCHCONSTRUCT)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [COMPANIES].CO_NewsSettings.oRemoveSearch1"; Form event code:C388)

If (CO_al_CurSearchOpt>0)
	If (CO_al_CurSearchOpt>1)
		DELETE FROM ARRAY:C228(CO_at_SearchOptions; CO_al_CurSearchOpt)
		DELETE FROM ARRAY:C228(CO_at_SearchConstructs; CO_al_CurSearchOpt)
		CO_T_SEARCHCONSTRUCT:=""
		CO_al_CurSearchOpt:=0
		CO_at_SearchOptions:=0
	Else 
		Gen_Alert("Sorry you cannot remove this!")
	End if 
	
End if 
ERR_MethodTrackerReturn("OBJ [COMPANIES].CO_NewsSettings.oRemoveSearch1"; $_t_oldMethodName)
