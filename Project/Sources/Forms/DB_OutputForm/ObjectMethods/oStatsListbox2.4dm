If (False:C215)
	//object Name: Object Name:      DB_OutputForm.oStatsListbox2
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 03/05/2011 07:52
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY TEXT(aSV1;0)
	//ARRAY TEXT(DB_at_TableName;0)
	C_LONGINT:C283($_l_event; $_l_FieldNumber; $_l_SelectedColumn; $_l_SelectedRow; $_l_TableNumber)
	C_TEXT:C284($_t_oldMethodName; $_t_VariableName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ DB_OutputForm.oStatsListbox2")

$_t_oldMethodName:=ERR_MethodTracker("OBJ DB_OutputForm.oStatsListbox2"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Double Clicked:K2:5)
		RESOLVE POINTER:C394(Self:C308; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
		$_l_SelectedRow:=Self:C308->
		$_l_SelectedColumn:=LB_GetColumn(Self:C308; $_t_VariableName)
		If ($_l_SelectedRow>0) & ($_l_SelectedColumn>0)
			aSV1:=$_l_SelectedRow
			Case of 
				: ($_l_SelectedColumn=1)
					
					StatsView_View($_l_SelectedRow)
				: ($_l_SelectedColumn=2) | ($_l_SelectedColumn=3) | ($_l_SelectedColumn=4)
					If (DB_at_TableName>1)
						StatsView_ViewR($_l_SelectedRow)
					Else 
						StatsView_View($_l_SelectedRow)
					End if 
			End case 
		End if 
End case 
ERR_MethodTrackerReturn("OBJ DB_OutputForm.oStatsListbox2"; $_t_oldMethodName)
