If (False:C215)
	//object Name: [ORDER_ITEMS]Items_List.Variable6
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
	C_REAL:C285(vT2)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [ORDER_ITEMS].Items_List.Variable6"; Form event code:C388)
If (Form event code:C388=On Printing Break:K2:19)
	vT2:=Subtotal:C97([ORDER_ITEMS:25]TAX_Amount:8)
End if 
ERR_MethodTrackerReturn("OBJ [ORDER_ITEMS].Items_List.Variable6"; $_t_oldMethodName)
