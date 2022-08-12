If (False:C215)
	//object Name: [COMPANIES]CO_NewsSettings.oAddSearch
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
	C_TEXT:C284($_t_oldMethodName; $_t_SearchOption; CO_T_SearchConstruct)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [COMPANIES].CO_NewsSettings.oAddSearch"; Form event code:C388)

If (CO_al_CurSearchOpt>0)
	If (CO_T_SearchConstruct#CO_at_SearchConstructs{CO_al_CurSearchOpt})
		Gen_Confirm("Save Changes to the Search URL?")
		If (OK=1)
			CO_at_SearchConstructs{CO_al_CurSearchOpt}:=CO_T_SearchConstruct
			CO_T_SearchConstruct:=""
		End if 
	End if 
End if 
HIDE WINDOW:C436
$_t_SearchOption:=Gen_Request("Enter the option name to appear in the list"; "")
SHOW WINDOW:C435
If ($_t_SearchOption#"")
	APPEND TO ARRAY:C911(CO_at_SearchOptions; $_t_SearchOption)
	APPEND TO ARRAY:C911(CO_at_SearchConstructs; "")
	CO_al_CurSearchOpt:=Size of array:C274(CO_at_SearchOptions)
	CO_T_SearchConstruct:=""
End if 
ERR_MethodTrackerReturn("OBJ [COMPANIES].CO_NewsSettings.oAddSearch"; $_t_oldMethodName)
