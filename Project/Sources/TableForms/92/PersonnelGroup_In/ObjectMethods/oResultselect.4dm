If (False:C215)
	//object Method Name: Object Name:      [PERSONNEL_GROUPS].Groups_In.oResultselect
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/10/2012 14:30
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(SD2_abo_LBres;0)
	//ARRAY INTEGER(SD_ai_ResultCodes;0)
	C_BOOLEAN:C305(SD_bo_ChangePrefs)
	C_LONGINT:C283($_l_Column; $_l_event; $_l_FieldNumber; $_l_Row; $_l_TableNumber)
	C_TEXT:C284($_t_oldMethodName; $_t_VariableName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [PERSONNEL_GROUPS].Groups_In.oResultselect"; Form event code:C388)


$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4) | ($_l_event=On Double Clicked:K2:5)
		RESOLVE POINTER:C394(Self:C308; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
		$_l_Row:=Self:C308->
		If ($_l_Row>0)
			$_l_Column:=LB_GetColumn(->SD2_abo_LBres; $_t_VariableName)
			Case of 
				: ($_l_Column=1)
					
					SD_ai_ResultCodes{$_l_Row}:=Abs:C99(SD_ai_ResultCodes{$_l_Row}-1)
					SD_bo_ChangePrefs:=True:C214
					
					
			End case 
			
		Else 
			LISTBOX SELECT ROW:C912(SD2_abo_LBres; 1; 0)
		End if 
End case 
ERR_MethodTrackerReturn("OBJ [PERSONNEL_GROUPS].Groups_In.oResultselect"; $_t_oldMethodName)
