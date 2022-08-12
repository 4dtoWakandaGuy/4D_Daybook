If (False:C215)
	//object Name: [USER]DaskSelect.oGenSelect
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 06/01/2011 00:26
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(GEN_lb_LBprod;0)
	C_LONGINT:C283($_l_Column; $_l_event; $_l_FieldNumber; $_l_Row; $_l_TableNumber)
	C_TEXT:C284($_t_oldMethodName; $_t_VariableName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].DaskSelect.oGenSelect"; Form event code:C388)

$_l_event:=Form event code:C388
Case of 
	: ($_l_event=On Header Click:K2:40)
		LISTBOX SELECT ROW:C912(GEN_lb_LBprod; 1; 0)
	: ($_l_event=On Clicked:K2:4) | ($_l_event=On Double Clicked:K2:5)
		RESOLVE POINTER:C394(Self:C308; $_t_VariableName; $_l_TableNumber; $_l_FieldNumber)
		$_l_Row:=Self:C308->
		If ($_l_Row>0)
			LISTBOX GET CELL POSITION:C971(GEN_lb_LBprod; $_l_Column; $_l_Row)
			
		Else 
			LISTBOX SELECT ROW:C912(GEN_lb_LBprod; 1; 0)
		End if 
End case 
ERR_MethodTrackerReturn("OBJ [USER].DaskSelect.oGenSelect"; $_t_oldMethodName)
