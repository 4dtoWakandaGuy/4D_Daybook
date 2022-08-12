If (False:C215)
	//object Name: [ORDER_ITEMS]Jobs_OIList.Variable7
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
	C_REAL:C285(vT3)
	C_TEXT:C284($_t_oldMethodName)
End if 
//Code Starts Here


$_t_oldMethodName:=ERR_MethodTracker("OBJ [ORDER_ITEMS].Jobs_OIList.Variable7"; Form event code:C388)
If (Form event code:C388=On Printing Break:K2:19)
	vT3:=Subtotal:C97([ORDER_ITEMS:25]Total_Amount:9)
End if 
ERR_MethodTrackerReturn("OBJ [ORDER_ITEMS].Jobs_OIList.Variable7"; $_t_oldMethodName)
