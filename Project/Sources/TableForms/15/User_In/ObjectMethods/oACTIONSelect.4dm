If (False:C215)
	//object Method Name: Object Name:      [USER].User_In.oACTIONSelect
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 24/10/2012 14:05
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(SD2_lb_Actions;0)
	//ARRAY INTEGER(SD_ai_ActionCodes;0)
	//ARRAY INTEGER(SD_ai_ActionCodesOSW;0)
	//ARRAY LONGINT(SD_al_ActionCodesOST;0)
	//ARRAY LONGINT(SD_al_ActionTime;0)
	//ARRAY TEXT(SD_at_ActioncodesOST;0)
	C_BOOLEAN:C305(SD_bo_ChangePrefs)
	C_LONGINT:C283($_l_Column; $_l_event; $_l_FieldNumber; $_l_Row; $_l_TableNumber; SD_l_SettingsTimeLen)
	C_TEXT:C284($_t_oldMethodName; $_t_VariableName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].User_In.oACTIONSelect"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4) | ($_l_event=On Double Clicked:K2:5)
		RESOLVE POINTER:C394(Self:C308; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
		$_l_Row:=Self:C308->
		If ($_l_Row>0)
			$_l_Column:=LB_GetColumn(->SD2_lb_Actions; $_t_VariableName)
			Case of 
				: ($_l_Column=1)
					
					SD_ai_ActionCodes{$_l_Row}:=Abs:C99(SD_ai_ActionCodes{$_l_Row}-1)
					SD_bo_ChangePrefs:=True:C214
					Case of 
						: (SD_ai_ActionCodes{$_l_Row}=1)
							If (SD_al_ActionTime{$_l_Row}=0)
								SD_al_ActionTime{$_l_Row}:=SD_l_SettingsTimeLen
							End if 
					End case 
				: ($_l_Column=4)
					
					SD_SetTimeWarning(->SD_al_ActionTime{$_l_Row})
					
				: ($_l_Column=5)
					
					SD_ai_ActionCodesOSW{$_l_Row}:=Abs:C99(SD_ai_ActionCodesOSW{$_l_Row}-1)
					SD_bo_ChangePrefs:=True:C214
					Case of 
						: (SD_ai_ActionCodesOSW{$_l_Row}=1)
							SD_SetTimeWarning(->SD_al_ActionCodesOST{$_l_Row}; ->SD_at_ActioncodesOST{$_l_Row})
					End case 
					
				: ($_l_Column=6)
					SD_SetTimeWarning(->SD_al_ActionCodesOST{$_l_Row}; ->SD_at_ActioncodesOST{$_l_Row})
					
			End case 
			
		Else 
			LISTBOX SELECT ROW:C912(SD2_lb_Actions; 1; 0)
		End if 
End case 
ERR_MethodTrackerReturn("OBJ [USER].User_In.oACTIONSelect"; $_t_oldMethodName)
