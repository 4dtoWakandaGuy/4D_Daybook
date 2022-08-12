If (False:C215)
	//object Method Name: Object Name:      [USER].TRANS_DelSelector.oLBDelItems
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 22/06/2009 10:46
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(ACC_lb_TransItems;0)
	//ARRAY INTEGER(ACC_ai_TransDelete;0)
	C_LONGINT:C283($_l_Column; $_l_event; $_l_FieldNumber; $_l_Row; $_l_TableNumber)
	C_TEXT:C284($_t_ColumnName; $_t_oldMethodName; $_t_VariableName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].TRANS_DelSelector.oLBDelItems"; Form event code:C388)
$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Clicked:K2:4) | ($_l_event=On Double Clicked:K2:5)
		RESOLVE POINTER:C394(Self:C308; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
		$_l_Row:=Self:C308->
		If ($_l_Row>0)
			$_l_Column:=LB_GetColumn(->ACC_lb_TransItems; $_t_ColumnName)
			Case of 
				: ($_l_Column>0)
					
					ACC_ai_TransDelete{$_l_Row}:=Abs:C99(ACC_ai_TransDelete{$_l_Row}-1)
			End case 
		End if 
End case 
ERR_MethodTrackerReturn("OBJ [USER].TRANS_DelSelector.oLBDelItems"; $_t_oldMethodName)
