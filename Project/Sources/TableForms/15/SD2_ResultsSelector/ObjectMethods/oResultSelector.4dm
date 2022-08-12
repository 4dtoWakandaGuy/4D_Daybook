If (False:C215)
	//object Name: [USER]SD2_ResultsSelector.oResultSelector
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 25/10/2012 12:06
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(SD2_Lb_ResultsSelector;0)
	//ARRAY INTEGER(SD2_ai_SelectedResults;0)
	C_LONGINT:C283($_l_event; $_l_FieldNumber; $_l_SelectedColumn; $_l_SelectedRow; $_l_TableNumber; SD_l_Changes)
	C_TEXT:C284($_t_oldMethodName; $_t_VariableName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].SD2_ResultsSelector.oResultSelector"; Form event code:C388)

$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4)
		RESOLVE POINTER:C394(Self:C308; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
		$_l_SelectedRow:=Self:C308->
		If ($_l_SelectedRow>0)
			$_l_SelectedColumn:=LB_GetColumn(->SD2_Lb_ResultsSelector; $_t_VariableName)
			SD2_ai_SelectedResults{$_l_SelectedRow}:=Abs:C99(SD2_ai_SelectedResults{$_l_SelectedRow}-1)
			SD_l_Changes:=SD_l_Changes+1
		End if 
End case 
ERR_MethodTrackerReturn("OBJ [USER].SD2_ResultsSelector.oResultSelector"; $_t_oldMethodName)
