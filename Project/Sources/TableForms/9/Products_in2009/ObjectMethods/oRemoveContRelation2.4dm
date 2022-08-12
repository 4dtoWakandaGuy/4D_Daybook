If (False:C215)
	//object Name: [PRODUCTS]Products_in2009.oRemoveContRelation2
	//------------------ Method Notes ------------------
	
	//------------------ Revision Control ----------------
	//Date Created: 30/09/2013 19:08
	//Created BY: Nigel Greenlee
	//Date Modified:
	//Modified By DefaultUser
	//Modification notes
	
End if 
//Variable Declarations
If (True:C214)
	//ARRAY BOOLEAN(PROD_lb_SubsComponents;0)
	C_LONGINT:C283($_l_Column; $_l_Row)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here

$_t_oldMethodName:=ERR_MethodTracker("OBJ [PRODUCTS].Products_in2009.oRemoveContRelation2"; Form event code:C388)

//This button is on Page_1-which is only displayed when there is just one person
//we have to add the

LISTBOX GET CELL POSITION:C971(PROD_lb_SubsComponents; $_l_Column; $_l_Row)
If ($_l_Row>0)
	Gen_Confirm("Are you sure you want to remove the subscriibed product from this subscription?")
	If (OK=1)
		
	End if 
End if 
ERR_MethodTrackerReturn("OBJ [PRODUCTS].Products_in2009.oRemoveContRelation2"; $_t_oldMethodName)
