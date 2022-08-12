If (False:C215)
	//object Name: [USER]DaskSelect.Variable12
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
	C_LONGINT:C283($_l_Column; $_l_Row)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here
$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER]DaskSelect.Variable12"; Form event code:C388)

LISTBOX GET CELL POSITION:C971(GEN_lb_LBprod; $_l_Column; $_l_Row)
If ($_l_Row>1)
	
	LISTBOX SELECT ROW:C912(GEN_lb_LBprod; $_l_Row-1)
	LB_SetScroll(->GEN_lb_LBprod; $_l_Row-1)
	
End if 
ERR_MethodTrackerReturn("OBJ [USER].DaskSelect.Variable12"; $_t_oldMethodName)
