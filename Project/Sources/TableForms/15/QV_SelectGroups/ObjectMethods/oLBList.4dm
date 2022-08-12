If (False:C215)
	//object Name: [USER]QV_SelectGroups.oLBList
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 29/10/2012 19:53
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(QV_lb_Groups;0)
	//ARRAY INTEGER(QV_ai_Tick;0)
	C_LONGINT:C283($_l_ColumnNumber; $_l_event; $_l_FieldNumber; $_l_Row; $_l_TableNumber)
	C_TEXT:C284($_t_oldMethodName; $_t_VariableName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].QV_SelectGroups.oLBList"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4)
		RESOLVE POINTER:C394(Self:C308; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
		$_l_Row:=Self:C308->
		$_l_ColumnNumber:=LB_GetColumn(->QV_lb_Groups; $_t_VariableName)
		If ($_l_Row>0)
			QV_ai_Tick{$_l_Row}:=Abs:C99(QV_ai_Tick{$_l_Row}-1)
			
		End if 
End case 
ERR_MethodTrackerReturn("OBJ [USER].QV_SelectGroups.oLBList"; $_t_oldMethodName)
