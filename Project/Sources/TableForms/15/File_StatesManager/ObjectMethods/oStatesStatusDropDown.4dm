//Variable Declarations
If (True:C214)
	//ARRAY LONGINT(STATE_al_ClassIDs;0)
	//ARRAY TEXT(STATE_at_ClassNames;0)
	C_LONGINT:C283(ST_l_Modified; ST_l_StateClass)
	C_TEXT:C284($_t_oldMethodName; STATE_t_ClassName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].File_StatesManager.Pop-up/Drop-down List1"; Form event code:C388)
If (STATE_at_ClassNames>0)
	ST_l_StateClass:=STATE_al_ClassIDs{STATE_at_ClassNames}
	STATE_t_ClassName:=STATE_at_ClassNames{STATE_at_ClassNames}
	ST_l_Modified:=1
End if 
ERR_MethodTrackerReturn("OBJ [USER].File_StatesManager.Pop-up/Drop-down List1"; $_t_oldMethodName)
