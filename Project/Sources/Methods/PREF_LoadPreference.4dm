//%attributes = {}
If (False:C215)
	//Project Method Name:      PREF_LoadPreference
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 17/12/2012 08:30
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	ARRAY LONGINT:C221($_al_VariableTypes; 0)
	ARRAY TEXT:C222($_at_VariableNames; 0)
	C_BLOB:C604($_blb_Preference)
	C_LONGINT:C283($_l_Index; $_l_offset; $1; $3)
	C_POINTER:C301($_ptr_Variable)
	C_TEXT:C284($_t_oldMethodName; $2; DM_T_UserName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("PREF_LoadPreference")
If (Count parameters:C259>=2)
	
	If (Count parameters:C259>=3)
		$_blb_Preference:=PREF_GetPreferenceBLOB($1; $2; $3)
		
	Else 
		$_blb_Preference:=PREF_GetPreferenceBLOB($1; $2)
	End if 
	ARRAY TEXT:C222($_at_VariableNames; 0)  //note that the variables must be declared
	ARRAY LONGINT:C221($_al_VariableTypes; 0)
	PREF_GetPrefVariables($2; ->$_at_VariableNames; ->$_al_VariableTypes)
	If (BLOB size:C605($_blb_Preference)=0)
		
	Else 
		$_l_offset:=0
		For ($_l_Index; 1; Size of array:C274($_at_VariableNames))
			If (BLOB size:C605($_blb_Preference)>$_l_offset)
				$_ptr_Variable:=Get pointer:C304($_at_VariableNames{$_l_Index})
				//need handling here for 2D arrays-standardized format before loading must know how many rows
				BLOB TO VARIABLE:C533($_blb_Preference; DM_T_UserName; $_l_offset)
			End if 
		End for 
	End if 
End if 
ERR_MethodTrackerReturn("PREF_LoadPreference"; $_t_oldMethodName)
