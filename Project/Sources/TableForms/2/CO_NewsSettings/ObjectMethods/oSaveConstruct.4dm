If (False:C215)
	//object Name: [COMPANIES]CO_NewsSettings.oSaveConstruct
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
	C_TEXT:C284($_t_oldMethodName; CO_T_SearchConstruct)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [COMPANIES].CO_NewsSettings.oSaveConstruct"; Form event code:C388)

If (CO_al_CurSearchOpt>0)
	CO_at_SearchConstructs{CO_al_CurSearchOpt}:=CO_T_SearchConstruct
	CO_T_SearchConstruct:=""
	CO_at_SearchOptions:=0
	CO_al_CurSearchOpt:=0
End if 
ERR_MethodTrackerReturn("OBJ [COMPANIES].CO_NewsSettings.oSaveConstruct"; $_t_oldMethodName)
