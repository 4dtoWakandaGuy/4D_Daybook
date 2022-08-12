If (False:C215)
	//object Name: [USER]Prod_SelectionPallette.oCopyhighlight
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 23/11/2010 09:37
	//Created BY: Nigel Greenlee
	//Date Modified: 
	//Modified By DefaultUser
	//Modification notes 
	
End if 
//Variable Declarations
If (True:C214)
	//Array BOOLEAN(CAT_lb_Products;0)
	C_LONGINT:C283($_l_Column; $_l_Row)
	C_TEXT:C284($_t_oldMethodName)
End if 

//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [USER].Prod_SelectionPallette.oCopyhighlight"; Form event code:C388)
LISTBOX GET CELL POSITION:C971(CAT_lb_Products; $_l_Column; $_l_Row)
//$Line:=LB_GetLine (->CAT_lb_Products)

PROD_CopyHighlighted($_l_Row)
ERR_MethodTrackerReturn("OBJ:Prod_SelectionPallette,BCopytoOrder"; $_t_oldMethodName)